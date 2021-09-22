/**
 * プログラムID : trg_Account
 * プログラム名 : サンプルバッチクラス
 * 処理形態　　 : ApexTrigger
 * 処理概要　　 : サンプル処理
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
trigger trg_Account on Account (before update ,after insert) {
	cntl_trg_Sample handler = new cntl_trg_Sample();
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            handler.onBeforeUpdateProcess(Trigger.new);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            handler.onAfterInsertProcess(Trigger.new);
        }
    }
}