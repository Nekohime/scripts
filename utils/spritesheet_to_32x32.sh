#!/usr/bin/env bash
#Converts a spritesheet consisting of 32x32 tiles into individual files
convert tileset01.png -crop 32x32 tile%04d.png