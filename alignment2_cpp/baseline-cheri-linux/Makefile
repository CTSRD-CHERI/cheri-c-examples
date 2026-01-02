CC = clang
CCX = clang++
MUSL_HOME?=/morello/musl
TARGET = aarch64-linux-musl_purecap
#CFLAGS = -march=morello -mabi=aapcs -O0 -Wall -g -I.
CFLAGS = -march=morello -mabi=purecap --target=$(TARGET) -O0 -Wall -g -I.  --sysroot $(MUSL_HOME) -v
CFLAGSXX = -march=morello -mabi=purecap --target=$(TARGET) -O0 -Wall -g -I.  --sysroot $(MUSL_HOME) -v

CC1 ?= /usr/local64/llvm-morello-csa/bin/clang-14++
CFLAGSNA ?= -g -Wcheri-provenance -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
APP ?= alignment2_cpp
BUILD_DIR = build
LDFLAGS = -fuse-ld=lld -static -lc -lunwind -lc++abi -lc++   -march=morello -mabi=purecap --target=$(TARGET) -rtlib=compiler-rt -L$(MUSL_HOME)/lib  

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

