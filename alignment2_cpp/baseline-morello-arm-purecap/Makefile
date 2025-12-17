CC = clang
CCX = clang++
CC1 = /usr/local64/llvm-morello-csa/bin/clang-14
CC1X = /usr/local64/llvm-morello-csa/bin/clang-14
CFLAGS = -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap
CFLAGSX = -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap
CFLAGSNA = -g -Wcheri-provenance -march=morello+c64 -mabi=purecap
APP = alignment2_cpp
BUILD_DIR = build

$(APP):  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CCX) $(CFLAGSX)  src/main.cpp -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CC1X) $(CFLAGSX) --analyze  src/main.cpp -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

