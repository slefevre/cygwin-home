#!/bin/bash

# Choose which script to use for the final awk step 
out_script=out_all

# Print all duplicated file names, even when md5sum is the same 
out_all='{ if( p1 != $1 ) { print nl $1; print I $2 }
      else if( p2 != $2 ) { print I $2 }
      print I I $3; p1=$1; p2=$2; nl="\n" }
   END { printf nl}'

# Print only duplicated file names which have multiple md5sums.
out_only='{ if( p1 != $1 ) { if( multi ) { print pend }
                             multi=0; pend=$1 "\n" I $2 "\n" }
       else if( p2 != $2 ) { multi++; pend=pend I $2 "\n" } 
       pend=pend I I $3 "\n"; p1=$1; p2=$2 } 
   END { if( multi ) print pend }'

# The main pipeline 
find "${1:-.}" -type f -name '*' |  # awk for duplicate names
awk -F/ '{ if( name[$NF] ) { dname[$NF]++ }
           name[$NF]=name[$NF] $0 "\n" } 
     END { for( d in dname ) { printf name[d] } 
   }' |                             # standard md5sum output 
xargs -d'\n' md5sum |               # " "==text, "*"==binary
sed 's/ [ *]/\x00/' |               # prefix with file name  
awk -F/ '{ print $3 "\x00" $0 }' |  # sort by name. md5sum, path 
sort |                              # awk to print result
awk -F"\x00" -v"I=   " "${!out_script}"
