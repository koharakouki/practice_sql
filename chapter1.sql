-- 家計簿テーブルから出金額カラムを取得
SELECT 出金額 FROM 家計簿

-- 複数の場合は、','で区切る
SELECT 出金額, 入金額 FROM 家計簿

-- テーブル全体を取得するには、'*'を使う
SELECT * FROM 家計簿

-- 出金額が3,000円を超えるカラムだけを取得する
SELECT 日付, 費目, 出金額 FROM 家計簿 WHERE 出金額 > 3000


-- データの追加
-- INSERT INTO (インサート イントゥ)で追加先のテーブルを、2行目の VALUES で追加するデータを指定
INSERT INTO 家計簿 VALUES ('2018-02-25', '居住費', '3月の家賃', 0, 85000)

-- データの更新
UPDATE 家計簿 SET 出金額 = 90000 WHERE 日付 = '2018-02-25'

-- データの削除
DELETE FROM 家計簿 WHERE 日付 = '2018-02-25'


-- 練習問題

-- 1
SELECT * FROM 家計簿 WHERE 入金額 = 50000

-- 2
DELETE FROM 家計簿 WHERE 出金額 > 4000

-- 3
UPDATE 家計簿 SET メモ = 'カフェラテ購入' WHERE 日付 = '2018-02-03'