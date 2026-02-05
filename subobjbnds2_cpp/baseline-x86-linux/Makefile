CC = gcc
CCX = g++
TARGET = x86_64-linux-gnu
CFLAGS = -O0 -Wall -g -I.
CFLAGSXX = -O0 -Wall -g -I. -std=c++11

CC1 ?= g++
CFLAGSNA ?= -g -Wall
APP = subobjbnds2_cpp
BUILD_DIR = build

$(APP):  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CCX) $(CFLAGSXX)  src/main.cpp -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CC1XX) $(CFLAGSXX) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

