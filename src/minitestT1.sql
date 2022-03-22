Create DATABASE QuanLyHocVien;
use QuanLyHocVien;
CREATE TABLE Class
(
    idClasses          varchar(10) NOT NULL PRIMARY KEY,
    nameClasses        varchar(15),
    languageClasses    varchar(15),
    descriptionClasses text
);
CREATE TABLE Adress
(
    idAdress INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Adress   varchar(40)
);
CREATE TABLE Student
(
    idStudent          varchar(10) NOT NULL PRIMARY KEY,
    fullnameStudent varchar(40),
    idAdress        INT,
    ageStudent int,
    phoneStudent int unique ,
    idClasses varchar(10),
    FOREIGN KEY (idAdress)references Adress(idAdress),
    FOREIGN KEY (idClasses)references Class(idClasses)
);
CREATE TABLE Course(
                       idCourse int NOT NULL PRIMARY KEY ,
                       nameCourse varchar(20),
                       descriptionCourse text
);
CREATE TABLE Point(
                      idPoint int PRIMARY KEY AUTO_INCREMENT,
                      idCourse int,
                      idStudent varchar(10),
                      point double,
                      FOREIGN KEY (idCourse)references Course(idCourse),
                      foreign key (idStudent)references Student(idStudent)
);
SELECT *FROM Adress;
SELECT *FROM Class;
SELECT *FROM Student;
SELECT *FROM Course;
SELECT *FROM Point;

INSERT INTO Adress (idAdress, Adress)values ('1','Quận Ba Đình');
INSERT INTO Adress (idAdress, Adress)values ('2','Quận Hoàng Mai');
INSERT INTO Adress (idAdress, Adress)values ('3','Quận Thanh Xuân');
INSERT INTO Adress (idAdress, Adress)values ('4','Quận Đống Đa');
INSERT INTO Adress (idAdress, Adress)values ('5','Quận Tây Hồ');

INSERT INTO Class (idClasses, nameClasses, languageClasses, descriptionClasses)values ('A','A1221H1','JAVA','Lớp có 20 người và 3 mentor');
INSERT INTO Class (idClasses, nameClasses, languageClasses, descriptionClasses)values ('B','B1221H1','C++','Lớp có 15 người và 3 mentor');
INSERT INTO Class (idClasses, nameClasses, languageClasses, descriptionClasses)values ('C','C1221H1','Python','Lớp có 24 người và 3 mentor');
INSERT INTO Class (idClasses, nameClasses, languageClasses, descriptionClasses)values ('D','D1221H1','.NET','Lớp có 18 người và 3 mentor');
INSERT INTO Class (idClasses, nameClasses, languageClasses, descriptionClasses)values ('E','E1221H1','PHP','Lớp có 13 người và 3 mentor');

INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('A1','Nguyễn Minh Hiếu','1','23','165216484','A');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('A2','Nguyễn Trung Đức','4','23','113541484','A');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('A5','Trần Thái Dương','3','25','161651484','A');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('B1','Trần Trung Quân','2','21','051216484','B');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('B4','Lương Thúy Hiền','1','19','131516484','B');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('C7','Hoàng Nhật Anh','4','26','565216484','C');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('C1','Đinh Phương Thúy','2','20','64852164','C');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('D1','Dương Quang Đức','2','28','165216644','D');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('D8','Nguyễn Kim Anh','1','23','15216484','D');
INSERT INTO Student(idStudent, fullnameStudent, idAdress, ageStudent, phoneStudent, idClasses) values ('D9','Trần Quốc Anh','1','24','46841684','D');

INSERT INTO Course(idCourse, nameCourse, descriptionCourse) VALUES ('1','JAVA','Khóa học FULLSTACK về Java trong 6 tháng') ,('2','C++','Khóa học về C++ trong 6 tháng'),('3','Python','Lớp học về Python trong 4 tháng'),('4','.NET','Lớp học về .NET trong 5 tháng'),('5','PHP','Lớp học về PHP trong 3 tháng');


Insert Into Point(idCourse, idStudent, point) VALUES ('1','A1','9.5'),('1','A2','9'),('1','A5','5.5'),('2','B1','8'),('2','B4','6'),('3','C7','7'),('3','C7','8'),('4','D1','9.5'),('4','D8','10'),('4','D9','10');
SELECT *FROM Student where ageStudent between 15 and 18;
SELECT *FROM Student where SUBSTRING(fullnameStudent,1,6) ='Nguyễn';
SELECT *FROM Student where RIGHT(fullnameStudent,3)='Anh';
SELECT *FROM Student WHERE idStudent ='12';

SELECT C.idClasses , COUNT(S.idStudent) as 'so hoc sinh' FROM Class C join student s on C.idClasses = s.idClasses GROUP BY C.idClasses;
SELECT Adress , COUNT(S.idStudent) as 'so hoc sinh' FROM Adress A join Student S on A.idAdress = S.idAdress GROUP BY A.Adress;
SELECT C.idCourse,C.nameCourse, AVG(P.point)as 'diemTB' From Course C join Point P on C.idCourse = P.idCourse GROUP BY C.idCourse
having diemTB>=ALL(SELECT AVG(P.point)as 'diemTB' From Course C join Point P on C.idCourse = P.idCourse GROUP BY C.idCourse );