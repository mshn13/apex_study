@isTest
public with sharing class test_bat_AccountRead {

    @TestSetup
    static void makeData() {
        insert new Account(name='取引先A');
    }

    @isTest
    public static void isSuccessTest() {
        Test.startTest();
        cntl_bat_AccountRead batch = new cntl_bat_AccountRead();
        Database.executeBatch(batch, cntl_bat_AccountRead.BATCH_SIZE);
        Test.stopTest();
    }
}