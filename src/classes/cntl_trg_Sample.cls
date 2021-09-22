/**
 * プログラムID : trg_Account
 * プログラム名 : サンプルバッチクラス
 * 処理形態　　 : ApexTrigger
 * 処理概要　　 : サンプル処理
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
public without sharing class cntl_trg_Sample {
    /**
     * onBeforeUpdateProcess サンプル処理
     * @param trgAccount Trigger.New List
     */
    public void onBeforeUpdateProcess( List<Account> trgAccount ){
       // 処理
    }

	/**
     * onAfterInsertProcess サンプル処理
     * @param trgAccount Trigger.New List
     */
    public void onAfterInsertProcess( List<Account> trgAccount ){
        // 処理
    }
}