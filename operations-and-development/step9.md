# Backing up Mysql data

Now that we learnt to create a backup and perform recovery using a plugin, we will explore ways to backup mysql data without using plugins. mysql data in this case also includes wordpress data that is included in the mysql table.

Step 1: Access the mysql container using bash
`docker exec -it mysql bash`{{execute}}

Step 2: Login to mysql as root
`mysql -u root -p`{{execute}}
enter the password "12345"

step 3: show databases in mysql and note there is mysql database and wordpress database along with other databases. each of this database can be backed up individually.
`show databases;`{{execute}}

step 4: create backup
