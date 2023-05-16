#Improved Makefile
CC_GCC = g++
CC_CLANG = clang++

LD_GCC = g++ -Wl,-rpath=.
LD_CLANG = clang++ -Wl,-rpath=.

#-s for strip
#-g for debug
DEBUG_FLAG = -g

CLANG_CFLAGS = $(DEBUG_FLAG) --std=c++17 -march=native -O3 -Wall -Wextra -Weverything -Wno-sign-compare -Wpedantic -Wformat=2 -Wno-deprecated -Wno-varargs -Wno-c++98-compat -Wno-old-style-cast -Wno-conversion -Wno-unused-parameter -Wno-padded -Wno-cast-align -Wno-reserved-id-macro -Wno-zero-as-null-pointer-constant -Wno-unused-macros -Wno-tautological-unsigned-zero-compare -Wno-format-nonliteral -Wnon-virtual-dtor
GCC_CFLAGS = $(DEBUG_FLAG) --std=c++17 -oFast -Wall -Wextra -Wpedantic -Wno-unused-parameter -Wno-unused-function -Wno-unused-but-set-variable -Wno-sign-compare -Wno-type-limits -Wnon-virtual-dtor

#-lmariadbclient - if lmariadb doesn't work
LIB = #-lmariadb

LDFLAGS = -L/usr/lib/x86_64-linux-gnu/ -L.
INCLUDES = -I/usr/include/ -I./

BUILD_DIR = ./obj/Release
OUT_BINARY = ./main

BUILD_OBJ = $(BUILD_DIR)/main.o

all: release

release: gcc

before:
	test -d . || mkdir -p .
	test -d $(BUILD_DIR) || mkdir -p $(BUILD_DIR)

gcc: CC = g++
gcc: CFLAGS = $(GCC_CFLAGS)
gcc: before $(BUILD_OBJ)
	$(LD_GCC) -o $(OUT_BINARY) $(BUILD_OBJ) $(INCLUDES) $(LDFLAGS) $(LIB)


clang: CC = clang++
clang: CC = $(CLANG_CFLAGS)
clang: before $(BUILD_OBJ)
	$(LD_CLANG) -o $(OUT_BINARY) $(BUILD_OBJ) $(INCLUDES) $(LDFLAGS) $(LIB)

$(BUILD_DIR)/main.o: main.c
	$(CC) $(CFLAGS) $(INCLUDES) -c main.c -o $(BUILD_DIR)/main.o
