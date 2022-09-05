# LESSON3
## 変数の型(データ型)を覚えよう

Integer、Double、Long、Date、Datetime、String、ID、または Booleanなどのよく使用する型（データ型）
| 型 | リテラル | 使用例 |　サイズ | 
| --- | --- | --- | --- |
| ID | ID型 | ```ID actId = ‘123456789012345678’;``` | 18文字(15文字を入れた場合自動で18に変換されます) |
| Integer | 整数型 | ```Integer count = 1;``` | 32bit | 
| Long | データ量の多い整数型 | ```Long lg = 30000000L;``` | 64bit |
| Double | 小数点を含む数値型 | ```Double d=3.14159;``` | 64bit |
| Decimal | 小数点を含む数値型 | ```Decimal decimalNum = -3.05443;``` | 任意 |
| String | 文字列型 | ```String moji = ‘aiueo’;``` | 任意 |
| Boolean | 真偽型 | ```Boolean flag = true;``` | true、false、null |
| Date | 日付型 | ```Date today = Date.newInstance(‘2022’, ‘12’, ‘25’);``` | 任意 |
| Datetime | 日付時刻型 | ```Datetime now = Datetime.now();``` | 任意 |
| Blob | バイナリデータ型 | ```Blob exampleIv = Blob.valueOf('Example of IV123');``` | 任意 |


## 型(データ型)で色々試してみよう
1. 実行匿名ウィンドウ上に以下を入力し、実行
    1. Integer型よりLong型の方が大きいため、Long型にInteger型を代入することは可能
    ```apex
    Integer test1 = 10;
    Long test2 = test1;
    System.debug(tset2);
    // 結果 ↓↓↓↓
    // 10
    ```
    2. Integer型よりLong型の方が大きいため、Integer型にLong型を代入使用とするとエラーになる
    ```apex
    Long test1 = 10;
    Integer test2 = test1;
    System.debug(tset2);
    // 結果 ↓↓↓↓
    // Line: 2, Column: 9
    // Illegal assignment from Long to Integer
    ```
    3. キャストすることによってサイズが小さいデータ型に代入することができる
    ```apex
    Long test1 = 10;
    Integer test2 = (Integer)test1;
    System.debug(test2);
    // 結果 ↓↓↓↓
    // 10
    ```
    > キャストとは・・・　変数の前に```(変更したいデータ型)```を記載することによってデータ型を変更してくれる

# 🎉🎉🎉Congratulations!🎉🎉🎉








