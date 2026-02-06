CC = clang
CC1 = /usr/local64/llvm-morello-csa/bin/clang-14
MUSL_HOME?=/morello/musl
TARGET = aarch64-linux-musl_purecap
CFLAGS = -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
CFLAGSNA = -g -Wcheri-provenance -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
APP = subobjbnds1
BUILD_DIR = build
LDFLAGS = -fuse-ld=lld -static  -march=morello -mabi=purecap --target=$(TARGET) -rtlib=compiler-rt -L$(MUSL_HOME)/lib  

$(APP):  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGSNA) $(LDFLAGS) src/main.c -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGS) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

