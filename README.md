## Работа с MySQL в Visual Studio.
## Visual Studio 2013 Ultimate Update 5

1. Ставим mysql-installer-community
	на тот момент версия 5.7.12.0
	dev.mysql.com/downloads/installer/
  
2. Проверяем в VS подключение.
	DataSourse -> MySQL database
  
3. Если нет. То в установленной панели mysql-installer-community удаляем 
	MySQL for VS и устанавливаем заново в этой же панели. После этого должно появиться.
  
4. Для того что бы работать с EF6 добавляем через NuGet EF6 и потом ручками добавдяем References
	MySQL.Date
	MySQL.Date.Entity.EF6
	MySQL.Web
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
		Open Services (services.msc) 
		cmd -> services.msc
	Перезапускаем
		restart MySQL57 service.
	Открываем командную строку MySQL и ввидим команды
		use "db name"; - без кавычек
		
		SET optimizer_switch='derived_merge=off';
		SET GLOBAL optimizer_switch='derived_merge=off';
		
		Можно проверить применился влаг или нет командой:
		
		SELECT @@optimizer_switch\G
		
	stackoverflow.com/questions/31961646/ef6-mysql-strongtypingexception-when-column-is-not-pk	
	dev.mysql.com/doc/refman/5.6/en/switchable-optimizations.html
	docs.oracle.com/cd/E17952_01/refman-5.5-en/switchable-optimizations.html
	
7. После этого должно всё заработать. Если нет то гуглим ответ всё равно есть.
	некоторые предлагают установить компонент версией ниже.
