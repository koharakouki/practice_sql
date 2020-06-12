-- 明示的なロック
BEGIN;                      -- トランザクションの始まり
SELECT * FROM 家計簿
 WHERE 日付 >= '2018-02-01'
   FOR UPDATE;              -- 2月以降のデータを明示的ロック
-- 集計処理1
SELECT ~ ;
-- 集計処理2
SELECT ~ ;
-- 集計処理3
SELECT ~ ;
COMMIT;                     -- ロック解除される


-- 家計簿テーブルをロックして集計する
BEGIN;
LOOK TABLE 家計簿 IN EXCLUSIVE MODE;  -- 表を明示的ロック
-- 集計処理1
SELECT ~ ;
-- 集計処理2
SELECT ~ ;
-- 集計処理3
SELECT ~ ;
COMMIT;                              -- ロック解除される

