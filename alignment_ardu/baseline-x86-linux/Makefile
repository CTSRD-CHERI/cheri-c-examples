CC = clang
CC1 = /usr/local64/llvm-morello-csa/bin/clang-14
TARGET = aarch64-linux-musl_purecap
MUSL_HOME = /morello/musl
#CFLAGS = -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap
CFLAGS = -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello -mabi=purecap --target=$(TARGET) -rtlib=compiler-rt -L$(MUSL_HOME)/lib -fuse-ld=lld -static --sysroot $(MUSL_HOME) -v
CFLAGSNA = -g -Wcheri-provenance -march=morello+c64 -mabi=purecap
APP = alignment_ardu 
BUILD_DIR = build

$(APP):  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS)  src/main.c -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGS) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

