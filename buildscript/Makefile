CC_GCC = g++
CC_CLANG = clang++-7
CC = $(CC_GCC)

LD_GCC = g++ -Wl,-rpath=.
LD_CLANG = clang++-7 -Wl,-rpath=.
LD = $(LD_GCC) #-march=native

DEBUG_FLAG = -g
RELEASE_STRIP = -s
DBG_RLS_MODE = $(RELEASE_STRIP)

CLANG_CFLAGS = $(DBG_RLS_MODE) --std=c++17 -O3 -Wall -Weverything -Wno-unused-function -Wno-sign-compare -pedantic -Wnull-dereference -Wdouble-promotion -Wformat=2 -Wno-deprecated -Wno-varargs -Wno-c++98-compat -Wno-old-style-cast -Wno-conversion -Wno-unused-parameter -Wno-padded -Wno-cast-align -Wno-reserved-id-macro -Wno-zero-as-null-pointer-constant -Wno-unused-macros -Wno-documentation-unknown-command -Wno-shadow -Wno-tautological-unsigned-zero-compare
GCC_CFLAGS = $(DBG_RLS_MODE) --std=c++17 -oFast -Wall -Wno-unused-function -Wno-unused-but-set-variable -Wno-unused-variable -Wno-sign-compare -pedantic -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wdouble-promotion -Wformat=2 -Wno-unused-result

CFLAGS = $(GCC_CFLAGS)

#Libs we're linking against
LIB = 

#Where to look for .so files
LDFLAGS = -L/usr/lib/x86_64-linux-gnu/ -L.

#Where to look for include files
INCLUDES = -I/usr/include/ -I./

BUILD_DIR = obj/Release
OUT_BINARY = ./binary_name

BUILD_OBJ = $(BUILD_DIR)/main.o $(BUILD_DIR)/anotherfile.o

all: release

before_release:
	test -d . || mkdir -p .
	test -d $(BUILD_DIR) || mkdir -p $(BUILD_DIR)

release: before_release out_release

out_release: before_release $(BUILD_OBJ)
	$(LD) -o $(OUT_BINARY) $(BUILD_OBJ) $(INCLUDES) $(LDFLAGS) $(LIB)

$(BUILD_DIR)/main.o: main.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c main.cpp -o $(BUILD_DIR)/main.o

$(BUILD_DIR)/anotherfile.o: anotherfile.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c anotherfile.cpp -o $(BUILD_DIR)/anotherfile.o

