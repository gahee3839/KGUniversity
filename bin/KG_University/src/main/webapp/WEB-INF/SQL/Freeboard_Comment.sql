
-- 권태영 작성 : 자유게시판 댓글용 SQL
DROP TABLE Freeboard_Comment;
CREATE TABLE Freeboard_Comment(
	contentNum  NUMBER,
    FBC_seq     NUMBER,
	id			VARCHAR2(20),
	nickname	VARCHAR2(20),
	fbComment	VARCHAR2(1000),
	regDate		VARCHAR2(30),
    commentPW   VARCHAR2(6)
);
DROP SEQUENCE FBC_seq;
CREATE SEQUENCE FBC_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000000
    MINVALUE 1
    NOCYCLE;
    
SELECT * FROM Freeboard_Comment
ORDER BY FBC_seq;
COMMIT;

INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-1', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-2', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, 'nickname1', '댓글61-3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-4', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, 'nickname2', '댓글61-5', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(60, FBC_seq.NEXTVAL, null, '익명', '댓글60-1', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(60, FBC_seq.NEXTVAL, null, 'nickname3', '댓글60-2', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(59, FBC_seq.NEXTVAL, null, '익명', '댓글59-1', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, 'nickname4', '댓글61-6', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-7', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, 'nickname5', '댓글61-8', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-9', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-10', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), null);
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, '익명', '댓글61-11', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), '');
INSERT INTO Freeboard_Comment VALUES(61, FBC_seq.NEXTVAL, null, 'nickname6', '댓글61-12', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), '');
