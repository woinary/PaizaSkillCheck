#!/bin/bash

# 問題毎のフォルダとテンプレート作成

## サブルーチン
usage() {
    echo "$0 <directory> <lang>"
    echo "<directory>: directiry name of test"
    echo "<lang>": language for test
    echo "ex) python or py"
    echo "    ruby or rb"
    echo "    perl or pl"
    echo "    swift or sw"
    echo "    go"
    echo "    c"
    echo "    c++ or cpp or c+ or cp"
    echo "    rust or rs"
    echo "    javascript or js"
}

## メイン

## フォルダチェック
if test $1 = "" ; then
    usage
    exit 1
fi

## 実行言語のチェック（第1引数に言語名を指定する）
require_build="none"
case "$2" in
  "python" | "py" ) 
    target="py"
    echo "create directory and templates for Python..."
    ;;
  "ruby" | "rb" ) 
    target="rb"
    echo "create directory and templates for Ruby..."
    ;;
  "perl" | "pl" ) 
    target="pl"
    echo "create directory and templates for Perl..."
    ;;
  "javascript" | "js" ) 
    target="js"
    echo "create directory and templates for JavaScript..."
    ;;
  "swift" | "sw" ) 
    target="swift"
    echo "create directory and templates for Swift..."
    ;;
  "go" ) 
    target="go"
    echo "create directory and templates for Go..."
    ;;
  "c" ) 
    target="c"
    echo "create directory and templates for C..."
    ;;
  "c++" | "cpp" | "c+" | "cp") 
    target="cpp"
    echo "create directory and templates for C++..."
    ;;
  "rust" | "rs" ) 
    target="rs"
    echo "create directory and templates for Rust..."
    ;;
  * )
    usage
    exit 2
    ;;
esac

## テスト用ディレクトリの作成
dir_name=$(echo "$1"|tr '[:lower:]' '[:upper:]')
mkdir "$dir_name"

## ソースコード・テンプレートのコピー
cp templates/*.$target $dir_name/$1.$target

## テストケースファイルの作成
for f in 001 002 ; do
    touch $dir_name/input_$f.txt
    touch $dir_name/output_$f.txt
done

## テスト用ディレクトリへ移動
cd "$dir_name"
