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

## 

# 🎉🎉🎉Congratulations!🎉🎉🎉
