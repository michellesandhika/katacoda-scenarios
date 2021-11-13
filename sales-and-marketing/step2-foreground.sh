#!/bin/bash


post_paragraph = mysql_real_escape_string("<!-- wp:paragraph --><p>Test post</p><!-- /wp:paragraph -->");


docker exec -it mysql bash

mysql -u root -p12345 wordpress << EOF
  INSERT INTO wp_posts (post_author,post_date,post_content,post_title,post_excerpt,post_status,comment_status,post_name,to_ping,pinged,post_content_filtered,post_type) 
    VALUES ('1','2021-11-09 06:46:45','<p>We want to improve our customer service and are looking for your feedback. What do you like, wish or miss on our website. Please write us a comment!</p>','Tell us your opinion!','feedback request', 'publish','open','feedback','','','','post');

  INSERT INTO wp_comments (comment_post_ID,comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ('5','Alice','alice@example.com','2021-11-10 08:24:10','Hello, nice website.',1,'comment');
  INSERT INTO wp_comments (comment_post_ID,comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ('5','Bob','bob@ilovearts.com','2021-11-12 06:44:17','I'm looking for some unique paintings. Can you reccomend new artists on your website?',1,'comment');
  INSERT INTO wp_comments (comment_post_ID,comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ('5','Carol','carol@somemailbox.com','2021-11-12 07:58:27','I saw a similar website, see <a href="https://2886795298-20080-elsy05.environments.katacoda.com/wp-admin/">here</a>. Are these two related?',1,'comment');
  INSERT INTO wp_comments (comment_post_ID,comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ('5','Dave','dave@dmail.com','2021-11-12 13:05:27','What about new products? When will you',1,'comment');
  INSERT INTO wp_comments (comment_post_ID,comment_author,comment_author_email,comment_date,comment_content,comment_approved,comment_type) 
    VALUES ('5','Eve','eve@evil.com','2021-11-12 13:13:13','I can't access the product catalog. Please send it to me per email.',1,'comment');  

EOF
