# LESSON4
## 比較演算子を覚えよう
- 比較された2つの値を1つのBoolean型(true/false)の値として扱う
- 代表的な比較演算子
    | 演算子 | 説明 | 例文　| 
    |---|---|---| 
    | ```==``` | 左側の値と右側の値が一致している場合```true```を返す | ```10 == 20```  ```'アイウエオ' == 'アイウエオ'``` |
    | ```!=``` | 左側の値と右側の値が一致していない場合```true```を返す | ```10 != 20```  ```'アイウエオ' != 'アイウエオ'``` |
    | ```<``` | 左側の値が右側の値より小さい場合```true```を返す | ```10 < 20``` |
    | ```<=``` | 左側の値が右側の値以下の場合```true```を返す | ```10 <= 10``` |
    | ```>``` | 左側の値が右側の値より大きい場合```true```を返す | ```20 > 10``` |
    | ```>=``` | 左側の値が右側の値より以上の場合```true```を返す | ```10 <= 10``` |
## 論理演算子を覚えよう
- 左側のBoolean型の値と左のBoolean型の値の論理値を
- 代表的な論理演算子
    | 演算子 | 説明 | 例文　| 
    |---|---|---| 
    | ```&&``` | 左側の値が```true```で<strong>かつ</strong>右側の値が```true```の場合```true```を返し、それ以外は```false```を返す | ```true && true``` |
    | ```\|\|``` | 左側の値が```true```<strong>または</strong>右側の値が```true```の場合```true```を返し、どちらも```false```の場合```false```を返す | ```true \|\| false``` |

## 比較(論理)演算子で色々試してみよう！
1. 実行匿名ウィンドウ上に以下を入力し、実行
    1. ```true```が表示されるか```false```が表示されるか考えてみよう
    ```apex
    Boolean result = true;
    System.debug('Q01. ↓↓↓↓');
    result = true == true;
    System.debug(result);
    
    System.debug('Q02. ↓↓↓↓');
    result = true && true || false;
    System.debug(result);
    
    System.debug('Q03. ↓↓↓↓');
    result = 'Apex' == 'Apex' && true || false;
    System.debug(result);
    
    System.debug('Q04. ↓↓↓↓');
    result = 10 < 5;
    System.debug(result);
    
    System.debug('Q05. ↓↓↓↓');
    result = 24 > 12 || 21 < 20;
    System.debug(result);
    
    System.debug('Q06. ↓↓↓↓');
    result = 212 < 121 && 212 < 222 || 111 <= 111;
    System.debug(result);
    
    System.debug('Q07. ↓↓↓↓');
    result = 0 < 14 && ( 1 < 2 || 2 < 1 );
    System.debug(result);
    
    System.debug('Q08. ↓↓↓↓');
    result = (0 < 14 && 1 < 2) || 2 < 1 ;
    System.debug(result);
    ```
