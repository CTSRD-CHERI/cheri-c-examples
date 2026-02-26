# cheri-c-examples
Collection of CHERI C code examples, to be used in tests, documentation, etc.

# Overview
The idea is to create a structured set of sample projects where each “example” consists of four parts:

1. **Baseline (Non-Compliant) x86 example**  
    - These should be fully available to an LLM.
    - Readmes should be written as standard functionality overview & build instructions.

2. **Faulty (broken) CHERI Linux and CHERI BSD examples**
   - These should be fully available to an LLM.
   - This is an example of a 'naive' attempt at porting to CHERI Linux/BSD, but one or more errors are introduced.
   - Faulty behavior can be a broken build, runtime error (often by triggering a CHERI security exception), or improper use of CHERI feature.

3. **Ported (Compliant) CHERI Linux and CHERI BSD examples**  
   - None of this repo will be shown to an LLM.
   - This will be our ground truth.
   - Scripts should include inline comments indicating what patches were applied & why.
   - Readme should emphasize improvements & original pitfalls For human evaluators.

4. **Test Suite**  
- This contains a simple set of tests to check for success or failure of the build and run for each example.
- Each shell script will test the build or run of a single example on a single variant.
- (ex.:  test-build-ported-cheri-linux.sh tests the build for the ported example on CHERI Linux).
- See 'testing' section below.

Since the baseline and ported are for specific variants, the variant name is depicted after "baseline"
or "ported".  i.e. "baseline-x86", "ported-cheri-linux", etc. (see example below)

### Example Directory Layout
```
example1/
├── baseline-x86/          # Baseline Code (Full repo should be available to LLM)
├── faulty-cheri-linux/          # Incorrect/naive port to CHERI Linux (doesn't work as intended)
├── faulty-cheri-bsd/            # Incorrect/naive port to CHERI BSD (doesn't work as intended)
├── ported-cheri-linux/                    # Ground Truth Port (Not shown to LLM)
├── ported-cheri-bsd/                    # Ground Truth Port (Not shown to LLM)
└── test-suite/                # Platform-specific tests for building an running
...
```

Subfolder and file structures for a generic example
```
example/
├── baseline-x86/
│   ├── src/
│   │   ├── main.c
│   ├── README.md               # Overview, build instructions (LLM can view this - standard README)
│   └── Makefile
├── faulty-cheri-linux/
│   ├── src/                    
│   │   ├── main.c              
│   ├── README.md               # Overview, build instructions (LLM can view this - standard README)
│   └── Makefile
├── ported-cheri-linux/
│   ├── src/                    # Should have inline comments (what was changed & why?)
│   │   ├── main.c              # Include comments from annotation json for later human readable annotation.
│   ├── README.md               # (additional named section for what was changed & why) Emphasize improvements.
│   └── Makefile
├── test-suite/                 # Contains test for each platform/instance.
│   ├── test-build-baseline-x86-linux.sh
│   ├── test-build-faulty-cheri-linux.sh
│   ├── test-build-ported-cheri-linux.sh
│   ├── test-run-baseline-x86-linux.sh
│   ├── test-run-faulty-cheri-linux.sh
│   ├── test-run-ported-cheri-linux.sh
...
```
# Testing

To test a single example, navigate to the 'test-suite' folder in an example.

```
cd [example]/test-suite
```

### To test build
```
./test-build-[variant].sh
```
Results will be printed to the command line.  Exit code '0' is a passed test; exit code '1' is a failed test.

### To test run
(build first, then)

```
./test-run-[variant].sh
```

Results will be printed to the command line.  Exit code '0' is a passed test; exit code '1' is a failed test.

### To build and test for all examples on one variant and save results to a log file:

Navigate to the 'test' folder in the cheri-c-examples repo

```
cd test
```

Run the "./build_and_run_all_cheri_examples.sh" script with the variant as a command line argument.

```
./build_and_run_all_cheri_examples.sh [variant]
```

This will save results in a log file in the folder:  

```
/test/results/cheri_examples_[variant]-[hostname]-[YYYYMMDD_HHMMSS].log
```

For example:

```
./build_and_run_all_cheri_examples.sh ported-cheri-linux
```

Will build and run all ported cheri linux examples and save the results in the example log file

```
cheri_examples_ported-cheri-linux-cherilinux0_20260225_191238.log
```