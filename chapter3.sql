-- NULL演算子
NULLであることを判定する: IS NULL
でないことを判定する    : IS NOT NULL

-- 出金額がNULLであることを判定する
SELECT * FROM 家計簿 WHERE 出金額 IS NULL



-- LIKE演算子
式 LIKE パターン文字

-- パターン文字とは？
% : 任意の0文字以上の文字列
_ : 任意の位置文字

-- メモ列に1月という文字列が含まれている行を取得する
SELECT * FROM 家計簿
WHERE メモ　LIKE '%1月%'

%1月% は1月の前後に文字列がついても良い
%1月  は1月の前後に文字列がついても良い
1月%  は1月の後ろに文字列がついても良い
1月_  は1月の後ろに任意の1文字がある文字列

-- %や_の文字列そのものを含む文字列で検索したい場合(100%の前に0文字以上の文字列が含まれる場合で検索)
-- 正規表現の\のようにESCAPE句を指定してエスケープする
SELECT * FROM 家計簿 WHERE メモ LIKE '%100$%' ESCAPE '$'



-- BETWEEN演算子
式 BETWEEN 値1 AND 値2

出金額が100以上3000以下
SELECT *
FROM 家計簿
WHERE 出金額 BETWEEN 100 AND 3000



-- IN演算子
式 IN (値1, 値2, 値3)

-- 費目が食費・交際費の行を取得する(逆の場合は NOT IN演算子を使う)
SELECT *
FROM 家計簿
WHERE 費目 IN ('食費', '交際費')



-- ANY/ALL演算子
-- 値リストのそれぞれと比較していずれかが真なら真
式 基本比較演算子　ANY (値1, 値2, 値3)
-- 値リストのそれぞれと比較して全て真なら真
式 基本比較演算子 ALL (値1, 値2, 値3)



-- AND/OR演算子
-- 両方真なら真だしん
条件式1 AND 条件式2
-- どちらかが真なら真
条件式1 OR 条件式2

-- スッキリ勇者クエストかつ販売店Bを更新
UPDATE 湊くんの買い物リスト
SET 価格 = 6200
WHERE 名称 = "スッキリ勇者クエスト"
AND 販売店 = 'B'



-- NOT演算子
NOT 条件式

-- 販売店がB以外の行を取得
WHERE NOT 販売店 = 'B'



-- 論理演算子の優先度
-- ANDはORより優先度が高い
SELECT * FROM 湊くんの買い物リスト
WHERE ( 販売店 = 'A' OR 販売店 = 'B' ) AND ( カテゴリ = 'ゲーム' OR カテゴリ = 'DVD' )



-- 練習問題
-- 3-1
-- 1
SELECT * FROM 気象観測
WHERE 月 = 6

-- 2
SELECT * FROM 気象観測
WHERE NOT 月 = 6

-- WHERE 月 <> 6もあり
-- <>は等しくないということ

-- 3
SELECT * FROM 気象観測
WHERE 降水量 < 100

-- 4
SELECT * FROM 気象観測
WHERE 降水量 > 200

-- 5
SELECT * FROM 気象観測
WHERE 最高気温 >= 30

-- 6
SELECT * FROM 気象観測
WHERE 最低気温 <= 0

-- 7
-- INを使う場合
SELECT * FROM 気象観測
WHERE 月 IN (3, 5, 7);

-- ORを使う場合
SELECT * FROM 気象観測
WHERE 月 = 3 OR 月 = 5 OR 月 = 7

-- 8
-- NOT INを使う場合
SELECT * FROM 気象観測
WHERE 月 NOT IN (3, 5, 7);

-- ANDを使う場合
SELECT * FROM 気象観測
WHERE 月 <> 3 OR 月 <> 5 OR 月 <> 7

-- 9
SELECT * FROM 気象観測
WHERE (降水量 <= 100) AND (湿度 < 50)

-- 10
SELECT * FROM 気象観測
WHERE 湿度 < 5 OR 最高気温 > 35

-- 11
-- BETWEENを使う場合
SELECT * FROM 気象観測
WHERE 湿度 BETWEEN 60 AND 79;

-- ANDを使う場合
SELECT * FROM 気象観測
WHERE 湿度 >= 60 AND 湿度 <= 79

-- 12
SELECT 月 FROM 気象観測
WHERE 降水量 IS NULL OR 最高気温 IS NULL OR 最低気温 IS NULL OR 湿度 IS NULL



-- 3-2
-- 1
SELECT * FROM 都道府県
WHERE 都道府県名 LIKE '%川'

-- 2
SELECT * FROM 都道府県
WHERE 都道府県名　LIKE '%島%'

-- 3
SELECT * FROM 都道府県
WHERE 都道府県名　LIKE '愛%'

-- 4
SELECT * FROM 都道府県
WHERE 都道府県名 = 県庁所在地

-- 5
SELECT * FROM 都道府県
WHERE 都道府県名 <> 県庁所在地



-- 3-3
-- 1
SELECT * FROM 成績表

-- 2
INSERT INTO 成績表
VALUES ('S001', '織田 信長', 77, 55, 80, 75, 93, NULL);

INSERT INTO 成績表
VALUES ('A002', '豊臣 秀吉', 64, 69, 70, 0, 59, NULL);

INSERT INTO 成績表
VALUES ('E003', '徳川 家康', 80, 83, 85, 90, 79, NULL);

-- 3
UPDATE 成績表
SET 法学 = 85, 哲学 = 67
WHERE 学籍番号 = 'S001'

-- 4
UPDATE 成績表
SET 外国語 = 81
WHERE 学籍番号 IN ('A002', 'E003')

-- 5
-- (1)
UPDATE 成績表
SET 総合成績 = 'A'
WHERE 法学 >= 80 AND 経済学 >= 80 AND 哲学 >= 80 AND 情報理論 >= 80 AND 外国語 >= 80

-- (2)
UPDATE 成績表
SET 総合成績 = 'B'
WHERE ( 法学 >= 80 OR 外国語 >= 80 ) AND ( 経済学 >= 80 OR 哲学 >= 80) AND 総合成績 IS NULL

-- (3)
UPDATE 成績表
SET 総合成績 = 'D'
WHERE 法学 < 50 AND 経済学 < 50 AND 哲学 < 50 AND 情報理論 < 50 AND 外国語 < 50 AND 総合成績 IS NULL

-- (4)
UPDATE 成績表
SET 総合成績 = 'C'
WHERE 総合成績 IS NULL

-- 6
DELETE FROM 成績表
WHERE 法学 = 0 OR 経済学 = 0 OR 哲学 = 0 OR 情報理論 = 0 OR 外国語 = 0