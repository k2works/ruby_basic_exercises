### Rubyプログラミング基礎演習


---


### 構成

+ 自己紹介
+ Rubyについて
+ 開発演習
+ 開発実演

---


### 自己紹介

+ カキギカツユキ
+ ネット通販の会社で業務システムを開発運用しています
+ その前はシステムエンジニアとしていろんな会社のシステム開発をしていました

---


### Rubyについて

[参照：第1回 2012.4.12 講義ガイダンス、Rubyについて](https://speakerdeck.com/igaiga/ruby-1?slide=25)

---


### 開発演習

あなたはとあるシステム会社のプログラマです。

ある日の先輩のSE（システムエンジニア）から仕事を依頼さました。

---

### 開発演習

SE「ちょっとしたプログラムを作ってくれるかな、仕様書は[これ](https://k2works.github.io/ruby_basic_exercises/excercies/index.html#_uc_02%E4%BB%95%E5%85%A5%E3%82%8C%E5%95%86%E5%93%81%E3%82%92%E5%85%A5%E8%8D%B7%E3%81%99%E3%82%8B)ね。」

---

### 開発演習

あなたは渡された仕様書をもとに指定された納期までにプログラムを作らなければなりません。

---


### 開発実演

プログラムを作る方法はいろいろありますが一般的に以下の手順で進めます。

1. 仕様を決める
1. 設計する
1. 実装する

---

### 開発実演

まず、[仕様を決めます](https://github.com/k2works/ruby_basic_exercises/blob/b3a810733db506e40a762f926c1fe718a580cb78/docs/src/demonstration/index.adoc)

#### 仕様
* ３で割り切れる場合は「Fizz」を出力する。
* ５で割り切れる場合は「Buzz」を出力する。
* 両者で割り切れる場合は「FizzBuzz」を出力する。
* 指定された回数だけ繰り返し実行する。

---

### 開発実演

続いてプログラムの設計をします。

まず、[TODOリスト](https://github.com/k2works/ruby_basic_exercises/blob/b3a810733db506e40a762f926c1fe718a580cb78/docs/src/demonstration/index.adoc)を作成しましょう

#### TODOリスト
+ Fizzを出力できるようにする
+ Buzzを出力できるようにする
+ FizzBuzzを出力できるようにする
+ 繰り返し実行できるようにする

---

### 開発実演

必要に応じて以下の図表を作成することがあります。

+ ユースケース図
+ クラス図
+ シーケンス図

---

### 開発実演

設計が終わったらプログラムの実装です。

まず、クラスを作成しましょう。

```ruby
class FizzBuzz
end
```
---

### 開発実演

テストをしながら設計のTODOリストを一つづつ片付けていきましょう

```ruby
class FizzBuzz
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    it '3ならばFizzを返す' do
      expect(3).must_equal 'Fizz'
    end
  end
end
```
---

### 開発実演

クラスにメソッドを追加します

```ruby
class FizzBuzz
  def generate(number)
    'Fizz'
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end
    end
  end
end
```
---

### 開発実演

3以外の数字でもFizzを返すことができるようにしましょう。

```ruby
class FizzBuzz
  def generate(number)
    if number % 3 == 0
      'Fizz'
    end
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '30ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'Fizz'
      end
    end
  end
end
```
---

### 開発実演

TODOを一つ片付けることができました。

では、次のTODOに取り組みましょう。

#### TODOリスト
+ ~~Fizzを出力できるようにする~~
+ **Buzzを出力できるようにする**
+ FizzBuzzを出力できるようにする
+ 繰り返し実行できるようにする

---

### 開発実演

まずはテストを追加しましょう

```ruby
class FizzBuzz
  def generate(number)
    if number % 3 == 0
      'Fizz'
    end
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '30ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'Fizz'
      end

      it '5ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(5)).must_equal 'Buzz'
      end
    end
  end
```
---

### 開発実演

テストが通るように条件を変更しましょう。

```ruby
class FizzBuzz
  def generate(number)
    if number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    end
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '30ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'Fizz'
      end

      it '5ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(5)).must_equal 'Buzz'
      end

      it '10ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(10)).must_equal 'Buzz'
      end

      it '50ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(50)).must_equal 'Buzz'
      end
    end
  end
end
```
---

### 開発実演

２つ目のTODOを片付けることができました。

では、次のTODOに取り組みましょう。

#### TODOリスト
+ ~~Fizzを出力できるようにする~~
+ ~~Buzzを出力できるようにする~~
+ **FizzBuzzを出力できるようにする**
+ 繰り返し実行できるようにする

---

### 開発実演

まずは・・・テストからですよね。

```ruby
class FizzBuzz
  def generate(number)
    if number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    end
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '30ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'Fizz'
      end

      it '5ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(5)).must_equal 'Buzz'
      end

      it '10ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(10)).must_equal 'Buzz'
      end

      it '50ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(50)).must_equal 'Buzz'
      end

      it '15ならばFizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(15)).must_equal 'FizzBuzz'
      end
    end
  end
end
```
---

### 開発実演

続いて、テストが通るようにプログラムを変更しましょう。

おや、テストが失敗してしまいました。

なぜでしょうか？

```ruby
class FizzBuzz
  def generate(number)
    if number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    elsif number % 3 == 0 and number % 5 == 0
      'FizzBuzz'
    end
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '30ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'Fizz'
      end

      it '5ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(5)).must_equal 'Buzz'
      end

      it '10ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(10)).must_equal 'Buzz'
      end

      it '50ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(50)).must_equal 'Buzz'
      end

      it '15ならばFizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(15)).must_equal 'FizzBuzz'
      end
    end
  end
end
```
---

### 開発実演

どうやら変更した条件では思ったとおりにプログラムが動いてくれなかったようです。

思ったとおりに動くようにプログラムを修正しましょう。

テストが通りましたか？

```ruby
class FizzBuzz
  def generate(number)
    if number % 3 == 0 and number % 5 == 0
      'FizzBuzz'
    elsif number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    end
  end
end

require 'minitest/autorun'
class FizzBuzzSpec < Minitest::Spec
  describe FizzBuzz do
    describe '#generate' do
      it '3ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(3)).must_equal 'Fizz'
      end

      it '6ならばFizzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(6)).must_equal 'Fizz'
      end

      it '5ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(5)).must_equal 'Buzz'
      end

      it '10ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(10)).must_equal 'Buzz'
      end

      it '50ならばBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(50)).must_equal 'Buzz'
      end

      it '15ならばFizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(15)).must_equal 'FizzBuzz'
      end

      it '30ならばFizzBuzzを返す' do
        fizz_buzz = FizzBuzz.new
        expect(fizz_buzz.generate(30)).must_equal 'FizzBuzz'
      end

    end
  end
end
```
---

### 開発実演

３つ目のTODOを片付けることができました。

いよいよ最後のTODOですがこれはちょっと難しいのでやってみてわからないときはプログラムの上手い人に相談してみましょう。

#### TODOリスト
+ ~~Fizzを出力できるようにする~~
+ ~~Buzzを出力できるようにする~~
+ ~~FizzBuzzを出力できるようにする~~
+ 繰り返し実行できるようにする
---

### 開発実演

最終的な完成イメージが[こちら](https://k2works.github.io/ruby_basic_exercises/demonstration/index.html)になります。
---

### おわり
