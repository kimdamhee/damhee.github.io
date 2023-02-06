CREATE TABLE `btqna` (
  `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `id` char(10) NOT NULL DEFAULT '' COMMENT '회원아이디',
  `name` varchar(8) NOT NULL COMMENT '회원이름',
  `email` varchar(30) NOT NULL COMMENT '이메일',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `body` varchar(1000) NOT NULL COMMENT '내용',
  `wdate` date DEFAULT NULL COMMENT '작성일',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='질문 테이블';