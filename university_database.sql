CREATE TABLE faculty (
    facultycode INT PRIMARY KEY,
    facultyname VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE major (
    majorcode VARCHAR2(50) PRIMARY KEY,
    majorname VARCHAR2(100) UNIQUE,
    facultycode INT,
    FOREIGN KEY (facultycode) REFERENCES faculty(facultycode)
);

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    fname VARCHAR2(100) NOT NULL,
    lname VARCHAR2(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    bdate DATE,
    std_level CHAR(1) CHECK (std_level IN ('1','2','3','4')),
    majorcode VARCHAR2(10),
    FOREIGN KEY (majorcode) REFERENCES major(majorcode)
);

CREATE TABLE instructor (
    instid INT PRIMARY KEY,
    fname VARCHAR2(100) NOT NULL,
    lname VARCHAR2(100) NOT NULL,
    status VARCHAR2(20),
    facultycode INT,
    salary NUMBER(10,2) CHECK (salary BETWEEN 5000 AND 30000),
    FOREIGN KEY (facultycode) REFERENCES faculty(facultycode)
);

CREATE TABLE course (
    majorcode VARCHAR2(20),
    courseNo VARCHAR2(20),
    coursename VARCHAR2(100),
    CreditHours INT,
    PRIMARY KEY (majorcode, courseNo),
    FOREIGN KEY (majorcode) REFERENCES major(majorcode)
);

CREATE TABLE section (
    majorcode VARCHAR2(20),
    courseNo VARCHAR2(20),
    sectionNo INT,
    semester VARCHAR2(20),
    Year INT,
    weekday VARCHAR2(20),
    time_ VARCHAR2(20),
    instid INT,
    PRIMARY KEY (majorcode, courseNo, sectionNo, semester, Year),
    FOREIGN KEY (majorcode, courseNo) REFERENCES course(majorcode, courseNo),
    FOREIGN KEY (instid) REFERENCES instructor(instid)
);

CREATE TABLE transcript (
    student_id INT,
    majorcode VARCHAR2(20),
    courseno VARCHAR2(20),
    sectionNo INT,
    semester VARCHAR2(20),
    Year INT,
    grade NUMBER(5,2),
    PRIMARY KEY (student_id, majorcode, courseno, sectionNo, semester, Year),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (majorcode, courseno, sectionNo, semester, Year) 
        REFERENCES section(majorcode, courseNo, sectionNo, semester, Year)
);


INSERT ALL
    INTO faculty VALUES (200, 'Engineering')
    INTO faculty VALUES (201, 'Science')
    INTO faculty VALUES (202, 'Computer')
    INTO faculty VALUES (203, 'Business')
    INTO faculty VALUES (204, 'Arts')
    INTO faculty VALUES (205, 'Medicine')
    INTO faculty VALUES (206, 'Law')
    INTO faculty VALUES (207, 'Education')
    INTO faculty VALUES (208, 'Agriculture')
    INTO faculty VALUES (209, 'Pharmacy')
SELECT * FROM dual;

INSERT ALL
    INTO major VALUES ('101', 'Computer Engineering', 200)
    INTO major VALUES ('102', 'Electrical Engineering', 200)
    INTO major VALUES ('201', 'Physics', 201)
    INTO major VALUES ('202', 'Chemistry', 201)
    INTO major VALUES ('211', 'Software Engineering', 202)
    INTO major VALUES ('212', 'Information Systems', 202)
    INTO major VALUES ('301', 'Accounting', 203)
    INTO major VALUES ('302', 'Marketing', 203)
    INTO major VALUES ('401', 'English Literature', 204)
    INTO major VALUES ('501', 'General Medicine', 205)
SELECT * FROM dual;

INSERT ALL
    INTO student VALUES (1001, 'Ahmed', 'Mohamed', 'M', TO_DATE('2000-05-15', 'YYYY-MM-DD'), '4', '211')
    INTO student VALUES (1002, 'Sara', 'Ahmed', 'F', TO_DATE('2001-03-20', 'YYYY-MM-DD'), '3', '212')
    INTO student VALUES (1003, 'Mohamed', 'Ali', 'M', TO_DATE('1999-08-10', 'YYYY-MM-DD'), '4', '101')
    INTO student VALUES (1004, 'Fatima', 'Hassan', 'F', TO_DATE('2000-12-01', 'YYYY-MM-DD'), '4', '211')
    INTO student VALUES (1005, 'Omar', 'Khalid', 'M', TO_DATE('2001-06-25', 'YYYY-MM-DD'), '3', '301')
    INTO student VALUES (1006, 'Noor', 'Mahmoud', 'F', TO_DATE('2000-09-14', 'YYYY-MM-DD'), '4', '212')
    INTO student VALUES (1007, 'Ali', 'Hussein', 'M', TO_DATE('1999-04-30', 'YYYY-MM-DD'), '2', '102')
    INTO student VALUES (1008, 'Layla', 'Ibrahim', 'F', TO_DATE('2001-11-05', 'YYYY-MM-DD'), '3', '201')
    INTO student VALUES (1009, 'Youssef', 'Tarek', 'M', TO_DATE('2000-02-18', 'YYYY-MM-DD'), '4', '211')
    INTO student VALUES (1010, 'Mona', 'Saeed', 'F', TO_DATE('1999-07-22', 'YYYY-MM-DD'), '1', '401')
SELECT * FROM dual;

INSERT ALL
    INTO instructor VALUES (2001, 'Khalil', 'Mohamed', 'Full-time', 202, 15000)
    INTO instructor VALUES (2002, 'Ahmed', 'Ali', 'Part-time', 200, 8000)
    INTO instructor VALUES (2003, 'Mona', 'Saeed', 'Full-time', 202, 25000)
    INTO instructor VALUES (2004, 'Hassan', 'Khalil', 'Part-time', 203, 5000)
    INTO instructor VALUES (2005, 'Nadia', 'Omar', 'Full-time', 202, 20000)
    INTO instructor VALUES (2006, 'Tarek', 'Mahmoud', 'Part-time', 200, 5000)
    INTO instructor VALUES (2007, 'Sara', 'Hussein', 'Full-time', 204, 17000)
    INTO instructor VALUES (2008, 'Omar', 'Tawfik', 'Part-time', 205, 8000)
    INTO instructor VALUES (2009, 'Layla', 'Fathi', 'Full-time', 202, 28000)
    INTO instructor VALUES (2010, 'Ali', 'Youssef', 'Part-time', 200, 15000)
SELECT * FROM dual;

INSERT ALL
    INTO course VALUES ('211', '301', 'Data Structures', 3)
    INTO course VALUES ('211', '302', 'Algorithms', 4)
    INTO course VALUES ('211', '401', 'Database Systems', 3)
    INTO course VALUES ('212', '301', 'Web Development', 3)
    INTO course VALUES ('212', '302', 'Network Security', 3)
    INTO course VALUES ('101', '201', 'Digital Logic', 4)
    INTO course VALUES ('101', '202', 'Microprocessors', 3)
    INTO course VALUES ('301', '101', 'Financial Accounting', 3)
    INTO course VALUES ('301', '102', 'Managerial Accounting', 3)
    INTO course VALUES ('201', '101', 'Classical Mechanics', 4)
SELECT * FROM dual;

INSERT ALL
    INTO section VALUES ('211', '301', 1, 'Spring', 2020, 'Monday', '09:00:00', 2001)
    INTO section VALUES ('211', '301', 2, 'Spring', 2020, 'Wednesday', '11:00:00', 2003)
    INTO section VALUES ('211', '302', 1, 'Spring', 2020, 'Tuesday', '10:00:00', NULL)
    INTO section VALUES ('212', '301', 1, 'Spring', 2020, 'Thursday', '14:00:00', 2005)
    INTO section VALUES ('211', '401', 1, 'Fall', 2019, 'Monday', '09:00:00', 2001)
    INTO section VALUES ('211', '401', 1, 'Spring', 2020, 'Monday', '09:00:00', 2001)
    INTO section VALUES ('101', '201', 1, 'Spring', 2020, 'Wednesday', '13:00:00', NULL)
    INTO section VALUES ('301', '101', 1, 'Spring', 2020, 'Tuesday', '08:00:00', 2004)
    INTO section VALUES ('201', '101', 1, 'Fall', 2019, 'Friday', '10:00:00', 2006)
    INTO section VALUES ('211', '302', 1, 'Fall', 2019, 'Tuesday', '10:00:00', 2001)
SELECT * FROM dual;

INSERT ALL
    INTO transcript VALUES (1001, '211', '301', 1, 'Spring', 2020, 85.5)
    INTO transcript VALUES (1001, '211', '302', 1, 'Spring', 2020, 90.0)
    INTO transcript VALUES (1002, '212', '301', 1, 'Spring', 2020, 78.0)
    INTO transcript VALUES (1003, '101', '201', 1, 'Spring', 2020, 82.5)
    INTO transcript VALUES (1004, '211', '401', 1, 'Fall', 2019, 95.0)
    INTO transcript VALUES (1004, '211', '401', 1, 'Spring', 2020, 88.0)
    INTO transcript VALUES (1006, '212', '301', 1, 'Spring', 2020, 92.5)
    INTO transcript VALUES (1008, '201', '101', 1, 'Fall', 2019, 76.0)
    INTO transcript VALUES (1009, '211', '302', 1, 'Fall', 2019, 87.0)
    INTO transcript VALUES (1005, '301', '101', 1, 'Spring', 2020, 81.0)
SELECT * FROM dual;

COMMIT;


SELECT * 
FROM student;

SELECT * 
FROM faculty ORDER BY facultycode DESC;

SELECT * 
FROM student 
WHERE gender = 'M';

SELECT * 
FROM student 
WHERE gender = 'F';

SELECT * 
FROM instructor 
WHERE salary BETWEEN 15000 AND 17550;

SELECT * 
FROM instructor 
WHERE salary IN (5000, 8000, 15000);

SELECT fname || ' ' || lname AS fullname 
FROM student 
WHERE majorcode IS NOT NULL;

SELECT COUNT(*) 
FROM section 
WHERE instid IS NULL;

SELECT SUM(salary) AS total_salary 
FROM instructor 
WHERE facultycode = 202;

SELECT * FROM student 
WHERE std_level = '4' 
ORDER BY lname ASC;

SELECT student_id, fname || ' ' || lname AS fullname 
FROM student 
WHERE std_level = '4' AND gender = 'M';

SELECT * 
FROM student ORDER BY std_level ASC, lname ASC;

SELECT * 
FROM section 
WHERE semester = 'Spring' AND year = 2020;

SELECT * 
FROM student ORDER BY std_level DESC, fname ASC;

SELECT * 
FROM section 
WHERE semester = 'Spring' AND year = 2020 AND instid IS NULL;

SELECT * 
FROM student 
WHERE fname LIKE 'Moh%' AND lname LIKE '%sh';

SELECT * 
FROM student 
WHERE fname LIKE '%sh%';

SELECT fname, lname, TRUNC(MONTHS_BETWEEN(SYSDATE, bdate) / 12) AS Student_Age 
FROM student;

SELECT fname, lname, salary, (salary * 1.10) AS Salary_After_Raise 
FROM instructor;

SELECT SUM(salary) AS Total_Salaries, SUM(salary) * 1.15 AS Total_After_Raise 
FROM instructor 
WHERE facultycode = 202;

SELECT s.* 
FROM section s JOIN instructor i ON s.instid = i.instid 
WHERE i.fname = 'Khalil' AND s.semester = 'Spring' AND s.year = 2020;

SELECT s.* 
FROM section s JOIN instructor i ON s.instid = i.instid 
WHERE i.fname = 'Khalil' AND s.year IN (2018, 2019, 2020);

SELECT fname, lname 
FROM instructor i JOIN faculty f ON i.facultycode = f.facultycode 
WHERE f.facultyname = 'Computer' AND i.instid NOT IN (SELECT instid FROM section 
WHERE semester = 'Spring' AND year = 2020 AND instid IS NOT NULL);

SELECT majorcode, COUNT(student_id) 
FROM student 
GROUP BY majorcode 
HAVING COUNT(student_id) < 20;

SELECT courseno, sectionNo, year, COUNT(student_id) AS Students_Count
FROM transcript
WHERE year IN (2019, 2020)
GROUP BY courseno, sectionNo, year;

SELECT fname || ' ' || lname AS FullName 
FROM student;

SELECT UPPER(fname), LOWER(lname) 
FROM student;

SELECT fname, TRUNC(MONTHS_BETWEEN(SYSDATE, bdate) / 12) AS Age 
FROM student;

SELECT SUBSTR(fname, 1, 3) AS First_3, SUBSTR(fname, -3) AS Last_3 
FROM student;

SELECT * 
FROM student 
WHERE fname LIKE 'A%';

SELECT * 
FROM student 
WHERE LENGTH(lname) > 5;

SELECT fname, (30 - TRUNC(MONTHS_BETWEEN(SYSDATE, bdate) / 12)) AS Years_to_30 
FROM student;

SELECT std_level, COUNT(*) 
FROM student 
GROUP BY std_level;

SELECT majorcode, COUNT(*) 
FROM student 
GROUP BY majorcode;

SELECT MAX(salary), MIN(salary) 
FROM instructor;

SELECT status, AVG(salary) 
FROM instructor 
GROUP BY status;

SELECT majorcode, COUNT(*) 
FROM course 
GROUP BY majorcode;

SELECT courseno, COUNT(*) 
FROM section 
GROUP BY courseno;

SELECT courseno, AVG(grade) 
FROM transcript 
GROUP BY courseno;

SELECT courseno, year, COUNT(student_id) 
FROM transcript 
GROUP BY courseno, year;

SELECT majorcode, SUM(CreditHours) 
FROM course 
GROUP BY majorcode;

SELECT student_id, MAX(grade) 
FROM transcript 
GROUP BY student_id;

SELECT courseno, AVG(grade) 
FROM transcript 
GROUP BY courseno 
HAVING AVG(grade) > 80;