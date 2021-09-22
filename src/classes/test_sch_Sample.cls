/**
 * プログラムID : test_sch_Sample
 * プログラム名 : サンプルスケジューラクラステスト
 * 処理形態　　 : ApexClass
 * 処理概要　　 : サンプル処理
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
@isTest
public with sharing class test_sch_Sample {
    /**
     * スケジューリングが可能であることを確認
     */
    @isTest
    public static void isSuccessTest(){
        // テスト開始
        Test.startTest();
        cntl_sch_Sample schedule = new cntl_sch_Sample();
        String jobId = System.schedule( 'isSuccessTest' , '0 0 * * * ?' , schedule );
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals('0 0 * * * ?', ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        Test.stopTest();
    }

}