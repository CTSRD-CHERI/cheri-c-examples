CC = clang
MUSL_HOME?=/morello/musl
TARGET = aarch64-linux-musl_purecap
CFLAGS =

CC1 ?= /usr/local64/llvm-morello-csa/bin/clang-14
CFLAGSNA ?= -g -Wcheri-provenance -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
APP ?= capcopy 
BUILD_DIR = build
LDFLAGS =

$(APP):  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $(LDFLAGS) src/main.c -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.c
	mkdir -p $(BUILD_DIR)
	$(CC1) $(CFLAGS) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

