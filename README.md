# Open-Data-API

1. config 속성 파일 추가
src/main/resources/config/properties 폴더에 아래 내용을 가진 config.properties 파일 추가

login.ignorePatternUrl=/\,/login\,/userInfoList

2. db 속성 파일 추가
src/main/resource/config/properties 폴더에 아래 내용을 가진 db.properties 파일 추가

jdbc.driverClassName=org.mariadb.jdbc.Driver
jdbc.url=DB서버 URL
jdbc.port=3306
jdbc.username=사용자명
jdbc.password=비밀번호
sqlMapper=classpath:sql/query/**/*.xml
sqlMapConfig=classpath:sql/mybatis-config.xml
jdbc.initialSize=10
jdbc.maxActive=10
jdbc.maxIdle=5
jdbc.maxWait=1000000
