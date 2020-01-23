<details>
	<summary>Apache</summary>

1. [Настройка кэширования через файл .htaccess](https://www.netangels.ru/support/hosting-old/htaccess-cache/)
</details>
<details>
	<summary>Axios</summary>

1. [Используем Axios для доступа к API](https://ru.vuejs.org/v2/cookbook/using-axios-to-consume-apis.html)
1. [axios](https://github.com/axios/axios)
</details>
<details>
	<summary>Bash</summary>

1. [Bash-скрипты: начало](https://habr.com/ru/company/ruvds/blog/325522/)
1. [How to Use sed to Find and Replace String in Files](https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/)
1. [Developing in WSL](https://code.visualstudio.com/docs/remote/wsl)
1. [Bash Debug](https://marketplace.visualstudio.com/items?itemName=rogalmic.bash-debug)
1. [Как запустить файл .sh или Shell скрипт в Windows 10](https://itsecforu.ru/2019/07/15/%F0%9F%94%A9-%D0%BA%D0%B0%D0%BA-%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D1%82%D0%B8%D1%82%D1%8C-%D1%84%D0%B0%D0%B9%D0%BB-sh-%D0%B8%D0%BB%D0%B8-shell-%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82-%D0%B2-windows-10/)
1. [Массивы bash](https://habr.com/ru/sandbox/102954/)
1. [Lesson 2. Bash Commands to Manage Directories and Files](https://www.earthdatascience.org/courses/intro-to-earth-data-science/open-reproducible-science/bash/bash-commands-to-manage-directories-files/)
1. [Поиск файлов с помощью find](https://www.opennet.ru/docs/RUS/linux_base/node149.html)
1. [How to Compare Strings in Bash](https://linuxize.com/post/how-to-compare-strings-in-bash/)
1. [Sed - An Introduction and Tutorial by Bruce Barnett](https://www.grymoire.com/Unix/Sed.html#uh-37)
</details>
<details>
	<summary>C#</summary>

1. [Состояние сеанса](https://professorweb.ru/my/ASP_NET/base/level5/5_4.php)
1. [Практическое руководство. Изменение деревьев выражений (C#)](https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/expression-trees/how-to-modify-expression-trees)
1. [Миграции модели данных](https://professorweb.ru/my/entity-framework/6/level2/2_11.php)
1. [Entity Framework rollback and remove bad migration](https://stackoverflow.com/questions/22680446/entity-framework-rollback-and-remove-bad-migration)

# Библиотеки / сайты

> Bogus
1. [Bogus](https://github.com/bchavez/Bogus)
1. [Creating a .NET Core API](https://dev.to/integerman/creating-a-net-core-api-3n6d)
1. [Mocking Data with Bogus](https://dev.to/integerman/mocking-data-with-bogus-25ac)

> Metanit
1. [Введение в C#](https://metanit.com/sharp/tutorial/1.1.php)
1. [Web API 2 в ASP.NET](https://metanit.com/sharp/aspnet_webapi/1.1.php)
1. [Введение в Entity Framework](https://metanit.com/sharp/entityframework/1.1.php)
1. [Работа с классом Task](https://metanit.com/sharp/tutorial/12.2.php)
1. [Aсинхронное программирование](https://metanit.com/sharp/tutorial/13.3.php)
</details>
<details>
	<summary>CSS</summary>

1. [Полное руководство по CSS Grid](https://tuhub.ru/posts/css-grid-complete-guide)
1. [Иконочный шрифт Ionicons](https://ionicons.com/)
1. [Шрифт Даниэль Карлмац](https://www.google.ru/search?q=%D0%94%D0%B0%D0%BD%D0%B8%D1%8D%D0%BB%D1%8C+%D0%9A%D0%B0%D1%80%D0%BB%D0%BC%D0%B0%D1%82%D1%86&newwindow=1&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjWhfv2wPDaAhXhApoKHd_aClYQ_AUICigB&biw=1920&bih=989)
1. [How to Center an Absolutely Positioned Element Using CSS](https://www.sitepoint.com/css-center-position-absolute-div/)
1. [ИЗУЧАЕМ CSS-ПОЗИЦИОНИРОВАНИЕ ЗА 10 ШАГОВ](http://dreamhelg.ru/2011/02/css-position-in-10-steps/)
1. [30 CSS-фреймворков для адаптивного веб-дизайна](https://habr.com/ru/post/156747/)
</details>
<details>
	<summary>По БД</summary>

1. [Как работает реляционная БД](https://habr.com/ru/company/mailru/blog/266811/)
1. [Обзор типов индексов Oracle, MySQL, PostgreSQL, MS SQL](https://habr.com/ru/post/102785/)

<details>
	<summary>Обход дерева в MySQL через пределы</summary>

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
</details>
</details>
<details>
	<summary>English</summary>

1. [Глаголы will и shall в английском языке](https://catchenglish.ru/grammatika/shall-i-will.html)
1. [5 простых правил порядка слов в английском](https://skyeng.ru/articles/5-prostyh-pravil-poryadka-slov-v-anglijskom)
1. [Порядок слов в английском языке: правила построения предложений](https://engblog.ru/construction-of-sentences)
1. [Разница между Past Simple и Past Continuous](https://www.start2study.ru/english-grammar/past-simple-past-continuous/)
1. [Present Simple vs Present Continuous – правила и отличия](https://obrazovaka.ru/english/present-simple-vs-present-continuous-pravila.html)
1. [Все времена глагола в английском языке](https://skyeng.ru/articles/vse-vremena-glagola-v-anglijskom-yazyke)
1. [Модальные глаголы](https://www.native-english.ru/grammar/modal-verbs)
</details>
<details>
	<summary>Git</summary>

1. [Есть ли отличие в командах rm --cached и reset HEAD?](https://toster.ru/q/452518)
2. [Book](https://git-scm.com/book/ru/v2)
3. [Как в Git удалить файлы из индекса, не удаляя их в рабочей директории](https://webhamster.ru/mytetrashare/index/mtb0/1518440234z6ace7z0ae)
</details>
<details>
	<summary>Html</summary>

1. [Особенности загрузки файлов на HTML5](https://habr.com/ru/post/154097/)
1. [FileSystem API&File API: разбираемся и используем](https://habr.com/ru/post/112286/)
1. [HTML-формы. Взгляд бэкенд-разработчика](https://habr.com/ru/post/236837/)
</details>
<details>
	<summary>JavaScript</summary>

1. [Создание и вызов событий](https://developer.mozilla.org/ru/docs/Web/Guide/Events/%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_%D0%B8_%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2_%D1%81%D0%BE%D0%B1%D1%8B%D1%82%D0%B8%D0%B9)
1. [Всплытие и перехват](https://learn.javascript.ru/event-bubbling)
1. [Event.preventDefault()](https://developer.mozilla.org/ru/docs/Web/API/Event/preventDefault)
1. [Event.stopPropagation()](https://developer.mozilla.org/ru/docs/Web/API/Event/stopPropagation)
1. [Метод EventTarget.addEventListener()](https://developer.mozilla.org/ru/docs/Web/API/EventTarget/addEventListener)
1. [WebSocket](https://learn.javascript.ru/websockets)
1. [Пара двойников](http://jsraccoon.ru/exercise-double)
1. [3 Ways to clone objects in JavaScript](https://medium.com/better-programming/3-ways-to-clone-objects-in-javascript-f752d148054d)
1. [Дескрипторы, геттеры и сеттеры свойств](https://learn.javascript.ru/descriptors-getters-setters)
1. [Революция дата-байндинга с Object.Observe()](https://habr.com/ru/post/225065/)
1. [Object.prototype.watch()](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/Object/watch)
1. [Object.observe()](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/Object/observe)
1. [MutationObserver](https://developer.mozilla.org/ru/docs/Web/API/MutationObserver)

# Статьи

1. [Вы не знаете JS (серия книг)](https://github.com/azat-io/you-dont-know-js-ru)
1. [Джедайские приемы на JavaScript: магические свойства транслятора событий](https://tproger.ru/translations/event-emitter-javascript/)
1. [Как работает JS: WebSocket и HTTP/2+SSE. Что выбрать?](https://habr.com/ru/company/ruvds/blog/342346/)
1. [Подборка из 15 лучших JavaScript-фреймворков для фронтенд-разработки](https://tproger.ru/digest/top-javascript-frontend-frameworks/)
1. [ES6: Интерполяция](http://jsraccoon.ru/es6-interpolation)
1. [Работа с файлами в JavaScript, Часть 2: FileReader](https://xdan.ru/working-with-files-in-javascript-part-2-filereader.html)
1. [15 советов по написанию самодокументируемого кода (на примере JavaScript)](https://tproger.ru/articles/15-tips-selfdoc-js/)
1. [Выразительный JavaScript: Модули](https://habr.com/ru/post/243273/)
1. [jStorage: замена стандартным cookies или как еще хранить данные на стороне клиента](http://csslike.me/jstorage-zamena-standartny-m-cookies-ili-kak-eshhe-hranit-danny-e-na-storone-klienta/)
1. [Долой callback hell или как работают promises?](https://zserge.wordpress.com/2013/10/17/%D0%B4%D0%BE%D0%BB%D0%BE%D0%B9-callback-hell-%D0%B8%D0%BB%D0%B8-%D0%BA%D0%B0%D0%BA-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%8E%D1%82-promises/)
1. [Разбираем WTF задачки в JavaScript](https://habr.com/ru/post/479496/)

# Библиотеки

> Gulp

1. [Основы использования Gulp для сборки JavaScript-приложений](https://getinstance.info/articles/tools/introduction-to-gulp/)
1. [GulpJS — фантастически быстрый сборщик проектов](https://habr.com/ru/post/208890/)
1. [Gulp-imagemin - оптимизация изображений в Gulp](http://gearmobile.github.io/gulp/gulp-imagemin/)

> lodash

1. [Lodash](https://lodash.com/)

> Node
1. [Скринкаст по Node.js](https://learn.javascript.ru/screencast/nodejs)

<details>
	<summary>Качаем изображения JavaScript</summary>

```javascript
$.get('/', function (data) {
  var t = data.match(/(images\/portfolio).*?.jpg/gi);
  var a = [];
  t.forEach(function (item, i, t) {
    a.push('http://repnitskaya.ru/' + item);
  });
  a.forEach(function (item, i, a) {
     var aTag = document.createElement("a");
      aTag.download = item;
      aTag.target = '_blank';
      aTag.href = item;
      aTag.click();
  });
});
	
(function(){
	var block = document.getElementById('allsizes-photo'),
		img = block.getElementsByTagName('img')[0],
		src = img.getAttribute('src');
		
	var aTag = document.createElement('a');
      aTag.download = src;
      //aTag.target = '_blank';
      aTag.href = src;
	  document.body.appendChild(aTag);
      aTag.click();
})()

(function(){
	var img = document.getElementsByClassName('zoom-large')[0],
		src = img.getAttribute('src');
		
	var aTag = document.createElement('a');
      aTag.download = src;
      //aTag.target = '_blank';
      aTag.href = src;
	  document.body.appendChild(aTag);
      aTag.click();
})()
```
</details>
</details>
<details>
	<summary>Less</summary>

1. [Путеводитель для новичков по CSS-препроцессору Less!](https://mrmlnc.gitbooks.io/less-guidebook-for-beginners/content/chapter_3/variable-interpolation.html)
</details>
<details>
	<summary>NPM</summary>

1. [Шпаргалка по пакетному менеджеру NPM](https://habr.com/ru/post/133363/)
1. [Почему npm-скрипты?](http://prgssr.ru/development/pochemu-npm-skripty.html)
</details>
<details>
	<summary>NVM</summary>

1. [Туториал по Node Version Manager (NVM)](https://ua-blog.com/%D1%82%D1%83%D1%82%D0%BE%D1%80%D0%B8%D0%B0%D0%BB-%D0%BF%D0%BE-node-version-manager-nvm/)
1. [Node Version Manager](https://github.com/nvm-sh/nvm)
1. [nvm-windows](https://github.com/coreybutler/nvm-windows/releases)
</details>
<details>
	<summary>Oracle</summary>

1. [Оптимизация обработки запросов в Oracle](https://oracle-patches.com/oracle/tuning/3106-%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F-%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B8-%D0%B7%D0%B0%D0%BF%D1%80%D0%BE%D1%81%D0%BE%D0%B2-%D0%B2-oracle)
1. [Опыт и рекомендации по оптимизации SQL-запросов](http://www.fors.ru/upload/magazine/07/http_text/russia_mihjeichev_plan_recomendations.html)
1. [Двадцать пять заповедей SQL](http://www.nsc.ru/win/docs/db/sql/sql25.htm)
1. [Индексы Oracle](https://oracle-dba.ru/docs/architecture/indexes/)
1. [Индексы](http://oracledb.ru/sql/ddl-i-obekty-sxemy/indeksy.html)
1. [Список наиболее часто используемых системных таблиц Oracle](http://j2w.blogspot.com/2008/11/oracle.html)
1. [Разбираем XML средствами Oracle database](https://habr.com/ru/post/129018/)
1. [Аналитические функции Oracle PL/SQL](https://oracleplsql.ru/analytic.html)
</details>
<details>
	<summary>Фотография</summary>

1. [ELENA SHUMILOVA](https://elenashumilova.smugmug.com/)
</details>
<details>
	<summary>TypeScript</summary>

1. [Compiler Options](https://www.typescriptlang.org/docs/handbook/compiler-options.html)
1. [Руководство Typescript](http://typescript-lang.ru/docs/)
1. [Введение в TypeScript](https://metanit.com/web/typescript/1.1.php)
1. [How to think and type in TypeScript](https://areknawo.com/how-to-think-and-type-in-typescript/)

# tsconfig.json

```javascript
{
	// "compileOnSave": true,
	"compilerOptions": {
		"watch": true,
		/* Basic Options */
		// "incremental": true,                   /* Enable incremental compilation */
		"target": "ES5",                          /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019' or 'ESNEXT'. */
		"module": "es2015",                     /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', or 'ESNext'. */
		// "lib": [],                             /* Specify library files to be included in the compilation. */
		// "allowJs": true,                       /* Allow javascript files to be compiled. */
		// "checkJs": true,                       /* Report errors in .js files. */
		// "jsx": "preserve",                     /* Specify JSX code generation: 'preserve', 'react-native', or 'react'. */
		// "declaration": true,                   /* `Generates corresponding '.d.ts' file.` */
		// "declarationMap": true,                /* Generates a sourcemap for each corresponding '.d.ts' file. */
		// "sourceMap": true,                     /* Generates corresponding '.map' file. */
		// "outFile": "./",                       /* Concatenate and emit output to single file. */
		"outDir": "./dist/",                        /* Redirect output structure to the directory. */
		"rootDir": "./src/",                       /* Specify the root directory of input files. Use to control the output directory structure with --outDir. */
		// "composite": true,                     /* Enable project compilation */
		// "tsBuildInfoFile": "./",               /* Specify file to store incremental compilation information */
		"removeComments": true,                /* Do not emit comments to output. */
		// "noEmit": true,                        /* Do not emit outputs. */
		// "importHelpers": true,                 /* Import emit helpers from 'tslib'. */
		// "downlevelIteration": true,            /* Provide full support for iterables in 'for-of', spread, and destructuring when targeting 'ES5' or 'ES3'. */
		// "isolatedModules": true,               /* Transpile each file as a separate module (similar to 'ts.transpileModule'). */

		/* Strict Type-Checking Options */
		"strict": true,                           /* Enable all strict type-checking options. */
		// "noImplicitAny": true,                 /* Raise error on expressions and declarations with an implied 'any' type. */
		// "strictNullChecks": true,              /* Enable strict null checks. */
		// "strictFunctionTypes": true,           /* Enable strict checking of function types. */
		// "strictBindCallApply": true,           /* Enable strict 'bind', 'call', and 'apply' methods on functions. */
		// "strictPropertyInitialization": true,  /* Enable strict checking of property initialization in classes. */
		// "noImplicitThis": true,                /* Raise error on 'this' expressions with an implied 'any' type. */
		"alwaysStrict": true,                  /* Parse in strict mode and emit "use strict" for each source file. */

		/* Additional Checks */
		"noUnusedLocals": true,                /* Report errors on unused locals. */
		"noUnusedParameters": true,            /* Report errors on unused parameters. */
		"noImplicitReturns": true,             /* Report error when not all code paths in function return a value. */
		"noFallthroughCasesInSwitch": true,    /* Report errors for fallthrough cases in switch statement. */

		/* Module Resolution Options */
		// "moduleResolution": "node",            /* Specify module resolution strategy: 'node' (Node.js) or 'classic' (TypeScript pre-1.6). */
		// "baseUrl": "./",                       /* Base directory to resolve non-absolute module names. */
		// "paths": {},                           /* A series of entries which re-map imports to lookup locations relative to the 'baseUrl'. */
		// "rootDirs": [],                        /* List of root folders whose combined content represents the structure of the project at runtime. */
		// "typeRoots": [],                       /* List of folders to include type definitions from. */
		// "types": [],                           /* Type declaration files to be included in compilation. */
		// "allowSyntheticDefaultImports": true,  /* Allow default imports from modules with no default export. This does not affect code emit, just typechecking. */
		"esModuleInterop": true,                  /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
		// "preserveSymlinks": true,              /* Do not resolve the real path of symlinks. */
		// "allowUmdGlobalAccess": true,          /* Allow accessing UMD globals from modules. */

		/* Source Map Options */
		// "sourceRoot": "",                      /* Specify the location where debugger should locate TypeScript files instead of source locations. */
		// "mapRoot": "",                         /* Specify the location where debugger should locate map files instead of generated locations. */
		// "inlineSourceMap": true,               /* Emit a single file with source maps instead of having a separate file. */
		// "inlineSources": true,                 /* Emit the source alongside the sourcemaps within a single file; requires '--inlineSourceMap' or '--sourceMap' to be set. */

		/* Experimental Options */
		// "experimentalDecorators": true,        /* Enables experimental support for ES7 decorators. */
		// "emitDecoratorMetadata": true,         /* Enables experimental support for emitting type metadata for decorators. */

		/* Advanced Options */
		"forceConsistentCasingInFileNames": true  /* Disallow inconsistently-cased references to the same file. */
	}
}
```
</details>
<details>
	<summary>Visual Studio</summary>

## Работа с MySQL в Visual Studio.
## Visual Studio 2013 Ultimate Update 5

1. Ставим mysql-installer-community на тот момент версия 5.7.12.0
	``dev.mysql.com/downloads/installer/``
  
2. Проверяем в VS подключение. DataSourse -> MySQL database
  
3. Если нет. То в установленной панели mysql-installer-community удаляем MySQL for VS и устанавливаем заново в этой же панели. После этого должно появиться.
  
4. Для того что бы работать с EF6 добавляем через NuGet EF6 и потом ручками добавдяем References

	```
	MySQL.Date
	MySQL.Date.Entity.EF6
	MySQL.Web
	```
	Наведя на них смотрим что бы версия пакетом совпадала Assemblies\v4.5.
	На тот момен версии были у всех 4.5
  
5. Дале смотри в Config И проверяем блок EntityFramework
	Он должен быть таким:
	
  ```C#
  	<entityFramework>
		<defaultConnectionFactory type="MySql.Data.Entity.MySqlConnectionFactory, MySql.Data.Entity.EF6">
			<parameters>
				<parameter value="mssqllocaldb" />
			</parameters>
		</defaultConnectionFactory>
		<providers>
			<provider invariantName="MySql.Data.MySqlClient" type="MySql.Data.MySqlClient.MySqlProviderServices, 
				MySql.Data.Entity.EF6" />
		</providers>
	</entityFramework>
  ```


6. После этого добавляем "New Item" ADO Entity в проект и создаем модель по уже заготовленной БД.
	Елси вылетает ошибка 
	
  ``
  'System.Data.StrongTypingException: El valor de la columna 'IsPrimaryKey' de la tabla 'TableDetails' es DBNull.
  ``
	
То открываем 
```
Open Services (services.msc) 
cmd -> services.msc
```
Перезапускаем
```
restart MySQL57 service.
```
Открываем командную строку MySQL и ввидим команды use "db name"; - без кавычек
```
SET optimizer_switch='derived_merge=off';
SET GLOBAL optimizer_switch='derived_merge=off';
```	
Можно проверить применился влаг или нет командой:
	
```
SELECT @@optimizer_switch\G
		
stackoverflow.com/questions/31961646/ef6-mysql-strongtypingexception-when-column-is-not-pk	
dev.mysql.com/doc/refman/5.6/en/switchable-optimizations.html
docs.oracle.com/cd/E17952_01/refman-5.5-en/switchable-optimizations.html
```
	
7. После этого должно всё заработать. Если нет то гуглим ответ всё равно есть.
	некоторые предлагают установить компонент версией ниже.
</details>
<details>
	<summary>VSCode</summary>

1. [Visual Studio Code. Настройка и применение. Часть 1](https://medium.com/@p1t1ch/visual-studio-code-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D0%B8-%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-7f1a26806522)
1. [Горячие клавиши Visual Studio Code](https://nikomedvedev.ru/other/vscodeshortcuts/hotkeys.html)
1. [Как настроить расширение Debugger for Chrome для Visual Studio Code](https://techrocks.ru/2019/05/14/debugger-for-chrome-in-vs-code/)
</details>
<details>
	<summary>Vue</summary>

1. [Официальное руководство](https://ru.vuejs.org/index.html)
1. [Форум по Vue](https://forum.vuejs.org/)
	* [Чат с помощью](https://gitter.im/vuejs/vue)
1. [Канал Эрика на Youtube](https://www.youtube.com/channel/UCshZ3rdoCLjDYuTR_RBubzw)
	* [Исходный код примеров для книги Эрика](https://www.manning.com/books/vue-js-in-action)
	* [Код отдельных глав на Git'e Эрика](https://github.com/ErikCH/VuejsInActionCode)
1. [Основы Vue.js](https://metanit.com/web/vuejs/1.1.php)
1. [TableComponent.vue](https://github.com/spatie/vue-table-component/blob/master/src/components/TableComponent.vue)
1. [Список псевдонимов клавиш в Vue](https://vuejs.org/v2/guide/events.html#Key-Modifiers)
1. [Таблица с кодами клавшим](https://css-tricks.com/snippets/javascript/javascript-keycodes/#article-header-id-1)
1. [Фильтры](https://vuejs.org/v2/api/#filters)
	* [Filters](https://vuejs.org/v2/guide/filters.html)
</details>
<details>
	<summary>Yii2</summary>

1. [Ресурсы](https://github.com/yiisoft/yii2/blob/master/docs/guide-ru/structure-assets.md#%D0%A0%D0%B5%D1%81%D1%83%D1%80%D1%81%D1%8B)
1. [Правила валидации форм в Yii 2.x](http://www.webapplex.ru/pravila-validaczii-form-v-yii-2.x)
1. [Yii 2.0.11](https://habr.com/ru/post/320906/)
1. [Что такое Yii?](http://stuff.cebe.cc/yii2docs-ru/guide-intro-yii.html)
1. [Русскоязычное сообщество Yii](https://yiiframework.ru/)
1. [Логирование](http://stuff.cebe.cc/yii2docs-ru/guide-runtime-logging.html)
1. [Виджет Breadcrumbs (хлебные крошки) на Yii 2.x](http://www.webapplex.ru/vizdzhet-breadcrumbs-(xlebnyie-kroshki)-na-yii-2.x)
1. [Карта сайта Yii2 для поисковых систем.](https://klisl.com/sitemap_yii2.html)
1. [Урок 8: Кэширование в Yii2](https://deone.ru/211/)

# Библиотеки

> owl.carousel

1. [owl.carousel.js](https://owlcarousel2.github.io/OwlCarousel2/docs/api-options.html)
</details>
 
# Статьи

1. [Алгоритм генерации QR-кода](https://habr.com/ru/post/172525/)
1. [Библиотека marked](https://github.com/markedjs/marked)
1. [Шпаргалка по SOLID-принципам с примерами на PHP](https://habr.com/ru/post/208442/)
1. [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
1. [Базовый синтаксис плагина EMMET](https://dwstroy.ru/stail/plaginy-rasshireniya/emmet-shpargalka/)
1. [Basic writing and formatting syntax](https://help.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax#quoting-text)
1. [FastReport.Net Руководство пользователя](https://www.fastreport.ru/public_download/FRNetUserManual-ru.pdf)
1. [«Хочу как Дуров»: пишем простой мессенджер](https://tproger.ru/translations/building-messenger/?utm_source=grf-eng&utm_medium=partner&utm_campaign=giraff.io)
1. [Используем кеш браузера для Google PageSpeed](http://vasilenko.info/pagespeed-cache/)
1. [Удивительный Angular](https://habr.com/ru/post/348818/)
1. [Бинарный поиск](https://prog-cpp.ru/search-binary/)
1. [hello-brand.ru - лендинг страницы](https://hello-brand.ru/)
1. [Free vectors](https://all-free-download.com/)
1. [15 правил написания качественного кода](https://tproger.ru/translations/15-rules-for-writing-quality-code/)
1. [PhpStorm — повышаем производительность (клавиатурные сокращения). Часть 1](https://habr.com/ru/post/212077/)
1. [Архив категории "Учебник"](https://softwaremaniacs.org/blog/category/primer/)
1. [Рисуем простую иконку Mac в Adobe Illustrator](http://www.interface.ru/home.asp?artId=36070)
1. [Исчерпывающее руководство по составлению почтовых рассылок](https://habr.com/ru/post/227229/)
1. [АРХИВ РАБОТ 2019](https://sawtech.ru/work/)
1. [Базовые фишки phpStorm, которыми я пользуюсь каждый день](http://zhurov.me/blog/phpstorm-base-features.html)
1. [What is EJS](https://ejs.co/#install)
1. [Handlebars](https://handlebarsjs.com/)

<details>
	<summary>Настройка окружения (PHPStorm, Git, OSPanel)</summary>

1. PHPStorm

2. Git
	- логин

		``git config --global user.name "username"``

	- email	
		
        ``git config --global user.email useremail@mail.com``

	- проверка

		``git config --list``

	- клонируем репозиторий
		
        ``git clone``

3. Open Server
	- обновляем composer
		
        ``composer self-update``

	- устанавливаем плагины через композер (находясь в корне проекта)
		
        ``composer instal``

4. HeidiSQL
	- раскатываем дамп БД

		``Файл -> Выполнить SQL-файл``

5. PHPStorm
	- Настраиваем XDebug (https://habrahabr.ru/post/250323/)
		в php.ini прописываем следующие строчки
        ```ini
        zend_extension="%sprogdir%/modules/php/%phpdriver%/ext/php_xdebug.dll"
        ;эта опция как раз и отвечает за автостарт
        xdebug.remote_autostart = 1
        xdebug.remote_enable = 1
        xdebug.remote_handler = "dbgp"
        xdebug.remote_host = "localhost"
        xdebug.remote_mode = "req"
        ;порт может быть и 9000, но у openserver он зарезервирован под php
        xdebug.remote_port = 9001
        ;ключ IDE (может быть любым) понадобится позже
        xdebug.idekey = "PHPSTORM"
        ```
	- Создаём сервер

	- Настройка внешнего вида idea

		```
        темы : http://www.phpstorm-themes.com/
		zeus, visual studio
		в папке config создаём папку colors и переносим туда файлы с темой
        ```
		
6. Node.js

	https://www.youtube.com/watch?v=EtbZQ6qWuJ4
	- nvm-setup.exe ``https://github.com/coreybutler/nvm-windows``
	- nvm install [version] [arch]
	- nvm use [version] [arch]
	
    Устанавливаем модули.
	
    - npm install gulp-cli -g
		установка gulp глобально
	
    Если проект скачен с репозитория и там есть файл package.json, то необходимо просто выполнить команду npm install.
	
    - npm i gulp gulp-concat-css gulp-clean-css gulp-rename gulp-autoprefixer gulp-uglify gulp-concat gulp-imagemin --save-dev
		
        установка необходимых пакетов в проект

	- nmp init
		создаст файл package.json
	Настраиваем gulp правила 

УСТАНОВКА НОВОГО ПРОЕКТА

1. 
```
composer global require "fxp/composer-asset-plugin:~1.0.3"
php composer.phar global update fxp/composer-asset-plugin --no-plugins
composer global update fxp/composer-asset-plugin --no-plugins
composer global require fxp/composer-asset-plugin --no-plugins
```

2. 
```
composer create-project --prefer-dist yiisoft/yii2-app-advanced                 my-project-name.local
my-project-name.local имя папки с проектом
```

3. php init

``http://www.elisdn.ru/blog/50/console-commands-in-yii``

Поведения 
	
``https://www.youtube.com/watch?v=JTV8Z4L3_O0``

Загрузка фото 

``https://www.youtube.com/watch?v=_vIWEpkK4VE``
	
``https://bootstrapstudio.io/``

``http://bootstraptour.com/``
	
	
bootstrap modal

```
http://jschr.github.io/bootstrap-modal/
https://codepen.io/maouida/pen/NPGaaN
```
	
Ajax валидация
```
https://ru.stackoverflow.com/questions/536701/yii2-ajax-%D0%B2%D0%B0%D0%BB%D0%B8%D0%B4%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8-%D1%81%D1%86%D0%B5%D0%BD%D0%B0%D1%80%D0%B8%D0%B8
```
	
ActiveForm (Bootstrap CSS)

``http://codemix.github.io/yii2-bs3activeform/horizontal.html``
	
	
	
```js	
npm i gulp gulp-concat-css gulp-clean-css gulp-rename gulp-autoprefixer --save-dev

npm init -y

npm i babel-cli babel-core babel-preset-es2015 --save-dev

"scripts": {
    "w": "babel src -d dist -s --presets es2015 -w"
}


--presets es2015 $FileDir$/test.js --out-file $FileParentDir$/out/test.js

--source-maps --out-file $FileNameWithoutExtension$.js $FilePath$ --presets es2015


$FileParentDir$/src/ --out-file $FileParentDir$/dist/$FileNameWithoutExtension$.js --presets es2015
```
</details>
