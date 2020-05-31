-- 회원
DROP TABLE BITUSER;

-- 관리자
DROP TABLE ADMIN;

-- 공지사항
DROP TABLE NOTICE;

-- 댓글
DROP TABLE REPLY;

-- 게시글
DROP TABLE BOARD;

-- 이미지
DROP TABLE IMAGE;

-- 관심목록
DROP TABLE FAVORITE;

-- 카테고리
DROP TABLE CATEGORY;

-- 질의응답
DROP TABLE USERQNA;

-- 질의응답댓글
DROP TABLE QNAREPLY;

-- 회원
CREATE TABLE BITUSER1 (
	ID      VARCHAR2(20)  NOT NULL, -- ID
	PWD     VARCHAR2(20)  NOT NULL, -- 비밀번호
	LOC     VARCHAR2(300) NOT NULL, -- 위치정보
	NICK    VARCHAR2(20)  NOT NULL, -- 닉네임
	PROFILE VARCHAR2(100) NULL,      -- 프로필 사진
    RTIME   VARCHAR2(30)  NOT NULL,
    lat     number        not null,
    lon     number        not null
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_BITUSER
	ON BITUSER ( -- 회원
		ID ASC -- ID
	);

-- 회원
ALTER TABLE BITUSER
	ADD
		CONSTRAINT PK_BITUSER -- 회원 기본키
		PRIMARY KEY (
			ID -- ID
		);

-- 관리자
CREATE TABLE ADMIN (
	ID  VARCHAR2(20) NOT NULL, -- ID
	PWD VARCHAR2(20) NOT NULL  -- 비밀번호
);

-- 관리자 기본키
CREATE UNIQUE INDEX PK_ADMIN
	ON ADMIN ( -- 관리자
		ID ASC -- ID
	);

-- 관리자
ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN -- 관리자 기본키
		PRIMARY KEY (
			ID -- ID
		);

-- 공지사항
CREATE TABLE NOTICE (
	NCINDEX   NUMBER        NOT NULL, -- 글번호
	TITLE     VARCHAR2(100) NOT NULL, -- 제목
	NCCONTENT VARCHAR2(500) NOT NULL, -- 내용
	RTIME     VARCHAR2(40)  NOT NULL, -- 등록시간
	NCSTATE   VARCHAR2(4)   NOT NULL, -- 공지사항 유무
	ADMINID   VARCHAR2(20)  NOT NULL  -- ID
);

-- 공지사항 기본키
CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE ( -- 공지사항
		NCINDEX ASC -- 글번호
	);

-- 공지사항
ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE -- 공지사항 기본키
		PRIMARY KEY (
			NCINDEX -- 글번호
		);

-- 댓글
CREATE TABLE REPLY (
	RPINDEX  NUMBER        NOT NULL, -- 댓글번호
	CONTENT  VARCHAR2(100) NOT NULL, -- 내용
	SCSTATE  VARCHAR2(4)   NOT NULL, -- 비밀유무
	DELSTATE VARCHAR2(4)   NOT NULL, -- 삭제유무
	TRSTATE  VARCHAR2(4)   NOT NULL, -- 구매자 거래유무
	RTIME    VARCHAR2(40)  NOT NULL, -- 등록시간
	REFER    NUMBER        NOT NULL, -- refer
	DEPTH    NUMBER        NOT NULL, -- depth
	STEP     NUMBER        NOT NULL, -- step
	ID       VARCHAR2(20)  NOT NULL, -- ID
	BDINDEX  NUMBER        NOT NULL  -- 글번호
);

-- 댓글 기본키
CREATE UNIQUE INDEX PK_REPLY
	ON REPLY ( -- 댓글
		RPINDEX ASC -- 댓글번호
	);

-- 댓글
ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY -- 댓글 기본키
		PRIMARY KEY (
			RPINDEX -- 댓글번호
		);

-- 게시글
CREATE TABLE BOARD (
	BDINDEX  NUMBER        NOT NULL, -- 글번호
	TITLE    VARCHAR2(100) NOT NULL, -- 제목
	PRICE    NUMBER        NOT NULL, -- 가격
	CONTENT  VARCHAR2(500) NOT NULL, -- 내용
	RTIME    DATE          NOT NULL, -- 등록시간
	TRSTATE  VARCHAR2(4)   NOT NULL, -- 판매자 거래유무
	DELSTATE VARCHAR2(4)   NOT NULL, -- 삭제유무
	COUNT    NUMBER        NOT NULL, -- 조회수
	IMG      VARCHAR2(500) NULL,     -- 이미지
	ID       VARCHAR2(20)  NOT NULL, -- ID
	CTCODE   VARCHAR2(20)  NOT NULL  -- 카테고리코드
);

-- 게시글 기본키
CREATE UNIQUE INDEX PK_BOARD
	ON BOARD ( -- 게시글
		BDINDEX ASC -- 글번호
	);

-- 게시글
ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD -- 게시글 기본키
		PRIMARY KEY (
			BDINDEX -- 글번호
		);

-- 이미지
CREATE TABLE IMAGE (
	IMGINDEX NUMBER        NOT NULL, -- 이미지번호
	IMGNAME  VARCHAR2(100) NOT NULL, -- 이미지이름
	BDINDEX  NUMBER        NOT NULL  -- 글번호
);

-- 이미지 기본키
CREATE UNIQUE INDEX PK_IMAGE
	ON IMAGE ( -- 이미지
		IMGINDEX ASC -- 이미지번호
	);

-- 이미지
ALTER TABLE IMAGE
	ADD
		CONSTRAINT PK_IMAGE -- 이미지 기본키
		PRIMARY KEY (
			IMGINDEX -- 이미지번호
		);

-- 관심목록
CREATE TABLE FAVORITE (
	FAVINDEX NUMBER       NOT NULL, -- 관심목록 번호
	ID       VARCHAR2(20) NOT NULL, -- ID
	BDINDEX  NUMBER       NOT NULL  -- 글번호
);

-- 관심목록 기본키
CREATE UNIQUE INDEX PK_FAVORITE
	ON FAVORITE ( -- 관심목록
		FAVINDEX ASC -- 관심목록 번호
	);

-- 관심목록
ALTER TABLE FAVORITE
	ADD
		CONSTRAINT PK_FAVORITE -- 관심목록 기본키
		PRIMARY KEY (
			FAVINDEX -- 관심목록 번호
		);

-- 카테고리
CREATE TABLE CATEGORY (
	CTCODE VARCHAR2(20) NOT NULL, -- 카테고리코드
	CTNAME VARCHAR2(20) NOT NULL  -- 카테고리코드명
);

-- 카테고리 기본키
CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY ( -- 카테고리
		CTCODE ASC -- 카테고리코드
	);

-- 카테고리
ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY -- 카테고리 기본키
		PRIMARY KEY (
			CTCODE -- 카테고리코드
		);

-- 질의응답
CREATE TABLE USERQNA (
	QAINDEX  NUMBER        NOT NULL, -- 글번호
	TITLE    VARCHAR2(100) NOT NULL, -- 제목
	QATIME   VARCHAR2(40)  NOT NULL, -- 등록시간
	COUNT    NUMBER        NOT NULL, -- 조회수
	SCSTATE  VARCHAR2(4)   NOT NULL, -- 비밀유무
	CONTENT  VARCHAR2(500) NOT NULL, -- 내용
	FILENAME VARCHAR2(100) NULL,     -- 첨부파일
	AWSTATE  VARCHAR2(4)   NOT NULL, -- 답변완료여부
	ID       VARCHAR2(20)  NOT NULL  -- ID
);

-- 질의응답 기본키
CREATE UNIQUE INDEX PK_USERQNA
	ON USERQNA ( -- 질의응답
		QAINDEX ASC -- 글번호
	);

-- 질의응답
ALTER TABLE USERQNA
	ADD
		CONSTRAINT PK_USERQNA -- 질의응답 기본키
		PRIMARY KEY (
			QAINDEX -- 글번호
		);

-- 질의응답댓글
CREATE TABLE QNAREPLY (
	TITLE   VARCHAR2(100) NOT NULL, -- 제목
	ID      VARCHAR2(20)  NOT NULL, -- ID
	CONTENT VARCHAR2(500) NOT NULL, -- 내용
	QARTIME VARCHAR2(40)  NOT NULL, -- 등록시간
	QAINDEX NUMBER        NOT NULL  -- 글번호
);

-- 질의응답댓글 기본키
CREATE UNIQUE INDEX PK_QNAREPLY
	ON QNAREPLY ( -- 질의응답댓글
		TITLE ASC -- 제목
	);

-- 질의응답댓글
ALTER TABLE QNAREPLY
	ADD
		CONSTRAINT PK_QNAREPLY -- 질의응답댓글 기본키
		PRIMARY KEY (
			TITLE -- 제목
		);

-- 공지사항
ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_ADMIN_TO_NOTICE -- 관리자 -> 공지사항
		FOREIGN KEY (
			ADMINID -- ID
		)
		REFERENCES ADMIN ( -- 관리자
			ID -- ID
		);

-- 댓글
ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_BITUSER_TO_REPLY -- 회원 -> 댓글
		FOREIGN KEY (
			ID -- ID
		)
		REFERENCES BITUSER ( -- 회원
			ID -- ID
		);

-- 댓글
ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_BOARD_TO_REPLY -- 게시글 -> 댓글
		FOREIGN KEY (
			BDINDEX -- 글번호
		)
		REFERENCES BOARD ( -- 게시글
			BDINDEX -- 글번호
		);

-- 게시글
ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_BITUSER_TO_BOARD -- 회원 -> 게시글
		FOREIGN KEY (
			ID -- ID
		)
		REFERENCES BITUSER ( -- 회원
			ID -- ID
		);

-- 게시글
ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_CATEGORY_TO_BOARD -- 카테고리 -> 게시글
		FOREIGN KEY (
			CTCODE -- 카테고리코드
		)
		REFERENCES CATEGORY ( -- 카테고리
			CTCODE -- 카테고리코드
		);

-- 이미지
ALTER TABLE IMAGE
	ADD
		CONSTRAINT FK_BOARD_TO_IMAGE -- 게시글 -> 이미지
		FOREIGN KEY (
			BDINDEX -- 글번호
		)
		REFERENCES BOARD ( -- 게시글
			BDINDEX -- 글번호
		);

-- 관심목록
ALTER TABLE FAVORITE
	ADD
		CONSTRAINT FK_BITUSER_TO_FAVORITE -- 회원 -> 관심목록
		FOREIGN KEY (
			ID -- ID
		)
		REFERENCES BITUSER ( -- 회원
			ID -- ID
		);

-- 관심목록
ALTER TABLE FAVORITE
	ADD
		CONSTRAINT FK_BOARD_TO_FAVORITE -- 게시글 -> 관심목록
		FOREIGN KEY (
			BDINDEX -- 글번호
		)
		REFERENCES BOARD ( -- 게시글
			BDINDEX -- 글번호
		);

-- 질의응답
ALTER TABLE USERQNA
	ADD
		CONSTRAINT FK_BITUSER_TO_USERQNA -- 회원 -> 질의응답
		FOREIGN KEY (
			ID -- ID
		)
		REFERENCES BITUSER ( -- 회원
			ID -- ID
		);

-- 질의응답댓글
ALTER TABLE QNAREPLY
	ADD
		CONSTRAINT FK_USERQNA_TO_QNAREPLY -- 질의응답 -> 질의응답댓글
		FOREIGN KEY (
			QAINDEX -- 글번호
		)
		REFERENCES USERQNA ( -- 질의응답
			QAINDEX -- 글번호
		);

-- 질의응답댓글
ALTER TABLE QNAREPLY
	ADD
		CONSTRAINT FK_ADMIN_TO_QNAREPLY -- 관리자 -> 질의응답댓글
		FOREIGN KEY (
			ID -- ID
		)
		REFERENCES ADMIN ( -- 관리자
			ID -- ID
		);



--메인 게시판  인덱스 순번 처리
CREATE SEQUENCE board_bdindex
START WITH 1
INCREMENT BY 1
NOCACHE;      
       
--공지사항 게시판 인덱스 순번 처리
CREATE SEQUENCE notice_ncindex
START WITH 1
INCREMENT BY 1
NOCACHE;

--댓글 게시판 인덱스 순번 처리
CREATE SEQUENCE reply_rpindex
START WITH 1
INCREMENT BY 1
NOCACHE;

commit;

--QnA 게시판 인덱스 순번 처리
CREATE SEQUENCE userqna_qaindex
START WITH 1
INCREMENT BY 1
NOCACHE;

--관심목록 게시판 인덱스 순번 처리
CREATE SEQUENCE favorite_favindex
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 시퀀스 내역 조회
SELECT * FROM USER_SEQUENCES;

insert into admin values('admin',1004);

select * from bituser;
desc bituser;

select * from board;

select b.*,round((google_distance(lat,lon, 37.6438784, 127.06775039999998)),10) t from 
board b join bituser u
on b.id=u.id
order by t;

select round((google_distance(37.6438784, 127.06775039999998, lat, lon)),10) t from bituser1 u;
desc bituser1;
select * from bituser1;



select google_distance(37.6438784, 127.06775039999998,37.6438784,127.0677503999998) from dual;

-- 두 좌표값(경/위도) 사이의 거리 구하는 함수
CREATE OR REPLACE FUNCTION GOOGLE_DISTANCE (
  LAT1 FLOAT, 
  LNG1 FLOAT,
  LAT2 FLOAT,
  LNG2 FLOAT 
)

  RETURN FLOAT
 
IS

  fEARTH_R FLOAT := 6371000.0;
  fPIE FLOAT := 3.141592653589793;
  fRAD FLOAT := 0.0;
  radLAT1 FLOAT := 0.0;
  radLAT2 FLOAT := 0.0;
  radDIST FLOAT := 0.0;
  fDIST FLOAT := 0.0;

BEGIN

  fRAD := fPIE / 180;
  radLAT1 := fRAD * LAT1;
  radLAT2 := fRAD * LAT2;
  radDIST := fRAD * ( LNG1 - LNG2 );
  fDIST := SIN( radLAT1 ) * SIN( radLAT2 );
  fDIST := fDIST + COS( radLAT1 ) * COS( radLAT2 ) * COS( radDIST );
  RETURN ((fEARTH_R * ACOS(ROUND(fDIST,10)))/1000);

END;
/

---함수 끝 '/'이것도 포함이다.

 SELECT * from 
					(select rownum rn, bdindex, title,price,content,rtime,trstate,delstate,count,id,img,dist
				 , ctcode FROM (SELECT b.*, (power(lat-37,2)+power(lon-127,2)) dist FROM board b JOIN bituser u ON b.id = u.id order by dist)
					 where rownum <=10) where rn >= 1;

 

select * from reply;



select * from admin;

desc notice;

commit;

INSERT into CATEGORY(ctcode, ctname) values (1,'디지털/가전');
INSERT into CATEGORY(ctcode, ctname) values (2,'스포츠/레저');
INSERT into CATEGORY(ctcode, ctname) values (3,'의류/잡화');
INSERT into CATEGORY(ctcode, ctname) values (4,'뷰티/미용');
INSERT into CATEGORY(ctcode, ctname) values (5,'생활/가구');

commit;




