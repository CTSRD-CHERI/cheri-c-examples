CC = clang
CCX = clang++
CC1 = /usr/local64/llvm-morello-csa/bin/clang-14
CC1X = /usr/local64/llvm-morello-csa/bin/clang-14++

MUSL_HOME?=/morello/musl
TARGET = aarch64-linux-musl_purecap

CFLAGS = -g -Wcheri-provenance -cheri-bounds=aggressive   -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
CFLAGSXX = -g -Wcheri-provenance -cheri-bounds=aggressive  -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
CFLAGSNA = -g -Wcheri-provenance -cheri-bounds=aggressive -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
CFLAGSNAXX = -g -Wcheri-provenance -cheri-bounds=aggressive -march=morello+c64 -mabi=purecap --target=$(TARGET) --sysroot $(MUSL_HOME)
APP = subobjbds2_cpp
BUILD_DIR = build
LDFLAGS = -fuse-ld=lld -static  -march=morello -mabi=purecap --target=$(TARGET) -rtlib=compiler-rt -L$(MUSL_HOME)/lib  

$(APP):  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CCX) $(CFLAGSXX) $(LDFLAGS) src/main.cpp -o $(BUILD_DIR)/$(APP) 

analyze:  src/main.cpp
	mkdir -p $(BUILD_DIR)
	$(CC1XX) $(CFLAGSXX) --analyze  src/main.c -o $(BUILD_DIR)/analyze

all: $(APP) 

clean:
	rm -f $(BUILD_DIR)/$(APP) 
	rm -f $(BUILD_DIR)/analyze

