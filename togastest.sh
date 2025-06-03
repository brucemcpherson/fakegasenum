SOURCE="./test"
EXT="*.js"
CLASP=true

TARGET="./testBmFakeGasenum"
cp "${SOURCE}"/${EXT} "${TARGET}/"
# find all the copied files and comment/fixes out import and export statements
# note - this simple version naively expects that to be on 1 line
sed -i 's/^import\s\s*/\/\/import /g' $(find "${TARGET}" -name "$EXT" -type f) 
sed -i 's/^\s*export\s\s*//g' $(find "${TARGET}" -name "$EXT" -type f)

# now go to the target and push and open if required
if [ "$CLASP" = true ] ; then
  cd "${TARGET}"
  clasp push
fi