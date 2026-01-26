# cheri-c-examples
Collection of CHERI C code examples, to be used in tests, documentation, etc.

# Overview
The idea is to create a structured set of sample projects where each “example” consists of two parts:

1. **Baseline (Non-Compliant) Repository**  
    - This repo should be fully available to an LLM.
    - Readme should be written as standard functionality overview & build instructions.

2. **Ported (Compliant) Repository**  
   - None of this repo will be shown to an LLM.
   - This will be our ground truth.
   - Scripts should include inline comments indicating what patches were applied & why.
   - Readme should emphasize improvements & original pitfalls For human evaluators.

3. **Test Suite**  
- This contains a simple set of tests to check for success or failure of the build and run.
- Each shell script will test the build or run of a single example on a single platform.
- (ex.:  test-build-cheri-linux.sh tests the build for the example on CHERI Linux).
- The script test-all-[platform].sh will run the build and test scripts for a platform and save them in a results folder in the test-suite directory.
- See 'testing' section below


Since the baseline and ported are for specific architectures, the architecture name is depicted after "baseline"
or "ported".  i.e. "baseline-x86", "ported-cheri-linux", etc. (see example below)

### Example Directory Layout
```
example1/
├── baseline-x86/          # Baseline Code (Full repo should be available to LLM)
├── ported-morello-arm-purecap/            # Ground Truth Port (Not shown to LLM)
├── ported-cheri-linux/                    # Ground Truth Port (Not shown to LLM)
└── test-suite/                # Platform-specific tests for building an running
...
```

```
example1/
├── baseline-x86/
│   ├── src/
│   │   ├── main.c
│   │   └── helper.c
│   ├── README.md               # Overview, build instructions (LLM can view this - standard README)
│   └── Makefile
├── ported-morello-arm-purecap/
│   ├── src/                    # Should have inline comments (what was changed & why?)
│   │   ├── main.c              # Include comments from annotation json for later human readable annotation.
│   │   └── helper.c 
│   ├── build/                  # Include Binary
│   ├── README.md               # (additional named section for what was changed & why) Emphasize improvements.
...
```
# Testing

To test, navigate to the 'test-suite' folder in an example.

### To test build
```
./test-build-[platform].sh
```
Results will be printed to the command line.

### To test run
(build first, then)

```
./test-run-[platform].sh
```

Results will be printed to the command line.

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

Example folder name:  

```
2026-01-26-184519-overalloc-cherilinux-cherilinux0
```

Example log file name:  

```
test-overalloc-cherilinux.log
```
