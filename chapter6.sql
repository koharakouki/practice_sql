-- 出金額を集計する
SELECT SUM(出金額) AS 出金額の合計
FROM 家計簿


-- さまざまな集計
SELECT
  SUM(出金額) AS 合計出金額,
  AVG(出金額) AS 平均出金額,
  MAX(出金額) AS 最も大きな散財,
  MIN(出金額) AS 最も少額の支払い
FROM 家計簿


-- COUNT関数
-- 食費の行数を数える
SELECT COUNT(*) AS 食費の行数
FROM 家計簿
WHERE 費目 = '食費'


-- 費目でグループ化してそれぞれの合計を求める
SELECT 費目, SUM(出金額) AS 費目別の出金額合計
FROM 家計簿
GROUP BY 費目


-- 集計処理を行った後の結果表に対しての絞り込み
-- HAVING句
SELECT グループ化の基準列名, 集計関数
FROM テーブル名
(WHERE もとの表に対する絞り込み条件)
GROUP BY グループ化の基準列名
HAVING 集計結果に対する絞り込み条件

SELECT 費目, SUM(出金額) AS 費目別の出金額合計
FROM 家計簿
GROUP BY 費目
HAVING SUM(出金額) > 0



-- 練習問題
-- 6-1-1
SELECT SUM(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測

-- 6-1-2
SELECT SUM(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測
WHERE 都市名 = '東京'

-- 6-1-3
SELECT 都市名, SUM(降水量), MIN(最高気温), MAX(最低気温)
FROM 都市別気象観測
GROUP BY 都市名

-- 6-1-4
SELECT 月, AVG(降水量), AVG(最高気温), AVG(最低気温)
FROM 都市別気象観測
GROUP BY 月

-- 6-1-5
SELECT 都市名, MAX(最高気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MAX(最高気温) >= 38

-- 6-1-6
SELECT 都市名, MIN(最低気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MIN(最低気温) <= -10

-- 6-2-1
SELECT COUNT(*) AS 社員数
FROM 入退室管理
WHERE 退室 IS NULL

-- 6-2-2
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
ORDER BY 入室回数 DESC

-- 6-2-3
SELECT CASE 事由区分
       WHEN '1' THEN 'メンテナンス'
       WHEN '2' THEN 'リリース作業'
       WHEN '3' THEN '障害対応'
       WHEN '9' THEN 'その他' END AS 事由区分,
COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 事由区分

-- 6-2-4
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
HAVING COUNT(*) > 10

-- 6-2-5
SELECT 日付, COUNT(社員名) AS 対応社員数
FROM 入退室管理
WHERE 事由区分 = '3'
GROUP BY 日付

