CREATE TABLE `board`.`board` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `pass` VARCHAR(45) NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `readcount` INT NULL DEFAULT 0,
  `writedate` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE `board`.`member` (
  `userid` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `pwd` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userid`));

 
  
insert into board.member values ('hong1', '홍길동', '1234', 'hong1@naver.com', '010-1234-1234');
insert into board.member values ('hong2', '홍길서', '1234', 'hong2@naver.com', '010-1234-1234');
insert into board.member values ('hong3', '홍길남', '1234', 'hong3@naver.com', '010-1234-1234');

insert into board(pass, userid, email, title, content)
values ('1234', 'hong1', 'hong1@naver.com', '첫방문입니다', '반갑습니다 잘부탁드립니다');
insert into board(pass, userid, email, title, content)
values ('1234', 'hong2', 'hong2@naver.com', '돼지골마을', '돼지삼겹살 이즈 나이스');
insert into board(pass, userid, email, title, content)
values ('1234', 'hong3', 'hong3@naver.com', '게시판 개설', 'ㅎㅇㅎㅇ 게시판 멋진데~');
insert into board(pass, userid, email, title, content)
values ('1234', 'hong1', 'hong3@naver.com', '집에 가고싶당', '다들 집에 가고싶으시죠~?');
insert into board(pass, userid, email, title, content)
values ('1234', 'hong2', 'hong3@naver.com', '스터디하는날', '객원멤버 민주님 환영합니다');

insert into board(pass, userid, email, title, content)
values('1234', 'hong1', 'hong1@abc.com', '약국가서 싸운 썰푼다.txt', '내가 발림');
insert into board(pass, userid, email, title, content)
values('1234', 'hong3', 'hong3@naver.com', '종로 맛집 공유', '돼지국밥이 최고');
insert into board(pass, userid, email, title, content)
values('1234', 'hong2', 'hong2@naver.com', '지나가다가 아이유 봄', '사실 거울에 비친 나였음');
insert into board(pass, userid, email, title, content)
values('1234', 'hong3', 'hong3@naver.com', '요즘 날씨 어디에 장단 맞추냐', '반팔 내려 후드 올려');
insert into board(pass, userid, email, title, content)
values('1234', 'hong2', 'hong2@naver.com', '코로나 양성 나왔다...', '응 휴가~');

drop table board;
drop table member;

select*from member;
select*from board;


CREATE TABLE `board`.`reply` (
  `replynum` INT NOT NULL,
  `boardnum` INT NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
  `writedate` DATETIME NOT NULL DEFAULT now(),
  `content` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`replynum`),
  INDEX `f1_idx` (`boardnum` ASC) VISIBLE,
  INDEX `f2_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `f1`
    FOREIGN KEY (`boardnum`)
    REFERENCES `board`.`board` (`num`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `f2`
    FOREIGN KEY (`userid`)
    REFERENCES `board`.`member` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into reply(boardnum, userid, content) values(6, 'hong1', '해위,수고륑');
insert into reply(boardnum, userid, content) values(6, 'hong2', '어쩔티비,저쩔티비');

select* from reply;

select*from board limit 10 offset 10;














