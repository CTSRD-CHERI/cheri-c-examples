CC = gcc
CCX = g++
TARGET = x86_64-linux-gnu
CFLAGS = -O0 -Wall -g -I.
CFLAGSXX = -O0 -Wall -g -I. -std=c++11

CC1 ?= g++
CFLAGSNA ?= -g -Wall
APP ?= capasint_cpp
BUILD_DIR = build
LDFLAGS = 

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

