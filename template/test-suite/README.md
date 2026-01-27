# cheri-c-example test scripts
Test the build and run for each example on a specific platform.

# To make a test suite for a new example
1. **Copy template test suite**

Copy scripts in this folder into the new example.

From the cheri-c-examples folder:

```
cp -r template/test-suite/*.sh [new-example]/test-suite
```

2. **Update test-build scripts**

In each "test-build-[platform].sh" script, change NAME to match the example and platform (ex. NAME="overalloc-cherilinux").

As long as the expected result is that the build succeeds, no other changes are needed.

3. **Update test-run scripts**

In each "test-run-[platform].sh" script, change NAME to match the example and platform (ex. NAME="overalloc-cherilinux").

Change RUN\_RESULTS to match the executable produced by the example (ex. RUN\_RESULTS=$(./build/overalloc 2>&1))

Put in SUCCESS\_CONDITION for test to pass.

Extra code and modification will be needed for some examples (such as if run is expected to fail, or intermediate code to make the success condition is needed).

3. **Update test-all scripts**

In each "test-run-[platform].sh" script, change NAME to match the example and platform (ex. NAME="overalloc-cherilinux").  

No other changes are needed.