select count(*) cnt from iceberg.test.customer; 	-- 1'500
select count(*) cnt from iceberg.test.lineitem; 	-- 60'175
select count(*) cnt from iceberg.test.nation;   	-- 25
select count(*) cnt from iceberg.test.orders;		-- 15'000
select count(*) cnt from iceberg.test.part;			-- 2'000
select count(*) cnt from iceberg.test.partsupp;		-- 8'000
select count(*) cnt from iceberg.test.region;		-- 5
select count(*) cnt from iceberg.test.supplier;		-- 100


select * from iceberg.test.customer;
select * from iceberg.test.lineitem;
select * from iceberg.test.nation;
select * from iceberg.test.orders;
select * from iceberg.test.part;
select * from iceberg.test.partsupp;
select * from iceberg.test.region;
select * from iceberg.test.supplier;

-- Сбор статистики
analyze iceberg.test.customer;
analyze iceberg.test.lineitem;
analyze iceberg.test.nation;
analyze iceberg.test.orders;
analyze iceberg.test.part;
analyze iceberg.test.partsupp;
analyze iceberg.test.region;
analyze iceberg.test.supplier;

-- EXPLAIN показывает планируемый план выполнения запроса
explain
select 
	c.mktsegment
	, cast(sum(o.totalprice) as int) as totalprice
from iceberg.test.orders o
left join iceberg.test.customer c on c.custkey = o.custkey
group by c.mktsegment 
order by 2 desc
;

-- EXPLAIN ANALYZE выполняет запрос и предоставляет фактические метрики его выполнения
explain analyze
select 
	c.mktsegment
	, cast(sum(o.totalprice) as int) as totalprice
from iceberg.test.orders o
left join iceberg.test.customer c on c.custkey = o.custkey
group by c.mktsegment 
order by 2 desc
;

-- Посмотреть колонки таблицы
describe iceberg.test.customer;

-- Показать статистику таблицы
SHOW STATS FOR iceberg.test.customer;

-- Обращение к метаданным таблицы Iceberg
select * from iceberg.test."orders$snapshots";

-- Посмотреть параметры сессии (и дефолтные значения) - настройки Trino и Iceberg
SHOW SESSION;
