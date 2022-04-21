#!/bin/bash
# カレントディレクトリにあるターゲットプログラムの実行テスト

## 実行言語のチェック（第1引数に言語名を指定する）
require_build="none"
case "$1" in
  "python" | "py" ) 
    target_extention="py"
    target_executor="python3"
    echo "test Python code..."
    ;;
  "ruby" | "rb" ) 
    target_extention="rb"
    target_executor="ruby"
    echo "test Ruby code..."
    ;;
  "perl" | "pl" ) 
    target_extention="pl"
    target_executor="perl"
    echo "test Perl code..."
    ;;
  "swift" | "sw" ) 
    target_extention="swift"
    target_executor="swift"
    echo "test Swift code..."
    ;;
  "go" ) 
    target_extention="out"
    source_extention="go"
    require_build="go build"
    echo "test Go code..."
    ;;
  "c" ) 
    target_extention="out"
    source_extention="c"
    require_build="gcc"
    echo "test C code..."
    ;;
  "c++" | "cpp" | "c+" | "cp") 
    target_extention="out"
    source_extention="cpp"
    require_build="g++"
    echo "test C++ code..."
    ;;
  * )
    echo "argument is language."
    echo "ex) python or py"
    echo "    ruby or rb"
    echo "    perl or pl"
    echo "    swift or sw"
    echo "    go"
    echo "    c"
    echo "    c++ or cpp or c+ or cp"
    exit 1
    ;;
esac

## ビルドが必要なものはやっておく
if test "$require_build" != "none" ; then
  for s in *.$source_extention; do
    $require_build -o ${s/$source_extention/out} $s
  done
fi

## テスト実行
count_OK=0
count_NG=0
for e in *.$target_extention; do
  if test "$require_build" != "" ; then
    e="./$e"
  fi
  for f in input_*.txt; do
    cat $f | $target_executor $e > temp_output
    result=$(diff -d temp_output ${f/input/output})
    if test $? -eq 0 ; then
      echo "check case $f is OK"
      count_OK=$(expr $count_OK + 1)
    else
      echo "check case $f is NG"
      echo $result
      count_NG=$(expr $count_NG + 1)
    fi
  done
done

## 後処理
rm temp_output
echo "test done(OK:$count_OK,NG:$count_NG)"
if test "$require_build" != "none" ; then
  for e in *.$target_extention; do
    rm $e
  done
fi