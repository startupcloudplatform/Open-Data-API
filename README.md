# Open-Data-API

<b>1. config 속성 파일 추가</b><br>
src/main/resources/config/properties 폴더에 아래 내용을 가진 config.properties 파일 추가

login.ignorePatternUrl=/\,/login\,/userInfoList

<b>2. db 속성 파일 추가</b><br>
src/main/resource/config/properties 폴더에 아래 내용을 가진 db.properties 파일 추가

jdbc.driverClassName=org.mariadb.jdbc.Driver<br>
jdbc.url=DB서버 URL<br>
jdbc.port=3306<br>
jdbc.username=사용자명<br>
jdbc.password=비밀번호<br>
sqlMapper=classpath:sql/query/**/*.xml<br>
sqlMapConfig=classpath:sql/mybatis-config.xml<br>
jdbc.initialSize=10<br>
jdbc.maxActive=10<br>
jdbc.maxIdle=5<br>
jdbc.maxWait=1000000<br>
