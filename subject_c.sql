-- 題材C
-- LEVEL1
-- 1
SELECT ID, 名称, 職業コード, HP, MP, 状態コード
  FROM パーティー

-- 2
SELECT 名称 AS なまえ, HP AS 現在のHP, MP AS 現在のMP
  FROM パーティー

-- 3
SELECT *
  FROM イベント

-- 4
SELECT イベント番号 AS 番号, イベント名称 AS 場面
  FROM イベント

-- 5
INSERT INTO パーティー
VALUES ('A01', 'スガワラ', '21', 131, 232, '03');

INSERT INTO パーティー
VALUES ('A02', 'オーエ', '10', 156, 84, '00');

INSERT INTO パーティー
VALUES ('A03', 'イズミ', '20', 84, 190, '00');



-- LEVEL2
-- 6
SELECT *
  FROM パーティー
 WHERE ID = 'C02'

-- 7
UPDATE パーティー
   SET HP = 120
 WHERE ID = 'A01'

-- 8
SELECT ID, 名称, HP
  FROM パーティー
 WHERE HP < 100

-- 9
SELECT ID, 名称, HP
  FROM パーティー
 WHERE MP >= 100

-- 10
SELECT イベント番号, イベント名称
  FROM イベント
 WHERE タイプ <> '3'

-- 11
SELECT イベント番号, イベント名称
  FROM イベント
 WHERE イベント番号 <= 5

-- 12
SELECT イベント番号, イベント名称
  FROM イベント
 WHERE イベント番号 >= 20

-- 13
SELECT イベント番号, イベント名称
  FROM イベント
 WHERE 前提イベント番号 IS NULL

-- 14
SELECT イベント番号, イベント名称, 後続イベント番号
  FROM イベント
 WHERE 後続イベント番号 IS NOT NULL

-- 15
UPDATE パーティー
   SET 状態コード = '01'
 WHERE 名称 LIKE '%ミ%'

-- 16
SELECT ID, 名称, HP
  FROM パーティー
 WHERE HP BETWEEN 120 AND 160

-- 17
SELECT ID, 名称, HP
  FROM パーティー
 WHERE 職業 IN ('01', '10', '11')

-- 18
SELECT 名称, 状態コード
  FROM パーティー
 WHERE 状態コード NOT IN ('00', '09')

-- 19
SELECT *
  FROM パーティー
 WHERE HP > 100
   AND MP > 100

-- 20
SELECT *
  FROM パーティー
 WHERE ID LIKE 'A%'
   AND 職業コード LIKE '2%'

-- 21
SELECT *
  FROM イベント
 WHERE タイプ = '1'
   AND 前提イベント番号 IS NOT NULL
   AND 後続イベント番号 IS NOT NULL

-- 22
ID, イベント番号



-- LEVEL3
-- 23
SELECT DISTINCT 状態コード
  FROM パーティー

-- 24
SELECT ID, 名称
  FROM パーティー
 ORDER BY ID

-- 25
SELECT 名称, 職業コード
  FROM パーティー
 ORDER BY 名称 DESC

-- 26
SELECT 名称, HP, 状態コード
  FROM パーティー
 ORDER BY 状態コード, HP DESC

-- 27
SELECT タイプ, イベント番号, イベント名称, 前提イベント番号, 後続イベント番号
  FROM イベント
 ORDER BY 1, 2

-- 28
SELECT *
  FROM パーティー
 ORDER BY HP DESC
OFFSET 0 ROWS
 FETCH NEXT 3 ROWS ONLY

-- 29
SELECT *
  FROM パーティー
 ORDER BY MP DESC
OFFSET 2 ROWS
 FETCH NEXT 1 ROWS ONLY

-- 30
SELECT CASE SUBSTRING(職業コード, 1, 1)
       WHEN '1' THEN 'S'
       WHEN '2' THEN 'M'
       ELSE 'A'
       END AS 職業区分,
       職業コードM, ID, 名称
  FROM パーティー
 ORDER BY 職業コード

-- 31
SELECT I.イベント番号
  FROM イベント AS I
EXCEPT
SELECT K.イベント番号
  FROM 経験イベント番号 AS K
 ORDER BY I.イベント番号

-- 32
SELECT イベント番号
  FROM 経験イベント
 WHERE クリア区分 = '1'
INTERSECT
SELECT イベント番号
  FROM イベント
 WHERE タイプ = '2'



-- LEVEL4
-- 33
SELECT 名称 AS なまえ, HP AS 現在のHP, HP + 50 AS 装備後のHP
  FROM パーティー
 WHERE 職業コード IN ('11', '21')

-- 34
UPDATE パーティー
   SET MP = MP + 20
 WHERE ID IN ('A01', 'A03')

-- 35
SELECT 名称 AS なまえ, HP AS 現在のHP, HP * 2 AS 予想されるダメージ
  FROM パーティー
 WHERE 職業コード = '11'

-- 36
SELECT 名称 AS なまえ, HP || '/' || MP AS HPとMP,
       CASE 状態コード
       WHEN '00' THEN NULL
       WHEN '01' THEN '眠り'
       WHEN '02' THEN '毒'
       WHEN '03' THEN '沈黙'
       WHEN '04' THEN '混乱'
       WHEN '09' THEN '気絶'
       END AS ステータス
  FROM パーティー

-- 37
SELECT イベント番号, イベント名称,
       CASE タイプ
       WHEN '1' THEN '強制'
       WHEN '2' THEN 'フリー'
       WHEN '3' THEN '特殊'
       END AS タイプ,
       CASE WHEN イベント番号 BETWEEN 1 AND 10 THEN '序盤'
            WHEN イベント番号 BETWEEN 11 AND 17 THEN '中盤'
            ELSE '終盤'
       END AS 発生時期
  FROM イベント

-- 38
SELECT 名称 AS なまえ, HP AS 現在のHP, LENGTH(名称) * 10 AS 予想ダメージ
  FROM パーティー

-- 39
UPDATE パーティー
   SET 状態コード = '04'
 WHERE HP % 4 = 0
    OR MP % 4 = 0

-- 40
SELECT TRUNC(777 * 0.7, 0) AS 支払った金額

-- 41
UPDATE パーティー
   SET HP = ROUND(HP * 1.3, 0), MP = ROUND(MP * 1.3, 0)

-- 42
SELECT 名称 AS なまえ, HP, POWER(HP, 0) AS 攻撃1回目, POWER(HP, 1) AS 攻撃2回目, POWER(HP, 2) AS 攻撃3回目
  FROM パーティー
 WHERE 職業コード = '10'

-- 43
SELECT 名称 AS なまえ, HP, 状態コード,
       CASE WHEN HP <= 50 THEN 3 + CAST(状態コード AS INTEGER)
            WHEN HP >= 51 AND HP <= 100 THEN 2 + CAST(状態コード AS INTEGER)
            WHEN HP >= 101 AND HP <= 150 THEN 1 + CAST(状態コード AS INTEGER)
            ELSE CAST(状態コード AS INTEGER)
       END AS リスク値
  FROM パーティー
 ORDER BY リスク値 DESC, HP

-- 44
SELECT COALESCE(CAST(前提イベント番号 AS VARCHAR), '前提なし'), イベント番号, COALESCE(CAST(後続イベント番号 AS VARCHAR), '後続なし')
  FROM イベント
 ORDER BY イベント番号



-- LEVEL5
-- 45
SELECT MAX(HP) AS 最大HP, MIN(HP) AS 最小HP, AVG(HP) AS 平均HP, MAX(MP) AS 最大MP, MIN(MP) AS 最小MP, AVG(MP) AS 平均MP
  FROM パーティー

-- 46
SELECT CASE タイプ
       WHEN '1' THEN '強制'
       WHEN '2' THEN 'フリー'
       WHEN '3' THEN '特殊'
       END AS タイプ,
       COUNT(イベント番号) AS イベント数
  FROM イベント
 GROUP BY タイプ

-- 47
SELECT クリア結果, COUNT(イベント番号) AS イベント数
  FROM 経験イベント
 WHERE クリア区分 = '1'
 GROUP BY クリア結果
 ORDER BY クリア結果

-- 48
SELECT CASE WHEN SUM(MP) < 500 THEN '敵は見とれている！'
            WHEN SUM(MP) >= 500 AND SUM(MP) < 1000 THEN '敵は呆然としている！'
            WHEN SUM(MP) >= 1000 THEN '敵はひれ伏している！'
       END AS 小さな奇跡
  FROM パーティー

-- 49
SELECT CASE クリア区分
       WHEN '0' THEN '参加したがクリアしていない'
       WHEN '1' THEN 'クリアした'
       END AS 区分,
       COUNT(イベント番号) AS イベント数
  FROM 経験イベント
 GROUP BY クリア区分

-- 50
SELECT SUBSTRING(職業コード, 1, 1) AS 職業タイプ, MAX(HP)AS 最大HP, MIN(HP) AS 最小HP, AVG(HP) AS 平均HP,
       MAX(MP) AS 最大MP, MIN(MP) AS 最小MP, AVG(MP) AS 平均MP
  FROM パーティー
 GROUP BY SUBSTRING(職業コード, 1, 1)

-- 51
SELECT SUBSTRING(ID, 1, 1) AS IDによる分類, AVG(HP) AS HPの平均, AVG(MP) AS MPの平均
  FROM パーティー
 GROUP BY SUBSTRING(ID, 1, 1)
HAVING AVG(HP) > 100

-- 52
SELECT SUM(CASE WHEN HP < 100 THEN 1
	              WHEN HP >= 100 AND HP < 150 THEN 2
	              WHEN HP >= 150 AND HP < 200 THEN 3
	              WHEN HP >= 200 THEN 5
	         END) AS 開けられる扉の数
  FROM パーティー



-- LEVEL6
-- 53
SELECT 名称 AS なまえ, HP AS 現在のHP, ROUND(CAST(HP AS NUMERIC) / (SELECT SUM(HP)
                                                                   FROM パーティー) * 100, 1)
       AS パーティーでの割合
  FROM パーティー
 WHERE 職業コード = '01'

-- 54
UPDATE パーティー
   SET MP = MP + (SELECT ROUND(SUM(MP*0.1))
   	                FROM パーティー
   	               WHERE 職業コード <> '20')
 WHERE 職業コード = '20'

-- 55
SELECT イベント番号, クリア結果
  FROM 経験イベント
 WHERE クリア区分 = '1'
   AND イベント番号 IN (SELECT イベント番号
   	                    FROM イベント
   	                   WHERE タイプ IN ('1', '3')

-- 56
SELECT 名称, MP
  FROM パーティー
 WHERE MP = (SELECT MAX(MP)
 	             FROM パーティー)

-- 57
SELECT イベント番号, イベント名称
  FROM イベント
 WHERE イベント番号 NOT IN ( SELECT イベント番号
 	                           FROM 経験イベント)
 ORDER BY イベント番号

-- 58
SELECT COUNT(*) AS 未着手のイベント数
  FROM (SELECT イベント番号
 	        FROM イベント
 	      EXCEPT
 	      SELECT イベント番号
 	        FROM 経験イベント)

-- 59
SELECT イベント番号, イベント名称
  FROM イベント
 WHERE イベント番号 < ALL (SELECT イベント番号
                           FROM 経験イベント
                          WHERE ルート番号 = 5)

-- 60
SELECT イベント番号, イベント名称, 前提イベント番号
  FROM イベント
 WHERE 前提イベント番号 ANY (SELECT イベント番号
 	                          FROM 経験イベント
 	                          WHERE クリア区分 = '1')

-- 61
UPDATE 経験イベント
   SET クリア区分 = '1', クリア結果 = 'B'
 WHERE イベント番号 = 9;

INSERT INTO 経験イベント
VALUES ((SELECT イベント番号
           FROM イベント
          WHERE 前提イベント番号 = 9), 0, NULL, (SELECT MAX(ルート番号)+1
                                                FROM 経験イベント));



-- LEVEL7
-- 62
