/**
 * プログラムID : Common
 * プログラム名 : 共通クラス
 * 処理形態　　 : ApexClass
 * 処理概要　　 : 共通処理
 * 作成日　　　 : 2021/09/01
 * 作成者　　　 : 草野
 */
public class Common {
    /**
     * SObjectのフィールドをカンマ区切りで返す
     * @param  type オブジェクトタイプ
     * @return カンマ区切りの項目名(エスケープ済み)
     */
    public static String getAllFieldsNames(Schema.SObjecttype type) {
        List<String> result = New List<String>{};
        Map<String, Schema.sObjectField> omap =
            type.getDescribe().fields.getMap();
        for(String s: omap.keySet()) {
            // カスタム項目だけ選択
            if (s.endsWith('__c')) {
                result.add(s);
            }
        }
        return String.escapeSingleQuotes(String.join(result, ','));
    }
    
    /**
     * 配列番号をリストで返す
     * @param  saveResult データベースインサート結果
     * @param  result true: 成功した配列番号 false: 失敗した配列番号
     * @return 配列番号リスト
     */
    public static List<Integer> getInsertNumber(Database.SaveResult[] saveResult, Boolean result) {
        List<Integer> numberList = new List<Integer>();
        for (Integer i = 0; i < saveResult.size(); i++) {
             if (!saveResult[i].isSuccess() && !result) {
                numberList.add(i);
             } else if (saveResult[i].isSuccess() && result) {
                numberList.add(i);
             }
        }
        return numberList;
    }

    /**
     * yyyyMMdd形式の文字列をDate型に変換
     * @param dateString yyyyMMddの日付文字列
     * @return 日付
     */
    public static Date stringToDate(String dateString) {
        if (dateString == null) {
            return null;
        }
        String newDateString = '';
        // 年
        newDateString += dateString.substring(0, 4) + '/';
        // 月
        newDateString += dateString.substring(4, 6) + '/';
        // 日
        newDateString += dateString.substring(6, 8);
        return Date.parse(newDateString);
    }

    /**
     * 数値型の日付を日付型で返す
     * @param  intDate 数値型の日付
     * @return 日付
     */ 
    public static Date integerToDate(Integer intDate) {
        String dateString = String.valueOf(intDate);
        return stringToDate(dateString);
    }

    /**
     * DateをyyyyMMdd形式の数値で返却する
     * @param  targetDate 日付型
     * @return  yyyyMMdd形式の数値
     */
    public static Integer dateToInteger(Date targetDate) {
        Integer year = targetDate.year() * 10000;
        Integer month = targetDate.month() * 100;
        Integer day = targetDate.day();
        return year + month + day;
    }

    
    /**
     * エラー通知を送信する
     * @param lst_error bodyに表示するエラーメッセージリスト
     * @param lst_toAddresses Toに設定するメールアドレスリスト
     * @param lst_ccAddresses CCに設定するメールアドレスリスト
     * @param str_pgmhName 対象プログラム名(メール件名に使用)
     */
    public static void sendErrorMail(List<String> lst_error, 
                                     List<String> lst_toAddresses, 
                                     List<String> lst_ccAddresses,
                                     String pgmName ) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(lst_toAddresses);
        mail.setCcAddresses(lst_ccAddresses);
        mail.setSubject('[' + pgmName + ']An error has occurred');
        mail.setPlainTextBody(String.join(lst_error, '\r\n'));
        mail.setUseSignature(false);
        mail.setBccSender(false);
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
    }
    
}