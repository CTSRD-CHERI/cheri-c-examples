CC ?= clang
CXX = clang++
CC1 ?= /usr/local64/llvm-morello-csa/bin/clang-14
CFLAGS ?= -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap
CXXFLAGS = -g -march=morello+c64 -mabi=purecap -O0 -Wall -g
CFLAGSNA ?= -g -Wcheri-provenance -march=morello+c64 -mabi=purecap
LDFLAGS = -lrt
APP ?=  arduprob 
BUILD_DIR = build

$(APP):  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS)  $(LDFLAGS) src/main.cpp -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGS) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

