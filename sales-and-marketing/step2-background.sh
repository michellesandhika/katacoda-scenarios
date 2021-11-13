#!/bin/bash

mysql -u root -p12345 -D wordpress <<EOF
INSERT INTO wp_comments (comment_author,comment_author_email,comment_content) values("Alice","alice@example.com","Hello, nice website.");
EOF
