-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 09, 2016 at 12:40 PM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csr`
--

--
-- Dumping data for table `survey_question_types`
--

INSERT INTO `survey_question_types` (`question_type_id`, `question_type`, `comments`) VALUES
(1, 'short answer', 'short answer type questions  fixed words or alphabets'),
(2, 'paragraph', 'long answer type questions with no fixed words or alphabets'),
(3, 'multiple choice', 'radio buttons and only one option to be chosen'),
(4, 'check box', 'mutiple answers can be chosen with checkboxes');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/* insertion of pagelist surveySuccess Page - 16 Nov*/
 insert into pagelist(name,content,comment,class) values("surveySuccess","<p><b>Dear User,</b></p>
        <p>Your answers have been recorded.</p>
        <p>Thank you for answering the survey.</p>","","");
 insert into pagelist(name,content,comment,class) values("surveyAlreadyFilled","<p><b>Dear User,</b></p>
        <p>You have already filled the survey.</p>
        ","","");


insert into pagelist(name,content,comment,class) values("surveyError","<p><b>Dear User,</b></p>
        <p>The url entered is incorrect. </p>
        ","","");