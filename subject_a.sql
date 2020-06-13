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