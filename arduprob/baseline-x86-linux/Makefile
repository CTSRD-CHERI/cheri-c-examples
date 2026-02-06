CC = clang
CCX = clang++
TARGET = x86_64-linux-gnu
CFLAGS = -O0 -Wall -g -I.
GCC_VERSION = $(notdir $(firstword $(wildcard /usr/include/c++/*)))
CXX_INCLUDE_FLAGS = $(if $(GCC_VERSION),-I/usr/include/c++/$(GCC_VERSION) -I/usr/include/x86_64-linux-gnu/c++/$(GCC_VERSION))
CFLAGSXX = -O0 -Wall -g -I. -std=c++11 $(CXX_INCLUDE_FLAGS)

CC1 ?= clang++
CFLAGSNA ?= -g -Wall
APP ?= arduprob
BUILD_DIR = build
GCC_LIB_DIR = $(firstword $(wildcard /usr/lib/gcc/x86_64-linux-gnu/*))
LDFLAGS = $(if $(GCC_LIB_DIR),-L$(GCC_LIB_DIR))

$(APP):  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CCX) $(CFLAGSXX) $(LDFLAGS) src/main.cpp -o $(BUILD_DIR)/$(APP)

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGSXX) --analyze  src/main.cpp -o $(BUILD_DIR)/analyze

all: $(APP)

clean:
	rm -f $(BUILD_DIR)/$(APP)
	rm -f $(BUILD_DIR)/analyze

