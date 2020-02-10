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
