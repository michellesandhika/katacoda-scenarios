#!/bin/bash

mysql -u root-p12345 << EOF
use wordpress;
SELECT comment_content FROM wp_comments;
INSERT INTO wp_comments (comment_author,comment_author_email,comment_content) values("Alice","alice@example.com","Hello, nice website.");
EOF
