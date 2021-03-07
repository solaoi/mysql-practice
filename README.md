# 日本語環境でのMySQLテスト環境

ローカル環境でMySQLとphpMyAdminを起動します。

## 始め方

### Docker Desktopのインストール

https://www.docker.com/get-started

### このリポジトリをclone

```
git clone https://github.com/solaoi/mysql-practice.git
```

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
[root@mysql /]$ mysql -u root -ppassword
```

3. MySQLからログアウト

```
mysql> \q
```

4. MySQLを利用できる環境からログアウト

```
[root@mysql /]$ exit
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

1. sampleデータベースを作成

MySQLにログインして実行します。

```
mysql> CREATE DATABASE sample;
```

2. 使用データベースを選択

```
mysql> use sample;
```

3. usersテーブルを作成

```
mysql> CREATE TABLE users (id int, name varchar(10));
```

4. userを追加

```
mysql> INSERT INTO users VALUES (1, "あお太");
```

5. usersテーブルにuserが追加されたか確認

```
mysql> SELECT * FROM users;
```

6. usersテーブルにcsvファイルからuserを追加  
MySQLからログアウトし、 MySQLを利用できる環境で実行します。   
（/tmpディレクトリに置いたファイルを参照・更新できるようDockerを設定しています。）

```
[root@mysql /]$ mysqlimport -u root -ppassword --local --fields-terminated-by="," --fields-enclosed-by='"' sample /tmp/users.csv
```

7. usersテーブルをバックアップ   

```
[root@mysql /]$ mysqldump -u root -ppassword sample users --master-data --single-transaction > /tmp/users.sql
```

1. テーブルの一覧を確認   

MySQLにログインして実行します。

```
mysql> SHOW TABLES;
```

1.  usersテーブルを削除

```
mysql> DROP TABLE users;
```

10. usersテーブルをバックアップから復元

MySQLからログアウトし、 MySQLを利用できる環境で実行します。

```
[root@mysql /]$ mysql -u root -ppassword sample < /tmp/users.sql
```
