# LESSON5
## クラスとは

## クラスの作り方
```text
修飾子 class クラス名 {
}
```
### 解説
- 修飾子
    - ```public```, ```private```, ```protected```, ```global```のいずれかを使用する。
- クラス名
    - 任意の文字列。[アッパーキャメルケース](https://wa3.i-3-i.info/word13954.html)で記載する。
    
### 使用例
```apex
public class Cat {
}
```

## クラスの構成
- フィールド ・・・ そのクラスの持つ情報(ステータス, プロパティ)
    - メンバ変数/フィールド ・・・ 変動が起こり得る値。インスタンスが持つ値として使用する。```this.```を使用する。
    ```apex
    public Integer age = 20;
    ```

    - 定数フィールド ・・・ 変動しない値。固定値。
    ```apex
    // finalを使用することで定数フィールドになる
    // 全て大文字で記述する。
    public final Integer ADULT_AGE = 18;
    ```

    - 静的変数/クラス変数/インスタンス変数 ・・・ 変動が起こり得る値。クラスが持つ情報として使用する。
    ```apex
    // staticを使用することで定数フィールドになる。
    public static Boolean isFly = false;
    ```
- メソッド ・・・ そのクラスが持つ機能(関数, ファンクション)
    ```text
    修飾子 戻り値型 メソッド型(引数型 変数名, 引数型 変数名, ...) {
    }
    ```
    - メンバメソッド/インスタンスメソッド ・・・ インスタンス内のメソッドとして使用する。
    ```apex
    public void run() {
    }
    ```
    - 静的メソッド/クラスメソッド/ ・・・ クラスからメソッドを使用する。
    ```apex
    // staticを使用することで静的メソッドになる
    public static void execute(String key) {
    }
    ```

## Let's Try!
### Level 1
-  Dogクラスに、barkメソッドを作成しよう
    ```apex
    public class Dog {
        //フィールドの宣言
        public String name;
        
        //コンストラクタの定義
        public Dog(String name){
            //this.name(上記で宣言したフィールド）にname(引数)の値を代入
            this.name = name;
        }
    
        //barkメソッド
        public void bark() {
            System.debug('僕の名前は' + this.name + 'だワン!');
        }
    }
    ```
-  実行匿名ウィンドウ上で、barkメソッドを呼び出してみよう
    ```apex
    //Dogインスタンスを生成する
    Dog d = new Dog('任意のName値');
    
    //Dogインスタンスのbarkメソッドを呼び出す
    d.bark();
    ```
-  上記を実行し、以下のようなログが表示されていることを確認しよう
    
    <img width="496" alt="image" src="https://user-images.githubusercontent.com/112843362/189784311-c09ff680-bfc7-438f-8579-b2887beb666d.png">
### Level 2
-  Dogクラスにフィールドとメソッドを追加しよう 
    ```apex
    public class Dog {
        //フィールドの宣言
        public String name;
        public Integer feedMinimumAmount;
        public integer feedMaximumAmount;
        
        //コンストラクタの定義
        public Dog(String name, Integer feedMinimumAmount, Integer feedMaximumAmount) {
            this.name = name;
            this.minimumAmount = feedMinimumAmount;
            this.maximumAmount = feedMaximumAmount;
        }
    
        //barkメソッド
        public void bark() {
            System.debug('僕の名前は' + this.name + 'だワン!');
        }
        
        //eatメソッド
        public Integer eat(String feedName, Integer feedAmount) {
            System.debug(feedName + 'おいしいワン');
            
            //feedMinimumAmount（エサの最小限量）、feedMaximumAmount（エサの最大限量）とfeedAmount（与えられた餌の量）を比較し処理を分ける
            if (feedAmount <= this.feedMinimumAmount) {
                System.debug('量が足りないワン...');
            } else if(feedAmount <= this.feedMaximumAmount) {
                System.debug('ちょうどいいワン');
            } else {
                System.debug('食べきれなかったワン...');
                //食べきれなかった量を戻り値として返す
                return feedAmount - this.feedMaximumAmount;
            }
            
            return 0;
        }
    }
    ```
    
-  実行匿名ウィンドウ上で、eatメソッドを呼び出してみよう
    ```apex
    //Dogインスタンスを生成する
    Dog d = new Dog('任意のName値', 任意のminimumAmount値, 任意のmaximumAmount値 );    
    
    //Dogインスタンスのeatメソッドに引数を指定して呼び出す
    d.eat('任意のfeedName値', 任意のfeedAmount値);
    ```
-  上記を実行し、以下のようなログが表示されていることを確認しよう

    <img width="477" alt="image" src="https://user-images.githubusercontent.com/112843362/189788532-0e7fdf58-b263-4dd7-ba4c-ff3f87eb00e6.png">


# 🎉🎉🎉Congratulations!🎉🎉🎉
