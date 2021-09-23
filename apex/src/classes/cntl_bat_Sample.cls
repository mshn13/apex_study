/**
 * プログラムID : cntl_bat_Sample
 * プログラム名 : サンプルバッチクラス
 * 処理形態　　 : ApexClass
 * 処理概要　　 : サンプル処理
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
public class cntl_bat_Sample implements Database.Batchable<sObject>, Database.Stateful {
    
    // バッチサイズ
    public static final Integer BATCH_SIZE = 200;

    /**
     * バッチ実行時に呼ばれる処理
     * @param BC Database.BatchableContext
     * @return  getQueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext bc) {
        System.debug('Called start method');
        return Database.getQueryLocator('SELECT ID FROM Account');
    }

    /**
     * startメソッドのクエリ結果を操作
     * @param  BC Database.BatchableContext
     * @param  scope startメソッド処理のクエリ結果
     */
    public void execute(Database.BatchableContext BC, 
            List<Account> scope) {
        system.debug('ヒープサイズ: ' + Limits.getHeapSize() + '/' + Limits.getLimitHeapSize());
        system.debug('データサイズ: ' + scope.size());
    }

    /**
     * executeメソッドがすべて終了したときに呼ばれる処理
     * @param  BC Database.BatchableContext
     */
    public void finish(Database.BatchableContext BC) {
        System.debug('Called finish method');
    }
}