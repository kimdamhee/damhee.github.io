CREATE TABLE btPollList (
  num	INT	AUTO_INCREMENT	COMMENT '번호',
	question	VARCHAR(100)	NOT NULL  COMMENT '질문',
	sdate	DATE  COMMENT '시작일',
	edate	DATE COMMENT '종료일',
	wdate	DATE  COMMENT '작성일',
  type		INT	NOT NULL  COMMENT '이중답변여부',
	active	INT	DEFAULT 1 COMMENT '활성화여부',
  PRIMARY KEY (num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='투표 테이블';
  
CREATE TABLE btPollItem (
	listnum	INT COMMENT '번호',
	itemnum		INT	 COMMENT '아이템번호',
	item		VARCHAR(30)	NOT NULL  COMMENT '아이템',
	count	INT DEFAULT 0  COMMENT '선택횟수',
  PRIMARY KEY (listnum, itemnum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='아이템 테이블';