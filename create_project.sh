#!/bin/sh

# a little script for creating the directory structure of basic C++ projects
# example usage: sh create_project.sh project_name

# make project directory and src and bin subdirectories
mkdir $1
cd $1
mkdir src bin

# create a basic makefile with my preferred compiler flags
echo "CC = g++
CFLAGS = -O2 -std=c++11 -Wall -Wextra

all: TODO

TODO: src/TODO.cpp
	\$(CC) \$(CFLAGS) -o bin/TODO src/TODO.cpp" >  makefile

# exclude binaries from being committed to github
echo "# Ignore all files in bin except those with extensions
bin/*
!bin/*.*" > .gitignore

# add a gitkeep to bin so it's added to github even if empty
touch bin/.gitkeep

# create a README file for documentation
echo "# My New Project" > README.md
