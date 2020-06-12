CREATE INDEX 費目IDインデックス ON 家計簿(費目ID);
CREATE INDEX メモインデックス ON 家計簿(メモ);

-- 家計簿4月VIEWを定義
CREATE VIEW 家計簿4月 AS
SELECT * FROM 家計簿
WHERE 日付 >= '2018-04-01'
  AND 日付 <= '2018-04-30'

-- 定義した家計簿4月VIEWを使う
SELECT * FROM 家計簿4月;
SELECT DISTINCT 費目ID FROM 家計簿4月;