-- 副問い合わせ
-- 最大の出費に対する費目と金額を求める
SELECT 費目, 出金額 FROM 家計簿
WHERE 出金額 = ( SELECT MAX(出金額) FROM 家計簿)


UPDATE 家計簿集計
   SET 平均 = ( SELECT AVG(出金額)
   	             FROM 家計簿集計
   	            WHERE 出金額 > 0
   	              AND 費目 = '食費')
WHERE 費目 = '食費'


SELECT 日付, メモ, 出金額,
       (SELECT 合計 FROM 家計簿集計
       	WHERE 費目 = '食費') AS 過去の合計額
FROM 家計簿アーカイブ
WHERE 費目 = '食費'


-- INで副問い合わせを利用する
SELECT * FROM 家計簿集計
WHERE 費目 IN ( SELECT DISTINCT 費目 FROM 家計簿 )

-- ANYで副問い合わせを利用する
SELECT * FROM 家計簿
 WHERE 費目 = '食費'
   AND 出金額 < ANY ( SELECT 出金額 FROM 家計簿アーカイブ
  	                  WHERE 費目 = '食費')


SELECT * FROM 家計簿アーカイブ
WHERE 費目 IN ( SELECT 費目 FROM 家計簿
                WHERE 費目 IS NOT NULL )

SELECT * FROM 家計簿アーカイブ
WHERE 費目 IN ( SELECT COALESCE(費目, '不明') FROM 家計簿　)


SELECT SUM(SUB.出金額) AS 出金額合計
FROM ( SELECT 日付, 費目, 出金額
         FROM 家計簿
        UNION
       SELECT 日付, 費目, 出金額
         FROM 家計簿アーカイブ
        WHERE 日付 >= '2018-01-01'
          AND 日付 <= '2018-01-31') AS SUB


INSERT INTO 家計簿集計 ( 費目, 合計, 平均, 回数 )
SELECT 費目, SUM(出金額), AVG(出金額), 0
FROM 家計簿
WHERE 出金額 > 0
GROUP BY 費目


-- 練習問題
-- 7-3-1
INSERT INTO 頭数集計
SELECT 飼育県, COUNT(個体識別番号)
FROM 個体識別
GROUP BY 飼育県


-- 7-3-2
SELECT 飼育県 AS 都道府県, 個体識別番号,
      CASE 雌雄コード
      WHEN '1' THEN '雄'
      WHEN '2' THEN '雌'
      END AS 雌雄
FROM 個体識別
WHERE 飼育県 IN ( SELECT 飼育県 FROM 頭数集計
                 ORDER BY 頭数　DESC
                 OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)

-- 7-3-3
SELECT 個体識別番号,
       CASE 品種コード
       WHEN '01' THEN '乳用種'
       WHEN '02' THEN '肉用種'
       WHEN '03' THEN '交雑種'
       END AS 品種,
       出生日, 母牛番号
FROM 個体識別
WHERE 母牛番号 IN ( SELECT 個体識別番号 FROM 個体識別
                   WHERE 品種コード = '01' )
