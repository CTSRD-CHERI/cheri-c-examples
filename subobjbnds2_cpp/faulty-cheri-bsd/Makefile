CC = clang
CCX = clang++
CC1 = /usr/local64/llvm-morello-csa/bin/clang-14
CC1X = /usr/local64/llvm-morello-csa/bin/clang-14++
CFLAGS = -g -Wcheri-provenance -cheri-bounds=aggressive   -march=morello+c64 -mabi=purecap
CFLAGSXX = -g -Wcheri-provenance -cheri-bounds=aggressive  -march=morello+c64 -mabi=purecap
CFLAGSNA = -g -Wcheri-provenance -cheri-bounds=aggressive -march=morello+c64 -mabi=purecap
CFLAGSNAXX = -g -Wcheri-provenance -cheri-bounds=aggressive -march=morello+c64 -mabi=purecap
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

