/**
 * プログラムID : test_bat_Sample
 * プログラム名 : サンプルバッチクラステスト
 * 処理形態　　 : ApexClass
 * 処理概要　　 : サンプル処理テスト
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
@isTest
public with sharing class test_bat_Sample {

    @TestSetup
    static void makeData() {
        insert new Account(name='取引先A');
    }

    @isTest
    public static void isSuccessTest() {
        Test.startTest();
        cntl_bat_Sample batch = new cntl_bat_Sample();
        Database.executeBatch(batch, cntl_bat_Sample.BATCH_SIZE);
        Test.stopTest();
    }
}