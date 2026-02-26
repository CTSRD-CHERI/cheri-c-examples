# cheri-c-example test scripts
Test the build and run for each example on a specific platform.

# To make a test suite for a new example
### **Copy template test suite**

Copy scripts in this folder into the new example.

From the cheri-c-examples folder:

```
mkdir [new-example]/test-suite
cp -r template/test-suite/*.sh [new-example]/test-suite
```

### **Update test-build scripts**

Make any changs to each "test-build-[platform].sh" script.  As long as the expected result is that the build succeeds, no changes are needed.

### **Update test-run scripts**

In each "test-run-[platform].sh" script, put in SUCCESS\_CONDITION for test to pass.

Extra code and modification will be needed for some examples (such as if run is expected to fail, or intermediate code to make the success condition is needed).