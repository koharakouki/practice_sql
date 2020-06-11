-- 選択列リストへのさまざまな指定
-- 選択列リストとは、SELECT の後ろに指定する値
SELECT 出金額,       -- 列名での指定
       出金額 + 100, -- 計算式での指定
       'SQL'        -- 固定値での指定
  FROM 家計簿



-- CASE演算子
CASE 評価する値や式 WHEN 値1 THEN 値1のときに返す値
                 (WHEN 値2 THEN 値2のときに返す値)
                 (ELSE デフォルト値)
END

-- CASE-ENDまでの部分が選択列となる(なのでこのSQL文では選択列が3つあることになる)
SELECT 費目, 出金額
       CASE 費目 WHEN '居住費' THEN '固定費'
                WHEN '水道光熱費' THEN '固定費'
                ELSE '変動費'
       END AS 出費の分類
FROM 家計簿 WHERE 出金額 > 0

-- CASEの後ろに列名や式を書かない場合(RubyのCASE文と同じようになる)
SELECT 費目, 出金額
CASE WHEN 入金額 < 5000 THEN 'お小遣い' --最初に一致したWHENが採用される
     WHEN 入金額 < 100000 THEN '一時収入'
     WHEN 入金額 < 300000 THEN '給料'
     ELSE '想定外の収入'
END AS 収入の分類
FROM 家計簿 WHERE 入金額 > 0



-- 関数
-- LENGTH関数
SELECT メモ, LENGTH(メモ) AS メモの長さ
FROM 家計簿

-- 10文字以下のメモだけを取得する
SELECT メモ, LENGTH(メモ) AS メモの長さ FROM 家計簿
WHERE LENGTH <= 10



-- TRIM関数(LTIRM/RTRIM)
SELECT メモ, TRIM(メモ) AS メモの長さ FROM 家計簿



-- REPLACE関数
UPDATE 家計簿
   SET メモ = REPLACE(メモ, '購入', '買った')



-- SUBSTRING/SUBSTR関数
-- 費目列の1~3文字目に「費」があるものだけを抽出する
SELECT * FROM 家計簿
WHERE SUBSTRING(費目, 1, 3) LIKE '%費%'



-- CONCAT関数
SELECT CONCAT(費目, ':' || メモ) FROM 家計簿



-- ROUND関数
SELECT 出金額, ROUND(出金額, -2) AS 百円単位の出金額 FROM 家計簿



-- CAST関数
-- データ型を変換する関数
CAST(変換する値 AS 変換する型)



-- COALESCE関数
-- NULLでない値を返す
SELECT 日付, 費目
       COALESCE(メモ, '(メモはNULLです)')) AS メモ, 入金額, 出金額
FROM 家計簿



-- 練習問題
-- 5-1-1
-- (A)
UPDATE 試験結果
SET 午後1 = 平均点 * 4 - (午前 + 午後2 + 論述)
WHERE 受験者ID = 'SW1046'

-- (B)
UPDATE 試験結果
SET 論述 = 平均点 * 4 - (午前 + 午後1 + 午後2)
WHERE 受験者ID = 'SW1350'

-- (C)
UPDATE 試験結果
SET 午前 = 平均点 * 4 - (午後1 + 午後2 + 論述)
WHERE 受験者ID = 'SW1877'

-- 5-1-2
SELECT 受験者ID AS 合格者ID
FROM 試験結果
WHERE 午前 >= 60
  AND 午後1 + 午後2 >= 120
  AND 0.3 * (午前 + 午後1 + 午後2 + 論述) <= 論述


-- 5-2-1
UPDATE 回答者
   SET 国名 = CASE SUBSTRING(TRIM(メールアドレス), LENGTH(TRIM(メールアドレス))-1, 2)
             WHEN 'jp' THEN '日本'
             WHEN 'uk' THEN 'イギリス'
             WHEN 'cn' THEN '中国'
             WHEN 'fr' THEN 'フランス'
             WHEN 'vt' THEN 'ベトナム'
             END

-- 5-2-2
SELECT TRIM(メールアドレス) AS メールアドレス,
  CASE WHEN 年齢 >= 20 AND 年齢 <= 30 THEN '20代'
       WHEN 年齢 >= 30 AND 年齢 <= 40 THEN '30代'
       WHEN 年齢 >= 40 AND 年齢 <= 50 THEN '40代'
       WHEN 年齢 >= 50 AND 年齢 <= 60 THEN '50代' END
       || ':' ||
  CASE 性別 WHEN 'M' THEN '男性'
           WHEN 'F' THEN '女性' END AS 属性
FROM 回答者


-- 5-3-1
UPDATE 受注
   SET 文字数 = LENGTH(REPLACE(文字, ' ', ''))

-- 5-3-2
SELECT 受注日, 受注ID, 文字数,
  CASE COALESCE(書体コード, '1')
       WHEN '1' THEN 'ブロック体'
       WHEN '2' THEN '筆記体'
       WHEN '3' THEN '草書体'
  END AS 書体名,
  CASE COALESCE(書体コード, '1')
       WHEN '1' THEN 100
       WHEN '2' THEN 150
       WHEN '3' THEN 200
  END AS 単価,
  CASE WHEN 文字数 > 10 THEN 500
       ELSE 0
  END AS 特別加工料
FROM 受注
ORDER BY 受注日, 受注ID

-- 5-3-3
UPDATE 受注
   SET 文字 = REPLACE(文字, ' ', '★')
 WHERE 受注ID = '113'
