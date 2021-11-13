#!/bin/bash

db_user='root'
db_pw='12345'
db_name='wordpress'

mysql -u$db_user -p$db_pw -D$db_name <<EOF
INSERT INTO wp_comments (comment_author,comment_author_email,comment_content) values("Alice","alice@example.com","Hello, nice website.");
EOF
