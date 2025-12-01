# StrukturData
mysql installation in local(use linux ubuntudistro environment): 
- sudo apt install mysql-server -y
- sudo systemctl start mysql
- sudo mysql
- mysql -u root -p
- CREATE USER 'namauser'@'localhost' IDENTIFIED BY 'passwordku';
- GRANT ALL PRIVILEGES ON *.* TO 'namauser'@'localhost' WITH GRANT OPTION;
- FLUSH PRIVILEGES;
- do run the migration.sql and backup.sql
- do run the transaction.sql

## Screenshot
### Commit
![Screenshot](Evidence/Commit.png)
![Screenshot](Evidence/Commit-evidence.png)

### Rollback
![Screenshot](Evidence/Rollback.png)
![Screenshot](Evidence/Rollback-evidence.png)

### Savepoint
![Screenshot](Evidence/Savepoint.png)
![Screenshot](Evidence/Savepoint-evidence.png)

### Trigger
![Screenshot](Evidence/Trigger-create-new-table.png)
![Screenshot](Evidence/Create-trigger.png)
![Screenshot](Evidence/Trigger.png)
![Screenshot](Evidence/Trigger-evidence.png)
