#!/bin/bash

user="root"
pw="12345"
db_name="wordpress"

mysql -u wordpress_user -psecret wordpress <<EOF
  INSERT INTO wp_comments (comment_author,comment_author_email,comment_content) values("Alice","alice@example.com","Hello, nice website.");
EOF
