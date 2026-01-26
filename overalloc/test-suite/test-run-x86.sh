cd ../baseline-x86/

REGEX="0x[0-9A-Fa-f]+" # REGEX to find printed memory addresses only

if ! ./build/overalloc; then
    echo "RESULT:  $NAME run failed."
fi 

# Run the built c file; print results to command line and grep for REGEX.  
# Save finds for memory addresses to MEM_MATCHES array.
mapfile -t MEM_MATCHES < <(
  ./build/overalloc | tee /dev/tty | grep -o -E "$REGEX"
)

# First element (MEM_MATCHES[0]) is the address for p1.
echo "Pointer p1 address is ${MEM_MATCHES[0]}"

# Third element (MEM_MATCHES[2]) is the address for p2 after pointer bleed.
echo "Pointer p2 address is ${MEM_MATCHES[2]}"

# Compare first and third elements (strip whitespace).  
if [[ "${MEM_MATCHES[0]//[[:space:]]/}" == "${MEM_MATCHES[2]//[[:space:]]/}" ]]; then
    # These should be the same.
    echo "p1 and p2 addresses are equal."
    echo "RESULT:  $NAME run success."
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
fi
