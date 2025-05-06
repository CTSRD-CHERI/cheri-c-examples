CC ?= clang
CC1 ?= /usr/local64/llvm-morello-csa/bin/clang-14
CFLAGS ?= -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap
CFLAGSNA ?= -g -Wcheri-provenance -march=morello+c64 -mabi=purecap
APP ?= template
APP_NA ?= template_na
BUILD_DIR=build

$(APP_NA):  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGSNA)  src/main.c -o $(BUILD_DIR)/$(APP_NA)

$(APP):  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS)  src/main.c -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGS) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(APP) 
	rm -f $(APP_NA) 
	rm -f analyze 

