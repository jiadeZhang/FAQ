1、查询某个表格的字段和值
SELECT *
        FROM `information_schema`.`COLUMNS`
        WHERE `TABLE_SCHEMA`="%s" AND `TABLE_NAME`="%s"
        ORDER BY `ORDINAL_POSITION` ASC
