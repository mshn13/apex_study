# LESSON5
## 算術演算子を覚えよう
- 左側の値と右側の値の2つの値を1つの数値型または文字列型の値として扱う
- 数値を使用する代表的な算術演算子

    | 演算子 | 説明 | 例文　| 
    |---|---|---| 
    | ```+``` | 左側の値と右側の値を加算した値を返す | ```10 + 20; // 30``` |
    | ```-``` | 左側の値から右側の値を差し引いた値を返す | ```20 - 12; // 8``` |
    | ```/``` | 左側の値から右側の値を割った値を返す | ```20 / 5; // 4```|
    | ```*``` | 左側の値と右側の値を掛けた値を返す | ```10 * 20; // 300```|

- 数値を使用する代表的な算術演算子

    | 演算子 | 説明 | 例文　| 
    |---|---|---| 
    | ```+``` | 左側の値と右側の値のどちらかが文字列の場合文字列を返す | ```'アイウ' + 'エオ'; 'アイウエオ'``` ```'20' + 1; // 201``` |

## 算術演算子で色々試してみよう！
1. 実行匿名ウィンドウ上に以下を入力し、実行
    1. 何が表示されるか考えてみよう
    ```apex
    Boolean result = true;
    System.debug('Q01. ↓↓↓↓');
    result = 12 + 12;
    System.debug(result);
    
    System.debug('Q02. ↓↓↓↓');
    result = 12 + '12';
    System.debug(result);
    
    System.debug('Q03. ↓↓↓↓');
    result = 12 + 12 + '12';
    System.debug(result);
    
    System.debug('Q04. ↓↓↓↓');
    result = 12 + (12 + '12');
    System.debug(result);
    
    System.debug('Q05. ↓↓↓↓');
    result = 12 + 12 * 2;
    System.debug(result);
    
    ```

# 🎉🎉🎉Congratulations!🎉🎉🎉
