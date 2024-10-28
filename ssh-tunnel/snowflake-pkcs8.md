* generate ssh-keys
ssh-keygen -t rsa -b 2048 -m PEM -C "your-comment-here"

* convert public-key to pkcs8 format
ssh-keygen -e -m PKCS8 -f id_rsa-snowflake.pub > id_rsa_pkcs8-snowflake.pub

* convert private-key to pkcs8-format
openssl pkcs8 -in id_rsa-snowflake -topk8 -nocrypt -out id_rsa-snowflake-pkcs8.pem

* insert the public-key to snowflake-user
ALTER USER 'YOUR-SNOWFLAKE-USER' SET 
RSA_PUBLIC_KEY=
'''MIIBIjxxxxxxxxxxxxxxxxxxxxxxxxIIBCgKCAQEAt/kfrgwPRxF/86ljq8m6
this-is-your-generated-pkcs8-puclic-key-for-snowflake-xxxxxxxxxx
567890''';
