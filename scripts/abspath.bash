#!/bin/bash

abspath=$(realpath "$1");
rm "$1";
ln -s "$abspath" "$1";
