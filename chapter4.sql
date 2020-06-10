-- DISTINCT
-- 重複行を除外する
SELECT DISTINCT 列名...
  FROM テーブル名



-- ORDER BY
-- 検索結果を並び替える
SELECT 列名 FROM テーブル名
  ORDER BY 列名 並び順(ASC or DESC)#並び順を指定しないとデフォルトはASC

-- 日付で降順になるように並び替えて取得する
SELECT * FROM 家計簿
ORDER BY 日付 DESC

-- 入金額の降順で並び替えて、入金額が等しい場合には出金額の降順で並び替える
SELECT * FROM 家計簿
ORDER BY 入金額 DESC, 出金額 DESC



-- OFFSET - FETCH
-- 先頭から数件だけを取得する
SELECT 列名 FROM テーブル名
ORDER BY 列名 (並び順)
OFFSET 先頭から除外する行数 ROWS
(FETCH NEXT 取得行数 ROWS ONLY)

-- 出金額の高い順に3件を取得する
SELECT 費目, 出金額 FROM 家計簿
ORDER BY 出金額 DESC
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY

-- 3番目に高い出金額だけを取得する
SELECT 費目, 出金額 FROM 家計簿
ORDER BY 出金額 DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY

-- 他の取得業を限定する方法
-- LIMIT の使用
SELECT 費目, 出金額 FROM 家計簿
ORDER BY 出金額 DESC LIMIT 3



-- UNION演算子
-- 和集合
SELECT 文1
UNION (ALL) # UNION ALL にすると重複行も全て取得する
SELECT 文2

SELECT 費目, 入金額, 出金額 FROM 家計簿
UNION
SELECT 費目, 入金額, 出金額 FROM 家計簿アーカイブ
ORDER BY 2, 3, 1



-- EXCEPT演算子
-- 差集合
SELECT 文1
EXCEPT (ALL) # EXCEPT ALL にすると重複行も全て取得する
SELECT 文2

-- 家計簿アーカイブテーブルには存在せず、家計簿テーブルには存在する費目、
-- つまり「今月初めて登場した費目」を取得する
SELECT 費目 FROM 家計簿
EXCEPT
SELECT 費目 FROM 家計簿アーカイブ



-- INTERSECT演算子
-- 積集合
SELECT 列名 FROM テーブル名
INTERSECT
SELECT 列名 FROM テーブル名

-- 家計簿テーブルと家計簿アーカイブの両方にある費目を取得する
SELECT 費目 FROM 家計簿
INTERSECT
SELECT 費目 FROM 家計簿アーカイブ



-- 練習問題
-- 4-1
-- 1
SELECT * FROM 注文履歴
ORDER BY 注文番号, 注文枝番

-- 2
SELECT DISTINCT 商品名 FROM 注文履歴
WHERE 日付 >= '2018-01-01' AND 日付 <= '2018-01-31'
ORDER BY 商品名

-- 3
SELECT 注文番号, 注文枝番, 注文金額 FROM 注文履歴
WHERE  分類 = '1' ORDER BY 注文金額
OFFSET 1 ROWS
FETCH NEXT 3 ROWS ONLY

-- 4
SELECT 日付, 商品名, 単価, 数量, 注文金額 FROM 注文履歴
WHERE 分類 = '3' AND 数量 >= 2
ORDER BY 日付, 数量 DESC

-- 5
SELECT DISTINCT 分類, 商品名, サイズ, 単価 FROM 注文履歴
WHERE 分類 = '1' UNION

SELECT DISTINCT 分類, 商品名, NULL 単価 FROM 注文履歴
WHERE 分類 = '2' UNION

SELECT DISTINCT 分類, 商品名, NULL 単価 FROM 注文履歴
WHERE 分類 = '3'
ORDER BY 1, 2


-- 4-2
-- 1
SELECT 値 FROM 奇数　UNION SELECT 値 FROM 偶数

-- 2
SELECT 値 FROM 整数 EXCEPT SELECT 値 FROM 偶数

-- 3
SELECT 値 FROM 整数 INTERSECT SELECT 値 FROM 偶数

-- 4
SELECT 値 FROM 奇数 INTERSECT SELECT 値 FROM 偶数





