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

