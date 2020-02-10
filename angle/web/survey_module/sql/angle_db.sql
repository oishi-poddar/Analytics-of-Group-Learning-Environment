/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  ubuntu
 * Created: 29 May, 2017
 */

--create database angle_db;
--use angle_db;

CREATE TABLE `angle_db`.`login` (
  `login_id` int(11) NOT NULL,
  `login_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `usertypeid` varchar(45) DEFAULT NULL,
  `loginstatus` varchar(45) NOT NULL DEFAULT '1',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `no_of_logins` int(11) DEFAULT '0',
  `ipaddress` varchar(80) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `last_passupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `login_name` (`login_name`));

CREATE TABLE `angle_db`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `IP` VARCHAR(45) NULL,
  `gender` VARCHAR(6) NULL,
  `createdOn` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));
 
CREATE TABLE `angle_db`.`groupdata` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `groupcode` VARCHAR(45) NOT NULL,
  `groupname` VARCHAR(45) NOT NULL,
  `supergroupcode` VARCHAR(45) NULL,
  `owner` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `subjectArea` VARCHAR(45) NULL,
  `description` VARCHAR(250) NULL,
  `publicURL` VARCHAR(45) NULL,
  `lastUsedOn` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_userdata_1_idx` (`supergroupcode` ASC),
  CONSTRAINT `fk_userdata_1`
    FOREIGN KEY (`supergroupcode`)
    REFERENCES `angle_db`.`groupdata` (`groupcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  UNIQUE INDEX `groupcode_UNIQUE` (`groupcode` ASC));

CREATE TABLE `angle_db`.`user_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uid` INT NOT NULL,
  `gid` VARCHAR(45) NOT NULL,
  `access` INT NULL,
  `type` INT NULL,
  `joinedBy` VARCHAR(45) NULL,
  `joinedOn` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_group_1_idx` (`gid` ASC),
  INDEX `fk_user_group_2_idx` (`uid` ASC),
  CONSTRAINT `fk_user_group_1`
    FOREIGN KEY (`gid`)
    REFERENCES `angle_db`.`groupdata` (`groupcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_group_2`
    FOREIGN KEY (`uid`)
    REFERENCES `angle_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `angle_db`.`group_topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `createdOn` DATETIME NULL,
  `createdBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_topic_1_idx` (`gid` ASC),
  INDEX `fk_group_topic_2_idx` (`createdBy` ASC),
  CONSTRAINT `fk_group_topic_1`
    FOREIGN KEY (`gid`)
    REFERENCES `angle_db`.`groupdata` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_topic_2`
    FOREIGN KEY (`createdBy`)
    REFERENCES `angle_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    





-- New SQL Files Appended --



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `angledb1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Feature`
--

CREATE TABLE `Feature` (
  `featureId` int(11) NOT NULL,
  `featureName` varchar(20) NOT NULL,
  `accessNameList` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GroupFeatures`
--

CREATE TABLE `GroupFeatures` (
  `groupId` int(11) NOT NULL,
  `featureList` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GroupInfo`
--

CREATE TABLE `GroupInfo` (
  `groupId` int(11) NOT NULL,
  `groupCode` varchar(8) NOT NULL,
  `groupType` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT 'name of group',
  `owner` int(11) NOT NULL COMMENT 'user id',
  `description` text COMMENT 'description about the group',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUsedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `groupState` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Login_Info`
--

CREATE TABLE `Login_Info` (
  `LoginId` int(11) NOT NULL,
  `name` text NOT NULL,
  `gender` enum('M','F','O') NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Profile`
--

CREATE TABLE `Profile` (
  `profileId` int(11) NOT NULL,
  `profileName` text NOT NULL,
  `modifyGroup` tinyint(1) NOT NULL,
  `createTopic` tinyint(1) NOT NULL,
  `modifyTopic` tinyint(1) NOT NULL,
  `postingNote` tinyint(1) NOT NULL,
  `hideNote` tinyint(1) NOT NULL,
  `createAssignment` tinyint(1) NOT NULL,
  `viewAssignment` tinyint(1) NOT NULL,
  `submitAnswer` tinyint(1) NOT NULL,
  `gradeAssignment` tinyint(1) NOT NULL,
  `viewGrades` tinyint(1) NOT NULL,
  `createQuiz` tinyint(1) NOT NULL,
  `viewQuiz` tinyint(1) NOT NULL,
  `sendInvite` tinyint(1) NOT NULL,
  `submitQuiz` tinyint(1) NOT NULL,
  `gradeQuiz` tinyint(1) NOT NULL,
  `startVideoChat` tinyint(1) NOT NULL,
  `startDiscussionForum` tinyint(1) NOT NULL,
  `createPoll` tinyint(1) NOT NULL,
  `viewPoll` tinyint(1) NOT NULL,
  `acceptProfile` tinyint(1) NOT NULL COMMENT 'accept profile for the new user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserId` int(11) NOT NULL COMMENT 'Unique User Id',
  `email` text NOT NULL COMMENT 'email of the user',
  `password` text NOT NULL COMMENT 'password',
  `userIP` text NOT NULL COMMENT 'IP Address',
  `lastLoggedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserGroup`
--

CREATE TABLE `UserGroup` (
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `profileId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Feature`
--
ALTER TABLE `Feature`
  ADD PRIMARY KEY (`featureId`);

--
-- Indexes for table `GroupFeatures`
--
ALTER TABLE `GroupFeatures`
  ADD KEY `fk_groupId2` (`groupId`);

--
-- Indexes for table `GroupInfo`
--
ALTER TABLE `GroupInfo`
  ADD PRIMARY KEY (`groupId`),
  ADD KEY `fk_uid` (`owner`);

--
-- Indexes for table `Login_Info`
--
ALTER TABLE `Login_Info`
  ADD KEY `LoginId` (`LoginId`),
  ADD KEY `LoginId_2` (`LoginId`);

--
-- Indexes for table `Profile`
--
ALTER TABLE `Profile`
  ADD PRIMARY KEY (`profileId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `UserGroup`
--
ALTER TABLE `UserGroup`
  ADD KEY `fk_userId` (`userId`),
  ADD KEY `fk_groupId` (`groupId`),
  ADD KEY `fk_profileId1` (`profileId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `GroupInfo`
--
ALTER TABLE `GroupInfo`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique User Id';
--
-- Constraints for dumped tables
--

--
-- Constraints for table `GroupFeatures`
--
ALTER TABLE `GroupFeatures`
  ADD CONSTRAINT `fk_groupId2` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `GroupInfo`
--
ALTER TABLE `GroupInfo`
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`owner`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Login_Info`
--
ALTER TABLE `Login_Info`
  ADD CONSTRAINT `fk_loginid` FOREIGN KEY (`LoginId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `UserGroup`
--
ALTER TABLE `UserGroup`
  ADD CONSTRAINT `fk_groupId` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profileId1` FOREIGN KEY (`profileId`) REFERENCES `Profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
