# Visual Force入門
:dolphin::dolphin::dolphin::dolphin:[サンプルクラス]():dolphin::dolphin::dolphin::dolphin:

## TRAILHEAD
本記事は以下のTRAILHEADの内容をまとめたもののため以下を実施が前提となる
> 1. [Visualforce の基礎](https://trailhead.salesforce.com/ja/content/learn/modules/visualforce_fundamentals)
## 目次
- [標準コントローラ](#標準コントローラ)
  - [標準コントローラとは](#標準コントローラとは)  
  - [標準コントローラの具体的な使い方](#標準コントローラの具体的な使い方)  
- [カスタムコントローラ](#カスタムコントローラ)
  - [カスタムコントローラ](#カスタムコントローラ)  
  - [カスタムコントローラの具体的な使い方](#カスタムコントローラの具体的な使い方)  
- [コントローラ拡張](#コントローラ拡張)
## visualforceページとは
HTMLライクな書き方で作成したSalesforceの画面のこと。Visw部分をVisualforceやCSSやJavascriptで設計し、Controller部分をApexで設計する。
> 外部サイト: [salesforce MVC モデル　ビュー　コントローラー とは　いまさら](https://salesforce.oikeru.com/entry/salesforce_mvc)
## 標準コントローラ
### 標準コントローラとは
Apexコードを書かないvisualforceページのコントローラ。自動でIDの```getter```が作成される。URLのパラメータにIDを渡すことでレコードを指定することが可能。
### 標準コントローラの具体的な使い方
```html
<apex:page standardController="Account">
</apex:page>
```
上記のように```standardController```で対象のオブジェクトを指定することによって標準コントローラを作成することが可能。
apexタグ内で```{!Account}```を使用してAccount内の項目を参照することが可能。その際idパラメータにレコードIDを渡すことができる。
```url
例）　https://visualforce.com/apex/customAccountPage?id=00XXX0000076gklXXX
```
***VisualForce内で使用していない項目はApex内で使用することはできない***ため
処理でのみ使いたい項目がある場合は以下のように表示されないHTMLタグを記載することで対応可能
```HTML
    <apex:outputfield value="{!Account.Phone}" rendered="false" />
```
## カスタムコントローラ
### カスタムコントローラとは
### カスタムコントローラの具体的な使い方
標準コントローラとは違いApexでコントローラを先に作成する必要がある。
apexコントローラクラス内のフィールド変数または```getter```や```setter```を作ることでvisualforceとのデータの受け渡し可能になる
> Apex 開発者ガイド: [コントローラメソッド](https://developer.salesforce.com/docs/atlas.ja-jp.pages.meta/pages/pages_controller_methods.htm)
```apex
public class CustomSampleController {
  // accountのgetterを作成
  public List<Account> getAccounts() {
    List<Account> results = Database.query(
        'SELECT Id　' +
        'FROM Account'
    );
    // View(visualforce)に値を送る
    return results;
  }
}
```
下記のように```controller```で対象のApexコントローラを指定することによってカスタムコントローラを作成することが可能。
```html
<apex:page controller="CustomSampleController">
  <apex:pageBlockTable value="{! accounts }" var="act">
      <apex:column value="{! act.id }"/>
  </apex:pageBlockTable>
</apex:page>
```
Apexタグ内でコントローラクラスの<b>参照可能な</b>フィールド変数を参照することができる。上記の例ではaccountsフィールドを参照している。
またコントローラクラスで```setter```を用いることで値を渡すことも可能。
以下のフィールド変数はvisualforceからの参照は可能だが設定ができなくなる。
```Apex
      public Account account { get; private set; }
```
## コントローラ拡張
標準コントローラまたはカスタムコントローラの機能を拡張する Apex クラスです。
アクションの追加や上書をする際に使用する
※標準コントローラを拡張する場合、標準コントローラのロジックは、システムモードで実行されません

### コントローラ拡張の具体的な使い方
標準コントローラを拡張することでコントローラ拡張を行うことができる。
下記のように```extensions```で対象のApexコントローラを指定することによってコントローラ拡張を使用することが可能。
```Apex
public class myControllerExtension {
    private final Account acct;
    // controller.
    public myControllerExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }
    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
}
```

```html
<apex:page standardController="Account" extensions="myControllerExtension">
    {!greeting} <p/>
    <apex:form>
        <apex:inputField value="{!account.name}"/> <p/>
        <apex:commandButton value="Save" action="{!save}"/>
    </apex:form>
</apex:page>
```
> Apex 開発者ガイド: [コントローラ拡張の作成](https://developer.salesforce.com/docs/atlas.ja-jp.pages.meta/pages/pages_controller_extension.htm)

各コントローラの相違点

| 相違点	 | 標準 | 標準リスト | 拡張 | カスタム |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Apexクラスの作成 | 不要	  | 不要  | 必須  | 必須  |
| テストクラス | 不要  | 不要  | 必須 | 必須 |
| 新しいアクションの追加	| できない | できない	| できる | できる |
| アクションの上書き | できない	  | できない | できる | できる |
| デフォルトの実行モード	| ユーザ  | ユーザ | システム	| システム |
> 外部サイト：[【Apex】コントローラ拡張の使い方](https://savepo.com/how_to_use_controller_extension)


> Apex 開発者ガイド: [Visualforce の概要](https://developer.salesforce.com/docs/atlas.ja-jp.pages.meta/pages/pages_intro.htm)
