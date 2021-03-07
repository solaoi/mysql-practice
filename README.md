# 日本語環境でのMySQLテスト環境

ローカル環境でMySQLとphpMyAdminを起動します。

## 始め方

### Docker Desktopのインストール

https://www.docker.com/get-started

### MySQLおよびphpMyAdminを起動

```
cd [このファイルがあるディレクトリ] && docker-compose up -d
```

### phpMyAdminの利用

http://localhost:8080/

### MySQLの利用

1. MySQLを利用できる環境にログイン

```
docker exec -it mysql-practice_mysql /bin/bash
```

2. MySQLにログイン

```
mysql -u root -ppassword
```

3. MySQLからログアウト

```
\q
```

4. MySQLを利用できる環境からログアウト

```
exit
```

### MySQLおよびphpMyAdminが実行中か確認

```
docker ps -f "name=mysql-practice_mysql" -f "name=mysql-practice_phpmyadmin"
```

### MySQLおよびphpMyAdminを終了

```
cd [このファイルがあるディレクトリ] && docker-compose down
```

### 作成したDBの削除と、MySQLおよびphpMyAdminを終了

```
cd [このファイルがあるディレクトリ] && docker-compose down -v
```

## 練習

実際に上記手順で作成したMySQL上でデータを作成してみます。

以下、MySQLにログインした状態で行ってください。

1. sampleデータベースを作成

```
CREATE DATABASE sample;
```

2. 使用データベースを選択

```
use sample;
```

3. usersテーブルを作成

```
CREATE TABLE users (id int, name varchar(10));
```

4. userを追加

```
INSERT INTO users VALUES (1, "あお太");
```

5. usersテーブルにuserが追加されたか確認

```
SELECT * FROM users;
```
