# Apex入門

## TRAILHEAD
本記事は以下のTRAILHEADの内容をまとめたもののため以下を実施が前提となる
> 1. [Apex の基本とデータベース](https://trailhead.salesforce.com/ja/content/learn/modules/apex_database)
> 2. [非同期 Apex](https://trailhead.salesforce.com/ja/content/learn/modules/asynchronous_apex)
> 3. [Apex トリガ](https://trailhead.salesforce.com/ja/content/learn/modules/apex_triggers)
## 目次
- [SOQL/DML](#soqldml)
  - [SOQL](#SOQL)
    - [SOQLとは](#soqlとは)
    - [Apex内でのSOQL使用例](#Apex内でのSOQL使用例)
  - [DML](#DML) 
    - [DMLとは](#dmlとは)
      - [Insert・・・新規登録](#Insert)
      - [Update・・・更新](#Update)
      - [Upsert・・・登録/更新](#Upsert)
      - [Delete・・・削除](#Delete)
- [非同期処理](#非同期処理)
  - [非同期処理とは](#非同期処理とは)
  - [futureを使用する方法](#future)
  - [Database .batchableを使用する方法](#DatabaseBatchable)
- [スケジューラ](#スケジューラ)
  - [スケジューラとは](#スケジューラとは)
  - [スケジューラの使用例](#スケジューラの使用例)
- [トリガ](#トリガ)
  - [トリガとは](#トリガとは)
  - [トリガの使用例](#トリガの使用例)
- [ガバナ制限](#ガバナ制限)
  - [ガバナ制限とは](#ガバナ制限とは)
# SOQL/DML
## SOQL
### SOQLとは
Salesforce上の各オブジェクト(テーブル)に問い合わせるためのクエリのこと
基本構文としてはSQLと同じになる。
### Apex内でのSOQL使用例
```Apex
/* 取得もとによってリストか単体かが自動で判定される */
-- リスト
List<SObject> objList = [SELECT colomn FROM SObject];
-- 単体
SObject obj = [SELECT colomn FROM SObject];
```
またWHERE句をしようして条件を指定することができる
```Apex
/* nameの値が取引先Aになっている取引先オブジェクトを取得 */
-- リスト
List<Account> actList = [SELECT name FROM account WHERE name = `取引先A`];
-- 単体
Account act = [SELECT name FROM account WHERE name = `取引先A`];
```
## DML
### DMLとは
Salesforce上の各オブジェクト(テーブル)を登録/更新/削除するための処理のこと。
### insert
新規レコード登録 
```Apex
List<Account> actList = new List<Account>();
actList.add(act);
/**
 * Database.insert
 * @param 登録対象(リストまたは単体)
 * @param エラー時のロールバック範囲。ture: すべて false: 単体
 */
Database.insert(actList, false);
```
### updatee
レコード更新 
```Apex
List<Account> actList = [SELECT id, name FROM account WHERE name = `取引先A`];
/**
 * Database.update
 * @param 更新対象(リストまたは単体)
 * @param エラー時のロールバック範囲。ture: すべて false: 単体
 */
Database.update(actList, false);
```
### upsert
- レコードの作成/更新
```Apex
List<Account> actList = [SELECT id, name FROM account WHERE name = `取引先A`];
Account act = new Account(Name= '取引先A');
actList.add(act);
/**
 * Database.upsert
 * @param 保存対象(リストまたは単体)
 * @param キー この値が一致するレコードを更新。一致しないレコードは新規作成
 * @param エラー時のロールバック範囲。ture: すべて false: 単体
 */
Database.upsert(actList, Account.Fields.name false);
```
### delete
レコード削除
```Apex
List<Account> actList = [SELECT id FROM account WHERE name = `取引先A`];
/**
 * Database.delete
 * @param delete(リストまたは単体) idが一致するデータを削除
 * @param エラー時のロールバック範囲。ture: すべて false: 単体
 */
Database.delete(actList, false);
```
※ よく調べるやつ
[参照項目の値の更新方法](https://developer.salesforce.com/docs/atlas.ja-jp.232.0.apexcode.meta/apexcode/langCon_apex_dml_nested_object.htm)
[エラーの取得方法](https://gawatari.com/apexlumpdml/)
※　注意
構文的にSQLと同じ箇所が多いが大きく違うのが以下の２点になる
1. 取得する項目はSELECTするときに必ず記載しなければならない。上記のようにnameだけ記載した場合は作成日などは取得できない。ただしIDだけはデフォルトで取得できる。「＊」は使用できない
2. ガバナ制限に注意しなければならない。具体的には一回の重い処理する場合などに制限がある。

# 非同期処理
## 非同期処理とは
通常Apexのプログラムは一つのスレッド上で実行される。非同期処理では複数のスレッドで処理が実行される。
ガバナ制限の回避や、大量のデータをやり取りする場合はバッチ処理を使用する。
### @future
アノテーションを使う ※使用頻度は高くないたコード例のみ
```java
@future
public void メソッド名() {
	// 非同期処理
}
```
> Apex 開発者ガイド: [future のメソッド](https://developer.salesforce.com/docs/atlas.ja-jp.apexcode.meta/apexcode/apex_invoking_future_methods.htm)
### Database.Batchable
バッチ(Database.Batchable)を使う
   - Database.QueryLocatorまたはIterable<sObject>を使用できるが、基本的には前者を使用していればよい。より複雑な処理を行う場合のみ後者を選択する。そのため本記事には前者のみの説明とする。
   - Database.Batchable インターフェースには、実装が必要な次の 3 つのメソッドが含まれています。
```Java
// 1. startメソッド
public Database.QueryLocator start(Database.BatchableContext bc) {}
// 2. executeメソッド
public void execute(Database.BatchableContext BC, list<P>){}
// 3. finishメソッド
public void finish(Database.BatchableContext BC){}
```
   - バッチを実行するには以下のメソッドを実行する
```Java
/**
 * Database.executeBatch バッチの実行
 * @param バッチのインスタンス
 * @param バッチのサイズ 一回の非同期処理に対しての処理件数。指定しない場合デフォルト200。最大2000。
 */
Database.executeBatch(new Batch(), 200);
```
バッチの全体的な動きとしては以下のような動きになる
```
1.start -> 2.execute -> 3.execute -> 4.execute -> 5.finish

- 1つ目のstartで検索結果がバッチサイズごとにexecuteが実行される
- executeで処理できるものがなくなり次第finishが呼ばれバッチが終了する
```
> Apex 開発者ガイド: [Apex の一括処理の使用
](https://developer.salesforce.com/docs/atlas.ja-jp.230.0.apexcode.meta/apexcode/apex_batch_interface.htm)
# スケジューラ
## スケジューラとは
非同期処理の一つ。Salesforce上で設定した曜日に間隔的に実行することができる。
## スケジューラの使用例
以下のクラスを作成するだけでSalesforce上で以下クラスのスケジュール設定を行うことができる
```Apex
global class SampleClass implements Schedulable {
    global void execute(SchedulableContext ctx) {
        // 処理
    }
}
```
# トリガ
## トリガとは
オブジェクトが登録や更新などのアクションを起こした際に呼ばれるもの。アクション前、後などタイミングを選択することができる。
## トリガの使用例
以下の引数をトリガに渡すことによってイベントを取得することができる
- before insert 登録前処理
- before update 登録前処理
- before delete 削除前処理
- after insert 登録後処理
- after update 更新後処理
- after delete 削除後処理
- after undelete ごみ箱からの復元後処理
```Apex
    // Account登録更新前に呼ばれる
    trigger HelloWorldTrigger on Account (before insert, before update) {
	// 処理
    }
```
> Apex 開発者ガイド: [Trigger クラス](https://developer.salesforce.com/docs/atlas.ja-jp.apexcode.meta/apexcode/apex_class_System_Trigger.htm)
# ガバナ制限
## ガバナ制限とは
Salesforceでは一つのリソースを複数の会社が共有しているためメモリやCPU、DBなどを大きく占有する処理の制限のこと。
ここは最重要だがSQOLを使用する際に毎回調べれば覚えられる範囲なので、暗記しなくても良い
> クイックリファレンス: [Apex ガバナ制限](https://developer.salesforce.com/docs/atlas.ja-jp.salesforce_app_limits_cheatsheet.meta/salesforce_app_limits_cheatsheet/salesforce_app_limits_platform_apexgov.htm)
