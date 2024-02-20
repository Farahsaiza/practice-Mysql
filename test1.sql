Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 15
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centreformation    |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.46 sec)

mysql> create database test3;
Query OK, 1 row affected (0.49 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centreformation    |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test3              |
| world              |
+--------------------+
9 rows in set (0.00 sec)

mysql> use test3;
Database changed
mysql> create table stagiaire(
    -> code_stg int primary key,
    -> nom_stg varchar(20) not null);
Query OK, 0 rows affected (1.50 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
+-----------------+
1 row in set (0.16 sec)

mysql> desc stagaire;
ERROR 1146 (42S02): Table 'test3.stagaire' doesn't exist
mysql> desc stagiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.19 sec)

mysql> select * from stagiaire;
Empty set (0.11 sec)

mysql> insert into stagiaire values
    -> (1,farah);
ERROR 1054 (42S22): Unknown column 'farah' in 'field list'
mysql> insert into stagiaire values
    -> (1,"farah"),
    -> (2,"qdoura");
Query OK, 2 rows affected (0.25 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stagiaire;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
|        2 | qdoura  |
+----------+---------+
2 rows in set (0.00 sec)

mysql> insert into stagiaire values
    -> (1,"hassna");
ERROR 1062 (23000): Duplicate entry '1' for key 'stagiaire.PRIMARY'
mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
+-----------------+
1 row in set (0.01 sec)

mysql> create table stg_copy like stagiaire;
Query OK, 0 rows affected (0.76 sec)

mysql> desc stg_copy;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.08 sec)

mysql> select * from stg_copy;
Empty set (0.06 sec)

mysql> insert into stg_copy select * from stagiaire;
Query OK, 2 rows affected (0.16 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stg_copy;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
|        2 | qdoura  |
+----------+---------+
2 rows in set (0.00 sec)

mysql> select * from stagiaire;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
|        2 | qdoura  |
+----------+---------+
2 rows in set (0.00 sec)

mysql> delete from stagiaire;
Query OK, 2 rows affected (0.16 sec)

mysql> select * from stagiaire;
Empty set (0.00 sec)

mysql> select * from stg_copy;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
|        2 | qdoura  |
+----------+---------+
2 rows in set (0.00 sec)

mysql> insert into stagiaire select * from stg_copy;
Query OK, 2 rows affected (0.11 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stagiaire;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
|        2 | qdoura  |
+----------+---------+
2 rows in set (0.00 sec)

mysql> delete from stg_copy where code_stg=2;
Query OK, 1 row affected (0.16 sec)

mysql> select * from stg_copy ;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
+----------+---------+
1 row in set (0.01 sec)

mysql> select * from stagiaire;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | farah   |
|        2 | qdoura  |
+----------+---------+
2 rows in set (0.00 sec)

mysql> drop table stg_copy;
Query OK, 0 rows affected (0.69 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stagiaire       |
+-----------------+
1 row in set (0.01 sec)

mysql> alter table stagiaire
    -> drop primary key;
Query OK, 2 rows affected (2.10 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> desc stagiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   |     | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.03 sec)

mysql> alter table stagiaire
    -> add primary  key(code_stg);
Query OK, 0 rows affected (2.37 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stagiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.03 sec)

mysql> create table groupe(
    -> code_gr int primary key,
    -> nom_gr varchar(10) not null unique,
    -> filliere_gr varchar(10) not null);
Query OK, 0 rows affected (0.45 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| groupe          |
| stagiaire       |
+-----------------+
2 rows in set (0.03 sec)

mysql> desc groupe;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| code_gr     | int         | NO   | PRI | NULL    |       |
| nom_gr      | varchar(10) | NO   | UNI | NULL    |       |
| filliere_gr | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> select * fromgroupe;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fromgroupe' at line 1
mysql> select * from groupe;
Empty set (0.04 sec)

mysql> insert into groupe values
    -> (1, "dev104","info"),
    -> (2,"gest104","gestion"),
    -> (3,"dev103","info");
Query OK, 3 rows affected (0.13 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from groupe;
+---------+---------+-------------+
| code_gr | nom_gr  | filliere_gr |
+---------+---------+-------------+
|       1 | dev104  | info        |
|       2 | gest104 | gestion     |
|       3 | dev103  | info        |
+---------+---------+-------------+
3 rows in set (0.00 sec)

mysql> alter table stagiaire
    -> add code_gr int;
Query OK, 0 rows affected (0.36 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stagiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
| code_gr  | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select* from stagiaire;
+----------+---------+---------+
| code_stg | nom_stg | code_gr |
+----------+---------+---------+
|        1 | farah   |    NULL |
|        2 | qdoura  |    NULL |
+----------+---------+---------+
2 rows in set (0.00 sec)

mysql> alter table stagiaire
    -> add foreign  key (code_gr) reference groupe (code_gr);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'reference groupe (code_gr)' at line 2
mysql> alter table stagiaire
    -> add foreign key (code_gr) references groupe(code_gr);
Query OK, 2 rows affected (1.59 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> desc stagiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
| code_gr  | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> update stagiaire
    -> set code_gr=3 where code_stg=1;
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update stagiaire
    -> set code_gr=2 where code_stg=2;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from stagiaire;
+----------+---------+---------+
| code_stg | nom_stg | code_gr |
+----------+---------+---------+
|        1 | farah   |       3 |
|        2 | qdoura  |       2 |
+----------+---------+---------+
2 rows in set (0.00 sec)

mysql> delete from groupe where code_gr=1;
Query OK, 1 row affected (0.07 sec)

mysql> select * from groupe;
+---------+---------+-------------+
| code_gr | nom_gr  | filliere_gr |
+---------+---------+-------------+
|       2 | gest104 | gestion     |
|       3 | dev103  | info        |
+---------+---------+-------------+
2 rows in set (0.00 sec)

mysql> select * from stagiaire join groupe where stagiaire.code_gr = groupe.code_gr;
+----------+---------+---------+---------+---------+-------------+
| code_stg | nom_stg | code_gr | code_gr | nom_gr  | filliere_gr |
+----------+---------+---------+---------+---------+-------------+
|        2 | qdoura  |       2 |       2 | gest104 | gestion     |
|        1 | farah   |       3 |       3 | dev103  | info        |
+----------+---------+---------+---------+---------+-------------+
2 rows in set (0.03 sec)

mysql> select *from stagiaire join groupe;
+----------+---------+---------+---------+---------+-------------+
| code_stg | nom_stg | code_gr | code_gr | nom_gr  | filliere_gr |
+----------+---------+---------+---------+---------+-------------+
|        2 | qdoura  |       2 |       2 | gest104 | gestion     |
|        1 | farah   |       3 |       2 | gest104 | gestion     |
|        2 | qdoura  |       2 |       3 | dev103  | info        |
|        1 | farah   |       3 |       3 | dev103  | info        |
+----------+---------+---------+---------+---------+-------------+
4 rows in set (0.00 sec)

mysql> select code_stg , nom_stg , filliere_gr from stagiaire joingroupe where stagiaire.code_gr = groupe.code_gr;
ERROR 1054 (42S22): Unknown column 'filliere_gr' in 'field list'
mysql> select code_stg , nom_stg , filliere_gr from stagiaire join groupe where stagiaire.code_gr= groupe.code_gr;
+----------+---------+-------------+
| code_stg | nom_stg | filliere_gr |
+----------+---------+-------------+
|        2 | qdoura  | gestion     |
|        1 | farah   | info        |
+----------+---------+-------------+
2 rows in set (0.00 sec)

mysql> select code_stg , nom_stg ,  nom_gr, filliere_gr from stagiaire join groupe where stagiaire.code_gr= groupe.code_gr;
+----------+---------+---------+-------------+
| code_stg | nom_stg | nom_gr  | filliere_gr |
+----------+---------+---------+-------------+
|        2 | qdoura  | gest104 | gestion     |
|        1 | farah   | dev103  | info        |
+----------+---------+---------+-------------+
2 rows in set (0.05 sec)

mysql> desc groupe;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| code_gr     | int         | NO   | PRI | NULL    |       |
| nom_gr      | varchar(10) | NO   | UNI | NULL    |       |
| filliere_gr | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql>


