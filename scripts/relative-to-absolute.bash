#!/bin/bash

find . -type l -printf 'ln -nsf "$(readlink "%p")" "$(echo "%p")"\n'
