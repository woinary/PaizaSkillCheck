# Paizaスキルチェック用テスト環境
![GitHub last commit](https://img.shields.io/github/last-commit/woinary/PaizaSkillCheck) ![GitHub](https://img.shields.io/github/license/woinary/PaizaSkillCheck)

## 概要
[Paiza](https://paiza.jp/)の[スキルチェック](https://paiza.jp/challenges)を行う際に、通常は提出先の実行環境や[Paiza.io](https://paiza.io/ja)を使用するかと思いますが、テストケースを都度都度入力するのも面倒です。
そこで、あらかじめテストケース（入力ファイル、出力ファイル）を用意しておくことで、テストを簡単に実行できるシェルスクリプト（bash系）を用意しました。

なお、こちらはテスト実行を簡単にするためのものですので、各プログラミング言語の開発環境は別途用意する必要があります。
また、bash系のシェルスクリプトですので、Linux各種ディストリビューションやその他Unix由来のOSや、macOSではそのまま使えると思いますが、WindowsではWSLやその他Unix系ツールのインストールが必要になります。

## 使い方

### create.sh

テスト用フォルダを作成し、テンプレートディレクトリから指定した言語のサンプルコードをコピーし、入力/出力テストケースファイルを作成します。第1引数がテスト名、第2引数がターゲット・プログラミング言語となります。

```
./create.sh <test_name> <language_name>
```

テスト名はなんでも構いませんが、例えば"D207:文字列の省略"ならばd207とするとわかりやすくなると思います。なお、ディレクトリ名は自動的に大文字に変換します。

ソースコード名は指定した"テスト名.その言語の拡張子"となります。

テストケースファイルは2セット作成します。中身は空ですので、入力する内容と、その結果出力される内容をあらかじめ記載してください。
3つ目以降は適宜追加してください。

例えば、"./create.sh d123 py"を実行すると、以下のようなファイル構成になります。

```
PaizaSkillCheck
   + D123
      + d123.py
      + input_001.txt
      + input_002.txt
      + output_001.txt
      + output_002.txt
```

入力テストケースと出力テストケースのXXX部分は対応するものは同じものを記載します。必ずセットにしてください。セットになっていれば、いくつあっても構いません。全てのテストケースを実行します。テストケースも含めてサンプルを用意してあるので、実行してみてください^[プログラミング言語の開発環境は各自でご用意ください。]。

なお、テストではディレクトリにあるソースコードを全て実行するので、1問につき1ディレクトリにしてください。同じ問題であれば、複数の言語のソースを同じディレクトリにおいても構いません。

### test.sh

問題毎のディレクトリに移動した後、test.shを実行することで、カレントディレクトリにある入力テストケースファイル（input_*.txt）を読み込んで、テストを行います。
その結果を出力テストケースファイル(output_+.txt)と比較して、一致すればOK、不一致であればNGとしてカウントします。

第1引数に言語名を指定します。言語名は適宜省略も可能ですが、引数を指定しないで実行すると使えるものが出てくるので、参考としてください。

```
../test.sh py
```
例えば、サンプルのrubyスクリプトを実行すると以下のような結果が出力されます。

```
% ../test.sh rb
test Ruby code...
check case input_001.txt is OK
check case input_002.txt is OK
test done(OK:2,NG:0)
```

テスト結果が一致しない場合、diffの結果を出力します。改行がないので見にくいと思いますが、ご参考まで。

```
% ../test.sh rb
test Ruby code...
check case input_001.txt is OK
check case input_002.txt is NG
1c1 < 300 --- > 300a
test done(OK:1,NG:1)
```

### その他

サンプルとしてX01というディレクトリを作成してあります。本当の問題を掲載するわけにはいかないため、こちらで用意した簡単なサンプルになります。

現在、以下の言語に対応しています。いくつか省略形も用意しています。引数なしで実行した場合にリストを表示する様にしてあります。

```
python
ruby
perl
swift
Go
C
C++
```

対応言語の追加等、適宜修正してご利用ください。難しいことはしておりませんので、Paizaスキルチェックをやっておられる方なら難なく修正できるかと思われます。
テストしかしませんので、提出は各自で手作業でお願いします。
