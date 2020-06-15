-- 題材B
-- LEVEL1
-- 1
SELECT 商品コード, 商品名, 単価, 商品区分, 関連商品コード
  FROM 商品

-- 2
SELECT 商品名
  FROM 商品

-- 3
SELECT *
  FROM 注文

-- 4
SELECT 注文番号, 注文枝番, 商品コード
  FROM 注文

-- 5
INSERT INTO 商品(商品コード, 商品名, 単価, 商品区分)
VALUES ('W0461', '冬のあったかコート', 12800, '1');

INSERT INTO 商品
VALUES ('S0331', '春のさわやかコート', 6800, '1');

INSERT INTO 商品
VALUES ('A0582', '秋のシックなコート', 9800, '1');



-- LEVEL2
-- 6
SELECT *
  FROM 商品
 WHERE 商品コード = 'S0023'

-- 7
UPDATE 商品
   SET 単価 = 500
 WHERE 商品コード = 'S0023'

-- 8
SELECT *
  FROM 商品
 WHERE 単価 <= 1000

-- 9
SELECT *
  FROM 商品
 WHERE 単価 >= 50000

-- 10
SELECT *
  FROM 注文
 WHERE 注文日 >= '2018-01-01'

-- 11
SELECT *
  FROM 注文
 WHERE 注文日 < '2017-12-01'

-- 12
SELECT *
  FROM 商品
 WHERE 商品区分 <> '1'

-- 13
SELECT *
  FROM 注文
 WHERE クーポン割引料 IS NULL

-- 14
DELETE FROM 商品
 WHERE 商品コード LIKE 'N%'

-- 15
SELECT 商品コード, 商品名, 単価
  FROM 商品
 WHERE 商品名 LIKE '%コート%'

-- 16
SELECT 商品コード, 商品区分
  FROM 商品
 WHERE 商品区分 IN ('2', '3', '9')

-- 17
SELECT *
  FROM 商品
 WHERE 商品コード BETWEEN 'A0100' AND 'A0500'

-- 18
SELECT *
  FROM 注文
 WHERE 注文コード IN ('N0501', 'N1021', 'N0223')

-- 19
SELECT *
  FROM 商品
 WHERE 商品区分 = '3'
   AND 商品名 LIKE '%水玉%'

-- 20
SELECT *
  FROM 商品
 WHERE 商品名 LIKE '%軽い%'
    OR 商品名 LIKE '%ゆるふわ%'

-- 21
SELECT *
  FROM 商品
 WHERE (商品区分 = '1' AND 単価 <= 3000)
    OR (商品区分 = '3' AND 単価 >= 10000)

-- 22
SELECT 商品コード
  FROM 注文
 WHERE 注文日 >= '2018-03-01'
   AND 注文日 < '2018-04-01'
   AND 数量 >= 3

-- 23
SELECT *
  FROM 注文
 WHERE 数量 >= 10
    OR クーポン割引料 IS NOT NULL

-- 24
商品コード, 注文日・注文番号・注文枝番



-- LEVEL3
-- 25
SELECT 商品コード, 商品名
  FROM 商品
 WHERE 商品区分 = '1'
 ORDER BY 商品コード DESC

-- 26
SELECT 注文日, 注文番号, 注文枝番, 商品コード, 数量
  FROM 注文
 WHERE 注文日 >= '2018-03-01'
 ORDER BY 注文日, 注文番号, 注文枝番

-- 27
SELECT DISTINCT 商品コード
  FROM 注文
 ORDER BY 商品コード

-- 28
SELECT 注文日
  FROM 注文
 ORDER BY 注文日 DESC
OFFSET 0 ROWS
 FETCH NEXT 10 ROWS ONLY

-- MySQLの場合
SELECT 注文日
  FROM 注文
 ORDER BY 注文日 DESC LIMIT 10

-- 29
SELECT *
  FROM 商品
 ORDER BY 単価, 商品区分, 商品コード
OFFSET 5 ROWS
 FETCH NEXT 15 ROWS ONLY

-- 30
SELECT *
  FROM 廃番商品
 WHERE 廃番日 >= '2016-12-01'
   AND 廃番日 < '2017-01-01'
 UNION
  FROM 廃番商品
 WHERE 売上個数 > 100
 ORDER BY 売上個数 DESC

-- 31
SELECT 商品コード
  FROM 商品
 EXCEPT
SELECT 商品コード
  FROM 注文
 ORDER BY 1

-- 32
SELECT 商品コード
  FROM 商品
INTERSECT
SELECT 商品コード
  FROM 注文
 ORDER BY 1 DESC

-- 33
SELECT 商品コード, 商品名, 単価
  FROM 商品
 WHERE 商品区分 = '9'
   AND 単価 <= 1000
 UNION
SELECT 商品コード, 商品名, 単価
  FROM 商品
 WHERE 商品区分 = '9'
   AND 単価 > 10000
 ORDER BY 3, 1



-- LEVEL4
-- 34
BY 1 DESC