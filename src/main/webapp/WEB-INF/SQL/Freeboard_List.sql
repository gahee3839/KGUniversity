
-- 권태영 작성 : 자유게시판 글목록 SQL
DROP TABLE Freeboard_List;
CREATE TABLE Freeboard_List(
    FBN_seq     NUMBER      PRIMARY KEY,
    type        VARCHAR2(20),
    title       VARCHAR2(50),
    content     VARCHAR2(1000),
    writer      VARCHAR2(20),
    regDate     VARCHAR2(30),
    hit         NUMBER(10),
    commentCnt  NUMBER(10)
);
DROP SEQUENCE FBN_seq;
CREATE SEQUENCE FBN_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000000
    MINVALUE 1
    NOCYCLE;

SELECT * FROM Freeboard_List
ORDER BY FBN_seq desc;

COMMIT;


INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type1', 'title1', 'content1', 'writer1', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type2', 'title2', 'content2', 'writer2', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title3', 'content3', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, '질문/답변', '가나다라마바사아자차카타파하', 'content4',  'abcdefghij123456', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title5', 'content5', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title6', 'content6', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title7', 'content7', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title8', 'content8', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title9', 'content9', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title10', 'content10', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title11', 'content11', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title12', 'content12', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title13', 'content13', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title14', 'content14', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title15', 'content15', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title16', 'content16', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title17', 'content17', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title18', 'content18', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title19', 'content19', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title20', 'content20', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title21', 'content21', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title22', 'content22', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title23', 'content23', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title24', 'content24', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title25', 'content25', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title26', 'content26', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title27', 'content27', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title28', 'content28', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title29', 'content29', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title30', 'content30', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type1', 'title31', 'content31', 'writer1', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type2', 'title32', 'content32', 'writer2', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title33', 'content33', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, '질문/답변', '가나다라마바사아자차카타파하', 'content34', 'abcdefghij123456', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title35', 'content35', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title36', 'content36', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title37', 'content37', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title38', 'content38', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title39', 'content39', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title40', 'content40', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title41', 'content41', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title42', 'content42', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title43', 'content43', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title44', 'content44', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title45', 'content45', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title46', 'content46', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title47', 'content47', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title48', 'content48', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title49', 'content49', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title50', 'content50', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title51', 'content51', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title52', 'content52', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title53', 'content53', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title54', 'content54', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title55', 'content55', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title56', 'content56', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title57', 'content57', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title58', 'content58', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 0);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title59', 'content59', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 1);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title60', 'content60', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 2);
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'type3', 'title61', 'content61', 'writer3', TO_CHAR(SYSDATE, 'yyyy/mm/dd hh24:mi:ss'), 0, 12);
