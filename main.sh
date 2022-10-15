#!/bin/sh
# GDU
## Get gdu folder path
GDU_DIR=$(dirname -- "$0")

## Go to gdu folder
cd $GDU_DIR

## Define folder for repositories to be cloned to
TARGET="$GDU_DIR/temp"

## Make sure target folder exists
mkdir -p $TARGET

## Clone and run repositories

### Example
./clone/example.sh $TARGET
