/**
 * 明細オブジェクトの完了フラグのたっていないデータを削除
 */
public class cntl_bat_AccountRead implements Database.Batchable<sObject>, Database.Stateful {
    
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