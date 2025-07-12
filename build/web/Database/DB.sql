/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 8.0.17 : Database - internship_portal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/internship_portal /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE internship_portal;

/*Table structure for table admin */

DROP TABLE IF EXISTS admin;

CREATE TABLE admin (
  user_id varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  admin_name varchar(30) NOT NULL,
  admin_mob_no varchar(10) NOT NULL,
  admin_email_id varchar(30) NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table admin */

insert  into admin(user_id,password,admin_name,admin_mob_no,admin_email_id) values 
('amit123roy','123456789','Amit Roy','9876543210','amit123roy@gmail.com'),
('das_koushik52','987654321','Koushik das','8795463157','das.koushik52@gmail.com'),
('joy2013_biswas','123456789','Joy Biswas','7816490542','joy.biswas@gmail.com');

/*Table structure for table applicant */

DROP TABLE IF EXISTS applicant;

CREATE TABLE applicant (
  applicant_no int(10) NOT NULL AUTO_INCREMENT,
  std_user_email_id varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_name varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_email varchar(30) NOT NULL,
  std_mob_no varchar(10) NOT NULL,
  internship_code varchar(20) NOT NULL,
  Posting_date varchar(20) NOT NULL,
  internship_profile varchar(50) NOT NULL,
  com_email varchar(30) NOT NULL,
  com_name varchar(30) NOT NULL,
  com_mob_no varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  status varchar(15) NOT NULL,
  resume_id int(10) NOT NULL,
  Resume_name varchar(20) DEFAULT NULL,
  Modified_Resume_name varchar(50) DEFAULT NULL,
  Resume_path varchar(100) DEFAULT NULL,
  PRIMARY KEY (applicant_no),
  KEY std_email (std_email),
  KEY com_email (com_email),
  KEY internship_code (internship_code),
  CONSTRAINT applicant_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE,
  CONSTRAINT applicant_ibfk_2 FOREIGN KEY (com_email) REFERENCES employer (emp_email) ON UPDATE CASCADE,
  CONSTRAINT applicant_ibfk_3 FOREIGN KEY (internship_code) REFERENCES internship (internship_code)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table applicant */

insert  into applicant(applicant_no,std_user_email_id,std_name,std_email,std_mob_no,internship_code,Posting_date,internship_profile,com_email,com_name,com_mob_no,status,resume_id,Resume_name,Modified_Resume_name,Resume_path) values 
(4,'isitadey2010@gmail.com','Isita Dey','isitadey2010@gmail.com','7899456122','swd01','2019-09-04','Software Development','p.k@cmcltd.com','Cmc pvt ltd','9876543210','selected',6,'KVIC Answer Key.pdf','isitadey2010@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/isitadey2010@KVIC Answer Key.pdf'),
(5,'isitadey2010@gmail.com','Isita Dey','isitadey2010@gmail.com','7899456122','wedv01','2019-08-23','Web Development','d.kesav@travarsa.com','Travarsa Private Limited','8697902696','selected',6,'KVIC Answer Key.pdf','isitadey2010@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/isitadey2010@KVIC Answer Key.pdf'),
(6,'isitadey2010@gmail.com','Isita Dey','isitadey2010@gmail.com','7899456122','mobappd01','2019-09-30','Mobile App Development','suruchib@teri.res.in','suruchib@teri.res.in','7824682100','selected',6,'KVIC Answer Key.pdf','isitadey2010@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/isitadey2010@KVIC Answer Key.pdf'),
(7,'daspartha221@gmail.com','Partha Das','daspartha221@gmail.com','8274844634','hr01','2019-09-26','Human Resources (HR)','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',5,'KVIC Answer Key.pdf','daspartha221@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/daspartha221@KVIC Answer Key.pdf'),
(8,'daspartha221@gmail.com','Partha Das','daspartha221@gmail.com','8274844634','dgm01','2019-08-31','Digital Marketing','d.kesav@travarsa.com','Travarsa Private Limited','8697902696','selected',5,'KVIC Answer Key.pdf','daspartha221@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/daspartha221@KVIC Answer Key.pdf'),
(9,'daspartha221@gmail.com','Partha Das','daspartha221@gmail.com','8274844634','mak01','2019-09-30','Marketing','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',5,'KVIC Answer Key.pdf','daspartha221@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/daspartha221@KVIC Answer Key.pdf'),
(10,'joy.roy52@gmail.com','Joy Roy','joy.roy52@gmail.com','8756412806','hr01','2019-09-26','Human Resources (HR)','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',0,NULL,NULL,NULL),
(11,'joy.roy52@gmail.com','Joy Roy','joy.roy52@gmail.com','8756412806','mak01','2019-09-30','Marketing','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',0,NULL,NULL,NULL),
(12,'emeli1991@gmail.com','Emeli Nandi','emeli1991@gmail.com','8584357316','hr01','2019-09-26','Human Resources (HR)','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',4,'ssc mts annswer.pdf','emeli1991@ssc mts annswer.pdf','D:/NetBeans/Internship_Portal/web/resume/emeli1991@ssc mts annswer.pdf'),
(13,'emeli1991@gmail.com','Emeli Nandi','emeli1991@gmail.com','8584357316','mak01','2019-09-30','Marketing','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',4,'ssc mts annswer.pdf','emeli1991@ssc mts annswer.pdf','D:/NetBeans/Internship_Portal/web/resume/emeli1991@ssc mts annswer.pdf'),
(14,'isitadey2010@gmail.com','Isita Dey','isitadey2010@gmail.com','7899456122','hr01','2019-09-26','Human Resources (HR)','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',6,'KVIC Answer Key.pdf','isitadey2010@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/isitadey2010@KVIC Answer Key.pdf'),
(15,'mou12sen@gmail.com','Moumita Sen','mou12sen@gmail.com','9231875948','mak01','2019-09-30','Marketing','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',0,NULL,NULL,NULL),
(16,'mou12sen@gmail.com','Moumita Sen','mou12sen@gmail.com','9231875948','dgm01','2019-08-31','Digital Marketing','d.kesav@travarsa.com','Travarsa Private Limited','8697902696','selected',0,NULL,NULL,NULL),
(17,'mou12sen@gmail.com','Moumita Sen','mou12sen@gmail.com','9231875948','hr01','2019-09-26','Human Resources (HR)','m.gupta@timesinternet.in','Times Internet Limited','7218792387','pending',0,NULL,NULL,NULL),
(18,'joy.roy52@gmail.com','Joy Roy','joy.roy52@gmail.com','8756412806','fi01','2019-09-26','Finance','p.k@cmcltd.com','Cmc pvt ltd','9876543210','pending',0,NULL,NULL,NULL),
(19,'joy.roy52@gmail.com','Joy Roy','joy.roy52@gmail.com','8756412806','dgm01','2019-08-31','Digital Marketing','d.kesav@travarsa.com','Travarsa Private Limited','8697902696','selected',0,NULL,NULL,NULL),
(20,'isitadey2010@gmail.com','Isita Dey','isitadey2010@gmail.com','7899456122','dgm01','2019-08-31','Digital Marketing','d.kesav@travarsa.com','Travarsa Private Limited','8697902696','pending',6,'KVIC Answer Key.pdf','isitadey2010@KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/isitadey2010@KVIC Answer Key.pdf'),
(21,'ishitaghose2995@gmail.com','Ishita Ghose','ishitaghose2995@gmail.com','8240218272','fi01','2019-09-26','Finance','p.k@cmcltd.com','Cmc pvt ltd','9876543210','pending',0,NULL,NULL,NULL),
(22,'ishitaghose2995@gmail.com','Ishita Ghose','ishitaghose2995@gmail.com','8240218272','hd01','2020-02-12',' HTML Developer','debjyoti@idiosys.com','idiosys pvt ltd','9876543201','pending',0,NULL,NULL,NULL),
(23,'mou12sen@gmail.com','Moumita Sen','mou12sen@gmail.com','9231875948','hd01','2020-02-12',' HTML Developer','debjyoti@idiosys.com','idiosys pvt ltd','9876543201','pending',0,'','',''),
(24,'mou12sen@gmail.com','Moumita Sen','mou12sen@gmail.com','9231875948','fi01','2019-09-26','Finance','p.k@cmcltd.com','Cmc pvt ltd','9876543210','pending',7,'ssc mts amswer.pdf','mou12sen@ssc mts amswer.pdf','D:/NetBeans/Internship_Portal/web/resume/mou12sen@ssc mts amswer.pdf');

/*Table structure for table contact */

DROP TABLE IF EXISTS contact;

CREATE TABLE contact (
  cont_id int(200) NOT NULL AUTO_INCREMENT,
  cont_name varchar(20) NOT NULL,
  cont_email varchar(30) NOT NULL,
  cont_subject varchar(50) NOT NULL,
  cont_message varchar(500) NOT NULL,
  PRIMARY KEY (cont_id)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table contact */

insert  into contact(cont_id,cont_name,cont_email,cont_subject,cont_message) values 
(1,'isita china','abc@gmail.com','about internship','i want to know that can i apply more than one internship at a time?'),
(2,'Partha','daspartha221@gmail.com','XYZ','XYZ'),
(3,'isi','abc@gmail.com','ta','xh');

/*Table structure for table employer */

DROP TABLE IF EXISTS employer;

CREATE TABLE employer (
  emp_email varchar(30) NOT NULL,
  emp_psw varchar(20) NOT NULL,
  emp_name varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  emp_mob_no varchar(10) NOT NULL,
  PRIMARY KEY (emp_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table employer */

insert  into employer(emp_email,emp_psw,emp_name,emp_mob_no) values 
('d.kesav@travarsa.com','12345678','Travarsa Private Limited','8697902696'),
('debjyoti@idiosys.com','12345678','idiosys pvt ltd','9876543201'),
('i.china@internshouse.com','987654321','Intern House pvt ltd','7899456122'),
('m.gupta@timesinternet.in','123456789','Times Internet Limited','7218792387'),
('p.k@cmcltd.com','12345678','Cmc pvt ltd','9876543210'),
('suruchib@teri.res.in','123456789','The Energy and Resources Institute','7824682100');

/*Table structure for table employer_pd */

DROP TABLE IF EXISTS employer_pd;

CREATE TABLE employer_pd (
  com_name varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_email varchar(30) NOT NULL,
  com_mob_no varchar(10) NOT NULL,
  com_CIN varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_registration_no varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_industry_type varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_DOI varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_address varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_country varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_state varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_district varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_city varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_pincode varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (com_email),
  CONSTRAINT employer_pd_ibfk_1 FOREIGN KEY (com_email) REFERENCES employer (emp_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table employer_pd */

insert  into employer_pd(com_name,com_email,com_mob_no,com_CIN,com_registration_no,com_industry_type,com_DOI,com_address,com_country,com_state,com_district,com_city,com_pincode) values 
('Travarsa Private Limited','d.kesav@travarsa.com','8697902696','U67190TN2014PLC096978','67854920','Education, Employment','2010-09-24','B-610, Unitech Business Zone,Nirvana Country, South City 2, Gurgaon, India - 122018','India','Delhi','Gurgaon','South city','122018'),
('idiosys pvt ltd','debjyoti@idiosys.com','9876543201','12345678','12412340',' private','2014-12-10','saltlake sector 2, BK 147.Kolkata 700091','India','wb','Kolkata','Saltlake','700091'),
('Intern House pvt ltd','i.china@internshouse.com','7899456122','L27100MH1907PLC000260','20105213','IT','2019-09-04','Plot 2, Block E M, Times House, Salt Lake City Sector 5, Kolkata - 700091 ','India','West Bengal','Kolkata','Saltlake','700091'),
('Times Internet Limited','m.gupta@timesinternet.in','7218792387','U74999DL1999PLC135531','58791305','Internet Services','1999-06-09','Times Internet Limited\r\nEcstasy IT Park Plot 391, Udyog Vihar, Phase 3 Gurugram, Haryana - 122016','India','New Delhi','Haryana','Gurugram, Haryana','122016'),
('Cmc pvt ltd','p.k@cmcltd.com','9876543210','L72200TG1975PLC001970','19702203','Information Technology','1975-12-26','CMC CENTRE, OLD MUMBAI HIGHWAY, GACHIBOWLI,500032','India','Mumbai','GACHIBOWLI','Mumbai GACHIBOWLI','500032'),
('The Energy and Resources Institute','suruchib@teri.res.in','7824682100','L35301KA1963PLC001622','85792147','Research Institute','1974-01-01','Plot No. 10, Institutional Area,Vasant Kunj,New Delhi - 110 070','India','New Delhi','New Delhi','Vasant Kunj,New Delhi','110 070');

/*Table structure for table internship */

DROP TABLE IF EXISTS internship;

CREATE TABLE internship (
  internship_code varchar(20) NOT NULL,
  Posting_date varchar(20) NOT NULL,
  internship_profile varchar(50) NOT NULL,
  com_name varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  com_email varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  location varchar(20) NOT NULL,
  skills varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  responsibilities varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  other_skills varchar(50) NOT NULL,
  experience varchar(20) NOT NULL,
  duration varchar(20) NOT NULL,
  stipend varchar(30) NOT NULL,
  description varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (internship_code),
  KEY internship_ibfk_1 (com_email),
  CONSTRAINT internship_ibfk_1 FOREIGN KEY (com_email) REFERENCES employer (emp_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table internship */

insert  into internship(internship_code,Posting_date,internship_profile,com_name,com_email,location,skills,responsibilities,other_skills,experience,duration,stipend,description) values 
('dgm01','2019-08-31','Digital Marketing','Travarsa Private Limited','d.kesav@travarsa.com','Kolkata','Social Media Marketing, English Proficiency (Spoken) (Written)','Assist in Social Media & campaign calendar','','0-1 yrs','1 Months','3000-8000 /Month','1. Learning and participating in various digital marketing strategies\r\n2. Learning and performing search engine optimization and submission\r\n3. Learning and performing social media marketing\r\n4. On-Page and Off-Page SEO\r\n5. Paid and unpaid advertisement champagnes\r\n6. Online reputation management\r\n7. Content marketing\r\n8. Keyword analysis and usage\r\n9. Search engine and directory submission\r\n10. Organic traffic management'),
('ee01','2019-09-15','Electronics Engineering','The Energy and Resources Institute','suruchib@teri.res.in','Pune','English,Hindi and local language(spoken)','Design electronic circuits & associated schematics','','0 yrs','3 Months','3000-6000 /Month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Design electronic circuits & associated schematics\r\n2. Design PCB as per instructions\r\n3. Work on firmware\r\n4. Circuit building, soldering SMD and debugging\r\n5. Work on testing\r\n6. Brainstorm on new ideas'),
('fi01','2019-09-26','Finance','Cmc pvt ltd','p.k@cmcltd.com','Noida','MS-Office, MS-PowerPoint, Accounting, MS-Excel and Financial Modeling','Monitoring workload through Excel file','English (Spoken) (Written)','0 yrs','6 Months','10000/month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Overseeing the workflow of the day-to-day functions (e.g., contract entry; clearing sales suspense; etc.)\r\n2. Analyzing and interpreting contracts, amendments, and abstract forms\r\n3. Handling complex author agreements and amendments\r\n4. Inputting contract and financial information relating to royalties into the royalty system as well as performing general contract maintenance\r\n5. Managing and clearing royalty sales suspense and subsidiary rights deferred items\r\n6. Responding/resolving inquiries/requests from business units, editorial groups, legal department, contracts department, authors, agents, and other groups both from inside and outside Pearson\r\n7. Assisting Supervisor in preparation of monthly suspense packet\r\n8. Monitoring workload through the Contracts Work Log (CWL) and providing monthly metrics of backlog Excel\r\n9. Monitoring workload through Excel file'),
('hd01','2020-02-12',' HTML Developer','idiosys pvt ltd','debjyoti@idiosys.com','Saltlake',' HTML, CSS, JavaScript','Team Handling','','0 yrs','3 Months','3000-6000 /Month','Team Handling'),
('hr01','2019-09-26','Human Resources (HR)','Times Internet Limited','m.gupta@timesinternet.in','Noida','MS-Excel, English Proficiency (Spoken) and (Written)','Handling end to end recruitment of different positions assigned','','0 yrs','3 Months','8000 /Month','Selected interns day-to-day responsibilities include:\r\n1. Sourcing, screening, conducting the telephonic interview, and scheduling interviews with the hiring manager\r\n2. Posting jobs on different social media job portals\r\n3. Managing the candidates tracker and database\r\n4. Managing and coordinating with the hiring manager for the interviews.'),
('jbd01','2019-09-11','Java Backend Development','Travarsa Private Limited','d.kesav@travarsa.com','kolkata','Java and MySQL','Managing the direction of the whole tech stack as well as of the implementation','','0 yrs','2 Months','4000 /Month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Helping with the creation of back-end of an aggregator platform with a huge footprint in Asia\r\n2. Working on a breadth of services ranging from search, recommendations, finance, and payments\r\n\r\nOther requirements:\r\nIn-depth understanding of the entire backend development process (design, development, and deployment)\r\nHands-on mentality and focus on getting the right things done\r\nAbility to solve a problem logically and mathematically\r\nShould have good knowledge of Spring Boot, Java 8 and Maven'),
('mak01','2019-09-30','Marketing','Times Internet Limited','m.gupta@timesinternet.in','Noida','MS-Excel, English Proficiency (Spoken) and (Written)','Working with the team to brainstorm new and innovative growth & marketing strategies','','0 yrs','6 Months','10000 /Month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Interacting with clients.\r\n2. Handling the marketing of events.\r\n3.Handling delegate acquisition.'),
('mobappd01','2019-09-30','Mobile App Development','The Energy and Resources Institute','suruchib@teri.res.in','Delhi','iOS and Android','Team Handling','English Proficiency spoken','0 yrs','6 Months','5000-7000 /Month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Contributing to the development of a mobile application for various research projects and events\r\n2. Working on Android and IOS applications\r\n3. Learn new mobile technologies'),
('pd01','2019-09-19','PHP Development','Travarsa Private Limited','d.kesav@travarsa.com','Bangalore','PHP, MySQL, HTML, CSS, JavaScript and WordPress','Team Handling','English (Spoken) (Written)','0 yrs','3 Months','8000-10000 /Month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Develop the organization Application\r\n2. Work on Core PHP, Codeigniter (any PHP framework), MySQL, Javascript, HTML, HTML 5, WordPress'),
('swd01','2019-09-04','Software Development','Cmc pvt ltd','p.k@cmcltd.com','Mumbai','C#, .NET and ASP.NET','Team Handling','English Proficiency spoken','0 yrs','6 Months','5000-7000 /Month','Selected interns day-to-day responsibilities include:\r\n1. Contribute to software development projects (.Net, C#, MVC, SharePoint)\r\n2. Assist in the development of in-house ERP projects\r\n3. Assist in developing a new interface for in-house software applications..\r\n\r\nOnly those candidates can apply who:\r\n1.are available for full time (in-office) internship\r\n2.have relevant skills and interests'),
('wd01','2019-09-22','Web Designing','Travarsa Private Limited','d.kesav@travarsa.com','kolkata, Delhi','nothing','nothing','','0 yrs','6 Months','8000-15000 /Month','Selected interns day-to-day responsibilities include:\r\n\r\n1. Illustrate design ideas using storyboards, process flows and sitemaps\r\n2. Design graphic user interface elements, like menus, tabs, and widgets\r\n3. Develop UI mockups and prototypes that clearly illustrate how sites function and look like'),
('wedv01','2019-08-23','Web Development','Travarsa Private Limited','d.kesav@travarsa.com','Kolkata','PHP, MySQL, HTML, CSS, WordPress and AJAX','Manage the front end and backend operations and wireframing of the website','English Proficiency','0-1 yrs','6 Months','3000-8000 /Month','1. Handle any website issues as the entire team will be depending on your expertise.\r\n2. Edit, build & secure plugins/ modules.\r\n3. Upload/change content on the website from time-to-time.\r\n4. Fix bugs on the website.\r\n5. Increase the speed of the website.\r\n6. Manage the website database.\r\nOnly those candidates can apply who:are available for full time (in-office) internship and have relevant skills and interests.');

/*Table structure for table student */

DROP TABLE IF EXISTS student;

CREATE TABLE student (
  std_name varchar(20) NOT NULL,
  std_email varchar(30) NOT NULL,
  std_psw varchar(20) NOT NULL,
  std_mob_no varchar(10) NOT NULL,
  PRIMARY KEY (std_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student */

insert  into student(std_name,std_email,std_psw,std_mob_no) values 
('Partha Das','daspartha221@gmail.com','parthadas','8274844634'),
('Emeli Nandi','emeli1991@gmail.com','987654321','8584357316'),
('Ishita Ghose','ishitaghose2995@gmail.com','12345678','8240218272'),
('Isita Dey','isitadey2010@gmail.com','12345678','7899456122'),
('Joy Roy','joy.roy52@gmail.com','987654321','8756412806'),
('Moumita Sen','mou12sen@gmail.com','123456789','9231875948'),
('Koyel pal','palkoyel1995@gmail.com','123456789','7598463217'),
('ram chandra china','r1@gmail.com','12345678','9876543201');

/*Table structure for table student_ed_diploma */

DROP TABLE IF EXISTS student_ed_diploma;

CREATE TABLE student_ed_diploma (
  std_email varchar(30) NOT NULL,
  std_diploma_status varchar(20) NOT NULL,
  std_stream varchar(30) NOT NULL,
  std_college varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_start_year int(4) NOT NULL,
  std_end_year int(4) NOT NULL,
  std_performance_scale varchar(20) NOT NULL,
  std_marks float(4,2) NOT NULL,
  std_education_type varchar(20) NOT NULL,
  KEY std_email (std_email),
  CONSTRAINT student_ed_diploma_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_ed_diploma */

insert  into student_ed_diploma(std_email,std_diploma_status,std_stream,std_college,std_start_year,std_end_year,std_performance_scale,std_marks,std_education_type) values 
('isitadey2010@gmail.com','Completed','Computer Science & Technology','Womens polytechnic, Kolkata',2013,2016,'CGPA',8.20,'Fulltime'),
('daspartha221@gmail.com','Completed','Metallurgy','Engineering Institute For Junior Executives',2015,2018,'CGPA',8.80,'Fulltime'),
('emeli1991@gmail.com','Completed','HR','George Telegraph',2015,2016,'Percentage',60.00,'Fulltime');

/*Table structure for table student_ed_gd */

DROP TABLE IF EXISTS student_ed_gd;

CREATE TABLE student_ed_gd (
  std_email varchar(30) NOT NULL,
  std_graduation_status varchar(20) NOT NULL,
  std_degree varchar(50) NOT NULL,
  std_stream varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_college_university varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_start_year int(4) NOT NULL,
  std_end_year int(4) NOT NULL,
  std_performance_scale varchar(20) NOT NULL,
  std_marks float(4,2) NOT NULL,
  std_education_type varchar(20) NOT NULL,
  KEY std_email (std_email),
  CONSTRAINT student_ed_gd_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_ed_gd */

insert  into student_ed_gd(std_email,std_graduation_status,std_degree,std_stream,std_college_university,std_start_year,std_end_year,std_performance_scale,std_marks,std_education_type) values 
('isitadey2010@gmail.com','Pursuing','Bachelor of Computer Applications (BCA)','Computer Application','IGNOU',2017,2020,'percentage',60.00,'Correspondence'),
('joy.roy52@gmail.com','Pursuing','Bachelor of Commerce (B.Com) (Hons.)','Accounts','City College of Commerce and Business Administration',2010,2013,'Percentage',60.00,'Fulltime'),
('daspartha221@gmail.com','Completed','Bachelor of Science (B.Sc) (Hons.)','Physics','N.D. College',2013,2016,'Percentage',55.00,'Fulltime'),
('palkoyel1995@gmail.com','Completed','Bachelor of Technology (B.Tech)','Computer Science & Engineering','Meghnad Saha Institute Of Technology',2013,2017,'CGPA',8.00,'Fulltime'),
('emeli1991@gmail.com','Completed','Bachelor of Arts (B.A.) (Hons.)','Mass Communication Film and Television Studies','IMCFTS',2012,2015,'Percentage',50.00,'Fulltime'),
('mou12sen@gmail.com','Pursuing','Bachelor of Business Administration (BBA)','Marketing','New Delhi Institute Of Management',2017,2020,'Percentage',80.00,'Fulltime');

/*Table structure for table student_ed_pgd */

DROP TABLE IF EXISTS student_ed_pgd;

CREATE TABLE student_ed_pgd (
  std_email varchar(30) NOT NULL,
  std_graduation_status varchar(20) NOT NULL,
  std_degree varchar(50) NOT NULL,
  std_stream varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_college_university varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_start_year int(4) NOT NULL,
  std_end_year int(4) NOT NULL,
  std_performance_scale varchar(20) NOT NULL,
  std_marks float(4,2) NOT NULL,
  std_education_type varchar(20) NOT NULL,
  KEY std_email (std_email),
  CONSTRAINT student_ed_pgd_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_ed_pgd */

insert  into student_ed_pgd(std_email,std_graduation_status,std_degree,std_stream,std_college_university,std_start_year,std_end_year,std_performance_scale,std_marks,std_education_type) values 
('joy.roy52@gmail.com','Completed','Master of Commerce (M.Com)','Accounts','calcutta university',2014,2016,'Percentage',50.00,'Fulltime'),
('palkoyel1995@gmail.com','Pursuing','Master of Technology (M.Tech)','Computer Science & Engineering','Maulana Abul Kalam Azad University of Technology',2018,2020,'CGPA',7.00,'Fulltime');

/*Table structure for table student_ed_x */

DROP TABLE IF EXISTS student_ed_x;

CREATE TABLE student_ed_x (
  std_email varchar(30) NOT NULL,
  std_board varchar(50) NOT NULL,
  std_passing_year int(4) NOT NULL,
  std_performance_scale varchar(20) NOT NULL,
  std_marks float(4,2) NOT NULL,
  std_school varchar(50) NOT NULL,
  std_education_type varchar(20) NOT NULL,
  KEY std_email (std_email),
  CONSTRAINT student_ed_x_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_ed_x */

insert  into student_ed_x(std_email,std_board,std_passing_year,std_performance_scale,std_marks,std_school,std_education_type) values 
('daspartha221@gmail.com','WBBSE',2011,'Percentage',68.00,'Salkia Hindu School','Fulltime'),
('isitadey2010@gmail.com','WBBSE',2011,'Percentage',78.00,'Bantra B.B.P.C Girls High School','Fulltime'),
('joy.roy52@gmail.com','CBSE',2008,'Percentage',85.00,'Birla High School','Fulltime'),
('palkoyel1995@gmail.com','WBBSE',2010,'Percentage',65.00,'Jadavpur Adarsha Balika Sikshayatan','Fulltime'),
('emeli1991@gmail.com','WBBSE',2010,'Percentage',65.00,'St. Xaviers School','Fulltime'),
('mou12sen@gmail.com','CBSE',2015,'Percentage',80.00,'Delhi Public School','Fulltime'),
('ishitaghose2995@gmail.com','WBBSE',2011,'Percentage',72.00,'Tara sundari balika bidyabhaban.','Fulltime');

/*Table structure for table student_ed_xii */

DROP TABLE IF EXISTS student_ed_xii;

CREATE TABLE student_ed_xii (
  std_email varchar(30) NOT NULL,
  std_board varchar(50) NOT NULL,
  std_passing_year int(4) NOT NULL,
  std_stream varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  std_performance_scale varchar(20) NOT NULL,
  std_marks float(4,2) NOT NULL,
  std_school varchar(50) NOT NULL,
  std_education_type varchar(20) NOT NULL,
  KEY std_email (std_email),
  CONSTRAINT student_ed_xii_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_ed_xii */

insert  into student_ed_xii(std_email,std_board,std_passing_year,std_stream,std_performance_scale,std_marks,std_school,std_education_type) values 
('daspartha221@gmail.com','WBCHSE',2013,'Science','Percentage',64.00,'Salkia Hindu School','Fulltime'),
('isitadey2010@gmail.com','WBCHSE',2013,'Science','Percentage',55.00,'Bantra B.B.P.C Girls High School','Fulltime'),
('joy.roy52@gmail.com','CBSE',2010,'Commerce','Percentage',80.00,'Birla High School','Fulltime'),
('palkoyel1995@gmail.com','WBBSE',2012,'Science','Percentage',58.00,'Jadavpur High school','Fulltime'),
('emeli1991@gmail.com','WBBSE',2012,'Commerce','Percentage',60.00,'St. Xaviers School','Fulltime'),
('mou12sen@gmail.com','CBSE',2017,'Commerce','Percentage',75.00,'Delhi Public School','Fulltime'),
('ishitaghose2995@gmail.com','WBBSE',2013,'Science','Percentage',60.00,'Tara sundari balika bidyabhaban.','Fulltime');

/*Table structure for table student_id */

DROP TABLE IF EXISTS student_id;

CREATE TABLE student_id (
  sl_no int(10) NOT NULL AUTO_INCREMENT,
  std_email varchar(30) NOT NULL,
  std_profile varchar(50) NOT NULL,
  std_organization varchar(50) NOT NULL,
  std_location varchar(30) NOT NULL,
  std_start_date varchar(20) NOT NULL,
  std_end_date varchar(20) NOT NULL,
  PRIMARY KEY (sl_no),
  KEY student_id_ibfk_1 (std_email),
  CONSTRAINT student_id_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_id */

insert  into student_id(sl_no,std_email,std_profile,std_organization,std_location,std_start_date,std_end_date) values 
(1,'joy.roy52@gmail.com','Accounting and Finance','Aoratas Technica Engineering Private Limited','Delhi','2016-10-01','2017-04-30'),
(2,'joy.roy52@gmail.com','Accounts','MakeMyTrip ','Kolkata','2017-08-04','2017-12-31'),
(3,'daspartha221@gmail.com','Junior Engineer','Kiswok Industries Pvt. Ltd.','Howrah','2018-08-10','2019-02-10'),
(6,'emeli1991@gmail.com','Educational Counselor','ISBM','Parkstreet, Kolkata','2016-08-19','2017-04-20'),
(7,'emeli1991@gmail.com','Administration Department','FMCG- Krazy for Chocolate','Kolkata','2017-11-01','2018-05-31'),
(11,'isitadey2010@gmail.com','HR','VComply','kolkata','2019-08-01','2020-01-31'),
(12,'isitadey2010@gmail.com','Computer Operator','PWC','kolkata','2019-03-01','2019-07-31');

/*Table structure for table student_pd */

DROP TABLE IF EXISTS student_pd;

CREATE TABLE student_pd (
  std_name varchar(20) NOT NULL,
  std_email varchar(30) NOT NULL,
  std_mob_no varchar(10) NOT NULL,
  std_dob varchar(20) NOT NULL,
  std_gender varchar(10) NOT NULL,
  std_address varchar(50) NOT NULL,
  std_state varchar(20) NOT NULL,
  std_district varchar(20) NOT NULL,
  std_city varchar(20) NOT NULL,
  std_pincode varchar(10) NOT NULL,
  PRIMARY KEY (std_email),
  CONSTRAINT student_pd_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_pd */

insert  into student_pd(std_name,std_email,std_mob_no,std_dob,std_gender,std_address,std_state,std_district,std_city,std_pincode) values 
('Partha Das','daspartha221@gmail.com','8274844634','1995-09-12','Male','70/A/1 Panchanantala Road Liluah Howarh 711204','West Bengal','Howrah','Liluah Howrah','711204'),
('Emeli Nandi','emeli1991@gmail.com','8584357316','1991-01-23','Female','14/c Haldia township Purba Medinipur 721607','West Bengal','Purba Medinipur','Haldia','721607'),
('Ishita Ghose','ishitaghose2995@gmail.com','8240218272','1994-10-29','Female','how','wb','Howrah','howrah','711113'),
('Isita Dey','isitadey2010@gmail.com','7899456122','1994-09-26','Female','1/1 Dinulane Kadamatala Howrah 711101','West Bengal','Howrah','Kadamtala Howrah','711101'),
('Joy Roy','joy.roy52@gmail.com','8756412806','1991-07-12','Male','65, Park St, Taltala, Kolkata, West Bengal 700016','West Bengal','Kolkata','Kolkata','700016'),
('Moumita Sen','mou12sen@gmail.com','9231875948','1997-06-09','Female','13/341 DDA Flats madangir New Delhi-62','Delhi','delhi','delhi','110062'),
('Koyel pal','palkoyel1995@gmail.com','7598463217','1994-10-08','Female','12, Gouranga Sarani Kolkata-700078','West Bengal','Kolkata','Kolkata','700078'),
('ram chandra china','r1@gmail.com','9876543201','','','','','','','');

/*Table structure for table student_resume */

DROP TABLE IF EXISTS student_resume;

CREATE TABLE student_resume (
  sl_no int(10) NOT NULL AUTO_INCREMENT,
  std_email varchar(30) NOT NULL,
  Resume_name varchar(20) NOT NULL,
  Resume_path varchar(100) NOT NULL,
  Modified_Resume_name varchar(50) NOT NULL,
  PRIMARY KEY (sl_no),
  KEY std_email (std_email),
  CONSTRAINT student_resume_ibfk_1 FOREIGN KEY (std_email) REFERENCES student (std_email) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table student_resume */

insert  into student_resume(sl_no,std_email,Resume_name,Resume_path,Modified_Resume_name) values 
(4,'emeli1991@gmail.com','ssc mts annswer.pdf','D:/NetBeans/Internship_Portal/web/resume/emeli1991@ssc mts annswer.pdf','emeli1991@ssc mts annswer.pdf'),
(5,'daspartha221@gmail.com','KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/daspartha221@KVIC Answer Key.pdf','daspartha221@KVIC Answer Key.pdf'),
(6,'isitadey2010@gmail.com','KVIC Answer Key.pdf','D:/NetBeans/Internship_Portal/web/resume/isitadey2010@KVIC Answer Key.pdf','isitadey2010@KVIC Answer Key.pdf'),
(7,'mou12sen@gmail.com','ssc mts amswer.pdf','D:/NetBeans/Internship_Portal/web/resume/mou12sen@ssc mts amswer.pdf','mou12sen@ssc mts amswer.pdf');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
