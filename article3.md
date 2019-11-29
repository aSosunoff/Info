```sql
--вниз

SELECT
  node.*
FROM
  test AS node, test AS parent
WHERE
  node.l BETWEEN parent.l AND parent.r
  AND parent.id = 2
ORDER BY
  node.id;
  
-------------------
  
--вверх

SELECT
  node.*
FROM
  test AS node, test AS parent
WHERE
  parent.l BETWEEN node.l AND node.r
  AND parent.id = 9
ORDER BY
  node.id;
  
-------------------
-- Выводим каталоги до всех листов
-- Выводим только те узлы которые активны. Если узел является не активным не выводим его детей
SELECT
  	node.*
FROM
  	igi_CATALOG AS node, igi_CATALOG AS parent
WHERE
  	node.LEFT BETWEEN parent.LEFT AND parent.RIGHT
  	AND parent.ID = 6
	-- Надстройка. Выводить только следующий уровень каталога, листья которого выводим
	-- AND (parent.LEVEL + 1) >= node.LEVEL
	-- Надстройка. Не выводить каталог, который 
	-- AND node.ID != parent.ID
  	AND 1 = (
  		-- Проверяем узлы если есть в цепочке до корня не активные элементы то не выводим данный узел
  		-- если 1 то выводим
		SELECT
		  	IF((COUNT(*) - SUM(sub_parent.ACTIVE_FLAG)) = 0, 1, 0) AS IS_CATALOG
		FROM
		  	igi_CATALOG AS sub_node, igi_CATALOG AS sub_parent
		WHERE
		  	sub_node.LEFT BETWEEN sub_parent.LEFT AND sub_parent.RIGHT
		  	AND sub_node.ID = node.ID
	)
ORDER BY
  	node.ID;
	
-----------------------------------------
-- Проверяем каталог. Если его родители не активны, то не выводим его
SELECT
	IF((COUNT(*) - SUM(parent.ACTIVE_FLAG)) = 0, 1, 0) AS IS_CATALOG
FROM
  	igi_CATALOG AS node, igi_CATALOG AS parent
WHERE
  	node.LEFT BETWEEN parent.LEFT AND parent.RIGHT
AND node.ID = 21

-----------------
-- Выводим продукт. Если каталог не активен продукт не выводиться.
-- Если родитель не активен каталога в котором лежит продукт, то продукт не выводиться
SELECT
	product.*
FROM
	igi_PRODUCT AS product
WHERE
	product.ID = 1
	AND 1 = (
		-- Проверяем каталог. Если его родители не активны, то не выводим его
		SELECT
			IF((COUNT(*) - SUM(parent.ACTIVE_FLAG)) = 0, 1, 0) AS IS_CATALOG
		FROM
		  	igi_CATALOG AS node, igi_CATALOG AS parent
		WHERE
		  	node.LEFT BETWEEN parent.LEFT AND parent.RIGHT
		AND node.ID = product.ID_CATALOG
	);

	
------------------
-- Вывести все продукты всех узлов каталога
SELECT
	product.*
FROM
	igi_PRODUCT AS product
WHERE
	product.ID_CATALOG IN (
		-- Выводим каталоги до всех листов
		-- Выводим только те узлы которые активны. Если узел является не активным не выводим его детей
		SELECT
		  	node.ID
		FROM
		  	igi_CATALOG AS node, igi_CATALOG AS parent
		WHERE
		  	node.LEFT BETWEEN parent.LEFT AND parent.RIGHT
		  	AND parent.ID = 1
			-- Надстройка. Выводить только следующий уровень каталога, листья которого выводим
			-- AND (parent.LEVEL + 1) >= node.LEVEL
			-- Надстройка. Не выводить каталог, который 
			-- AND node.ID != parent.ID
		  	AND 1 = (
		  		-- Проверяем узлы если есть в цепочке до корня не активные элементы то не выводим данный узел
		  		-- если 1 то выводим
				SELECT
				  	IF((COUNT(*) - SUM(sub_parent.ACTIVE_FLAG)) = 0, 1, 0) AS IS_CATALOG
				FROM
				  	igi_CATALOG AS sub_node, igi_CATALOG AS sub_parent
				WHERE
				  	sub_node.LEFT BETWEEN sub_parent.LEFT AND sub_parent.RIGHT
				  	AND sub_node.ID = node.ID
			)
		ORDER BY
		  	node.ID
	)
```