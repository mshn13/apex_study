# LESSON1
## プログラムを書いてみよう
1. 実行匿名ウィンドウ上に以下を入力し、実行
```apex
System.debug('Hello Apex Class');
```

2. ログ上に```Hello Apex Class```が表示されることを確認
<img width="561" alt="スクリーンショット 2022-09-01 17 56 10" src="https://user-images.githubusercontent.com/42022387/187875532-ed2217f1-d429-44fa-8c26-482e5cd8818e.png">

## 解説
### メソッドの説明
System.debug(msg);
```
msgに文字列または数値を設定することでログ上に設定した値を出力することができる
```
> msg 引数が string でない場合、debug メソッドは String.valueOf をコールして引数を string に変換します。String.valueOf メソッドは、その引数に対する toString メソッド (利用可能な場合)、または引数がユーザ定義型の場合は上書きされた toString をコールします。それ以外の、toString メソッドが利用できない場合は引数の文字列表現を返します。
> 
> 参考：[System クラス](https://developer.salesforce.com/docs/atlas.ja-jp.apexcode.meta/apexcode/apex_methods_system_system.htm#apex_System_System_debug)

# 🎉🎉🎉Congratulations!🎉🎉🎉
