#!/bin/sh

# Process command line arguments
if [ "$#" -lt 1 ] ; then
    echo "Usage: $0 VARIANT LANGUAGE[optional] [examples to skip]"
    echo "Example: ./build_and_run_all_cheri_examples.sh baseline-x86-linux cpp alignment1 alignment2"
    exit 1
fi

VARIANT="$1"

if [ "$VARIANT" != "baseline-x86-linux" ] && [ "$VARIANT" != "faulty-cheri-bsd" ] && \
    [ "$VARIANT" != "faulty-cheri-linux" ] && [ "$VARIANT" != "ported-cheri-bsd" ]  && [ "$VARIANT" != "ported-cheri-linux" ] ; then
    echo "Invalid VARIANT.
"
    echo "Supported VARIANTs:"
    echo ""
    echo "baseline-x86-linux"
    echo "faulty-cheri-bsd"
    echo "faulty-cheri-linux"
    echo "ported-cheri-bsd"
    echo "ported-cheri-linux"
    exit 1
fi

LANGUAGE="$2"

if [ -z "$LANGUAGE" ]; then
    LANGUAGE="all"
fi

if [ "$LANGUAGE" != "c" ] && [ "$LANGUAGE" != "cpp" ] && [ "$LANGUAGE" != "all" ] ; then
    echo "Invalid LANGUAGE selection
"
    echo "LANGGUAGEs:"
    echo ""
    echo "c"
    echo "cpp"
    echo "all (default)"
    exit 1
fi

if [ "$#" -ge 2 ] ; then
    shift 2
fi

SKIP_EXAMPLES="$@"

echo "Running $LANGUAGE examples on $VARIANT.

Skipping $SKIP_EXAMPLES
"


# Make the results directory inside "test" if it doesn't exist already, and move up one directory.
mkdir -p results
cd ..

LOGFILE="$(pwd)/test/results/cheri_examples_$VARIANT-$(hostname)_$(date +%Y%m%d_%H%M%S).log"

PASS_LIST=""
FAIL_LIST=""
SKIP_LIST=""
BUILD_FAIL_LIST=""
PASS=0
FAIL=0
SKIP=0
BUILD_FAIL=0

echo "===== CHERI C Examples Test Run =====" | tee -a "$LOGFILE"
echo "Date: $(date)" | tee -a "$LOGFILE"
echo "Variant: $VARIANT" | tee -a "$LOGFILE"
echo "======================================" | tee -a "$LOGFILE"
echo "" | tee -a "$LOGFILE"

for dir in */; do
    example=$(basename "$dir")

    # Skip non-example entries
    if [ "$example" = "template" ] || [ "$example" = "test" ] || [ ! -d "$dir/$VARIANT" ]; then
        echo "[$example] SKIPPED - no $VARIANT directory found" | tee -a "$LOGFILE"
        SKIP=$((SKIP + 1))
        SKIP_LIST="${SKIP_LIST}${example}
"
        echo "" | tee -a "$LOGFILE"
        continue
    fi

    # Skip non-LANGUAGE entries (from $LANGUAGE command line argument above)
    if [ "$LANGUAGE" != "all" ] && [ ! -f "$dir/$VARIANT/src/main.$LANGUAGE" ]; then
        echo "[$example] SKIPPED - no main.$LANGUAGE file found" | tee -a "$LOGFILE"
        SKIP=$((SKIP + 1))
        SKIP_LIST="${SKIP_LIST}${example}
"
        echo "" | tee -a "$LOGFILE"
        continue
    fi

    # Skip an example specified in the command line
    SKIP_ME=0
    for item in $SKIP_EXAMPLES; do
        if [ "$example" = "$item" ]; then
            SKIP_ME=1
        fi
    done

    if [ "$SKIP_ME" -eq 1 ]; then
        echo "[$example] SKIPPED - specified skip in command line" | tee -a "$LOGFILE"
        SKIP=$((SKIP + 1))
        SKIP_LIST="${SKIP_LIST}${example}
"
        echo "" | tee -a "$LOGFILE"
        continue
    fi

    echo "========== $example ==========" | tee -a "$LOGFILE"

    cd "$dir/test-suite"

    # Build and capture output
    echo "[$example] Building..." | tee -a "$LOGFILE"
    BUILD_OUTPUT=$("./test-build-$VARIANT.sh")
    BUILD_STATUS=$?

    printf "%s\n" "$BUILD_OUTPUT" | tee -a "$LOGFILE"
    echo "" | tee -a "$LOGFILE"

    echo "[$example] Exit code: $BUILD_STATUS" | tee -a "$LOGFILE"

    if [ $BUILD_STATUS -eq 0 ]; then

        # If build worked, run and capture output
        echo "[$example] Running..." | tee -a "$LOGFILE"
        RUN_OUTPUT=$("./test-run-$VARIANT.sh")
        RUN_STATUS=$?
        
        printf "%s\n" "$RUN_OUTPUT" | tee -a "$LOGFILE"
        echo "" | tee -a "$LOGFILE"

        echo "[$example] Exit code: $RUN_STATUS" | tee -a "$LOGFILE"
        if [ $RUN_STATUS -eq 0 ]; then
            PASS=$((PASS + 1))
            PASS_LIST="${PASS_LIST}${example}
    "
        else
            FAIL=$((FAIL + 1))
            FAIL_LIST="${FAIL_LIST}${example} (exit code $RUN_STATUS)
    "
        fi

    else
        echo "[$example] BUILD FAILED: $BUILD_STATUS" | tee -a "$LOGFILE"
        BUILD_FAIL=$((BUILD_FAIL + 1))
        BUILD_FAIL_LIST="${BUILD_FAIL_LIST}${example}: ${BUILD_STATUS}
"
    fi

    cd ../..

done


# Save and print summary
echo "======================================" | tee -a "$LOGFILE"
echo "SUMMARY: PASS=$PASS  FAIL=$FAIL  BUILD_FAILED=$BUILD_FAIL  SKIP=$SKIP" | tee -a "$LOGFILE"
echo "" | tee -a "$LOGFILE"

echo "PASSED:" | tee -a "$LOGFILE"
if [ -n "$PASS_LIST" ]; then
    printf "%s" "$PASS_LIST" | sed 's/^/  /' | tee -a "$LOGFILE"
else
    echo "  (none)" | tee -a "$LOGFILE"
fi
echo "" | tee -a "$LOGFILE"

echo "FAILED:" | tee -a "$LOGFILE"
if [ -n "$FAIL_LIST" ]; then
    printf "%s" "$FAIL_LIST" | sed 's/^/  /' | tee -a "$LOGFILE"
else
    echo "  (none)" | tee -a "$LOGFILE"
fi
echo "" | tee -a "$LOGFILE"

echo "BUILD FAILED:" | tee -a "$LOGFILE"
if [ -n "$BUILD_FAIL_LIST" ]; then
    printf "%s" "$BUILD_FAIL_LIST" | sed 's/^/  /' | tee -a "$LOGFILE"
else
    echo "  (none)" | tee -a "$LOGFILE"
fi
echo "" | tee -a "$LOGFILE"

echo "SKIPPED:" | tee -a "$LOGFILE"
if [ -n "$SKIP_LIST" ]; then
    printf "%s" "$SKIP_LIST" | sed 's/^/  /' | tee -a "$LOGFILE"
else
    echo "  (none)" | tee -a "$LOGFILE"
fi
echo "" | tee -a "$LOGFILE"

echo "Log saved to: $LOGFILE" | tee -a "$LOGFILE"

if [ -n "$PASS_LIST" ] && [ -z "$FAIL_LIST" ] && [ -z "$BUILD_FAIL_LIST" ]; then
    echo "All tests passed, there were no build or run test fails." | tee -a "$LOGFILE"
    exit 0
else
    echo "At least one test failed." | tee -a "$LOGFILE"
    exit 1
fi