-- SELECT文
-- AS + 任意のキーワードで別名を定義できる
SELECT 費目 AS ITEM, 入金額 AS RECEIVE, 出金額 AS PAY
FROM 家計簿 AS MONEYBOOK
WHERE 費目 = '給料'


-- UPDATE文
-- UPDATE文は基本的にWHERE句を使用する(WHEREを使わないと全件更新されてしまう)


-- DELETE文
-- DELETE文は基本的にWHERE句を使用する(WHEREを使わないと全件削除されてしまう)


-- INSERT文
INSERT INTO 家計簿
            (費目, 日付, 出金額) #すべての列に値を追加する場合は省略可能
VALUES ('通信費', '2018-02-20', 6200)


-- 練習問題
-- 2-3
-- 1
SELECT コード, 地域, 都道府県名, 県庁所在地, 面積 FROM 都道府県

-- 2
SELECT * FROM 都道府県

-- 3
SELECT 地域 AS area, 都道府県名 AS pref
FROM 都道府県

-- 2-4
INSERT INTO 都道府県
　　　　　　　(コード, 地域, 都道府県, 面積)
VALUES ('26', '近畿', '京都'、4613);

INSERT INTO 都道府県
VALUES ('37', '四国', '香川', '高松', 1876);

INSERT INTO 都道府県
            (コード, 都道府県名, 県庁所在地)
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