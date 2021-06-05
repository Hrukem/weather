# Weither

Сайт показывает погоду в г.Электросталь. Можно посмотреть историю погоды или прогноз на 7 дней.
История погоды сохраняется с шагом 3 часа (00:00, 00:03, 00:04, ... , 18:00, 21:00). Время UTC.
Вывод данных ограничен 60 значениями.
Прогноз погоды выводится на один день, отстоящий от текущей даты на указанное количество дней.
Данные можно получать на страницах сайта или отправив запрос через поисковую строку.
Формат запроса истории:
namesite/weather?type=history&num=YYYY-MM-DD_hh:mm:ss,YYYY-MM-DD_hh:mm:ss
Формат запроса прогноза:
namesite/weather?type=forecast&num=n
где namesite - имя сайта (например weather.hrukem.xyz)
YYYY - год, MM - месяц, DD - день недели, hh - часы, mm - минуты. ss - секунды
n - на какой день от сегодняшней даты показывать прогноз
Важно: месяцы, дни, чвсы, минуты, секунды необходимо указывать 2 цифрами. Если второй месяц (февраль)
необходимо вводить 02 и т.д. Также первая дата должна быть раньше второй, иначе запрос не будет принят.

Для запуска сайта на локальном компьютере:
-скопируйте сайт с git репозитория на свой компьютер
-запустите команду mix deps.get
-запустите команду mix ecto.create; mix ecto.migrate
-создайте в корневой папке (там, где расположен файл mix.exs) файл .env
данный файл должен содержать следующие строки:

PORT=xxxx
SECRET_KEY_BASE=yyyy
SECRET_WEATHER_API=zzzz

где хххх - номер порта на котором будет работать приложение
УУУУ - секретный ключ, его лучше сгенерироваь с помощью команды mix gen.secret
zzzz - api-key, полученный при регистрации на сайте www.openweathermap.org
строки вводятся без кавычек 
