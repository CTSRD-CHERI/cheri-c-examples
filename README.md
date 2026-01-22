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

Since the baseline and ported are for specific architectures, the architecture name is depicted after "baseline"
or "ported".  i.e. "baseline-morello-arm-purecap", "ported-cheri-linux", etc. (see example below)

### Example Directory Layout
```
example1/
├── baseline-x86/          # Baseline Code (Full repo should be available to LLM)
...
├── ported-morello-arm-purecap/            # Ground Truth Port (Not shown to LLM)
├── ported-cheri-linux/                    # Ground Truth Port (Not shown to LLM)
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
