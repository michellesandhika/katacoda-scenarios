#!/bin/bash

user="root"
pw="12345"
db="wordpress"

post_paragraph = mysql_real_escape_string("<!-- wp:paragraph --><p>Test post</p><!-- /wp:paragraph -->");


docker exec -it mysql bash

mysql -u "$user" -p"$pw" "$db" << EOF
  INSERT INTO wp_comments (comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ("Alice","alice@example.com",2021-11-12 08:24:10,"Hello, nice website.",1,"comment");
  INSERT INTO wp_comments (comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ("Bob","bob@ilovearts.com",2021-11-13 06:44:17,"I'm looking for some unique paintings. Can you reccomend new artists?",1,"comment");
    
  INSERT INTO wp_posts (post_date,post_content,post_title,post_status,comment_status) 
    VALUES (2021-11-10 06:46:45,"$post_paragraph","Tell us your opinion!", "publish", "open");
EOF
