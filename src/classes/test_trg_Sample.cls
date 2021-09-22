/**
 * プログラムID : test_trg_Sample
 * プログラム名 : サンプルトリガハンドラクラステスト
 * 処理形態　　 : ApexClass
 * 処理概要　　 : サンプル処理
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
@isTest
private class test_trg_Sample {
    @isTest
    static void onBeforeInsertProcessSuccessTest(){
        Account act = new Account(name = '取引先A');
        Test.startTest();
        insert act;
        Test.stopTest();
    }
    
    @isTest
    static void onBeforeUpdateProcessSuccessTest(){
        Account act = new Account(name = '取引先A');
        Test.startTest();
        insert act;
        Test.stopTest();
    }
}