# Backing up Mysql data

Now that we learnt to create a backup and perform recovery using a plugin, we will explore ways to backup mysql data without using plugins. mysql data in this case also includes wordpress data that is included in the mysql table.

Step 1: Access the mysql container using bash
`docker exec -it mysql bash`{{execute}}

Step 2: Login to mysql as root
`mysql -u root -p`{{execute}}
enter the password "12345"

step 3: show databases in mysql and note there is mysql database and wordpress database along with other databases. each of this database can be backed up individually.
`show databases;`{{execute}}

step 4: exit mysql and go to its bash
`exit`{{execute}}

step 5: we use a built in mysql backup program called "mysqldump" to backup all the data
`mysqldump -u root -p --all-databases > database_backup.sql`{{execute}}
here is what this command does:

- mysqldump: the program
- -u root -p: signing in as the root
- all-databases: this option tells mysqldump to select all database to backup
- all_database_backup.sql: the name of the generated backup file

step 6: encrypt the file using openssl
`openssl enc -aes-256-cbc -in database_backup.sql -out database_backup.enc`{{execute}}
upon entering this command the user will be requested to input a password. input "12345".
here is what this command does:

- openssl: the program to use, an open source cryptography tool
- enc -aes-256-cbc: encrypts the file using aes 256 standard
- in database_backup.sql: the input file
- out database_backup.enc: the output file

step 7: delete the unencrypted sql backup file
`rm database_backup.sql`{{execute}}

step 8: manipulate sql files and wordpress as you like

step 9: to recover the backup, it must first be decrypted
`openssl enc -aes-256-cbc -d -in database_backup.enc > database_backup.sql`{{execute}}
upon entering this command the user will be requested to input a password. input "12345".
here is what this command does:

- enc -aes-256-cbc: encrypts the file using aes 256 standard
- -d stands for decryption
- in database_backup.enc: the input file
- out database_backup.sql: the output file

step 10: recover the databases by using the backup sql file
`mysql -u root -p< database_backup.sql`{{execute}}

step 11: dont forget to delete the unencrypted sql file generated in step 9
`rm database_backup.sql`{{execute}}
