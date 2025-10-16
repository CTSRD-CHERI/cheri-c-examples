CC ?= clang
CC1 ?= /usr/local64/llvm-morello-csa/bin/clang-14
CFLAGS ?= -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap
CFLAGSNA ?= -g -Wcheri-provenance -march=morello+c64 -mabi=purecap
APP ?= subobjbnds3
BUILD_DIR = build

$(APP):  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGSNA)  src/main.c -o $(BUILD_DIR)/$(APP)

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGS) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

