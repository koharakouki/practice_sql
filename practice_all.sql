-- chapter1-練習問題
-- 1-3-1
SELECT * FROM 家計簿 WHERE 入金額 = 50000

-- 1-3-2
DELETE FROM 家計簿
 WHERE 出金額 > 4000

-- 1-3-3
UPDATE 家計簿
   SET メモ = 'カフェラテを購入'
 WHERE 日付 = '2018-02-03'



-- chapter2-練習問題
-- 2-3-1
SELECT コード, 地域, 都道府県名, 県庁所在地, 面積
  FROM 都道府県

-- 2-3-2
SELECT + FROM 都道府県

-- 2-3-3
SELECT 地域 AS area, 都道府県名 AS pref FROM 都道府県


-- 2-4-(コード26)
INSERT INTO 都道府県(コード, 地域, 都道府県名, 面積)
VALUES ('26', '近畿', '京都', 4613)

-- 2-4-(コード37)
INSERT INTO 都道府県
VALUES ('37', '四国', '香川', '高松', 1876)

-- 2-4-(コード40)
INSERT INTO 都道府県(コード, 都道府県名, 県庁所在地)
VALUES ('40', '福岡', '福岡')


-- 2-5
UPDATE 都道府県
  SET 県庁所在地 = '京都'
 WHERE コード = '26';
UPDATE 都道府県
   SET 地域 = '九州', 面積 = 4976
 WHERE コード = '40'


-- 2-6
DELETE FROM 都道府県
 WHERE コード = '26'