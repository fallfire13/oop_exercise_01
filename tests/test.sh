executable=$1

for file in test_??.test
do
  $executable < $file > tmp
  if diff -w tmp ${file%%.test}.result
  then
    echo Test "$file": SUCCESS
  else
    echo Test "$file": FAIL
  fi
  rm tmp
done