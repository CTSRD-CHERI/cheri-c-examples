# cheri-c-examples
Collection of CHERI C code examples, to be used in tests, documentation, etc.

# Overview
The idea is to create a structured set of sample projects where each “example” consists of three parts:

1. **Baseline (Non-Compliant) Repository**  
    - This repo should be fully available to an LLM.
    - Readme should be written as standard functionality overview & build instructions.

2. **Ported (Compliant) Repository**  
   - None of this repo will be shown to an LLM.
   - This will be our ground truth.
   - Scripts should include inline comments indicating what patches were applied & why.
   - Readme should emphasize improvements & original pitfalls For human evaluators.

3. **Test Suite**  
    - Contains relevant information to assess the functionality & potential vulnerabilities addressed by porting
    - Still under cooperative design

### Example Directory Layout
```
example1/
├── baseline/                  # Baseline Code (Full repo should be available to LLM)
├── ported/                    # Ground Truth Port (Not shown to LLM)
└── test_suite/                # (In Progress)
```

```
example1/
├── baseline/
│   ├── src/
│   │   ├── main.c
│   │   └── helper.c
│   ├── README.md               # Overview, build instructions (LLM can view this - standard README)
│   └── Makefile
├── ported/
│   ├── src/                    # Should have inline comments (what was changed & why?)
│   │   ├── main.c              # Include comments from annotation json for later human readable annotation.
│   │   └── helper.c 
│   ├── build/                  # Include Binary
│   ├── README.md               # (additional named section for what was changed & why) Emphasize improvements & pitfalls (For human eval. Not LLM)
│   └── Makefile
└── test_suite/
  └── verification.yaml         # Contains expected terminal output strings for regex evaluation of functionality & vulnerability tests.
```
