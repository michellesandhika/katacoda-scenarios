# Formulating a Backup and recovery policy

Now that we learnt to create a backup and perform recovery using a plugin, a strategy on how often to backup and what to backup has to be formulated.

It is highly recommended that backups are performed several times a day or at least everyday. this is to ensure that when an irreversible mistakes happens only a day's worth of work is lost.

Step 1: To set periodic automatic backups go to the "settings" of updraftplus and set both the boxes to 5, this ensures that for each end of week data from the beginning of the week is retained.
![udp-step-9](./assets/udp-step-9.png)

the ideal way to store data is to follow the "3-2-1 rule". this means that 3 copies are stored, 2 are stored locally while 1 copu is stored in an offsite server. UpdraftPlus allows backup files to be sent to other storage services and servers.

Step 2: However, storing backups for a week is not enough since some mistakes might be discovered weeks or months after the matter. to rectify this we create a persisting backup. simply click the "backup now" button and check the box "only allow this backup to be deleted manually."
![udp-step-10](./assets/udp-step-10.png)

it is recommended to create a persisting backup of all media and databases every month. this does come with the drawback of large data use and plenty of server processing dedicated to data backups. hence the organization has to keep in mind a balance of resource use and data security this will defer based on the business model and data that the organization uses.
