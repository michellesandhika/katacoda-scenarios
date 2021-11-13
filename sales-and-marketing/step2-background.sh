#!/bin/bash

db_user='root'
db_pw='12345'

mysql -u$db_user -p$db_pw <<EOF
use wordpress;
INSERT INTO wp_comments (comment_author,comment_author_email,comment_content) values("Alice","alice@example.com","Hello, nice website.");
EOF
