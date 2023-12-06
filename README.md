# bakery-database

SQL files and commands to create a bakery database, tables, insert data and run queries.

## Create the database, tables and insert data

Run the bakery database code sql file.

```
mysql < bakery_database_code.sql
```

## Run queries

```
mysql < logical_queries.sql
```

## MySQL Guidance

Details on how to install mysql and authenticate (if needed).

### Install MySQL

MySQL can be installed via brew

```
brew install mysql
brew services start mysql
```

### Username / Password authentication

If mysql has authenticaton enabled, you can include your password in the command line.

```
mysql -p < bakery_database_code.sql
```
