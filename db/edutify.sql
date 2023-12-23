-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2023 pada 14.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edutify`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_assignment`
--

CREATE TABLE `assignment_assignment` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` longtext NOT NULL,
  `points` int(10) UNSIGNED NOT NULL CHECK (`points` >= 0),
  `due` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `assignment_assignment`
--

INSERT INTO `assignment_assignment` (`id`, `title`, `content`, `points`, `due`, `user_id`) VALUES
(1, 'Database Technology', '<p>Please explain 1 NoSQL database that you could find on internet (except MongoDB).<br />\r\n<br />\r\nYou could explain about:<br />\r\nwhen was the database created?<br />\r\nwho created that database (could be person or company)?<br />\r\nwhat the types of NoSQL databases?<br />\r\nThe advantage to use that NoSQL database compare to SQL</p>', 100, '2023-12-31', 1),
(2, 'Database Technology', '<p>Please explain 1 NoSQL database that you could find on internet (except MongoDB).<br />\r\n<br />\r\nYou could explain about:<br />\r\nwhen was the database created?<br />\r\nwho created that database (could be person or company)?<br />\r\nwhat the types of NoSQL databases?<br />\r\nThe advantage to use that NoSQL database compare to SQL</p>', 100, '2023-12-31', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_assignmentfilecontent`
--

CREATE TABLE `assignment_assignmentfilecontent` (
  `id` bigint(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `assignment_assignmentfilecontent`
--

INSERT INTO `assignment_assignmentfilecontent` (`id`, `file`, `user_id`) VALUES
(1, 'user_1/Academic_Calendar_-_Even_2023-2024_IS1_2_u6vjuBw.pdf', 1),
(2, 'user_1/Academic_Calendar_-_Even_2023-2024_IS1_2_SIOGxCZ.pdf', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_assignment_files`
--

CREATE TABLE `assignment_assignment_files` (
  `id` bigint(20) NOT NULL,
  `assignment_id` bigint(20) NOT NULL,
  `assignmentfilecontent_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `assignment_assignment_files`
--

INSERT INTO `assignment_assignment_files` (`id`, `assignment_id`, `assignmentfilecontent_id`) VALUES
(1, 2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `assignment_submission`
--

CREATE TABLE `assignment_submission` (
  `id` bigint(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` datetime(6) NOT NULL,
  `assignment_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `assignment_submission`
--

INSERT INTO `assignment_submission` (`id`, `file`, `comment`, `date`, `assignment_id`, `user_id`) VALUES
(1, 'user_1/Academic_Calendar_-_Even_2023-2024_IS1_2_UW5hTcD.pdf', 'test', '2023-12-23 13:03:51.587754', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `authy_profile`
--

CREATE TABLE `authy_profile` (
  `id` bigint(20) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `profile_info` longtext DEFAULT NULL,
  `created` date NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `authy_profile`
--

INSERT INTO `authy_profile` (`id`, `location`, `url`, `profile_info`, `created`, `picture`, `banner`, `user_id`) VALUES
(1, NULL, NULL, NULL, '2023-12-22', '', '', 1),
(2, NULL, NULL, NULL, '2023-12-22', '', '', 2),
(3, '', '', '', '2023-12-22', 'user_3/profile.jpg', '', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add course', 8, 'add_course'),
(30, 'Can change course', 8, 'change_course'),
(31, 'Can delete course', 8, 'delete_course'),
(32, 'Can view course', 8, 'view_course'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add module', 10, 'add_module'),
(38, 'Can change module', 10, 'change_module'),
(39, 'Can delete module', 10, 'delete_module'),
(40, 'Can view module', 10, 'view_module'),
(41, 'Can add page', 11, 'add_page'),
(42, 'Can change page', 11, 'change_page'),
(43, 'Can delete page', 11, 'delete_page'),
(44, 'Can view page', 11, 'view_page'),
(45, 'Can add post file content', 12, 'add_postfilecontent'),
(46, 'Can change post file content', 12, 'change_postfilecontent'),
(47, 'Can delete post file content', 12, 'delete_postfilecontent'),
(48, 'Can view post file content', 12, 'view_postfilecontent'),
(49, 'Can add grade', 13, 'add_grade'),
(50, 'Can change grade', 13, 'change_grade'),
(51, 'Can delete grade', 13, 'delete_grade'),
(52, 'Can view grade', 13, 'view_grade'),
(53, 'Can add assignment', 14, 'add_assignment'),
(54, 'Can change assignment', 14, 'change_assignment'),
(55, 'Can delete assignment', 14, 'delete_assignment'),
(56, 'Can view assignment', 14, 'view_assignment'),
(57, 'Can add assignment file content', 15, 'add_assignmentfilecontent'),
(58, 'Can change assignment file content', 15, 'change_assignmentfilecontent'),
(59, 'Can delete assignment file content', 15, 'delete_assignmentfilecontent'),
(60, 'Can view assignment file content', 15, 'view_assignmentfilecontent'),
(61, 'Can add submission', 16, 'add_submission'),
(62, 'Can change submission', 16, 'change_submission'),
(63, 'Can delete submission', 16, 'delete_submission'),
(64, 'Can view submission', 16, 'view_submission');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$F7jKCdr3O7uq3gn9cuzUjd$/1ZyM6SgbNOxBLxfVEkZRvzmycPKRCN6R/MR2O2ZlrM=', '2023-12-23 12:18:22.643820', 1, 'michail', '', '', 'mbl@gmail.com', 1, 1, '2023-12-22 08:03:54.388189'),
(2, 'pbkdf2_sha256$600000$LGJ0wENHvitP6LSFhy0M60$WGQshlGy2YJQwPY7rSaNKH/5hSN5deKvbabcdWvn60c=', '2023-12-23 04:07:10.066357', 0, 'mb', '', '', 'mb@gmail.com', 0, 1, '2023-12-22 08:04:35.167878'),
(3, 'pbkdf2_sha256$600000$sbS76R9tIwfs4xNZwxFGLn$xB8RmgeeII8AKtgdIXY6UHIx1yDTuGL354sZyPnrP2I=', '2023-12-23 07:41:30.907842', 0, 'dabin', 'dabin', 'nelbon', 'dabin@gmail.com', 0, 1, '2023-12-22 16:57:30.393948');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `classroom_category`
--

CREATE TABLE `classroom_category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `classroom_category`
--

INSERT INTO `classroom_category` (`id`, `title`, `slug`, `icon`) VALUES
(1, 'Science', 'science', 'science'),
(2, 'Software', 'software', 'bug_report'),
(3, 'Botanic', 'botanic', 'grass'),
(4, 'Human', 'human', 'articles'),
(5, 'Law', 'law', 'gavel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `classroom_course`
--

CREATE TABLE `classroom_course` (
  `id` char(32) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(300) NOT NULL,
  `syllabus` longtext NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `classroom_course`
--

INSERT INTO `classroom_course` (`id`, `picture`, `title`, `description`, `syllabus`, `category_id`, `user_id`) VALUES
('31e32824cca241409ef55d246f422d9e', 'user_1/file.png', 'Software Engineering', 'Learn software engineering', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed augue a quam viverra condimentum in ac libero. Nullam imperdiet scelerisque fermentum. Donec a sapien at risus tempus molestie at in orci. Interdum et malesuada fames ac ante ipsum primis in faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi posuere ex ac elit rutrum porta. Nullam ut convallis tortor, in lacinia felis. Proin sodales nibh eu venenatis fermentum. Nam sit amet odio placerat, commodo dui quis, fermentum velit. Praesent vitae mauris nec arcu consectetur egestas. Fusce id orci vitae arcu rutrum pellentesque.</p>', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `classroom_course_enrolled`
--

CREATE TABLE `classroom_course_enrolled` (
  `id` bigint(20) NOT NULL,
  `course_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `classroom_course_enrolled`
--

INSERT INTO `classroom_course_enrolled` (`id`, `course_id`, `user_id`) VALUES
(1, '31e32824cca241409ef55d246f422d9e', 1),
(5, '31e32824cca241409ef55d246f422d9e', 2),
(3, '31e32824cca241409ef55d246f422d9e', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `classroom_course_modules`
--

CREATE TABLE `classroom_course_modules` (
  `id` bigint(20) NOT NULL,
  `course_id` char(32) NOT NULL,
  `module_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `classroom_course_modules`
--

INSERT INTO `classroom_course_modules` (`id`, `course_id`, `module_id`) VALUES
(1, '31e32824cca241409ef55d246f422d9e', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `classroom_grade`
--

CREATE TABLE `classroom_grade` (
  `id` bigint(20) NOT NULL,
  `points` int(10) UNSIGNED NOT NULL CHECK (`points` >= 0),
  `status` varchar(10) NOT NULL,
  `course_id` char(32) NOT NULL,
  `graded_by_id` int(11) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `classroom_grade`
--

INSERT INTO `classroom_grade` (`id`, `points`, `status`, `course_id`, `graded_by_id`, `submission_id`) VALUES
(1, 90, 'graded', '31e32824cca241409ef55d246f422d9e', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-12-22 08:56:59.641311', '1', 'Science', 1, '[{\"added\": {}}]', 9, 1),
(2, '2023-12-22 08:57:07.478511', '2', 'Software', 1, '[{\"added\": {}}]', 9, 1),
(3, '2023-12-22 08:57:13.399279', '3', 'Botanic', 1, '[{\"added\": {}}]', 9, 1),
(4, '2023-12-22 08:57:25.767867', '4', 'Human', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-12-22 09:00:43.162532', '5', 'Law', 1, '[{\"added\": {}}]', 9, 1),
(6, '2023-12-22 09:00:51.167885', '2', 'Software', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(7, '2023-12-22 09:01:39.064799', '1', 'Science', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(8, '2023-12-22 09:02:02.367574', '3', 'Botanic', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1),
(9, '2023-12-22 16:12:38.637411', '3', 'Botanic', 2, '[{\"changed\": {\"fields\": [\"Icon\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(14, 'assignment', 'assignment'),
(15, 'assignment', 'assignmentfilecontent'),
(16, 'assignment', 'submission'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authy', 'profile'),
(9, 'classroom', 'category'),
(8, 'classroom', 'course'),
(13, 'classroom', 'grade'),
(5, 'contenttypes', 'contenttype'),
(10, 'module', 'module'),
(11, 'page', 'page'),
(12, 'page', 'postfilecontent'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-22 07:52:44.384533'),
(2, 'auth', '0001_initial', '2023-12-22 07:52:49.491776'),
(3, 'admin', '0001_initial', '2023-12-22 07:52:51.115894'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-12-22 07:52:51.141158'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-22 07:52:51.165233'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-12-22 07:52:51.540600'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-12-22 07:52:52.006813'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-12-22 07:52:52.084905'),
(9, 'auth', '0004_alter_user_username_opts', '2023-12-22 07:52:52.112462'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-12-22 07:52:52.431935'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-12-22 07:52:52.453806'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-22 07:52:52.478524'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-12-22 07:52:52.531223'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-22 07:52:52.586812'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-12-22 07:52:52.665065'),
(16, 'auth', '0011_update_proxy_permissions', '2023-12-22 07:52:52.691519'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-22 07:52:52.754858'),
(18, 'sessions', '0001_initial', '2023-12-22 07:52:53.000997'),
(19, 'authy', '0001_initial', '2023-12-22 08:01:15.672601'),
(20, 'classroom', '0001_initial', '2023-12-22 08:47:05.287387'),
(21, 'classroom', '0002_category_icon', '2023-12-22 08:59:14.339946'),
(22, 'classroom', '0003_course_enrolled', '2023-12-22 09:10:51.332018'),
(23, 'classroom', '0004_rename_category_course_category', '2023-12-22 09:42:10.891800'),
(24, 'classroom', '0005_alter_course_enrolled_alter_course_user', '2023-12-22 09:58:56.511603'),
(25, 'module', '0001_initial', '2023-12-23 03:47:11.183676'),
(26, 'classroom', '0002_course_modules', '2023-12-23 03:47:12.506590'),
(27, 'module', '0002_rename_hour_module_hours', '2023-12-23 04:12:42.512555'),
(28, 'page', '0001_initial', '2023-12-23 06:59:55.732425'),
(29, 'module', '0003_module_pages', '2023-12-23 06:59:55.806616'),
(30, 'assignment', '0001_initial', '2023-12-23 10:45:59.771362'),
(31, 'classroom', '0003_grade', '2023-12-23 10:45:59.858879'),
(32, 'module', '0004_module_assignments', '2023-12-23 10:45:59.932394');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b3zbbu6ujh0z9tnk1n1wbula9bultgmd', '.eJxVjDsOwjAQBe_iGlkbf7OU9JzB8nptHECOFCcV4u4QKQW0b2beS4S4rTVsPS9hYnEWgzj9bhTTI7cd8D222yzT3NZlIrkr8qBdXmfOz8vh_h3U2Ou3tpbKiJyVZlLKMg6kXQRflI4JM2gDNKJmD94jZVDoyKDxqUBxCkC8P9vtN0M:1rGtJN:DfvdeMdv1opg4T6AjkBfUkO7ev5RJVdHGOeh9FLlj0s', '2024-01-06 04:08:29.499509'),
('ce98klytdyciv7pyqs37qims1tt0o540', '.eJxVjMsOwiAQAP-FsyEsizw8evcbyLJQqRqalPZk_HdD0oNeZybzFpH2rca9lzXOWVyEFqdfloifpQ2RH9Tui-Slbeuc5EjkYbu8Lbm8rkf7N6jU69hqlUrQxeaECOg9cwI0igNko9mdlQuOvAECp5IPE5SJDVq0li2QFp8vyF03BA:1rGeIg:ea58GrT9Eiv0byuhpWYk8R-4zJjtSXs35iYCSoLrCkA', '2024-01-05 12:06:46.454183'),
('qiy8l5fveep6bclmn8aqfe6v8dbmko5u', '.eJxVjDsOwjAQBe_iGlkbf7OU9JzB8nptHECOFCcV4u4QKQW0b2beS4S4rTVsPS9hYnEWgzj9bhTTI7cd8D222yzT3NZlIrkr8qBdXmfOz8vh_h3U2Ou3tpbKiJyVZlLKMg6kXQRflI4JM2gDNKJmD94jZVDoyKDxqUBxCkC8P9vtN0M:1rH0xS:-GHIDH8oqx54GDGPP4OO9jMOFanLFwxtHmVzAF1Ngik', '2024-01-06 12:18:22.648816');

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_module`
--

CREATE TABLE `module_module` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `hours` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `module_module`
--

INSERT INTO `module_module` (`id`, `title`, `hours`, `user_id`) VALUES
(1, 'bimbimbambam', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_module_assignments`
--

CREATE TABLE `module_module_assignments` (
  `id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `assignment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `module_module_assignments`
--

INSERT INTO `module_module_assignments` (`id`, `module_id`, `assignment_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_module_pages`
--

CREATE TABLE `module_module_pages` (
  `id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `module_module_pages`
--

INSERT INTO `module_module_pages` (`id`, `module_id`, `page_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `page_page`
--

CREATE TABLE `page_page` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `page_page`
--

INSERT INTO `page_page` (`id`, `title`, `content`, `user_id`) VALUES
(1, 'Introduction to Programming', '<h3>Introduction to programming</h3>\r\n\r\n<p>Computer programming is the process of&nbsp;<strong>designing&nbsp;</strong>and&nbsp;<strong>writing&nbsp;</strong><strong>computer programs</strong>. As a skill set, it includes a wide variety of different tasks and techniques, but our tutorials are not intended to teach you everything. Instead, they are meant&nbsp;to provide&nbsp;<strong>basic, practical&nbsp;skills</strong>&nbsp;to help you understand and&nbsp;write&nbsp;<strong>computer code</strong>&nbsp;that reflects things you see and use in the real world.&nbsp;</p>\r\n\r\n<p>What you need to know</p>\r\n\r\n<p>Our computer programming tutorials assume that you have&nbsp;<strong>no programming experience&nbsp;</strong>whatsoever. They do, however, require basic familiarity with the use of computers and web browsers. For example, you should be comfortable downloading and opening files, and using text editing software.&nbsp;If you don&#39;t feel confident in those skills, consider spending some time with these tutorials first:</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://edu.gcfglobal.org/en/computerbasics/\">Computer Basics</a></li>\r\n	<li><a href=\"https://edu.gcfglobal.org/en/internetbasics/\">Internet Basics</a></li>\r\n</ul>\r\n\r\n<p>As long as you are comfortable with those basics, you should be prepared to begin learning programming.&nbsp;</p>', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `page_page_files`
--

CREATE TABLE `page_page_files` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `postfilecontent_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `page_page_files`
--

INSERT INTO `page_page_files` (`id`, `page_id`, `postfilecontent_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `page_postfilecontent`
--

CREATE TABLE `page_postfilecontent` (
  `id` bigint(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `posted` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `page_postfilecontent`
--

INSERT INTO `page_postfilecontent` (`id`, `file`, `posted`, `user_id`) VALUES
(1, 'user_1/Academic_Calendar_-_Even_2023-2024_IS1_2.pdf', '2023-12-23 07:32:39.457442', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `assignment_assignment`
--
ALTER TABLE `assignment_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_assignment_user_id_b66c9f0b_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `assignment_assignmentfilecontent`
--
ALTER TABLE `assignment_assignmentfilecontent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_assignmen_user_id_343205bd_fk_auth_user` (`user_id`);

--
-- Indeks untuk tabel `assignment_assignment_files`
--
ALTER TABLE `assignment_assignment_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assignment_assignment_fi_assignment_id_assignment_6d0267d3_uniq` (`assignment_id`,`assignmentfilecontent_id`),
  ADD KEY `assignment_assignmen_assignmentfileconten_37774b92_fk_assignmen` (`assignmentfilecontent_id`);

--
-- Indeks untuk tabel `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_submissio_assignment_id_607c0502_fk_assignmen` (`assignment_id`),
  ADD KEY `assignment_submission_user_id_6097f150_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `authy_profile`
--
ALTER TABLE `authy_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `classroom_category`
--
ALTER TABLE `classroom_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indeks untuk tabel `classroom_course`
--
ALTER TABLE `classroom_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_course_user_id_a05d9798_fk_auth_user_id` (`user_id`),
  ADD KEY `classroom_course_category_id_50e7f834_fk_classroom_category_id` (`category_id`);

--
-- Indeks untuk tabel `classroom_course_enrolled`
--
ALTER TABLE `classroom_course_enrolled`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classroom_course_enrolled_course_id_user_id_aa8a3b9b_uniq` (`course_id`,`user_id`),
  ADD KEY `classroom_course_enrolled_user_id_c8e0f9a2_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `classroom_course_modules`
--
ALTER TABLE `classroom_course_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classroom_course_modules_course_id_module_id_a9016b6a_uniq` (`course_id`,`module_id`),
  ADD KEY `classroom_course_modules_module_id_0f5129ef_fk_module_module_id` (`module_id`);

--
-- Indeks untuk tabel `classroom_grade`
--
ALTER TABLE `classroom_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classroom_grade_course_id_5c750493_fk_classroom_course_id` (`course_id`),
  ADD KEY `classroom_grade_graded_by_id_80ac25d7_fk_auth_user_id` (`graded_by_id`),
  ADD KEY `classroom_grade_submission_id_7dc90528_fk_assignmen` (`submission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeks untuk tabel `module_module`
--
ALTER TABLE `module_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_module_user_id_23441d86_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `module_module_assignments`
--
ALTER TABLE `module_module_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_module_assignments_module_id_assignment_id_119d18d4_uniq` (`module_id`,`assignment_id`),
  ADD KEY `module_module_assign_assignment_id_d64463cb_fk_assignmen` (`assignment_id`);

--
-- Indeks untuk tabel `module_module_pages`
--
ALTER TABLE `module_module_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_module_pages_module_id_page_id_e0d0fd4b_uniq` (`module_id`,`page_id`),
  ADD KEY `module_module_pages_page_id_c5236a73_fk_page_page_id` (`page_id`);

--
-- Indeks untuk tabel `page_page`
--
ALTER TABLE `page_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_page_user_id_3e90c4d5_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `page_page_files`
--
ALTER TABLE `page_page_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_page_files_page_id_postfilecontent_id_e026f43a_uniq` (`page_id`,`postfilecontent_id`),
  ADD KEY `page_page_files_postfilecontent_id_b1535502_fk_page_post` (`postfilecontent_id`);

--
-- Indeks untuk tabel `page_postfilecontent`
--
ALTER TABLE `page_postfilecontent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_postfilecontent_user_id_40e839bb_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `assignment_assignment`
--
ALTER TABLE `assignment_assignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `assignment_assignmentfilecontent`
--
ALTER TABLE `assignment_assignmentfilecontent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `assignment_assignment_files`
--
ALTER TABLE `assignment_assignment_files`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `assignment_submission`
--
ALTER TABLE `assignment_submission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `authy_profile`
--
ALTER TABLE `authy_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `classroom_category`
--
ALTER TABLE `classroom_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `classroom_course_enrolled`
--
ALTER TABLE `classroom_course_enrolled`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `classroom_course_modules`
--
ALTER TABLE `classroom_course_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `classroom_grade`
--
ALTER TABLE `classroom_grade`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `module_module`
--
ALTER TABLE `module_module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `module_module_assignments`
--
ALTER TABLE `module_module_assignments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `module_module_pages`
--
ALTER TABLE `module_module_pages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `page_page`
--
ALTER TABLE `page_page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `page_page_files`
--
ALTER TABLE `page_page_files`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `page_postfilecontent`
--
ALTER TABLE `page_postfilecontent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `assignment_assignment`
--
ALTER TABLE `assignment_assignment`
  ADD CONSTRAINT `assignment_assignment_user_id_b66c9f0b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `assignment_assignmentfilecontent`
--
ALTER TABLE `assignment_assignmentfilecontent`
  ADD CONSTRAINT `assignment_assignmen_user_id_343205bd_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `assignment_assignment_files`
--
ALTER TABLE `assignment_assignment_files`
  ADD CONSTRAINT `assignment_assignmen_assignment_id_2bb75ece_fk_assignmen` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_assignment` (`id`),
  ADD CONSTRAINT `assignment_assignmen_assignmentfileconten_37774b92_fk_assignmen` FOREIGN KEY (`assignmentfilecontent_id`) REFERENCES `assignment_assignmentfilecontent` (`id`);

--
-- Ketidakleluasaan untuk tabel `assignment_submission`
--
ALTER TABLE `assignment_submission`
  ADD CONSTRAINT `assignment_submissio_assignment_id_607c0502_fk_assignmen` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_assignment` (`id`),
  ADD CONSTRAINT `assignment_submission_user_id_6097f150_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `authy_profile`
--
ALTER TABLE `authy_profile`
  ADD CONSTRAINT `authy_profile_user_id_200e8c9b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `classroom_course`
--
ALTER TABLE `classroom_course`
  ADD CONSTRAINT `classroom_course_category_id_50e7f834_fk_classroom_category_id` FOREIGN KEY (`category_id`) REFERENCES `classroom_category` (`id`),
  ADD CONSTRAINT `classroom_course_user_id_a05d9798_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `classroom_course_enrolled`
--
ALTER TABLE `classroom_course_enrolled`
  ADD CONSTRAINT `classroom_course_enr_course_id_4a0d5d7c_fk_classroom` FOREIGN KEY (`course_id`) REFERENCES `classroom_course` (`id`),
  ADD CONSTRAINT `classroom_course_enrolled_user_id_c8e0f9a2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `classroom_course_modules`
--
ALTER TABLE `classroom_course_modules`
  ADD CONSTRAINT `classroom_course_mod_course_id_28140d0c_fk_classroom` FOREIGN KEY (`course_id`) REFERENCES `classroom_course` (`id`),
  ADD CONSTRAINT `classroom_course_modules_module_id_0f5129ef_fk_module_module_id` FOREIGN KEY (`module_id`) REFERENCES `module_module` (`id`);

--
-- Ketidakleluasaan untuk tabel `classroom_grade`
--
ALTER TABLE `classroom_grade`
  ADD CONSTRAINT `classroom_grade_course_id_5c750493_fk_classroom_course_id` FOREIGN KEY (`course_id`) REFERENCES `classroom_course` (`id`),
  ADD CONSTRAINT `classroom_grade_graded_by_id_80ac25d7_fk_auth_user_id` FOREIGN KEY (`graded_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `classroom_grade_submission_id_7dc90528_fk_assignmen` FOREIGN KEY (`submission_id`) REFERENCES `assignment_submission` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `module_module`
--
ALTER TABLE `module_module`
  ADD CONSTRAINT `module_module_user_id_23441d86_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `module_module_assignments`
--
ALTER TABLE `module_module_assignments`
  ADD CONSTRAINT `module_module_assign_assignment_id_d64463cb_fk_assignmen` FOREIGN KEY (`assignment_id`) REFERENCES `assignment_assignment` (`id`),
  ADD CONSTRAINT `module_module_assignments_module_id_c2dbfc8c_fk_module_module_id` FOREIGN KEY (`module_id`) REFERENCES `module_module` (`id`);

--
-- Ketidakleluasaan untuk tabel `module_module_pages`
--
ALTER TABLE `module_module_pages`
  ADD CONSTRAINT `module_module_pages_module_id_876fc287_fk_module_module_id` FOREIGN KEY (`module_id`) REFERENCES `module_module` (`id`),
  ADD CONSTRAINT `module_module_pages_page_id_c5236a73_fk_page_page_id` FOREIGN KEY (`page_id`) REFERENCES `page_page` (`id`);

--
-- Ketidakleluasaan untuk tabel `page_page`
--
ALTER TABLE `page_page`
  ADD CONSTRAINT `page_page_user_id_3e90c4d5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `page_page_files`
--
ALTER TABLE `page_page_files`
  ADD CONSTRAINT `page_page_files_page_id_ef4f7bd4_fk_page_page_id` FOREIGN KEY (`page_id`) REFERENCES `page_page` (`id`),
  ADD CONSTRAINT `page_page_files_postfilecontent_id_b1535502_fk_page_post` FOREIGN KEY (`postfilecontent_id`) REFERENCES `page_postfilecontent` (`id`);

--
-- Ketidakleluasaan untuk tabel `page_postfilecontent`
--
ALTER TABLE `page_postfilecontent`
  ADD CONSTRAINT `page_postfilecontent_user_id_40e839bb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
