CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_name` varchar(75) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `usertypeid` varchar(75) DEFAULT NULL,
  `loginstatus` varchar(75) NOT NULL DEFAULT '1',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `no_of_logins` int(11) DEFAULT '0',
  `ipaddress` varchar(80) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_name` (`login_name`)
);



/* Survey Index table*/
CREATE TABLE `survey_index` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_name` text NOT NULL,
  `survey_purpose` text NOT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

/* Survey Question type table*/
CREATE TABLE `survey_question_types` (
  `question_type_id` int(11) NOT NULL,
  `question_type` text NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`question_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Survey Question index table*/
CREATE TABLE `survey_question_index` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `question_type` int(11) NOT NULL,
  `question_description` text NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `survey_id` (`survey_id`),
  KEY `question_type` (`question_type`),
  CONSTRAINT `question_type_idk` FOREIGN KEY (`question_type`) REFERENCES `survey_question_types` (`question_type_id`) ON UPDATE NO ACTION,
  CONSTRAINT `survey_idk` FOREIGN KEY (`survey_id`) REFERENCES `survey_index` (`survey_id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

/* Survey Question options table*/

CREATE TABLE `survey_options_of_questions` (
  `question_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `value_of_option` int(11) DEFAULT NULL,
  `sequence_of_option` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Survey answers table*/

CREATE TABLE `survey_answers` (
  `question_id` int(11) NOT NULL,
  `option` int(11) NOT NULL,
  `personid` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  KEY `question_id` (`question_id`),
  KEY `personid` (`personid`),
  CONSTRAINT `personidk` FOREIGN KEY (`personid`) REFERENCES `login` (`login_id`),
  CONSTRAINT `survey_question_idk` FOREIGN KEY (`question_id`) REFERENCES `survey_question_index` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/* constarint foreign key Added 10 Nov*/
ALTER TABLE `survey_options_of_questions` ADD  CONSTRAINT `question_idk` FOREIGN KEY (`question_id`) REFERENCES `survey`.`survey_question_index`(`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT; 


/* option value changed to text*/
ALTER TABLE `survey_answers` CHANGE `option` `option` TEXT default NULL ;

alter table survey_question_index add column required int(1) default 0;

/* alignment type of each question : horizontal - 0 , vertical 1*/
ALTER TABLE `survey_question_index` ADD `alignment_type` INT(1) NOT NULL  default 0;
/*graph type added on 29 nov*/
ALTER TABLE `survey_question_index` ADD `graph_type` INT( 2 ) NOT NULL DEFAULT '0' COMMENT '0 - bar graph, 1- pie chart';


/* addition of slider implementation*/
INSERT INTO `survey`.`survey_question_types` (`question_type_id`, `question_type`, `comments`) VALUES ('5', 'slider with limits', 'slider can be defined with lower and upper limits with step size');

alter table survey_question_index add column `lower_limit` int(11) default NULL;
alter table survey_question_index add column `upper_limit` int(11) default NULL;
alter table survey_question_index add column `step_size` int(11) default NULL;

ALTER TABLE `survey_index` ADD `start_date` DATE NULL ,
ADD `end_date` DATE NULL ;

/*bulk mail logs - creation table*/
CREATE TABLE `bulk_mail_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `workshop_id` text,
  `status` text,
  `count_of_participants` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `mail_content` text NOT NULL,
  `subject` text NOT NULL,
  `cc` text,
  `from` text NOT NULL,
  `file_attachment_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `bulk_mail_logs` CHANGE `file_attachment_path` `file_attachment_path` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL ;
/* database name added in the bulk mail logs : */
alter table bulk_mail_logs add column `database_name` varchar(30) NOT NULL;

alter table bulk_mail_logs add column `typeofmail` int(2) NOT NULL;


 CREATE TABLE `survey_question_index_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `row_description` text NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `survey_question_index_rows_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `survey_question_index` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `survey`.`survey_question_types` (`question_type_id`, `question_type`, `comments`) VALUES ('6', 'Multiple choice grid', 'set up a grid of variables and choices');

/* added on 11 Jan*/
ALTER TABLE survey_options_of_questions ADD id INT PRIMARY KEY AUTO_INCREMENT;
ALTER TABLE `survey_answers` ADD `row_id` INT NULL ;
ALTER TABLE `survey_answers` ADD INDEX ( `row_id` ) ;
ALTER TABLE `survey_answers` ADD FOREIGN KEY ( `row_id` ) REFERENCES `survey_question_index_rows` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT ;

-- new sql added 07 march 2017
  
  
 CREATE TABLE `survey_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `bulk_mail_template_id` int(11) NOT NULL,
  `email` text NOT NULL,
  `if_filled_survey` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`)
);
-- drop foreign constraint key 
alter table survey_answers drop foreign key personidk;
--create foreign constraint key
ALTER TABLE survey_answers ADD CONSTRAINT personidk FOREIGN KEY (personid) REFERENCES survey_log(id);


CREATE TABLE `status_matrix` (
  `InitialStatus` varchar(30) DEFAULT NULL,
  `Registered` varchar(5) DEFAULT NULL,
  `Invalid` varchar(5) DEFAULT NULL,
  `Approved` varchar(5) DEFAULT NULL,
  `Confirmed` varchar(5) DEFAULT NULL,
  `Completed` varchar(5) DEFAULT NULL,
  `Cancelled` varchar(5) DEFAULT NULL
);

insert into survey.status_matrix select * from csr.status_matrix;

CREATE TABLE `partuserdata` (
  `userinterfaceid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `errormessage` text,
  `created_by` int(11) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdatedby` int(11) DEFAULT NULL,
  `lastupdateon` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filename` varchar(100) DEFAULT NULL,
  `filename_id` int(11) DEFAULT NULL,
  `declined` int(11) DEFAULT '0',
  `bulk_mail_template_id` int(11) DEFAULT '0',
  `bulk_mail_type` int(11),
  PRIMARY KEY (`userinterfaceid`)
);

INSERT INTO `survey_question_types` (`question_type_id`, `question_type`, `comments`) VALUES ('7', 'Date', 'date picker');
INSERT INTO `survey_question_types` (`question_type_id`, `question_type`, `comments`) VALUES ('8', 'Time', 'time picker');

 CREATE TABLE `visitorlog` (
  `visitorid` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ipAddress` text,
  `device` varchar(50),
  `browser_type` varchar(200),
  `os_used` varchar(200),
  `email` varchar(200),
  `visit_number` int(11),
  PRIMARY KEY (`visitorid`)
);

alter table login add column last_passupdate DATETIME null;
alter table survey_index add column success_title text;
alter table survey_index add column success_content text;
alter table survey_index add column error_title text;
alter table survey_index add column error_content text;
