# Visual Force入門
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
apexを書かないシンプルなvisualforceページのコントローラ。自動でIDのgetterが作成されるため、IDをURLパラメータに渡すことでレコードを指定することが可能。
### 標準コントローラの具体的な使い方
```Visualforce
<apex:page standardController="Account">
</apex:page>
```
上記のように```standardController```で対象のオブジェクトを選択することによって標準コントローラを作成することが可能。
apexタグ内で```{!Account}```を使用してAccount内の項目を参照することが可能。その際idパラメータに```?id=XXXXXXXXXXXXX```を追加する。
## カスタムコントローラ
### カスタムコントローラとは
### カスタムコントローラの具体的な使い方
```visualforce
<apex:page controller="ContactsListWithController">
</apex:page>
```
上記のように```controller```で対象のオブジェクトを選択することによってカスタムコントローラを作成することが可能。

## コントローラ拡張
> Apex 開発者ガイド: [Visualforce の概要](https://developer.salesforce.com/docs/atlas.ja-jp.pages.meta/pages/pages_intro.htm)

