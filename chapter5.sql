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

-- CASENの後ろに列名や式を書かない場合(RubyのCASE文と同じようになる)
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