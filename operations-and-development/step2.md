# Personal Identifiable Information (PII)

## What is PII?

Personal Identifiable Information refers to information that can be used to identify a person. For example, a person's name, surname, address, driver's license number, credit card number, transaction informations, etc.

According to the General Data Protection Regulation (GDPR), PII also includes information like the IP addresses, social media posts, video footage, customer loyalty histories, biometric identifiers, and geolocation.

Although the GDPR only applies to EU citizens, thus, even if your business is located outside of the EU but still offers services or products to the EU citizen, your business will need to comply to the GDPR.

By complying to the GDPR, you are required to ask your customers for consent to store their PII data. The document should also specify what data are being stored, how long are they being stored, and what are they being used for.

A data breah is when customer's PIIs are being released to the public. When a case like this happens, the company is required to notify all affected parties within 72 hours. The company will also have to face a fine depending on the severity of the data breach. Thus, protecting PII is an important step that should not be overlooked.

<br>

## What is Encryption?

An encryption is when a piece of information goes through certain process and is translated into an unreadable data. For example, if a user's password is *ABC*, after the encryption, the user's password might become something like *SKJF9AE72*.

Encryption is one of the ways to protect sensitive data or PII. It has 2 types: deterministic and randomized. A deterministic encryption means that if the initial values are the same, it will generate the same encrypted value. On the other hand, the randomized encryption means that the same initial value will generate different encrypted values.

<br>

## Encryping User Information

The AES Encryption is a type of deterministic encryption and is a built-in function in MySQL.

To encrypt all user's nickname in the database using the key `test key`, run the following command:

```UPDATE wp_users SET user_nicename=HEX(AES_ENCRYPT(user_nicename, 'test key'));```{{execute}}

The function AES_ENCRYPT() will return a binary string, so we have to use the function HEX() to first convert the values into a hexadecimal in order to save the encrypted value as a varchar. Thus, when decrypting, you have to use the function UNHEX() for convert the hexabecimal back to binary string first before decrypting the field as follows:

```UPDATE wp_users SET user_nicename=CAST(AES_DECRYPT(UNHEX(user_nicename), 'test key') AS CHAR(250));```{{execute}}

In a real situation, you might want to make your key longer and harder to guess. One day to do so is to encrypt your key and convert it into a hex before using it to encrypt your sensitive data. For example:

```UPDATE wp_users SET user_nicename=HEX(AES_ENCRYPT(user_nicename, HEX(SHA2('test key', 256))));```{{execute}}

To decrypt, follow a similar step as follows:

```UPDATE wp_users SET user_nicename=CAST(AES_DECRYPT(UNHEX(user_nicename), HEX(SHA2('test key', 256))) AS CHAR(50));```{{execute}}