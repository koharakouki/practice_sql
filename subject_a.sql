-- LEVEL1
-- 1
SELECT 口座, 名義, 種別, 残高, 更新日
  FROM 口座

-- 2
SELECT 口座番号
  FROM 口座

-- 3
SELECT 口座番号, 残高
  FROM 口座

-- 4
SELECT *
  FROM 口座

-- 5
UPDATE 口座
   SET 名義 = 'XXXXX'

-- 6
UPDATE 口座
   SET 残高 = 99999999, 更新日 = '2018-03-01'

-- 7
INSERT INTO 口座
VALUES ('70652191', 'アオキ ハルカ', '1', 3640551, '2018-03-13');

INSERT INTO 口座
VALUES ('1039410', 'キノシタ リュウジ', '1', 259017, '2017-11-30',);

INSERT INTO 口座
VALUES ('1239855', 'タカシナ ミツル', '2', 6509773)

-- 8
DELETE FROM 口座



-- LEVEL2
-- 9
SELECT *
  FROM 口座
 WHERE 口座番号 = '0037651'

-- 10
SELECT *
  FROM 口座
 WHERE 残高 > 0

-- 11
SELECT *
  FROM 口座
 WHERE 口座番号 < '1000000'

-- 12
SELECT *
  FROM 口座
 WHERE 更新日 < '2018-01-01'

-- 13
SELECT *
  FROM 口座
 WHERE 残高 >= 1000000

-- 14
SELECT *
  FROM 口座
 WHERE 種別 <> '1'

-- 15
SELECT *
  FROM 口座
 WHERE 更新日 IS NULL

-- 16
SELECT *
  FROM 口座
 WHERE 名義 LIKE '%ハシ%'

-- 17
SELECT *
  FROM 口座
 WHERE 更新日 BETWEEN '2018-01-01' AND '2018-01-31'

-- 18
SELECT *
  FROM 口座
 WHERE 種別 IN ('2', '3')

-- 19
SELECT *
  FROM 口座
 WHERE 名義 = 'サカタ リョウヘイ' OR 名義 = 'マツモト ミワコ', OR 名義 = 'ハマダ サトシ'

-- 20
SELECT *
  FROM 口座
 WHERE 更新日 >= '2017-12-30'
   AND 更新日 <= '2018-01-04'

-- 21
SELECT *
  FROM 口座
 WHERE 残高 < 10000
   AND 更新日 IS NOT NULL

-- 22
SELECT *
  FROM 口座
 WHERE 口座番号 LIKE '2_______'
   OR 名義 LIKE 'エ__%コ'

-- 23
口座テーブル : 口座番号
取引テーブル : 取引番号
取引事由テーブル : 取引事由ID



-- LEVEL3
-- 24
SELECT *
  FROM 口座
 ORDER BY 口座番号

-- 25
SELECT DISTINCT 名義
  FROM 口座
 ORDER BY 名義

-- 26
SELECT *
  FROM 口座
  ORDER BY 4 DESC,1

-- 27
SELECT 更新日
  FROM 口座
 WHERE 更新日 IS NOT NULL
 ORDER BY 更新日 LIMIT 10

-- 28
SELECT 更新日, 残高
  FROM 口座
 WHERE 残高 > 0
   AND 更新日 IS NOT NULL
 ORDER BY 残高, 更新日 DESC
 OFFSET 10 ROWS
  FETCH NEXT 10 ROWS ONLY

-- 29
SELECT 口座番号
  FROM 口座
 UNION
SELECT 口座番号
  FROM 廃止口座
 ORDER BY 口座番号

-- 30
SELECT 名義
  FROM 口座
EXCEPT
SELECT 名義
　FROM 廃止口座
 ORDER BY 名義 DESC

-- 31
SELECT 名義
  FROM 口座
INTERSECT
SELECT 名義
　FROM 廃止口座
 ORDER BY 名義

-- 32
SELECT 口座番号, 残高
  FROM 口座
 WHERE 残高 = 0
 UNION
 SELECT 口座番号, 解約時残高
  FROM 廃止口座
 WHERE 解約時残高 <> 0
 ORDER BY 口座番号

-- 33
SELECT 口座番号, 名義, '◯' AS 口座区分
  FROM 口座
 UNION
SELECT 口座番号, 名義, '×' AS 口座区分
  FROM 廃止口座
 ORDER BY 名義



-- LEVEL4
-- 34
SELECT 口座番号, 残高/1000 AS 千円単位の残高
  FROM 口座
 WHERE 残高 >= 1000000

-- 35
INSERT INTO 口座
VALUES ('0652281', 'たかぎ のぶお', '1', 100000 + 3000, '2018-04-01');

INSERT INTO 口座
VALUES ('1026413', 'まつもと さわこ', '1', 300000 + 3000, '2018-04-02');

INSERT INTO 口座
VALUES ('2239710', 'ささき しげのり', '1', 100000 + 3000, '2018-04-03');

-- 36
UPDATE 口座
   SET 残高 = (残高 - 3000) * 1.003
 WHERE 口座番号 IN ('0652281 ', '1026413', '2239710')

-- 37
SELECT 口座番号, 更新日, 更新日 + 180 AS 通帳期限日
  FROM 口座
 WHERE 更新日 < '2017-01-01'

-- 38
SELECT 口座番号, CONCAT((カ,名義)
  FROM 口座
 WHERE 種別 = '3'

-- 39
SELECT DISTINCT 種別 AS 種別コード,
  CASE 種別
  WHEN '1' THEN '普通'
  WHEN '2' THEN '当座'
  WHEN '3' THEN '別段'
  END AS 種別名
 FROM 口座

-- 40
SELECT 口座番号, 名義,
  CASE WHEN 残高 < 100000 THEN 'C'
       WHEN 残高 >= 100000 AND 残高 < 1000000 THEN 'B'
       ELSE 'A'
  END AS 残高ランク
 FROM 口座

-- 41
SELECT LENGTH(口座番号), LENGTH(REPRACE(名義, '  ', '')), LENGTH(CAST(残高, AS VARCHAR))
  FROM 口座

-- 42
SELECT *
  FROM 口座
 WHERE SUBSTRING(名義, 1, 5) LIKE '%カワ%'

-- 43
SELECT *
  FROM 口座
 WHERE LENGTH(CAST(残高, AS VARCHAR)) >= 4
   AND SUBSTRING(LENGTH(CAST(残高, AS VARCHAR)), LENGTH(CAST(残高, AS VARCHAR))-2, 3) = '000'

-- 44
SELECT 口座番号, 残高, TRUNK(残高 * 0.0002, 0) AS 利息
  FROM 口座
 ORDER BY 残高 DESC

-- 45
SELECT 口座番号, 残高,
  CASE WHEN 残高 < 500000 THEN TRUNK(残高 * 0.0001, 0)
       WHEN 残高 >= 500000 AND 残高 < 2000000 THEN TRUNK(残高 * 0.0002, 0)
       WHEN 残高 >= 2000000 THEN TRUNK(残高 * 0.0003, 0)
  END AS 残高別利息
 FROM 口座
 ORDER BY 残高別利息 DESC, 口座番号

-- 46
INSERT INTO 口座
VALUES ('0351262', 'いとかわ　だい', '2', 635110, CURRENT_DATE);

INSERT INTO
VALUES ('105513', 'あきつ　じゅんじ', '1', 88463, CURRENT_DATE);

INSERT INTO 口座
VALUES ('1739298', 'ほしの　さとみ', '1', 704610, CURRENT_DATE);

-- 47
SELECT 口座番号, 名義, 種別, 残高, SUBSTRING(CAST(更新日 AS VARCHAR), 1, 4) || '年' ||
　　　　　　　　　　　　　　　　　　　SUBSTRING(CAST(更新日 AS VARCHAR), 6, 2) || '月' ||
                               SUBSTRING(CAST(更新日 AS VARCHAR), 9, 2) || '日' AS 更新日
  FROM 口座
 WHERE 更新日 >= '2018-01-01'

-- 48
SELECT COALESCE(CAST(更新日 AS VARCHAR), '設定なし') AS 更新日
  FROM 口座



-- LEVEL5
-- 49

