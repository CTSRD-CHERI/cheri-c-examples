# cheri-c-examples
Collection of CHERI C code examples, to be used in tests, documentation, etc.

# Overview
The idea is to create a structured set of sample projects where each “example” consists of three parts:

1. **Baseline (Non-Compliant) x86 example**  
    - These should be fully available to an LLM.
    - Readmes should be written as standard functionality overview & build instructions.

2. **Faulty (broken) CHERI Linux example**
   - These should be fully available to an LLM.
   - This is an example of a 'naive' attempt at porting to CHERI Linux, but one or more errors are introduced.
   - Faulty behavior can be a broken build, runtime error (often by triggering a CHERI security exception), or improper use of CHERI feature.

3. **Ported (Compliant) CHERI Linux**  
   - None of this repo will be shown to an LLM.
   - This will be our ground truth.
   - Scripts should include inline comments indicating what patches were applied & why.
   - Readme should emphasize improvements & original pitfalls For human evaluators.

4. **Test Suite**  
- This contains a simple set of tests to check for success or failure of the build and run for each example.
- Each shell script will test the build or run of a single example on a single platform.
- (ex.:  test-build-ported-cheri-linux.sh tests the build for the ported example on CHERI Linux).
- The script test-all-[platform].sh will run the build and test scripts for a platform and save them in a local results folder in the test-suite directory.
- See 'testing' section below

Since the baseline and ported are for specific architectures, the architecture name is depicted after "baseline"
or "ported".  i.e. "baseline-x86", "ported-cheri-linux", etc. (see example below)

### Example Directory Layout
```
example1/
├── baseline-x86/          # Baseline Code (Full repo should be available to LLM)
├── faulty-cheri-linux/          # Incorrect/naive port to CHERI Linux (doesn't work as intended)
├── ported-morello-arm-purecap/            # In progress
├── ported-cheri-linux/                    # Ground Truth Port (Not shown to LLM)
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
├── ported-morello-arm-purecap/ # In progress
├── test-suite/                 # Contains test for each platform/instance.
│   ├── test-all-baseline-x86-linux.sh
│   ├── test-all-faulty-cheri-linux.sh
│   ├── test-all-ported-cheri-linux.sh
│   ├── test-build-baseline-x86-linux.sh
│   ├── test-build-faulty-cheri-linux.sh
│   ├── test-build-ported-cheri-linux.sh
│   ├── test-run-baseline-x86-linux.sh
│   ├── test-run-faulty-cheri-linux.sh
│   ├── test-run-ported-cheri-linux.sh
...
```
# Testing

To test, navigate to the 'test-suite' folder in an example.

### To test build
```
./test-build-[platform].sh
```
Results will be printed to the command line.  Exit code '0' is a passed test; exit code '1' is a failed test.

### To test run
(build first, then)

```
./test-run-[platform].sh
```

Results will be printed to the command line.  Exit code '0' is a passed test; exit code '1' is a failed test.

### To build and test and save results to a log file:
```
./test-all-[platform].sh
```

This will save results in a log file in the folder:  

```
/test-suite/[%Y-%m-%d-%H%M%S]-[Example]-[Platform]-[Hostname]
```

Log file name:

```
test-[Example]-[Platform].log
```

Example folder name and file name:  

```
/test-suite/results/2026-01-26-184519-overalloc-ported-cheri-linux-cherilinux0/test-overalloc-cherilinux.log
```