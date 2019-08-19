SET NAMES UTF8;
DROP DATABASE IF EXISTS msj;
CREATE DATABASE msj CHARSET=UTF8;
USE msj;
/**创建分类列表**/
CREATE TABLE msj_family(
  z_uid INT PRIMARY KEY AUTO_INCREMENT,
  f_id INT,
  z_uname VARCHAR(32)
);

/**创建分类下的子表**/
CREATE TABLE msj_laptop_family(
  z_pid INT PRIMARY KEY AUTO_INCREMENT,
  z_family_id INT,    #外键链接msj_family 中z_uid
  z_pname VARCHAR(32)
);

/*用户列表
CREATE TABLE msj_user(
  s_id INT PRIMARY KEY AUTO_INCREMENT,
  s_name VARCHAR(32),
  s_pwd VARCHAR(32),
  s_mail VARCHAR(64), 
  s_phone VARCHAR(11),
  s_avatar VARCHAR(128)          #头像图片路径
);*/

/*详情列表*/
CREATE TABLE msj_xiangqing(
  c_id INT PRIMARY KEY AUTO_INCREMENT,
  c_pic   VARCHAR(100),     #图片路径
  c_title VARCHAR(128),         #主标题
  c_pic_small   VARCHAR(100),     #时间图片路径
  c_subtitle VARCHAR(128),      #时间
  c_memory VARCHAR(10000),         #简介
  c_uid int             #值
);

/*详情列表数据*/
INSERT INTO msj_xiangqing VALUES
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','红烧','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",1),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','红烧小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",1),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",1),

(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','西餐','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",2),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','西餐小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",2),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",2),

(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','乳酪','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",3),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','乳酪小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",3),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','乳酪小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",3),

(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','果汁','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",4),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','果汁小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",4),
(NULL,'http://127.0.0.1:3000/product_clas/msj_c_s1.png','果汁小黄鱼','http://127.0.0.1:3000/product_clas/foot_c_qq07.png','30分钟',"适宜肤色没有光华，失去红润、手脚冰冷的人群。黄鱼含有丰富的蛋白质、矿物质和维生素，对人体有很好的补益作用。",4);
/*详情评论列表*/
CREATE TABLE msj_c_pinglun(
  c_id_pl INT PRIMARY KEY AUTO_INCREMENT,
  c_name_pl   VARCHAR(100),     #名字
  c_time_pl VARCHAR(128),         #时间
  c_title_pl   VARCHAR(10000)     #评论内容
);
/*详情评论列表数据*/
INSERT INTO msj_c_pinglun VALUES
(NULL,'崔巍',"2019/7/30 下午9:35:30",'123'),
(NULL,'张倩影',"2019/7/30 下午9:35:31",'1234'),
(NULL,'刘渊博',"2019/7/30 下午9:35:32",'12345');

/**创建用户地址表user_address**/
CREATE TABLE msj_user_address(
  l_id INT PRIMARY KEY AUTO_INCREMENT,
  l_name VARCHAR(16),  #用户真实姓名
  l_phone VARCHAR(11),
  l_provinces VARCHAR(12),#省
  l_city VARCHAR(12),#市
  l_area VARCHAR(12), #区
  l_areaCode VARCHAR(7),#地址区号
  l_coding VARCHAR(7),#邮政编码
  l_det_address VARCHAR(128) ,#详细地址
  l_default BOOLEAN #是否是默认地址
);
INSERT INTO msj_user_address VALUES
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',true),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾英',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false),
 (NULL,'张乾kun',"16639610102",'河南省','驻马店市','泌阳县',411726,463721,'具体地方自己猜',false);
/*购物车*/

CREATE TABLE msj_cart(
    x_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    x_uid INT(11),            #用户编号
    x_product_id INT(11),     #商品编号
    x_img_url VARCHar(128),   #商品图片路径
    x_title   VARCHAR(100),   #标题
    x_name  VARCHAR(32),      #介绍
    x_price DECIMAL(10,2),    #价格
    x_count INT(11),          #购买数量
    x_is_checked BOOLEAN      #是否已勾选，确定购买
);
INSERT INTO msj_cart VALUES
(NULL,1,1,"http://127.0.0.1:3000/product_clas/list01.jpg","澳洲深海小黄鱼","高蛋白\低脂肪","169",1,true),
(NULL,1,1,"http://127.0.0.1:3000/product_clas/list01.jpg","澳洲深海小黄鱼","高蛋白\低脂肪","169",1,true),
(NULL,1,1,"http://127.0.0.1:3000/product_clas/list01.jpg","澳洲深海小黄鱼","高蛋白\低脂肪","169",1,true),
(NULL,1,1,"http://127.0.0.1:3000/product_clas/list01.jpg","澳洲深海小黄鱼","高蛋白\低脂肪","169",1,true),
(NULL,1,1,"http://127.0.0.1:3000/product_clas/list01.jpg","澳洲深海小黄鱼","高蛋白\低脂肪","169",1,true);


/**插入数据-分类列表**/
INSERT INTO msj_family VALUES
(NULL,1,'海鲜'),
(NULL,2,'肉类'),
(NULL,3,'蔬菜'),
(NULL,4,'水果'),
(NULL,5,'禽类');

/**插入数据-分类列表下的子表**/
INSERT INTO msj_laptop_family VALUES
(NULL,1,"鱼类"),
(NULL,1,"壳类"),
(NULL,1,'虾类'),
(NULL,1,'螃蟹'),
(NULL,1,'刺身类'),
(NULL,2,'四只腿'),
(NULL,2,'两只腿'),
(NULL,3,'地上'),
(NULL,3,'地下'),
(NULL,4,'扒皮'),
(NULL,4,'不扒皮'),
(NULL,5,'飞'),
(NULL,5,'跑');



/**创建分类下的字表下的商品字表**/
CREATE TABLE msj_laptop_family_ftb(
  z_fid INT PRIMARY KEY AUTO_INCREMENT,
  z_ftb_id INT,             #外键链接msj_laptop_family 中z_pid
  z_ftitle VARCHAR(32),     #标题
  z_fname  VARCHAR(32),     #介绍
  z_price DECIMAL(10,2),    #价格
  z_pic   VARCHAR(100),     #图片路径
  sale     INT(11),         #销量   
  z_type     INT            #类型
	
);

INSERT INTO msj_laptop_family_ftb VALUES

(Null,1,"澳洲深海小黄鱼","高蛋白\低脂肪","169","http://127.0.0.1:3000/product_clas/list01.jpg",423,1), 
(Null,1,"澳洲深海小黄鱼","高蛋白\低脂肪","169","http://127.0.0.1:3000/product_clas/list01.jpg",423,1),
(Null,1,"澳洲深海小黄鱼","高蛋白\低脂肪","169","http://127.0.0.1:3000/product_clas/list01.jpg",423,1),
(Null,1,"澳洲深海小黄鱼","高蛋白\低脂肪","169","http://127.0.0.1:3000/product_clas/list01.jpg",423,1),
(Null,1,"澳洲深海小黄鱼","高蛋白\低脂肪","169","http://127.0.0.1:3000/product_clas/list01.jpg",423,1),
(Null,2,"澳洲深海大海蛎","高蛋白\低脂肪","299","http://127.0.0.1:3000/product_clas/list01.jpg",423,1),
(Null,2,"澳洲深海大海蛎","高蛋白\低脂肪","299","http://127.0.0.1:3000/product_clas/list01.jpg",423,1),
(Null,2,"澳洲深海大海蛎","高蛋白\低脂肪","299","http://127.0.0.1:3000/product_clas/list02.jpg",423,1),
(Null,2,"澳洲深海大海蛎","高蛋白\低脂肪","299","http://127.0.0.1:3000/product_clas/list02.jpg",423,1),
(Null,2,"澳洲深海大海蛎","高蛋白\低脂肪","299","http://127.0.0.1:3000/product_clas/list02.jpg",423,1),
(Null,3,"澳洲深海小龙虾","高蛋白\低脂肪","99","http://127.0.0.1:3000/product_clas/list02.jpg",642,1),
(Null,3,"澳洲深海小龙虾","高蛋白\低脂肪","99","http://127.0.0.1:3000/product_clas/list02.jpg",642,1),
(Null,3,"澳洲深海小龙虾","高蛋白\低脂肪","99","http://127.0.0.1:3000/product_clas/list02.jpg",642,1),
(Null,3,"澳洲深海小龙虾","高蛋白\低脂肪","99","http://127.0.0.1:3000/product_clas/list01.jpg",642,1),
(Null,3,"澳洲深海小龙虾","高蛋白\低脂肪","99","http://127.0.0.1:3000/product_clas/list01.jpg",642,1),
(Null,4,"可口美味大闸蟹","高蛋白\低脂肪","69","http://127.0.0.1:3000/product_clas/list01.jpg",642,1),
(Null,4,"可口美味大闸蟹","高蛋白\低脂肪","69","http://127.0.0.1:3000/product_clas/list01.jpg",642,1),
(Null,4,"可口美味大闸蟹","高蛋白\低脂肪","69","http://127.0.0.1:3000/product_clas/list01.jpg",642,1),
(Null,4,"可口美味大闸蟹","高蛋白\低脂肪","69","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,4,"可口美味大闸蟹","高蛋白\低脂肪","69","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,5,"可口美味生鱼片","高蛋白\低脂肪","66","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,5,"可口美味生鱼片","高蛋白\低脂肪","66","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,5,"可口美味生鱼片","高蛋白\低脂肪","66","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,5,"可口美味生鱼片","高蛋白\低脂肪","66","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,5,"可口美味生鱼片","高蛋白\低脂肪","66","http://127.0.0.1:3000/product_clas/list03.jpg",642,1),
(Null,6,"可口美味大海虾","高蛋白\低脂肪","166","http://127.0.0.1:3000/product_clas/list03.jpg",103,1),
(Null,6,"可口美味大海虾","高蛋白\低脂肪","166","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,6,"可口美味大海虾","高蛋白\低脂肪","166","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,6,"可口美味大海虾","高蛋白\低脂肪","166","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,6,"可口美味大海虾","高蛋白\低脂肪","166","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,7,"可口美味跳跳鱼","高蛋白\低脂肪","111","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,7,"可口美味跳跳鱼","高蛋白\低脂肪","111","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,7,"可口美味跳跳鱼","高蛋白\低脂肪","111","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,7,"可口美味跳跳鱼","高蛋白\低脂肪","111","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,7,"可口美味跳跳鱼","高蛋白\低脂肪","111","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,8,"可口美味大海龟","高蛋白\低脂肪","250","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,8,"可口美味大海龟","高蛋白\低脂肪","250","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,8,"可口美味大海龟","高蛋白\低脂肪","250","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,8,"可口美味大海龟","高蛋白\低脂肪","250","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,8,"可口美味大海龟","高蛋白\低脂肪","250","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,9,"澳洲深海梭子蟹","高蛋白\低脂肪","199","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,9,"澳洲深海梭子蟹","高蛋白\低脂肪","199","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,9,"澳洲深海梭子蟹","高蛋白\低脂肪","199","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,9,"澳洲深海梭子蟹","高蛋白\低脂肪","199","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,9,"澳洲深海梭子蟹","高蛋白\低脂肪","199","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,10,"北极洲先生鱼肉","高蛋白\低脂肪","999","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,10,"北极洲先生鱼肉","高蛋白\低脂肪","999","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,10,"北极洲先生鱼肉","高蛋白\低脂肪","999","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,10,"北极洲先生鱼肉","高蛋白\低脂肪","999","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,10,"北极洲先生鱼肉","高蛋白\低脂肪","999","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,11,"澳洲深海八爪鱼","高蛋白\低脂肪","222","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,11,"澳洲深海八爪鱼","高蛋白\低脂肪","222","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,11,"澳洲深海八爪鱼","高蛋白\低脂肪","222","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,11,"澳洲深海八爪鱼","高蛋白\低脂肪","222","http://127.0.0.1:3000/product_clas/list02.jpg",103,1),
(Null,11,"澳洲深海八爪鱼","高蛋白\低脂肪","222","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,12,"澳洲深海胖头鱼","高蛋白\低脂肪","366","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,12,"澳洲深海胖头鱼","高蛋白\低脂肪","366","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,12,"澳洲深海胖头鱼","高蛋白\低脂肪","366","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,12,"澳洲深海胖头鱼","高蛋白\低脂肪","366","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,12,"澳洲深海胖头鱼","高蛋白\低脂肪","366","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,13,"澳洲深海河刀鱼","高蛋白\低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,13,"澳洲深海河刀鱼","高蛋白\低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,13,"澳洲深海河刀鱼","高蛋白\低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,13,"澳洲深海河刀鱼","高蛋白\低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,13,"澳洲深海河刀鱼","高蛋白\低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",103,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,1),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,1),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,2),
(Null,13,"牛肉","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,2),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,3),
(Null,13,"大白菜","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,3),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,4),
(Null,13,"水果之王榴莲","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,4),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list01.jpg",3050,5),
(Null,13,"大公鸡","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list02.jpg",3250,5),
(Null,13,"澳洲深海小贱鱼","高蛋白/低脂肪","666","http://127.0.0.1:3000/product_clas/list03.jpg",1068,1);



CREATE TABLE msj_user(
  s_id INT PRIMARY KEY AUTO_INCREMENT,
  s_name      VARCHAR(32),
  s_pwd       VARCHAR(32),
  s_mail      VARCHAR(64), 
  s_phone     VARCHAR(11),
  s_avatar    VARCHAR(128),          #头像图片路径
  session_id   INT
);
/*用户信息*/
INSERT INTO msj_user VALUES
 (NULL, 'dingding', '123456', 'ding@qq.com', '13501234567','1',1),
 (NULl, 'dangdang', '123456', 'dang@qq.com', '13501234568','1',1);

