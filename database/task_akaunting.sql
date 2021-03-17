-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2021 at 12:52 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_akaunting`
--

-- --------------------------------------------------------

--
-- Table structure for table `zun_accounts`
--

CREATE TABLE `zun_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_accounts`
--

INSERT INTO `zun_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_bills`
--

CREATE TABLE `zun_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_bill_histories`
--

CREATE TABLE `zun_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_bill_items`
--

CREATE TABLE `zun_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_bill_item_taxes`
--

CREATE TABLE `zun_bill_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_bill_totals`
--

CREATE TABLE `zun_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_categories`
--

CREATE TABLE `zun_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_categories`
--

INSERT INTO `zun_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#3c3f72', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(2, 1, 'Deposit', 'income', '#efad32', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(3, 1, 'Sales', 'income', '#6da252', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(4, 1, 'Other', 'expense', '#e5e5e5', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(5, 1, 'General', 'item', '#328aef', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_companies`
--

CREATE TABLE `zun_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_companies`
--

INSERT INTO `zun_companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_contacts`
--

CREATE TABLE `zun_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_currencies`
--

CREATE TABLE `zun_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_currencies`
--

INSERT INTO `zun_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(2, 1, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(3, 1, 'British Pound', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_dashboards`
--

CREATE TABLE `zun_dashboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_dashboards`
--

INSERT INTO `zun_dashboards` (`id`, `company_id`, `name`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dashboard', 1, '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_documents`
--

CREATE TABLE `zun_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_document_histories`
--

CREATE TABLE `zun_document_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_document_items`
--

CREATE TABLE `zun_document_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `total` double(15,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_document_item_taxes`
--

CREATE TABLE `zun_document_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `document_item_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_document_totals`
--

CREATE TABLE `zun_document_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_email_templates`
--

CREATE TABLE `zun_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_email_templates`
--

INSERT INTO `zun_email_templates` (`id`, `company_id`, `alias`, `class`, `name`, `subject`, `body`, `params`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} invoice created', 'Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(2, 1, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} invoice overdue notice', 'Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(3, 1, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} invoice overdue notice', 'Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(4, 1, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} recurring invoice created', 'Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(5, 1, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{invoice_number} recurring invoice created', 'Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(6, 1, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Payment received for {invoice_number} invoice', 'Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(7, 1, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Payment received for {invoice_number} invoice', 'Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(8, 1, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} bill reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(9, 1, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} recurring bill created', 'Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> invoice has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_failed_jobs`
--

CREATE TABLE `zun_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_firewall_ips`
--

CREATE TABLE `zun_firewall_ips` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_firewall_logs`
--

CREATE TABLE `zun_firewall_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `middleware` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_invoices`
--

CREATE TABLE `zun_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_invoice_histories`
--

CREATE TABLE `zun_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_invoice_items`
--

CREATE TABLE `zun_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_invoice_item_taxes`
--

CREATE TABLE `zun_invoice_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_invoice_totals`
--

CREATE TABLE `zun_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_items`
--

CREATE TABLE `zun_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_item_taxes`
--

CREATE TABLE `zun_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_jobs`
--

CREATE TABLE `zun_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_media`
--

CREATE TABLE `zun_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_mediables`
--

CREATE TABLE `zun_mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `mediable_type` varchar(152) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_migrations`
--

CREATE TABLE `zun_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_migrations`
--

INSERT INTO `zun_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_14_000000_core_v1', 1),
(2, '2020_01_08_000000_core_v200', 1),
(3, '2020_03_20_183732_core_v208', 1),
(4, '2020_06_09_000000_core_v2014', 1),
(5, '2020_07_20_000000_core_v2017', 1),
(6, '2020_10_13_000000_core_v210', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zun_modules`
--

CREATE TABLE `zun_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_modules`
--

INSERT INTO `zun_modules` (`id`, `company_id`, `alias`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offline-payments', 1, '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(2, 1, 'paypal-standard', 1, '2021-03-09 12:19:59', '2021-03-09 12:19:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_module_histories`
--

CREATE TABLE `zun_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_module_histories`
--

INSERT INTO `zun_module_histories` (`id`, `company_id`, `module_id`, `version`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2.0.0', 'offline-payments installed', '2021-03-09 12:19:58', '2021-03-09 12:19:58', NULL),
(2, 1, 2, '2.0.0', 'paypal-standard installed', '2021-03-09 12:19:59', '2021-03-09 12:19:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_notifications`
--

CREATE TABLE `zun_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_password_resets`
--

CREATE TABLE `zun_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_permissions`
--

CREATE TABLE `zun_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_permissions`
--

INSERT INTO `zun_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2021-03-09 12:19:01', '2021-03-09 12:19:01'),
(2, 'read-api', 'Read Api', 'Read Api', '2021-03-09 12:19:02', '2021-03-09 12:19:02'),
(3, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2021-03-09 12:19:02', '2021-03-09 12:19:02'),
(4, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2021-03-09 12:19:02', '2021-03-09 12:19:02'),
(5, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2021-03-09 12:19:02', '2021-03-09 12:19:02'),
(6, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2021-03-09 12:19:03', '2021-03-09 12:19:03'),
(7, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2021-03-09 12:19:03', '2021-03-09 12:19:03'),
(8, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2021-03-09 12:19:03', '2021-03-09 12:19:03'),
(9, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2021-03-09 12:19:03', '2021-03-09 12:19:03'),
(10, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2021-03-09 12:19:03', '2021-03-09 12:19:03'),
(11, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2021-03-09 12:19:03', '2021-03-09 12:19:03'),
(12, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(13, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(14, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(15, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(16, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(17, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(18, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2021-03-09 12:19:04', '2021-03-09 12:19:04'),
(19, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2021-03-09 12:19:05', '2021-03-09 12:19:05'),
(20, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2021-03-09 12:19:05', '2021-03-09 12:19:05'),
(21, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2021-03-09 12:19:05', '2021-03-09 12:19:05'),
(22, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2021-03-09 12:19:05', '2021-03-09 12:19:05'),
(23, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2021-03-09 12:19:05', '2021-03-09 12:19:05'),
(24, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2021-03-09 12:19:05', '2021-03-09 12:19:05'),
(25, 'create-banking-transactions', 'Create Banking Transactions', 'Create Banking Transactions', '2021-03-09 12:19:06', '2021-03-09 12:19:06'),
(26, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2021-03-09 12:19:06', '2021-03-09 12:19:06'),
(27, 'update-banking-transactions', 'Update Banking Transactions', 'Update Banking Transactions', '2021-03-09 12:19:06', '2021-03-09 12:19:06'),
(28, 'delete-banking-transactions', 'Delete Banking Transactions', 'Delete Banking Transactions', '2021-03-09 12:19:06', '2021-03-09 12:19:06'),
(29, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2021-03-09 12:19:06', '2021-03-09 12:19:06'),
(30, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2021-03-09 12:19:06', '2021-03-09 12:19:06'),
(31, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(32, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(33, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(34, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(35, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(36, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(37, 'create-common-dashboards', 'Create Common Dashboards', 'Create Common Dashboards', '2021-03-09 12:19:07', '2021-03-09 12:19:07'),
(38, 'read-common-dashboards', 'Read Common Dashboards', 'Read Common Dashboards', '2021-03-09 12:19:08', '2021-03-09 12:19:08'),
(39, 'update-common-dashboards', 'Update Common Dashboards', 'Update Common Dashboards', '2021-03-09 12:19:08', '2021-03-09 12:19:08'),
(40, 'delete-common-dashboards', 'Delete Common Dashboards', 'Delete Common Dashboards', '2021-03-09 12:19:09', '2021-03-09 12:19:09'),
(41, 'create-common-import', 'Create Common Import', 'Create Common Import', '2021-03-09 12:19:09', '2021-03-09 12:19:09'),
(42, 'create-common-items', 'Create Common Items', 'Create Common Items', '2021-03-09 12:19:09', '2021-03-09 12:19:09'),
(43, 'read-common-items', 'Read Common Items', 'Read Common Items', '2021-03-09 12:19:09', '2021-03-09 12:19:09'),
(44, 'update-common-items', 'Update Common Items', 'Update Common Items', '2021-03-09 12:19:09', '2021-03-09 12:19:09'),
(45, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2021-03-09 12:19:10', '2021-03-09 12:19:10'),
(46, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2021-03-09 12:19:10', '2021-03-09 12:19:10'),
(47, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2021-03-09 12:19:10', '2021-03-09 12:19:10'),
(48, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2021-03-09 12:19:10', '2021-03-09 12:19:10'),
(49, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2021-03-09 12:19:11', '2021-03-09 12:19:11'),
(50, 'create-common-reports', 'Create Common Reports', 'Create Common Reports', '2021-03-09 12:19:11', '2021-03-09 12:19:11'),
(51, 'read-common-reports', 'Read Common Reports', 'Read Common Reports', '2021-03-09 12:19:11', '2021-03-09 12:19:11'),
(52, 'update-common-reports', 'Update Common Reports', 'Update Common Reports', '2021-03-09 12:19:11', '2021-03-09 12:19:11'),
(53, 'delete-common-reports', 'Delete Common Reports', 'Delete Common Reports', '2021-03-09 12:19:12', '2021-03-09 12:19:12'),
(54, 'read-common-search', 'Read Common Search', 'Read Common Search', '2021-03-09 12:19:12', '2021-03-09 12:19:12'),
(55, 'read-common-uploads', 'Read Common Uploads', 'Read Common Uploads', '2021-03-09 12:19:12', '2021-03-09 12:19:12'),
(56, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2021-03-09 12:19:12', '2021-03-09 12:19:12'),
(57, 'create-common-widgets', 'Create Common Widgets', 'Create Common Widgets', '2021-03-09 12:19:13', '2021-03-09 12:19:13'),
(58, 'read-common-widgets', 'Read Common Widgets', 'Read Common Widgets', '2021-03-09 12:19:13', '2021-03-09 12:19:13'),
(59, 'update-common-widgets', 'Update Common Widgets', 'Update Common Widgets', '2021-03-09 12:19:13', '2021-03-09 12:19:13'),
(60, 'delete-common-widgets', 'Delete Common Widgets', 'Delete Common Widgets', '2021-03-09 12:19:14', '2021-03-09 12:19:14'),
(61, 'create-purchases-bills', 'Create Purchases Bills', 'Create Purchases Bills', '2021-03-09 12:19:14', '2021-03-09 12:19:14'),
(62, 'read-purchases-bills', 'Read Purchases Bills', 'Read Purchases Bills', '2021-03-09 12:19:14', '2021-03-09 12:19:14'),
(63, 'update-purchases-bills', 'Update Purchases Bills', 'Update Purchases Bills', '2021-03-09 12:19:15', '2021-03-09 12:19:15'),
(64, 'delete-purchases-bills', 'Delete Purchases Bills', 'Delete Purchases Bills', '2021-03-09 12:19:15', '2021-03-09 12:19:15'),
(65, 'create-purchases-payments', 'Create Purchases Payments', 'Create Purchases Payments', '2021-03-09 12:19:16', '2021-03-09 12:19:16'),
(66, 'read-purchases-payments', 'Read Purchases Payments', 'Read Purchases Payments', '2021-03-09 12:19:16', '2021-03-09 12:19:16'),
(67, 'update-purchases-payments', 'Update Purchases Payments', 'Update Purchases Payments', '2021-03-09 12:19:16', '2021-03-09 12:19:16'),
(68, 'delete-purchases-payments', 'Delete Purchases Payments', 'Delete Purchases Payments', '2021-03-09 12:19:17', '2021-03-09 12:19:17'),
(69, 'create-purchases-vendors', 'Create Purchases Vendors', 'Create Purchases Vendors', '2021-03-09 12:19:17', '2021-03-09 12:19:17'),
(70, 'read-purchases-vendors', 'Read Purchases Vendors', 'Read Purchases Vendors', '2021-03-09 12:19:17', '2021-03-09 12:19:17'),
(71, 'update-purchases-vendors', 'Update Purchases Vendors', 'Update Purchases Vendors', '2021-03-09 12:19:18', '2021-03-09 12:19:18'),
(72, 'delete-purchases-vendors', 'Delete Purchases Vendors', 'Delete Purchases Vendors', '2021-03-09 12:19:19', '2021-03-09 12:19:19'),
(73, 'create-sales-customers', 'Create Sales Customers', 'Create Sales Customers', '2021-03-09 12:19:19', '2021-03-09 12:19:19'),
(74, 'read-sales-customers', 'Read Sales Customers', 'Read Sales Customers', '2021-03-09 12:19:19', '2021-03-09 12:19:19'),
(75, 'update-sales-customers', 'Update Sales Customers', 'Update Sales Customers', '2021-03-09 12:19:20', '2021-03-09 12:19:20'),
(76, 'delete-sales-customers', 'Delete Sales Customers', 'Delete Sales Customers', '2021-03-09 12:19:20', '2021-03-09 12:19:20'),
(77, 'create-sales-invoices', 'Create Sales Invoices', 'Create Sales Invoices', '2021-03-09 12:19:20', '2021-03-09 12:19:20'),
(78, 'read-sales-invoices', 'Read Sales Invoices', 'Read Sales Invoices', '2021-03-09 12:19:21', '2021-03-09 12:19:21'),
(79, 'update-sales-invoices', 'Update Sales Invoices', 'Update Sales Invoices', '2021-03-09 12:19:21', '2021-03-09 12:19:21'),
(80, 'delete-sales-invoices', 'Delete Sales Invoices', 'Delete Sales Invoices', '2021-03-09 12:19:21', '2021-03-09 12:19:21'),
(81, 'create-sales-revenues', 'Create Sales Revenues', 'Create Sales Revenues', '2021-03-09 12:19:22', '2021-03-09 12:19:22'),
(82, 'read-sales-revenues', 'Read Sales Revenues', 'Read Sales Revenues', '2021-03-09 12:19:22', '2021-03-09 12:19:22'),
(83, 'update-sales-revenues', 'Update Sales Revenues', 'Update Sales Revenues', '2021-03-09 12:19:22', '2021-03-09 12:19:22'),
(84, 'delete-sales-revenues', 'Delete Sales Revenues', 'Delete Sales Revenues', '2021-03-09 12:19:22', '2021-03-09 12:19:22'),
(85, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2021-03-09 12:19:23', '2021-03-09 12:19:23'),
(86, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2021-03-09 12:19:23', '2021-03-09 12:19:23'),
(87, 'create-modules-api-key', 'Create Modules Api Key', 'Create Modules Api Key', '2021-03-09 12:19:23', '2021-03-09 12:19:23'),
(88, 'update-modules-api-key', 'Update Modules Api Key', 'Update Modules Api Key', '2021-03-09 12:19:24', '2021-03-09 12:19:24'),
(89, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2021-03-09 12:19:24', '2021-03-09 12:19:24'),
(90, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2021-03-09 12:19:24', '2021-03-09 12:19:24'),
(91, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2021-03-09 12:19:25', '2021-03-09 12:19:25'),
(92, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2021-03-09 12:19:25', '2021-03-09 12:19:25'),
(93, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2021-03-09 12:19:25', '2021-03-09 12:19:25'),
(94, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2021-03-09 12:19:26', '2021-03-09 12:19:26'),
(95, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2021-03-09 12:19:26', '2021-03-09 12:19:26'),
(96, 'read-notifications', 'Read Notifications', 'Read Notifications', '2021-03-09 12:19:26', '2021-03-09 12:19:26'),
(97, 'update-notifications', 'Update Notifications', 'Update Notifications', '2021-03-09 12:19:26', '2021-03-09 12:19:26'),
(98, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2021-03-09 12:19:26', '2021-03-09 12:19:26'),
(99, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2021-03-09 12:19:27', '2021-03-09 12:19:27'),
(100, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2021-03-09 12:19:27', '2021-03-09 12:19:27'),
(101, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2021-03-09 12:19:27', '2021-03-09 12:19:27'),
(102, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2021-03-09 12:19:27', '2021-03-09 12:19:27'),
(103, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2021-03-09 12:19:28', '2021-03-09 12:19:28'),
(104, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2021-03-09 12:19:28', '2021-03-09 12:19:28'),
(105, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2021-03-09 12:19:28', '2021-03-09 12:19:28'),
(106, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2021-03-09 12:19:29', '2021-03-09 12:19:29'),
(107, 'read-settings-company', 'Read Settings Company', 'Read Settings Company', '2021-03-09 12:19:29', '2021-03-09 12:19:29'),
(108, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2021-03-09 12:19:30', '2021-03-09 12:19:30'),
(109, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2021-03-09 12:19:30', '2021-03-09 12:19:30'),
(110, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2021-03-09 12:19:31', '2021-03-09 12:19:31'),
(111, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2021-03-09 12:19:31', '2021-03-09 12:19:31'),
(112, 'read-settings-defaults', 'Read Settings Defaults', 'Read Settings Defaults', '2021-03-09 12:19:31', '2021-03-09 12:19:31'),
(113, 'read-settings-email', 'Read Settings Email', 'Read Settings Email', '2021-03-09 12:19:32', '2021-03-09 12:19:32'),
(114, 'read-settings-invoice', 'Read Settings Invoice', 'Read Settings Invoice', '2021-03-09 12:19:32', '2021-03-09 12:19:32'),
(115, 'read-settings-localisation', 'Read Settings Localisation', 'Read Settings Localisation', '2021-03-09 12:19:32', '2021-03-09 12:19:32'),
(116, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2021-03-09 12:19:33', '2021-03-09 12:19:33'),
(117, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2021-03-09 12:19:33', '2021-03-09 12:19:33'),
(118, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2021-03-09 12:19:33', '2021-03-09 12:19:33'),
(119, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2021-03-09 12:19:35', '2021-03-09 12:19:35'),
(120, 'read-settings-schedule', 'Read Settings Schedule', 'Read Settings Schedule', '2021-03-09 12:19:35', '2021-03-09 12:19:35'),
(121, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2021-03-09 12:19:36', '2021-03-09 12:19:36'),
(122, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2021-03-09 12:19:36', '2021-03-09 12:19:36'),
(123, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2021-03-09 12:19:36', '2021-03-09 12:19:36'),
(124, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2021-03-09 12:19:36', '2021-03-09 12:19:36'),
(125, 'read-widgets-account-balance', 'Read Widgets Account Balance', 'Read Widgets Account Balance', '2021-03-09 12:19:36', '2021-03-09 12:19:36'),
(126, 'read-widgets-cash-flow', 'Read Widgets Cash Flow', 'Read Widgets Cash Flow', '2021-03-09 12:19:36', '2021-03-09 12:19:36'),
(127, 'read-widgets-expenses-by-category', 'Read Widgets Expenses By Category', 'Read Widgets Expenses By Category', '2021-03-09 12:19:37', '2021-03-09 12:19:37'),
(128, 'read-widgets-income-by-category', 'Read Widgets Income By Category', 'Read Widgets Income By Category', '2021-03-09 12:19:37', '2021-03-09 12:19:37'),
(129, 'read-widgets-latest-expenses', 'Read Widgets Latest Expenses', 'Read Widgets Latest Expenses', '2021-03-09 12:19:37', '2021-03-09 12:19:37'),
(130, 'read-widgets-latest-income', 'Read Widgets Latest Income', 'Read Widgets Latest Income', '2021-03-09 12:19:37', '2021-03-09 12:19:37'),
(131, 'read-widgets-total-expenses', 'Read Widgets Total Expenses', 'Read Widgets Total Expenses', '2021-03-09 12:19:38', '2021-03-09 12:19:38'),
(132, 'read-widgets-total-income', 'Read Widgets Total Income', 'Read Widgets Total Income', '2021-03-09 12:19:38', '2021-03-09 12:19:38'),
(133, 'read-widgets-total-profit', 'Read Widgets Total Profit', 'Read Widgets Total Profit', '2021-03-09 12:19:38', '2021-03-09 12:19:38'),
(134, 'read-client-portal', 'Read Client Portal', 'Read Client Portal', '2021-03-09 12:19:56', '2021-03-09 12:19:56'),
(135, 'read-portal-invoices', 'Read Portal Invoices', 'Read Portal Invoices', '2021-03-09 12:19:56', '2021-03-09 12:19:56'),
(136, 'update-portal-invoices', 'Update Portal Invoices', 'Update Portal Invoices', '2021-03-09 12:19:57', '2021-03-09 12:19:57'),
(137, 'read-portal-payments', 'Read Portal Payments', 'Read Portal Payments', '2021-03-09 12:19:57', '2021-03-09 12:19:57'),
(138, 'update-portal-payments', 'Update Portal Payments', 'Update Portal Payments', '2021-03-09 12:19:57', '2021-03-09 12:19:57'),
(139, 'read-portal-profile', 'Read Portal Profile', 'Read Portal Profile', '2021-03-09 12:19:58', '2021-03-09 12:19:58'),
(140, 'update-portal-profile', 'Update Portal Profile', 'Update Portal Profile', '2021-03-09 12:19:58', '2021-03-09 12:19:58'),
(141, 'read-offline-payments-settings', 'Read Offline Payments Settings', 'Read Offline Payments Settings', '2021-03-09 12:19:58', '2021-03-09 12:19:58'),
(142, 'update-offline-payments-settings', 'Update Offline Payments Settings', 'Update Offline Payments Settings', '2021-03-09 12:19:59', '2021-03-09 12:19:59'),
(143, 'delete-offline-payments-settings', 'Delete Offline Payments Settings', 'Delete Offline Payments Settings', '2021-03-09 12:19:59', '2021-03-09 12:19:59'),
(144, 'read-paypal-standard-settings', 'Read PayPal Standard Settings', 'Read PayPal Standard Settings', '2021-03-09 12:19:59', '2021-03-09 12:19:59'),
(145, 'update-paypal-standard-settings', 'Update PayPal Standard Settings', 'Update PayPal Standard Settings', '2021-03-09 12:19:59', '2021-03-09 12:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `zun_reconciliations`
--

CREATE TABLE `zun_reconciliations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `reconciled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_recurring`
--

CREATE TABLE `zun_recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurable_id` bigint(20) UNSIGNED NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_reports`
--

CREATE TABLE `zun_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_reports`
--

INSERT INTO `zun_reports` (`id`, `company_id`, `class`, `name`, `description`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2021-03-09 12:20:00', '2021-03-09 12:20:00', NULL),
(2, 1, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2021-03-09 12:20:00', '2021-03-09 12:20:00', NULL),
(3, 1, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2021-03-09 12:20:00', '2021-03-09 12:20:00', NULL),
(4, 1, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2021-03-09 12:20:00', '2021-03-09 12:20:00', NULL),
(5, 1, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2021-03-09 12:20:00', '2021-03-09 12:20:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_roles`
--

CREATE TABLE `zun_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_roles`
--

INSERT INTO `zun_roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2021-03-09 12:19:01', '2021-03-09 12:19:01'),
(2, 'manager', 'Manager', 'Manager', '2021-03-09 12:19:38', '2021-03-09 12:19:38'),
(3, 'customer', 'Customer', 'Customer', '2021-03-09 12:19:56', '2021-03-09 12:19:56');

-- --------------------------------------------------------

--
-- Table structure for table `zun_role_permissions`
--

CREATE TABLE `zun_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_role_permissions`
--

INSERT INTO `zun_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(2, 1),
(2, 7),
(2, 8),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(2, 133),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(3, 134),
(3, 135),
(3, 136),
(3, 137),
(3, 138),
(3, 139),
(3, 140);

-- --------------------------------------------------------

--
-- Table structure for table `zun_sessions`
--

CREATE TABLE `zun_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_settings`
--

CREATE TABLE `zun_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_settings`
--

INSERT INTO `zun_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'localisation.financial_start', '01-01'),
(2, 1, 'localisation.financial_denote', 'ends'),
(3, 1, 'localisation.timezone', 'Europe/London'),
(4, 1, 'localisation.date_format', 'd M Y'),
(5, 1, 'localisation.date_separator', 'space'),
(6, 1, 'localisation.percent_position', 'after'),
(7, 1, 'localisation.discount_location', 'total'),
(8, 1, 'invoice.number_prefix', 'INV-'),
(9, 1, 'invoice.number_digit', '5'),
(10, 1, 'invoice.number_next', '1'),
(11, 1, 'invoice.item_name', 'settings.invoice.item'),
(12, 1, 'invoice.price_name', 'settings.invoice.price'),
(13, 1, 'invoice.quantity_name', 'settings.invoice.quantity'),
(14, 1, 'invoice.hide_item_name', '0'),
(15, 1, 'invoice.hide_item_description', '0'),
(16, 1, 'invoice.hide_quantity', '0'),
(17, 1, 'invoice.hide_price', '0'),
(18, 1, 'invoice.hide_amount', '0'),
(19, 1, 'invoice.payment_terms', '0'),
(20, 1, 'invoice.template', 'default'),
(21, 1, 'invoice.color', '#55588b'),
(22, 1, 'invoice.logo_size_width', '128'),
(23, 1, 'invoice.logo_size_height', '128'),
(24, 1, 'invoice.title', 'Invoice'),
(25, 1, 'bill.number_prefix', 'BILL-'),
(26, 1, 'bill.number_digit', '5'),
(27, 1, 'bill.number_next', '1'),
(28, 1, 'bill.item_name', 'settings.bill.item'),
(29, 1, 'bill.price_name', 'settings.bill.price'),
(30, 1, 'bill.quantity_name', 'settings.bill.quantity'),
(31, 1, 'bill.payment_terms', '0'),
(32, 1, 'bill.template', 'default'),
(33, 1, 'bill.color', '#55588b'),
(34, 1, 'default.currency', 'USD'),
(35, 1, 'default.locale', 'en-GB'),
(36, 1, 'default.list_limit', '25'),
(37, 1, 'default.payment_method', 'offline-payments.cash.1'),
(38, 1, 'default.select_limit', '10'),
(39, 1, 'default.account', '1'),
(40, 1, 'default.income_category', '2'),
(41, 1, 'default.expense_category', '4'),
(42, 1, 'email.protocol', 'mail'),
(43, 1, 'email.sendmail_path', '/usr/sbin/sendmail -bs'),
(44, 1, 'schedule.send_invoice_reminder', '0'),
(45, 1, 'schedule.invoice_days', '1,3,5,10'),
(46, 1, 'schedule.send_bill_reminder', '0'),
(47, 1, 'schedule.bill_days', '10,5,3,1'),
(48, 1, 'schedule.time', '09:00'),
(49, 1, 'contact.type.customer', 'customer'),
(50, 1, 'contact.type.vendor', 'vendor'),
(51, 1, 'transaction.type.income', 'income'),
(52, 1, 'transaction.type.expense', 'expense'),
(53, 1, 'wizard.completed', '1'),
(54, 1, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]'),
(55, 1, 'company.name', 'My Company'),
(56, 1, 'company.email', 'my@company.com');

-- --------------------------------------------------------

--
-- Table structure for table `zun_taxes`
--

CREATE TABLE `zun_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_transactions`
--

CREATE TABLE `zun_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `account_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_transfers`
--

CREATE TABLE `zun_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `expense_transaction_id` int(11) NOT NULL,
  `income_transaction_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_users`
--

CREATE TABLE `zun_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB',
  `landing_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT 'dashboard',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_users`
--

INSERT INTO `zun_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `locale`, `landing_page`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 'admin@company.com', '$2y$10$7yb7RF8WXc3nwpL4L8ibOuITNNytKU8nBU2PMhg3j7WiTFaFm8z6y', NULL, '2021-03-09 12:28:12', 'en-GB', 'dashboard', 1, '2021-03-09 12:20:01', '2021-03-09 12:28:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zun_user_companies`
--

CREATE TABLE `zun_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_user_companies`
--

INSERT INTO `zun_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `zun_user_dashboards`
--

CREATE TABLE `zun_user_dashboards` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `dashboard_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_user_dashboards`
--

INSERT INTO `zun_user_dashboards` (`user_id`, `dashboard_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `zun_user_permissions`
--

CREATE TABLE `zun_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zun_user_roles`
--

CREATE TABLE `zun_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_user_roles`
--

INSERT INTO `zun_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `zun_widgets`
--

CREATE TABLE `zun_widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `dashboard_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `zun_widgets`
--

INSERT INTO `zun_widgets` (`id`, `company_id`, `dashboard_id`, `class`, `name`, `sort`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(2, 1, 1, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(3, 1, 1, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(4, 1, 1, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(5, 1, 1, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(6, 1, 1, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(7, 1, 1, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(8, 1, 1, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL),
(9, 1, 1, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', '2021-03-09 12:20:01', '2021-03-09 12:20:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zun_accounts`
--
ALTER TABLE `zun_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_accounts_company_id_index` (`company_id`);

--
-- Indexes for table `zun_bills`
--
ALTER TABLE `zun_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `zun_bills_company_id_index` (`company_id`);

--
-- Indexes for table `zun_bill_histories`
--
ALTER TABLE `zun_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_bill_histories_company_id_index` (`company_id`),
  ADD KEY `zun_bill_histories_bill_id_index` (`bill_id`);

--
-- Indexes for table `zun_bill_items`
--
ALTER TABLE `zun_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_bill_items_company_id_index` (`company_id`),
  ADD KEY `zun_bill_items_bill_id_index` (`bill_id`);

--
-- Indexes for table `zun_bill_item_taxes`
--
ALTER TABLE `zun_bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_bill_item_taxes_company_id_index` (`company_id`),
  ADD KEY `zun_bill_item_taxes_bill_id_index` (`bill_id`);

--
-- Indexes for table `zun_bill_totals`
--
ALTER TABLE `zun_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_bill_totals_company_id_index` (`company_id`),
  ADD KEY `zun_bill_totals_bill_id_index` (`bill_id`);

--
-- Indexes for table `zun_categories`
--
ALTER TABLE `zun_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_categories_company_id_index` (`company_id`);

--
-- Indexes for table `zun_companies`
--
ALTER TABLE `zun_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zun_contacts`
--
ALTER TABLE `zun_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_contacts_company_id_type_email_deleted_at_unique` (`company_id`,`type`,`email`,`deleted_at`),
  ADD KEY `zun_contacts_company_id_type_index` (`company_id`,`type`);

--
-- Indexes for table `zun_currencies`
--
ALTER TABLE `zun_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `zun_currencies_company_id_index` (`company_id`);

--
-- Indexes for table `zun_dashboards`
--
ALTER TABLE `zun_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_dashboards_company_id_index` (`company_id`);

--
-- Indexes for table `zun_documents`
--
ALTER TABLE `zun_documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_documents_document_number_deleted_at_company_id_type_unique` (`document_number`,`deleted_at`,`company_id`,`type`),
  ADD KEY `zun_documents_company_id_index` (`company_id`),
  ADD KEY `zun_documents_type_index` (`type`);

--
-- Indexes for table `zun_document_histories`
--
ALTER TABLE `zun_document_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_document_histories_company_id_index` (`company_id`),
  ADD KEY `zun_document_histories_type_index` (`type`),
  ADD KEY `zun_document_histories_document_id_index` (`document_id`);

--
-- Indexes for table `zun_document_items`
--
ALTER TABLE `zun_document_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_document_items_company_id_index` (`company_id`),
  ADD KEY `zun_document_items_type_index` (`type`),
  ADD KEY `zun_document_items_document_id_index` (`document_id`);

--
-- Indexes for table `zun_document_item_taxes`
--
ALTER TABLE `zun_document_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_document_item_taxes_company_id_index` (`company_id`),
  ADD KEY `zun_document_item_taxes_type_index` (`type`),
  ADD KEY `zun_document_item_taxes_document_id_index` (`document_id`);

--
-- Indexes for table `zun_document_totals`
--
ALTER TABLE `zun_document_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_document_totals_company_id_index` (`company_id`),
  ADD KEY `zun_document_totals_type_index` (`type`),
  ADD KEY `zun_document_totals_document_id_index` (`document_id`);

--
-- Indexes for table `zun_email_templates`
--
ALTER TABLE `zun_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_email_templates_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `zun_email_templates_company_id_index` (`company_id`);

--
-- Indexes for table `zun_failed_jobs`
--
ALTER TABLE `zun_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `zun_firewall_ips`
--
ALTER TABLE `zun_firewall_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_firewall_ips_ip_deleted_at_unique` (`ip`,`deleted_at`),
  ADD KEY `zun_firewall_ips_ip_index` (`ip`);

--
-- Indexes for table `zun_firewall_logs`
--
ALTER TABLE `zun_firewall_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_firewall_logs_ip_index` (`ip`);

--
-- Indexes for table `zun_invoices`
--
ALTER TABLE `zun_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `zun_invoices_company_id_index` (`company_id`);

--
-- Indexes for table `zun_invoice_histories`
--
ALTER TABLE `zun_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_invoice_histories_company_id_index` (`company_id`),
  ADD KEY `zun_invoice_histories_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `zun_invoice_items`
--
ALTER TABLE `zun_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_invoice_items_company_id_index` (`company_id`),
  ADD KEY `zun_invoice_items_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `zun_invoice_item_taxes`
--
ALTER TABLE `zun_invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_invoice_item_taxes_company_id_index` (`company_id`),
  ADD KEY `zun_invoice_item_taxes_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `zun_invoice_totals`
--
ALTER TABLE `zun_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_invoice_totals_company_id_index` (`company_id`),
  ADD KEY `zun_invoice_totals_invoice_id_index` (`invoice_id`);

--
-- Indexes for table `zun_items`
--
ALTER TABLE `zun_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_items_company_id_index` (`company_id`);

--
-- Indexes for table `zun_item_taxes`
--
ALTER TABLE `zun_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_item_taxes_company_id_item_id_index` (`company_id`,`item_id`);

--
-- Indexes for table `zun_jobs`
--
ALTER TABLE `zun_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `zun_media`
--
ALTER TABLE `zun_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  ADD KEY `zun_media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `zun_media_aggregate_type_index` (`aggregate_type`);

--
-- Indexes for table `zun_mediables`
--
ALTER TABLE `zun_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `zun_mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `zun_mediables_tag_index` (`tag`),
  ADD KEY `zun_mediables_order_index` (`order`);

--
-- Indexes for table `zun_migrations`
--
ALTER TABLE `zun_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zun_modules`
--
ALTER TABLE `zun_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `zun_modules_company_id_index` (`company_id`);

--
-- Indexes for table `zun_module_histories`
--
ALTER TABLE `zun_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `zun_notifications`
--
ALTER TABLE `zun_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `zun_password_resets`
--
ALTER TABLE `zun_password_resets`
  ADD KEY `zun_password_resets_email_index` (`email`);

--
-- Indexes for table `zun_permissions`
--
ALTER TABLE `zun_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_permissions_name_unique` (`name`);

--
-- Indexes for table `zun_reconciliations`
--
ALTER TABLE `zun_reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `zun_recurring`
--
ALTER TABLE `zun_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_recurring_recurable_type_recurable_id_index` (`recurable_type`,`recurable_id`),
  ADD KEY `zun_recurring_company_id_index` (`company_id`);

--
-- Indexes for table `zun_reports`
--
ALTER TABLE `zun_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_reports_company_id_index` (`company_id`);

--
-- Indexes for table `zun_roles`
--
ALTER TABLE `zun_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_roles_name_unique` (`name`);

--
-- Indexes for table `zun_role_permissions`
--
ALTER TABLE `zun_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `zun_role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `zun_sessions`
--
ALTER TABLE `zun_sessions`
  ADD UNIQUE KEY `zun_sessions_id_unique` (`id`);

--
-- Indexes for table `zun_settings`
--
ALTER TABLE `zun_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `zun_settings_company_id_index` (`company_id`);

--
-- Indexes for table `zun_taxes`
--
ALTER TABLE `zun_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `zun_transactions`
--
ALTER TABLE `zun_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_transactions_company_id_type_index` (`company_id`,`type`),
  ADD KEY `zun_transactions_account_id_index` (`account_id`),
  ADD KEY `zun_transactions_category_id_index` (`category_id`),
  ADD KEY `zun_transactions_contact_id_index` (`contact_id`),
  ADD KEY `zun_transactions_document_id_index` (`document_id`);

--
-- Indexes for table `zun_transfers`
--
ALTER TABLE `zun_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_transfers_company_id_index` (`company_id`);

--
-- Indexes for table `zun_users`
--
ALTER TABLE `zun_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zun_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `zun_user_companies`
--
ALTER TABLE `zun_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `zun_user_dashboards`
--
ALTER TABLE `zun_user_dashboards`
  ADD PRIMARY KEY (`user_id`,`dashboard_id`,`user_type`);

--
-- Indexes for table `zun_user_permissions`
--
ALTER TABLE `zun_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `zun_user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `zun_user_roles`
--
ALTER TABLE `zun_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `zun_user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `zun_widgets`
--
ALTER TABLE `zun_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zun_widgets_company_id_dashboard_id_index` (`company_id`,`dashboard_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zun_accounts`
--
ALTER TABLE `zun_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zun_bills`
--
ALTER TABLE `zun_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_bill_histories`
--
ALTER TABLE `zun_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_bill_items`
--
ALTER TABLE `zun_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_bill_item_taxes`
--
ALTER TABLE `zun_bill_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_bill_totals`
--
ALTER TABLE `zun_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_categories`
--
ALTER TABLE `zun_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zun_companies`
--
ALTER TABLE `zun_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zun_contacts`
--
ALTER TABLE `zun_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_currencies`
--
ALTER TABLE `zun_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zun_dashboards`
--
ALTER TABLE `zun_dashboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zun_documents`
--
ALTER TABLE `zun_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_document_histories`
--
ALTER TABLE `zun_document_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_document_items`
--
ALTER TABLE `zun_document_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_document_item_taxes`
--
ALTER TABLE `zun_document_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_document_totals`
--
ALTER TABLE `zun_document_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_email_templates`
--
ALTER TABLE `zun_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zun_failed_jobs`
--
ALTER TABLE `zun_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_firewall_ips`
--
ALTER TABLE `zun_firewall_ips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_firewall_logs`
--
ALTER TABLE `zun_firewall_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_invoices`
--
ALTER TABLE `zun_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_invoice_histories`
--
ALTER TABLE `zun_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_invoice_items`
--
ALTER TABLE `zun_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_invoice_item_taxes`
--
ALTER TABLE `zun_invoice_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_invoice_totals`
--
ALTER TABLE `zun_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_items`
--
ALTER TABLE `zun_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_item_taxes`
--
ALTER TABLE `zun_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_jobs`
--
ALTER TABLE `zun_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_media`
--
ALTER TABLE `zun_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_migrations`
--
ALTER TABLE `zun_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zun_modules`
--
ALTER TABLE `zun_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zun_module_histories`
--
ALTER TABLE `zun_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zun_permissions`
--
ALTER TABLE `zun_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `zun_reconciliations`
--
ALTER TABLE `zun_reconciliations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_recurring`
--
ALTER TABLE `zun_recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_reports`
--
ALTER TABLE `zun_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zun_roles`
--
ALTER TABLE `zun_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zun_settings`
--
ALTER TABLE `zun_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `zun_taxes`
--
ALTER TABLE `zun_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_transactions`
--
ALTER TABLE `zun_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_transfers`
--
ALTER TABLE `zun_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zun_users`
--
ALTER TABLE `zun_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zun_widgets`
--
ALTER TABLE `zun_widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zun_mediables`
--
ALTER TABLE `zun_mediables`
  ADD CONSTRAINT `zun_mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `zun_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zun_role_permissions`
--
ALTER TABLE `zun_role_permissions`
  ADD CONSTRAINT `zun_role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `zun_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zun_role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `zun_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zun_user_permissions`
--
ALTER TABLE `zun_user_permissions`
  ADD CONSTRAINT `zun_user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `zun_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zun_user_roles`
--
ALTER TABLE `zun_user_roles`
  ADD CONSTRAINT `zun_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `zun_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
