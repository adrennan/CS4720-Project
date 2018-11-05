CREATE TABLE teacher(
	TeacherID int AUTO_INCREMENT NOT NULL,
    TeacherName varchar(50) NOT NULL,
    Username varchar(50) NOT NULL,
    Pass varchar(50) NOT NULL,
    CONSTRAINT TeacherID PRIMARY KEY(TeacherID)
);


CREATE TABLE Parent(
	ParentID int AUTO_INCREMENT NOT NULL,
    ParentName varchar(50) NOT NULL,
    Username varchar(50) NOT NULL,
    Pass varchar(50) NOT NULL,
    CONSTRAINT parentPK PRIMARY KEY(ParentID)
);


CREATE TABLE class(
	ClassID int AUTO_INCREMENT NOT NULL,
    ClassName varchar(50) NOT NULL,
    ClassTime varchar(25) NOT NULL,
    TeacherID int,
    Classroom varchar(50) NOT NULL,
    Description varchar(200) NOT NULL,
    CONSTRAINT classPk PRIMARY KEY(ClassID),
    CONSTRAINT fkTeacherID FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID)
);

CREATE TABLE parent_class(
	ClassID int,
    ParentID int,
	CONSTRAINT parentFK FOREIGN KEY (ParentID) REFERENCES Parent(ParentID),
    CONSTRAINT classFK FOREIGN KEY (ClassID) REFERENCES class(ClassID)
);



CREATE TABLE homework(
	HomeworkID int AUTO_INCREMENT NOT NULL,
	ClassID int,
	dueDate dateTime NOT NULL,
	Description varchar(200) NOT NULL,
	isHistorical varchar(1) NOT NULL,
	PRIMARY KEY(HomeworkID),
	CONSTRAINT hwkclassFK FOREIGN KEY (ClassID) REFERENCES class(ClassID)
);



CREATE TABLE activities(
	ActivityID int AUTO_INCREMENT NOT NULL,
    ClassID int,
    ActivityDate dateTime NOT NULL,
    Description varchar(200) NOT NULL,
    CONSTRAINT actPk PRIMARY KEY(ActivityID),
    CONSTRAINT activclassFK FOREIGN KEY (ClassID) REFERENCES class(ClassID)
);
