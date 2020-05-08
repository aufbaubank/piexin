-- MariaDB dump 10.17  Distrib 10.5.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: phpipam
-- ------------------------------------------------------
-- Server version	10.5.2-MariaDB-1:10.5.2+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api`
--

DROP TABLE IF EXISTS `api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `app_code` varchar(32) DEFAULT '',
  `app_permissions` int(1) DEFAULT 1,
  `app_comment` text DEFAULT NULL,
  `app_security` set('ssl_code','ssl_token','crypt','user','none') NOT NULL DEFAULT 'ssl_token',
  `app_lock` int(1) NOT NULL DEFAULT 0,
  `app_lock_wait` int(4) NOT NULL DEFAULT 30,
  `app_nest_custom_fields` tinyint(1) DEFAULT 0,
  `app_show_links` tinyint(1) DEFAULT 0,
  `app_last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api`
--

LOCK TABLES `api` WRITE;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
INSERT INTO `api` VALUES (1,'development','developcode',1,NULL,'ssl_code',0,0,0,0,'2020-05-08 15:52:41');
/*!40000 ALTER TABLE `api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelog` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ctype` set('ip_addr','subnet','section') NOT NULL DEFAULT '',
  `coid` int(11) unsigned NOT NULL,
  `cuser` int(11) unsigned NOT NULL,
  `caction` set('add','edit','delete','truncate','resize','perm_change') NOT NULL DEFAULT 'edit',
  `cresult` set('error','success') NOT NULL DEFAULT '',
  `cdate` datetime NOT NULL,
  `cdiff` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `coid` (`coid`),
  KEY `ctype` (`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES (1,'subnet',1,1,'delete','success','2020-03-07 11:23:23','[details]: \r\n[id]. 1\r\n[subnet]. fd13.6d20.29dc.cf27..\r\n[mask]. 64\r\n[sectionId]. IPv6 (id 2)\r\n[description]. Private subnet 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. Root\r\n[allowRequests]. False\r\n[vlanId]. IPv6 private 1 [2001]\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(2,'section',2,1,'delete','success','2020-03-07 11:23:23','[details]: \r\n[id]. 2\r\n[name]. IPv6\r\n[description]. Section for IPv6 addresses\r\n[masterSection]. Root\r\n[permissions]. / \r\n[strictMode]. False\r\n[subnetOrdering]. / \r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 0\r\n[DNS]. / \r\n\r\n'),(3,'subnet',6,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 6\r\n[subnet]. 10.65.22.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. DHCP range\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 0.0.0.0/ [My folder] (id 5)\r\n[allowRequests]. True\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(4,'subnet',5,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 5\r\n[sectionId]. Customers (id 1)\r\n[description]. My folder\r\n[masterSubnetId]. Root\r\n[resolveDNS]. 0\r\n[customer_id]. / \r\n[isFolder]. 1\r\n[location]. None\r\n\r\n'),(5,'subnet',3,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 3\r\n[subnet]. 10.10.1.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(6,'subnet',4,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 4\r\n[subnet]. 10.10.2.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 2\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(7,'subnet',2,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 2\r\n[subnet]. 10.10.0.0\r\n[mask]. 16\r\n[sectionId]. Customers (id 1)\r\n[description]. Business customers\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. Root\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(8,'subnet',3,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 3\r\n[subnet]. 10.10.1.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(9,'subnet',4,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 4\r\n[subnet]. 10.10.2.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 2\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(10,'subnet',6,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 6\r\n[subnet]. 10.65.22.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. DHCP range\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 0.0.0.0/ [My folder] (id 5)\r\n[allowRequests]. True\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(11,'section',1,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 1\r\n[name]. Customers\r\n[description]. Section for customers\r\n[masterSection]. Root\r\n[permissions]. / \r\n[strictMode]. False\r\n[subnetOrdering]. / \r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 0\r\n[DNS]. / \r\n\r\n'),(12,'section',3,1,'add','success','2020-03-07 11:24:25','[details]: \r\n[name]. section1\r\n[description]. / \r\n[strictMode]. True\r\n[subnetOrdering]. default\r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 1\r\n[masterSection]. Root\r\n[permissions]. / \r\n[id]. 3\r\n\r\n'),(13,'section',4,1,'add','success','2020-03-07 11:24:36','[details]: \r\n[name]. section2\r\n[description]. / \r\n[strictMode]. True\r\n[subnetOrdering]. default\r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 1\r\n[masterSection]. Root\r\n[permissions]. / \r\n[id]. 4\r\n\r\n'),(14,'subnet',7,1,'add','success','2020-03-07 11:26:02','[details]: \r\n[id]. 7\r\n[isFolder]. 0\r\n[masterSubnetId]. Root\r\n[subnet]. 10.0.0.0\r\n[mask]. 8\r\n[description]. huge subnet\r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(15,'subnet',8,1,'add','success','2020-03-07 11:26:46','[details]: \r\n[id]. 8\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.0.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 10_FIRST [10]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(16,'ip_addr',11,1,'add','success','2020-03-07 11:26:59','[details]: \r\n[ip_addr]. 10.0.0.1\r\n[id]. 11\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host1\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(17,'ip_addr',12,1,'add','success','2020-03-07 11:27:11','[details]: \r\n[ip_addr]. 10.0.0.2\r\n[id]. 12\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host2\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(18,'subnet',9,1,'add','success','2020-03-07 11:27:40','[details]: \r\n[id]. 9\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.1.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 11_SCND [11]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(19,'ip_addr',13,1,'add','success','2020-03-07 11:27:50','[details]: \r\n[ip_addr]. 10.0.1.1\r\n[id]. 13\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host3\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(20,'ip_addr',14,1,'add','success','2020-03-07 11:28:03','[details]: \r\n[ip_addr]. 10.0.1.2\r\n[id]. 14\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host4\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(21,'subnet',10,1,'add','success','2020-03-07 11:28:56','[details]: \r\n[id]. 10\r\n[isFolder]. 0\r\n[masterSubnetId]. Root\r\n[subnet]. 172.16.0.0\r\n[mask]. 12\r\n[description]. / \r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(22,'subnet',11,1,'add','success','2020-03-07 11:29:26','[details]: \r\n[id]. 11\r\n[isFolder]. 0\r\n[masterSubnetId]. 172.16.0.0/12 (id 10)\r\n[subnet]. 172.16.0.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 12_THRD [12]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(23,'subnet',12,1,'add','success','2020-03-07 11:30:01','[details]: \r\n[id]. 12\r\n[isFolder]. 0\r\n[masterSubnetId]. 172.16.0.0/12 (id 10)\r\n[subnet]. 172.16.1.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 13_4TH [13]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(24,'ip_addr',15,1,'add','success','2020-03-07 11:30:20','[details]: \r\n[ip_addr]. 172.16.0.1\r\n[id]. 15\r\n[subnetId]. 172.16.0.0/24 (id 11)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host5\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(25,'ip_addr',16,1,'add','success','2020-03-07 11:30:29','[details]: \r\n[ip_addr]. 172.16.0.2\r\n[id]. 16\r\n[subnetId]. 172.16.0.0/24 (id 11)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host6\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(26,'ip_addr',17,1,'add','success','2020-03-07 11:30:50','[details]: \r\n[ip_addr]. 172.16.1.1\r\n[id]. 17\r\n[subnetId]. 172.16.1.0/24 (id 12)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host7\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(27,'ip_addr',18,1,'add','success','2020-03-07 11:31:01','[details]: \r\n[ip_addr]. 172.16.1.2\r\n[id]. 18\r\n[subnetId]. 172.16.1.0/24 (id 12)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host8\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(28,'ip_addr',11,1,'edit','success','2020-03-07 12:39:03','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => dmz, group1\r\n'),(29,'ip_addr',12,1,'edit','success','2020-03-07 12:39:20','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => group2\r\n'),(30,'ip_addr',13,1,'edit','success','2020-03-07 12:39:37','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(31,'ip_addr',14,1,'edit','success','2020-03-07 12:39:45','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(32,'ip_addr',15,1,'edit','success','2020-03-07 12:40:11','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => dmz, group2\r\n'),(33,'ip_addr',16,1,'edit','success','2020-03-07 12:40:20','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(34,'ip_addr',16,1,'edit','success','2020-03-07 12:40:31','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: web1 => NULL\r\n'),(35,'ip_addr',11,1,'edit','success','2020-03-11 11:27:18','[hostname]: host1 => host1.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(36,'ip_addr',12,1,'edit','success','2020-03-11 11:27:28','[hostname]: host2 => host2.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(37,'ip_addr',19,1,'add','success','2020-03-11 11:27:40','[details]: \r\n[ip_addr]. 10.0.0.3\r\n[id]. 19\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(38,'ip_addr',20,1,'add','success','2020-03-11 11:27:52','[details]: \r\n[ip_addr]. 10.0.0.4\r\n[id]. 20\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid.hostname\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(39,'ip_addr',21,1,'add','success','2020-03-11 11:28:10','[details]: \r\n[ip_addr]. 10.0.0.5\r\n[id]. 21\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. moreinvalid.hostname.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(40,'ip_addr',21,1,'edit','success','2020-03-11 11:28:38','[hostname]: moreinvalid.hostname.local => moreinvalid..hostname.l\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(41,'ip_addr',13,1,'edit','success','2020-03-11 11:29:05','[hostname]: host3 => host3.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(42,'ip_addr',14,1,'edit','success','2020-03-11 11:29:10','[hostname]: host4 => host4.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(43,'ip_addr',15,1,'edit','success','2020-03-11 11:29:22','[hostname]: host5 => host5.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(44,'ip_addr',16,1,'edit','success','2020-03-11 11:29:28','[hostname]: host6 => host6.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(45,'ip_addr',17,1,'edit','success','2020-03-11 11:29:42','[hostname]: host7 => host7.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(46,'ip_addr',18,1,'edit','success','2020-03-11 11:29:52','[hostname]: host8 => host8.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(47,'ip_addr',22,1,'add','success','2020-05-08 15:53:13','[details]: \r\n[ip_addr]. 10.0.1.3\r\n[id]. 22\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. WINDOWS.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n');
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuitProviders`
--

DROP TABLE IF EXISTS `circuitProviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuitProviders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `contact` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuitProviders`
--

LOCK TABLES `circuitProviders` WRITE;
/*!40000 ALTER TABLE `circuitProviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuitProviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuitTypes`
--

DROP TABLE IF EXISTS `circuitTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuitTypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ctname` varchar(64) NOT NULL,
  `ctcolor` varchar(7) DEFAULT '#000000',
  `ctpattern` enum('Solid','Dotted') DEFAULT 'Solid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuitTypes`
--

LOCK TABLES `circuitTypes` WRITE;
/*!40000 ALTER TABLE `circuitTypes` DISABLE KEYS */;
INSERT INTO `circuitTypes` VALUES (1,'Default','#000000','Solid');
/*!40000 ALTER TABLE `circuitTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuits`
--

DROP TABLE IF EXISTS `circuits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` varchar(128) DEFAULT NULL,
  `provider` int(11) unsigned NOT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `capacity` varchar(128) DEFAULT NULL,
  `status` enum('Active','Inactive','Reserved') NOT NULL DEFAULT 'Active',
  `device1` int(11) unsigned DEFAULT NULL,
  `location1` int(11) unsigned DEFAULT NULL,
  `device2` int(11) unsigned DEFAULT NULL,
  `location2` int(11) unsigned DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT 0,
  `customer_id` int(11) unsigned DEFAULT NULL,
  `differentiator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuits_diff_UN` (`cid`,`differentiator`),
  KEY `location1` (`location1`),
  KEY `location2` (`location2`),
  KEY `customer_circuits` (`customer_id`),
  CONSTRAINT `customer_circuits` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuits`
--

LOCK TABLES `circuits` WRITE;
/*!40000 ALTER TABLE `circuits` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuitsLogical`
--

DROP TABLE IF EXISTS `circuitsLogical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuitsLogical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logical_cid` varchar(128) NOT NULL,
  `purpose` varchar(64) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `member_count` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `circuitsLogical_UN` (`logical_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuitsLogical`
--

LOCK TABLES `circuitsLogical` WRITE;
/*!40000 ALTER TABLE `circuitsLogical` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuitsLogical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circuitsLogicalMapping`
--

DROP TABLE IF EXISTS `circuitsLogicalMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuitsLogicalMapping` (
  `logicalCircuit_id` int(11) unsigned NOT NULL,
  `circuit_id` int(11) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuitsLogicalMapping`
--

LOCK TABLES `circuitsLogicalMapping` WRITE;
/*!40000 ALTER TABLE `circuitsLogicalMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `circuitsLogicalMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `address` varchar(255) DEFAULT NULL,
  `postcode` int(8) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `lat` varchar(12) DEFAULT NULL,
  `long` varchar(12) DEFAULT NULL,
  `contact_person` text DEFAULT NULL,
  `contact_phone` varchar(32) DEFAULT NULL,
  `contact_mail` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` set('Active','Reserved','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceTypes`
--

DROP TABLE IF EXISTS `deviceTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceTypes` (
  `tid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tname` varchar(128) DEFAULT NULL,
  `tdescription` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceTypes`
--

LOCK TABLES `deviceTypes` WRITE;
/*!40000 ALTER TABLE `deviceTypes` DISABLE KEYS */;
INSERT INTO `deviceTypes` VALUES (1,'Switch','Switch'),(2,'Router','Router'),(3,'Firewall','Firewall'),(4,'Hub','Hub'),(5,'Wireless','Wireless'),(6,'Database','Database'),(7,'Workstation','Workstation'),(8,'Laptop','Laptop'),(9,'Other','Other');
/*!40000 ALTER TABLE `deviceTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) DEFAULT NULL,
  `ip_addr` varchar(100) DEFAULT NULL,
  `type` int(2) DEFAULT 0,
  `description` varchar(256) DEFAULT NULL,
  `sections` varchar(1024) DEFAULT NULL,
  `snmp_community` varchar(100) DEFAULT NULL,
  `snmp_version` set('0','1','2','3') DEFAULT '0',
  `snmp_port` mediumint(5) unsigned DEFAULT 161,
  `snmp_timeout` mediumint(5) unsigned DEFAULT 1000,
  `snmp_queries` varchar(128) DEFAULT NULL,
  `snmp_v3_sec_level` set('none','noAuthNoPriv','authNoPriv','authPriv') DEFAULT 'none',
  `snmp_v3_auth_protocol` set('none','MD5','SHA') DEFAULT 'none',
  `snmp_v3_auth_pass` varchar(64) DEFAULT NULL,
  `snmp_v3_priv_protocol` set('none','DES','AES') DEFAULT 'none',
  `snmp_v3_priv_pass` varchar(64) DEFAULT NULL,
  `snmp_v3_ctx_name` varchar(64) DEFAULT NULL,
  `snmp_v3_ctx_engine_id` varchar(64) DEFAULT NULL,
  `rack` int(11) unsigned DEFAULT NULL,
  `rack_start` int(11) unsigned DEFAULT NULL,
  `rack_size` int(11) unsigned DEFAULT NULL,
  `location` int(11) unsigned DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewallZoneMapping`
--

DROP TABLE IF EXISTS `firewallZoneMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewallZoneMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoneId` int(11) unsigned NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deviceId` int(11) unsigned DEFAULT NULL,
  `interface` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `devId_idx` (`deviceId`),
  CONSTRAINT `devId` FOREIGN KEY (`deviceId`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewallZoneMapping`
--

LOCK TABLES `firewallZoneMapping` WRITE;
/*!40000 ALTER TABLE `firewallZoneMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewallZoneMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewallZoneSubnet`
--

DROP TABLE IF EXISTS `firewallZoneSubnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewallZoneSubnet` (
  `zoneId` int(11) NOT NULL,
  `subnetId` int(11) NOT NULL,
  KEY `fk_zoneId_idx` (`zoneId`),
  KEY `fk_subnetId_idx` (`subnetId`),
  CONSTRAINT `fk_subnetId` FOREIGN KEY (`subnetId`) REFERENCES `subnets` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_zoneId` FOREIGN KEY (`zoneId`) REFERENCES `firewallZones` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewallZoneSubnet`
--

LOCK TABLES `firewallZoneSubnet` WRITE;
/*!40000 ALTER TABLE `firewallZoneSubnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewallZoneSubnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firewallZones`
--

DROP TABLE IF EXISTS `firewallZones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firewallZones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generator` tinyint(1) NOT NULL,
  `length` int(2) DEFAULT NULL,
  `padding` tinyint(1) DEFAULT NULL,
  `zone` varchar(31) COLLATE utf8_unicode_ci NOT NULL,
  `indicator` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firewallZones`
--

LOCK TABLES `firewallZones` WRITE;
/*!40000 ALTER TABLE `firewallZones` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewallZones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructions`
--

DROP TABLE IF EXISTS `instructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructions` (
  `id` int(11) NOT NULL,
  `instructions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructions`
--

LOCK TABLES `instructions` WRITE;
/*!40000 ALTER TABLE `instructions` DISABLE KEYS */;
INSERT INTO `instructions` VALUES (1,'You can write instructions under admin menu!');
/*!40000 ALTER TABLE `instructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipTags`
--

DROP TABLE IF EXISTS `ipTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipTags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `showtag` tinyint(4) DEFAULT 1,
  `bgcolor` varchar(7) DEFAULT '#000',
  `fgcolor` varchar(7) DEFAULT '#fff',
  `compress` set('No','Yes') NOT NULL DEFAULT 'No',
  `locked` set('No','Yes') NOT NULL DEFAULT 'No',
  `updateTag` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipTags`
--

LOCK TABLES `ipTags` WRITE;
/*!40000 ALTER TABLE `ipTags` DISABLE KEYS */;
INSERT INTO `ipTags` VALUES (1,'Offline',1,'#f59c99','#ffffff','No','Yes',1),(2,'Used',0,'#a9c9a4','#ffffff','No','Yes',1),(3,'Reserved',1,'#9ac0cd','#ffffff','No','Yes',1),(4,'DHCP',1,'#c9c9c9','#ffffff','Yes','Yes',1);
/*!40000 ALTER TABLE `ipTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipaddresses`
--

DROP TABLE IF EXISTS `ipaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipaddresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subnetId` int(11) unsigned DEFAULT NULL,
  `ip_addr` varchar(100) NOT NULL,
  `is_gateway` tinyint(1) DEFAULT 0,
  `description` varchar(64) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `state` int(3) DEFAULT 2,
  `switch` int(11) unsigned DEFAULT NULL,
  `location` int(11) unsigned DEFAULT NULL,
  `port` varchar(32) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `lastSeen` datetime DEFAULT '1970-01-01 00:00:01',
  `excludePing` binary(1) DEFAULT '0',
  `PTRignore` binary(1) DEFAULT '0',
  `PTR` int(11) unsigned DEFAULT 0,
  `firewallAddressObject` varchar(100) DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `customer_id` int(11) unsigned DEFAULT NULL,
  `custom_ansible_groups` text DEFAULT NULL COMMENT 'field add the host to a ansible group',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid_ip_unique` (`ip_addr`,`subnetId`),
  KEY `subnetid` (`subnetId`),
  KEY `location` (`location`),
  KEY `customer_ip` (`customer_id`),
  CONSTRAINT `customer_ip` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipaddresses`
--

LOCK TABLES `ipaddresses` WRITE;
/*!40000 ALTER TABLE `ipaddresses` DISABLE KEYS */;
INSERT INTO `ipaddresses` VALUES (11,8,'167772161',NULL,NULL,'host1.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:27:18',NULL,'dmz, group1'),(12,8,'167772162',NULL,NULL,'host2.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:27:28',NULL,'group2'),(13,9,'167772417',NULL,NULL,'host3.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:05',NULL,'web1'),(14,9,'167772418',NULL,NULL,'host4.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:10',NULL,'web1'),(15,11,'2886729729',NULL,NULL,'host5.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:22',NULL,'dmz, group2'),(16,11,'2886729730',NULL,NULL,'host6.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:28',NULL,NULL),(17,12,'2886729985',NULL,NULL,'host7.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:42',NULL,NULL),(18,12,'2886729986',NULL,NULL,'host8.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:52',NULL,NULL),(19,8,'167772163',NULL,NULL,'invalid',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,NULL,NULL,NULL),(20,8,'167772164',NULL,NULL,'invalid.hostname',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,NULL,NULL,NULL),(21,8,'167772165',NULL,NULL,'moreinvalid..hostname.l',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:28:38',NULL,NULL),(22,9,'167772419',NULL,NULL,'WINDOWS.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ipaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang` (
  `l_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `l_code` varchar(12) NOT NULL DEFAULT '',
  `l_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang`
--

LOCK TABLES `lang` WRITE;
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
INSERT INTO `lang` VALUES (1,'en_GB.UTF-8','English'),(2,'sl_SI.UTF-8','Slovenščina'),(3,'fr_FR.UTF-8','Français'),(4,'nl_NL.UTF-8','Nederlands'),(5,'de_DE.UTF-8','Deutsch'),(6,'pt_BR.UTF-8','Brazil'),(7,'es_ES.UTF-8','Español'),(8,'cs_CZ.UTF-8','Czech'),(9,'en_US.UTF-8','English (US)'),(10,'ru_RU.UTF-8','Russian'),(11,'zh_CN.UTF-8','Chinese'),(12,'ja_JP.UTF-8','Japanese');
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `lat` varchar(12) DEFAULT NULL,
  `long` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginAttempts`
--

DROP TABLE IF EXISTS `loginAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginAttempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(128) NOT NULL DEFAULT '',
  `count` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginAttempts`
--

LOCK TABLES `loginAttempts` WRITE;
/*!40000 ALTER TABLE `loginAttempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginAttempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `severity` int(11) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ipaddr` varchar(64) DEFAULT NULL,
  `command` varchar(128) DEFAULT '0',
  `details` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,'2020-03-07 11:20:18',NULL,'172.20.0.1','Database installation','Database installed successfully. Version 1.4.026 installed'),(2,2,'2020-03-07 11:20:57','admin','172.20.0.1','User login','Invalid username or password'),(3,0,'2020-03-07 11:21:02','admin','172.20.0.1','User login','User phpIPAM Admin logged in'),(4,0,'2020-03-07 11:22:15','Admin','172.20.0.1','settings object 1 edit','Object id=1 in settings edited id: 1 siteTitle: phpipam siteDomain: domain.local siteURL: http.//localhost siteLoginText: NULL prettyLinks: No defaultLang: 0 inactivityTimeout: 3600 siteAdminName: Sysadmin siteAdminMail: admin@domain.local api: 1 enableIPrequests: 0 enableMulticast: 0 enableRACK: 1 enableCircuits: 1 enableLocations: 1 enableSNMP: 0 enablePSTN: 0 enableCustomers: 1 enableThreshold: 1 enableVRF: 0 enableDNSresolving: 0 vlanDuplicate: 1 decodeMAC: 1 vlanMax: 4096 enableChangelog: 1 tempShare: 0 enableNAT: 1 enablePowerDNS: 0 updateTags: 0 enforceUnique: 1 enableRouting: 0 enableFirewallZones: 0 maintaneanceMode: 0 permissionPropagate: 1 link_field: NULL log: Database donate: 0 visualLimit: 24 theme: dark subnetOrdering: subnet,asc subnetView: 0 scanPingType: ping pingStatus: 1800;3600 scanPingPath: /bin/ping scanFPingPath: /bin/fping scanMaxThreads: 128'),(5,0,'2020-03-07 11:22:57','Admin','172.20.0.1','api object creation','New api database object created id: NULL app_id: development app_code: developcode app_permissions: 0 app_security: ssl_code app_lock: 0 app_lock_wait: 0 app_nest_custom_fields: 0 app_show_links: 0 app_comment: NULL'),(6,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Subnet truncate','Subnet Private subnet 1 id 1 truncated'),(7,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Subnet Private subnet 1 delete','Subnet Private subnet 1 deleted id: 1 subnet: 336395549904799703390415618052362076160 mask: 64 sectionId: 2 description: Private subnet 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 1 vlanId: 1 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: fd13.6d20.29dc.cf27..'),(8,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Section IPv6 delete','Section IPv6 deleted id: 2 name: IPv6 description: Section for IPv6 addresses masterSection: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} strictMode: 1 subnetOrdering: / order: / editDate: / showVLAN: 0 showVRF: 0 showSupernetOnly: 0 DNS: /'),(9,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet My folder id 5 truncated'),(10,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet DHCP range id 6 truncated'),(11,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet DHCP range delete','Subnet DHCP range deleted id: 6 subnet: 172037632 mask: 24 sectionId: 1 description: DHCP range linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 5 allowRequests: 0 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.65.22.0'),(12,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet My folder id 5 truncated'),(13,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet My folder delete','Subnet My folder deleted id: 5 subnet: 0 mask: / sectionId: 1 description: My folder linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 0 vlanId: 0 showName: 0 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 1 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 0.0.0.0'),(14,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(15,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 1 id 3 truncated'),(16,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Customer 1 delete','Subnet Customer 1 deleted id: 3 subnet: 168427776 mask: 24 sectionId: 1 description: Customer 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.1.0'),(17,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(18,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 2 id 4 truncated'),(19,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Customer 2 delete','Subnet Customer 2 deleted id: 4 subnet: 168428032 mask: 24 sectionId: 1 description: Customer 2 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.2.0'),(20,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(21,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Business customers delete','Subnet Business customers deleted id: 2 subnet: 168427520 mask: 16 sectionId: 1 description: Business customers linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.0.0'),(22,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 1 id 3 truncated'),(23,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet Customer 1 delete','Subnet Customer 1 deleted id: 3 subnet: 168427776 mask: 24 sectionId: 1 description: Customer 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.1.0'),(24,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet truncate','Subnet Customer 2 id 4 truncated'),(25,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet Customer 2 delete','Subnet Customer 2 deleted id: 4 subnet: 168428032 mask: 24 sectionId: 1 description: Customer 2 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.2.0'),(26,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet truncate','Subnet DHCP range id 6 truncated'),(27,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet DHCP range delete','Subnet DHCP range deleted id: 6 subnet: 172037632 mask: 24 sectionId: 1 description: DHCP range linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 5 allowRequests: 0 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.65.22.0'),(28,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Section Customers delete','Section Customers deleted id: 1 name: Customers description: Section for customers masterSection: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} strictMode: 1 subnetOrdering: / order: / editDate: / showVLAN: 0 showVRF: 0 showSupernetOnly: 0 DNS: /'),(29,0,'2020-03-07 11:24:25','Admin','172.20.0.1','Section created','New section created name: section1 description: NULL strictMode: 1 subnetOrdering: default showVLAN: 1 showVRF: 1 showSupernetOnly: 1 masterSection: 0 permissions: [] id: 3'),(30,0,'2020-03-07 11:24:36','Admin','172.20.0.1','Section created','New section created name: section2 description: NULL strictMode: 1 subnetOrdering: default showVLAN: 1 showVRF: 1 showSupernetOnly: 1 masterSection: 0 permissions: [] id: 4'),(31,0,'2020-03-07 11:24:55','Admin','172.20.0.1','api object 1 edit','Object id=1 in api edited id: 1 app_id: development app_code: developcode app_permissions: 1 app_security: ssl_code app_lock: 0 app_lock_wait: 0 app_nest_custom_fields: 0 app_show_links: 0 app_comment: NULL'),(32,2,'2020-03-07 11:25:51','Admin','172.20.0.1','Subnet creation','Failed to add new subnetSQLSTATE[22007]: Invalid datetime format: 1366 Incorrect integer value: \'Add\' for column `phpipam`.`subnets`.`vlanId` at row 1'),(33,0,'2020-03-07 11:26:02','Admin','172.20.0.1','Subnet created','New subnet created id: 7 isFolder: 0 masterSubnetId: 0 subnet: 167772160 mask: 8 description: huge subnet vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(34,0,'2020-03-07 11:26:37','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 10 name: 10_FIRST description: NULL domainId: 1 customer_id: NULL'),(35,0,'2020-03-07 11:26:46','Admin','172.20.0.1','Subnet created','New subnet created id: 8 isFolder: 0 masterSubnetId: 7 subnet: 167772160 mask: 24 description: NULL vlanId: 3 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(36,0,'2020-03-07 11:26:59','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.0.1 action: add id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: zSo7Yfy7ggwVtMUAXkyGBJZWWwL8oNkx hostname: host1 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(37,0,'2020-03-07 11:27:11','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.0.2 action: add id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: KUFQt8CaAc-nR2mEOBCfNF0tL5r3lwdH hostname: host2 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(38,0,'2020-03-07 11:27:37','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 11 name: 11_SCND description: NULL domainId: 1 customer_id: NULL'),(39,0,'2020-03-07 11:27:40','Admin','172.20.0.1','Subnet created','New subnet created id: 9 isFolder: 0 masterSubnetId: 7 subnet: 167772416 mask: 24 description: NULL vlanId: 4 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(40,0,'2020-03-07 11:27:50','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.1.1 action: add id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: m6OlwrYlW0r-jyzisBf7_8p6vKH960f3 hostname: host3 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(41,0,'2020-03-07 11:28:03','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.1.2 action: add id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: im0pQgsa2cVigLp6o41583j6z8Wxy-HZ hostname: host4 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(42,0,'2020-03-07 11:28:56','Admin','172.20.0.1','Subnet created','New subnet created id: 10 isFolder: 0 masterSubnetId: 0 subnet: 2886729728 mask: 12 description: NULL vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(43,0,'2020-03-07 11:29:21','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 12 name: 12_THRD description: NULL domainId: 1 customer_id: NULL'),(44,0,'2020-03-07 11:29:26','Admin','172.20.0.1','Subnet created','New subnet created id: 11 isFolder: 0 masterSubnetId: 10 subnet: 2886729728 mask: 24 description: NULL vlanId: 5 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(45,0,'2020-03-07 11:29:57','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 13 name: 13_4TH description: NULL domainId: 1 customer_id: NULL'),(46,0,'2020-03-07 11:30:01','Admin','172.20.0.1','Subnet created','New subnet created id: 12 isFolder: 0 masterSubnetId: 10 subnet: 2886729984 mask: 24 description: NULL vlanId: 6 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(47,0,'2020-03-07 11:30:20','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.0.1 action: add id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 172.16.0.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: qquRP0lOWvltnCdfsr0AQBsqeOWF-QTh hostname: host5 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(48,0,'2020-03-07 11:30:29','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.0.2 action: add id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 172.16.0.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: F5VZqR6FpHykKIjLrIesv0va6aD-Ekxj hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(49,0,'2020-03-07 11:30:50','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.1.1 action: add id: 17 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 172.16.1.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: HiscF1SBKjl1sI73w8WVDl7Lc40fAcs7 hostname: host7 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(50,0,'2020-03-07 11:31:01','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.1.2 action: add id: 18 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 172.16.1.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 4OGwZO6DRsZ8w_-0Zh7whmRWlTFp1c_s hostname: host8 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(51,0,'2020-03-07 12:37:14','Admin','172.22.0.1','User logged out','User Admin has logged out'),(52,0,'2020-03-07 12:37:21','admin','172.22.0.1','User login','User phpIPAM Admin logged in'),(53,0,'2020-03-07 12:38:36','Admin','172.22.0.1','Custom field add','Custom Field add success (custom_ansible_groups) name: custom_ansible_groups oldname:  action: add table: ipaddresses csrf_cookie: Qa1WanrrZR6HBHBUgP1qnW80JHE0iuMt Comment: field add the host to a ansible group fieldType: text fieldSize:  fieldDefault:  ftype: text'),(54,0,'2020-03-07 12:39:03','Admin','172.22.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: vMCK38RTFw051AhucvL7Rl3rjsqeAKIS nostrict: yes hostname: host1 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(55,0,'2020-03-07 12:39:20','Admin','172.22.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: Buh1RYx4aTMjZKa8ucWJo4tI7WKgDrdT nostrict: yes hostname: host2 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(56,0,'2020-03-07 12:39:37','Admin','172.22.0.1','Address updated','Address 10.0.1.1 updated ip_addr: 10.0.1.1 action: edit id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772417 mac_old: NULL PTR: 0 addressId: 13 csrf_cookie: 02FLnUYNc37phrWkyl0m1cdlqQyP48jT nostrict: yes hostname: host3 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(57,0,'2020-03-07 12:39:45','Admin','172.22.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: tMLuzkicihuBqgtKVvvQOM8ID71H9uZw nostrict: yes hostname: host4 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(58,0,'2020-03-07 12:40:11','Admin','172.22.0.1','Address updated','Address 172.16.0.1 updated ip_addr: 172.16.0.1 action: edit id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729729 mac_old: NULL PTR: 0 addressId: 15 csrf_cookie: D5GnFXwZ6jN9F-6F535BwKUxL0vOgILT nostrict: yes hostname: host5 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(59,0,'2020-03-07 12:40:20','Admin','172.22.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: Nv_P-qb9PiJU5mhhyygLJQv5dN3fA9h3 nostrict: yes hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(60,0,'2020-03-07 12:40:31','Admin','172.22.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: uOhx68wZvJTJ7C81hg0dZnJTuaw4gYJo nostrict: yes hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(61,0,'2020-03-07 13:08:41','Admin','172.22.0.1','settings object 1 edit','Object id=1 in settings edited id: 1 siteTitle: phpipam siteDomain: domain.local siteURL: http.//localhost siteLoginText: NULL prettyLinks: Yes defaultLang: 0 inactivityTimeout: 3600 siteAdminName: Sysadmin siteAdminMail: admin@domain.local api: 1 enableIPrequests: 0 enableMulticast: 0 enableRACK: 1 enableCircuits: 1 enableLocations: 1 enableSNMP: 0 enablePSTN: 0 enableCustomers: 1 enableThreshold: 1 enableVRF: 0 enableDNSresolving: 0 vlanDuplicate: 1 decodeMAC: 1 vlanMax: 4096 enableChangelog: 1 tempShare: 0 enableNAT: 1 enablePowerDNS: 0 updateTags: 0 enforceUnique: 1 enableRouting: 0 enableFirewallZones: 0 maintaneanceMode: 0 permissionPropagate: 1 link_field: NULL log: Database donate: 0 visualLimit: 24 theme: dark subnetOrdering: subnet,asc subnetView: 0 scanPingType: ping pingStatus: 1800;3600 scanPingPath: /bin/ping scanFPingPath: /bin/fping scanMaxThreads: 128'),(62,2,'2020-03-11 11:26:50','root','172.18.0.1','User login','Invalid username'),(63,2,'2020-03-11 11:26:53','root','172.18.0.1','User login','Invalid username'),(64,0,'2020-03-11 11:26:58','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(65,0,'2020-03-11 11:27:18','Admin','172.18.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: Izd4r3L4KsCcy3kkQhHgIPll-GTvkoi_ nostrict: yes hostname: host1.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(66,0,'2020-03-11 11:27:28','Admin','172.18.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: a-V9nQ-YjXanlu5Q9zlL1GKUXHU6HfM2 nostrict: yes hostname: host2.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(67,0,'2020-03-11 11:27:40','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.3 action: add id: 19 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.3 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 7QcJkJCM3AubgVq2e6XKPD_0iiKagMVF hostname: invalid description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(68,0,'2020-03-11 11:27:52','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.4 action: add id: 20 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.4 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 8uXMH80PUCCgpgT0pJzrRWY9hflV9m_O hostname: invalid.hostname description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(69,0,'2020-03-11 11:28:10','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.5 action: add id: 21 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.5 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: Dj1JKJaRSo4eWVPDjTgP8MWGbSIrjfxq hostname: moreinvalid.hostname.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(70,0,'2020-03-11 11:28:38','Admin','172.18.0.1','Address updated','Address 10.0.0.5 updated ip_addr: 10.0.0.5 action: edit id: 21 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772165 mac_old: NULL PTR: 0 addressId: 21 csrf_cookie: wFQDKpcC_PDFBq2Aj4SflykvJIWUMUe6 nostrict: yes hostname: moreinvalid..hostname.l description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(71,0,'2020-03-11 11:29:05','Admin','172.18.0.1','Address updated','Address 10.0.1.1 updated ip_addr: 10.0.1.1 action: edit id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772417 mac_old: NULL PTR: 0 addressId: 13 csrf_cookie: iRk_cvFPRLNtvqrJ0jsj0_1ZLlK6bDF5 nostrict: yes hostname: host3.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(72,0,'2020-03-11 11:29:10','Admin','172.18.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: 25w7ZWgutYxPGflfTH0zb0hEXIdqteuo nostrict: yes hostname: host4.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(73,0,'2020-03-11 11:29:22','Admin','172.18.0.1','Address updated','Address 172.16.0.1 updated ip_addr: 172.16.0.1 action: edit id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729729 mac_old: NULL PTR: 0 addressId: 15 csrf_cookie: CDN-eLZgybAG37Abjxieu3zxj17mFkuP nostrict: yes hostname: host5.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(74,0,'2020-03-11 11:29:28','Admin','172.18.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: qA-GFeZEGa_vuDZVm6fpXRIT4Fu2difo nostrict: yes hostname: host6.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(75,0,'2020-03-11 11:29:42','Admin','172.18.0.1','Address updated','Address 172.16.1.1 updated ip_addr: 172.16.1.1 action: edit id: 17 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 2886729985 mac_old: NULL PTR: 0 addressId: 17 csrf_cookie: mtTkxpWzK2TZeAAAlwgHY7E2P_1mimaw nostrict: yes hostname: host7.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(76,0,'2020-03-11 11:29:52','Admin','172.18.0.1','Address updated','Address 172.16.1.2 updated ip_addr: 172.16.1.2 action: edit id: 18 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 2886729986 mac_old: NULL PTR: 0 addressId: 18 csrf_cookie: QqvBDxBIYnUt6sK1AZ4hdU-tQ7RiImVc nostrict: yes hostname: host8.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(77,2,'2020-05-08 15:52:03','root','172.18.0.1','User login','Invalid username'),(78,0,'2020-05-08 15:52:13','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(79,0,'2020-05-08 15:53:13','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.1.3 action: add id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.3 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 1uXnKB99ml-37_E3Z5VJvtYXZfB8PNLU hostname: WINDOWS.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nameservers`
--

DROP TABLE IF EXISTS `nameservers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nameservers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `namesrv1` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `permissions` varchar(128) DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nameservers`
--

LOCK TABLES `nameservers` WRITE;
/*!40000 ALTER TABLE `nameservers` DISABLE KEYS */;
INSERT INTO `nameservers` VALUES (1,'Google NS','8.8.8.8;8.8.4.4','Google public nameservers','1;2',NULL);
/*!40000 ALTER TABLE `nameservers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nat`
--

DROP TABLE IF EXISTS `nat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `type` set('source','static','destination') DEFAULT 'source',
  `src` text DEFAULT NULL,
  `dst` text DEFAULT NULL,
  `src_port` int(5) DEFAULT NULL,
  `dst_port` int(5) DEFAULT NULL,
  `device` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `policy` set('Yes','No') NOT NULL DEFAULT 'No',
  `policy_dst` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nat`
--

LOCK TABLES `nat` WRITE;
/*!40000 ALTER TABLE `nat` DISABLE KEYS */;
/*!40000 ALTER TABLE `nat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php_sessions`
--

DROP TABLE IF EXISTS `php_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php_sessions` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `access` int(10) unsigned DEFAULT NULL,
  `data` text NOT NULL,
  `remote_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php_sessions`
--

LOCK TABLES `php_sessions` WRITE;
/*!40000 ALTER TABLE `php_sessions` DISABLE KEYS */;
INSERT INTO `php_sessions` VALUES ('0046qpj7o754qesc2n0k585t31',1583931282,'','172.18.0.2'),('0403ki5ng410ofvaejfoges6e9',1583931975,'','172.18.0.2'),('04oe05b9mq5vsgiqohe0vjobor',1583931979,'','172.18.0.2'),('053ehvemsfl1fkifvir55sad1q',1583928423,'','172.18.0.2'),('05agmtlke811f89k8fkntppb86',1583931913,'','172.18.0.2'),('05ll2p2bpkg09hkasnjvnjroou',1583930230,'','172.18.0.2'),('0805laimadmt9a1rdc98r589bq',1588945928,'','172.18.0.5'),('0835r8r822tvpsb0p63atemcj6',1583931913,'','172.18.0.2'),('0885lfnvh37t287i8rjq1rdabp',1583931107,'','172.18.0.2'),('08mejq0usnkibjtqo3cl08hq5c',1583931451,'','172.18.0.2'),('08rac06im9ndn7aj41b4c4jk0v',1583921696,'','172.18.0.2'),('0aji2fm3jjkummaenbgmdr8l0r',1583931282,'','172.18.0.2'),('0bbih2tpj9655hvqq5quq4vr9g',1583931283,'','172.18.0.2'),('0bf8j1kvsrqml3ri5bqlg0nf02',1583931450,'','172.18.0.2'),('0bkhqe2ei7ootg14omq0avoktn',1583922301,'','172.18.0.2'),('0bqpq7u5jtns7sg7knrhhts7g9',1583931910,'','172.18.0.2'),('0cp6f3mq9dt9jbpjkk02t4gpgt',1583931242,'','172.18.0.2'),('0ctr8jlifpgnk42lnbategcl9u',1583931143,'','172.18.0.2'),('0d94t9nr1rehrab12q6elumh93',1583925961,'','172.18.0.2'),('0eipsvm3nqjog1tf4sle12p2so',1583921669,'','172.18.0.2'),('0ek7uhjbg3lucah1t4v52bnu6t',1583931108,'','172.18.0.2'),('0i9pmhq99t2e87b5rthvpatlbk',1583931979,'','172.18.0.2'),('0ign1nd0jp7svk6atkqjhtlj0b',1583919490,'','172.18.0.2'),('0kredvnrlnj9qmv9snfpv16jgr',1583931910,'','172.18.0.2'),('0lm769t0b0tocjv1u67shu9kk8',1583931278,'','172.18.0.2'),('0mt370ar0it2lajal44ltkvu6n',1583925997,'','172.18.0.2'),('0nddtr5btila9cm8c1rf5v047s',1583931451,'','172.18.0.2'),('0nk7do8nqpih6fmbtf93dtjbp4',1583922303,'','172.18.0.2'),('0pk0l8etd80pfe2v84rlp0r61p',1583922304,'','172.18.0.2'),('0pscs68o920rio4cjajaor1kvk',1583931111,'','172.18.0.2'),('0ptf3j23h2vv02gttc9gc05fud',1583931447,'','172.18.0.2'),('0q4j8lm8u934touesg0neiucsp',1583931279,'','172.18.0.2'),('0qe8irqb50ge7uvmh4thp4o4qr',1583925961,'','172.18.0.2'),('0qh2r8jlcurimuviatfhjulp8s',1583931497,'','172.18.0.2'),('0qi0bifufjnnnvd8ncp89l3907',1583931910,'','172.18.0.2'),('0r8vb2ip96kv5r8asejfq8s57v',1588945928,'','172.18.0.5'),('0rqhm92c8qil8a3lvt4m92bmr7',1588945960,'','172.18.0.5'),('0u4q292kjitamu0u599p6t02ho',1583931497,'','172.18.0.2'),('0uputaldc45krvp3rr910larsm',1583930274,'','172.18.0.2'),('105g2bthetembus08pefvgltjg',1583931282,'','172.18.0.2'),('10ihjl64loe3joe7aib5j8f7sa',1583919493,'','172.18.0.2'),('11h5qhbatm2n1ojhnrfcthko62',1583931246,'','172.18.0.2'),('12t73o3i2jnnnk95c5lkuk3680',1583922304,'','172.18.0.2'),('136gmloqjqfnr1qbosbb1utflg',1583921698,'','172.18.0.2'),('13ico92tm6798v766mm78qt2vf',1583921698,'','172.18.0.2'),('141te5hgsad917big6ufbpd60r',1583925961,'','172.18.0.2'),('14l5q2ptiffilas9k23vb66hle',1583921695,'','172.18.0.2'),('15p2uiu1nig15h93jnpuuekuu0',1583931978,'','172.18.0.2'),('16c3jjea4212d94qp5sgm0ugd3',1583931111,'','172.18.0.2'),('16utu1u23ulj9kmu80sln6ra2v',1583931034,'','172.18.0.2'),('178sgg99e8b45e6qfamtd9gfpf',1583931144,'','172.18.0.2'),('17ajmf03o4eims7kme98lb6dk3',1583931107,'','172.18.0.2'),('17hgbubbggqfqmjcb05qe0nadh',1583928420,'','172.18.0.2'),('17jclgj00ajpnh5f9s6lm5egpr',1588945929,'','172.18.0.5'),('17sjnm0b3m5cqmr48amdfl88q8',1583931913,'','172.18.0.2'),('18fbbbp7ea5ffmertoaro7objb',1583931140,'','172.18.0.2'),('18gis4t9njdnhiurcp12nmesri',1588945929,'','172.18.0.5'),('19i38dqdk4vv8keuornkl21mto',1583925958,'','172.18.0.2'),('19ubuge1gq11orffoh0b6ndf50',1583931143,'','172.18.0.2'),('1bh4se103mjvl8lgggaqudogho',1583931144,'','172.18.0.2'),('1bmoe7t36odt6ditbip7tkifrl',1583930296,'','172.18.0.2'),('1clrr0ddaij6rj2h2m08ts6r8h',1583931451,'','172.18.0.2'),('1daq28vjkaudss8a0cbln6jk1n',1583931451,'','172.18.0.2'),('1denb7a6kuraiteof07d3u68hp',1583926011,'','172.18.0.2'),('1dl3um91a7nlagg9hhfo8445ba',1583931282,'','172.18.0.2'),('1g435bqjg6pc8d4rtgcv6l0eob',1583926014,'','172.18.0.2'),('1h49pev4fo8dns5rb00ephvlkg',1583931282,'','172.18.0.2'),('1hbopsmphl0dfrqcot7vmbu4v4',1583922304,'','172.18.0.2'),('1hi1m2h8o4mqj03kova5o5jb1h',1583931448,'','172.18.0.2'),('1i8ednrtn4bjqgsfc6r1bdp6h5',1583928420,'','172.18.0.2'),('1ib0r71lbdfoeleuv3cfjeubr9',1583931246,'','172.18.0.2'),('1ib6hfhdtmg64ktpc0faimsiot',1583931497,'','172.18.0.2'),('1im2m3euppkrak50qbpsr7bphn',1583925994,'','172.18.0.2'),('1ipkktbooa4326c4tsf7ljh35u',1583928423,'','172.18.0.2'),('1j46dlpgt9gv78vamr70m2p824',1583928424,'','172.18.0.2'),('1jftmb7l5efd7mac52t28qbr6p',1583931279,'','172.18.0.2'),('1m4b47rki5gkl14qsnoccpk09a',1588945959,'','172.18.0.5'),('1mpc6luanp2fsprltgkahbvdjo',1583931143,'','172.18.0.2'),('1nbsvgsfcdqpen8p58ngfgdggc',1583930229,'','172.18.0.2'),('1nkno24f1v70ek573e9cji7h3l',1583931143,'','172.18.0.2'),('1nlog1pqkp5q5cfh69ofa4cgdm',1583930274,'','172.18.0.2'),('1o4dehiumn5h2qlk9ns5o9s24t',1583931913,'','172.18.0.2'),('1p1k8bgln9n8ejbuql7vqfmlrg',1583925997,'','172.18.0.2'),('1phfpgr0qe2jo5rjhgnukqvusv',1588945961,'','172.18.0.5'),('1qc2k9mh7fu7gbfm36d178kimi',1583930296,'','172.18.0.2'),('1smg94u5o10iplmskajo1dgim2',1583921698,'','172.18.0.2'),('1svo0f54chadebvekhnj65m64s',1583931282,'','172.18.0.2'),('1tgkt02hlqtlhe865srvfv6bbt',1583931031,'','172.18.0.2'),('1uricnmvctaj8q8mgufaeukq89',1583922301,'','172.18.0.2'),('1ve1ifkams2b94320pkmgq44tn',1583919490,'','172.18.0.2'),('20318u1tme533anud1nokn59b6',1583928424,'','172.18.0.2'),('21p970dlml0h9el196pusj3jbc',1583931447,'','172.18.0.2'),('2211crbbm1q6tfv2babsvf8c0v',1583931979,'','172.18.0.2'),('223qfgfcqvtv3ckq4qcaqon308',1583921672,'','172.18.0.2'),('224nonb9d95ubedt6k08sqrps9',1583921800,'','172.18.0.2'),('228a54acciosbnmhmhlv3mlamv',1583921771,'','172.18.0.2'),('22uk90op2refqqvepbn39g87tu',1583919489,'','172.18.0.2'),('23nkemdqa0dufuqfn049buoqq0',1583931110,'','172.18.0.2'),('23qp1pv1utvi4aem723js7tp7l',1583926011,'','172.18.0.2'),('24f8e0gr8g9vgtv44ffssg1rbv',1583921672,'','172.18.0.2'),('25c6lil58vu3aa67113reo87v8',1583931451,'','172.18.0.2'),('25jj8sovls3mcuap961k4lvoa8',1583921771,'','172.18.0.2'),('25q30mk33cimuthhnrjvs5qlcn',1583931451,'','172.18.0.2'),('28n11dhtma7308ntujussft4u0',1583931979,'','172.18.0.2'),('291547k3mfdejh595n9r3lji47',1583921669,'','172.18.0.2'),('295jn2eqp55sl014qjrbm7fbne',1583925994,'','172.18.0.2'),('2993tt8noimmasu423knkh9rco',1583921695,'','172.18.0.2'),('2aokndo8q7at4ts1fdv1u96vac',1583931980,'','172.18.0.2'),('2b29air3k28bdpunj92duup89r',1583925961,'','172.18.0.2'),('2bdj08nh0qcl2bd51e1rstiefc',1583931111,'','172.18.0.2'),('2be2hra4h6h49s9lov0ls7mbir',1583931278,'','172.18.0.2'),('2clkkoa8ll8reeu6k57qrvjdbu',1583931448,'','172.18.0.2'),('2eohogoojl0o397ha9ehgadsh4',1583931108,'','172.18.0.2'),('2eqquivflgsmlkcs2bp7qch20e',1583921798,'','172.18.0.2'),('2grbdsnkhnlbse3ckeddoej743',1583931976,'','172.18.0.2'),('2ibmhkl3bjlfm70ljfd03v4prd',1583926011,'','172.18.0.2'),('2ijb2k4i0a9jn7k01m3hte8j83',1583931913,'','172.18.0.2'),('2injc8c64l99n9qsso3gof32eb',1583921797,'','172.18.0.2'),('2jq2i9u7ga3redu4vb3c45pafh',1583925994,'','172.18.0.2'),('2kadgoo94729jq1uh3ddk6ffu0',1588945929,'','172.18.0.5'),('2loujktp0v5lu31mklccv7cih0',1583921774,'','172.18.0.2'),('2lpj3bmffmt9crohrkviduontf',1583931448,'','172.18.0.2'),('2m8hjk522gh43delc0nm4uiuic',1583931282,'','172.18.0.2'),('2n5u7kaku9htcf9v7bnc09mo4e',1588945929,'','172.18.0.5'),('2n6rf1oi0knbv8lckvnnqrbsov',1583926014,'','172.18.0.2'),('2ne1p9ejfnom6rb0o3vshasecq',1583931910,'','172.18.0.2'),('2o6amhrdec6prmmrcgmls501ic',1583922301,'','172.18.0.2'),('2o81mog7389fo17607rbc7489g',1588945929,'','172.18.0.5'),('2of9au1344r5n7l4v7jlfkjj4s',1583931111,'','172.18.0.2'),('2q6bq85lb1ufspheva3rpq3119',1583930229,'','172.18.0.2'),('2qcu78rkujpc7bot5vf1jnhi7h',1583921771,'','172.18.0.2'),('2qen6rudg7dj4297vma3fi9jmf',1583921695,'','172.18.0.2'),('2qug847p9irf39p5mv6s76cced',1583931279,'','172.18.0.2'),('2r1fqe0nmnph7jp4s6un9d321j',1583931034,'','172.18.0.2'),('2saaoplt48niqkvakfcm204bgq',1583931450,'','172.18.0.2'),('2sl5e750go3cqul7mocvu9ape2',1583931107,'','172.18.0.2'),('2t0ecg48ngjrcbuke66i4mu0ta',1583931243,'','172.18.0.2'),('2tg8qb71in9gtv1v4a070k2v2i',1583931282,'','172.18.0.2'),('2titi81j2hndfitkp58dp03aai',1583930274,'','172.18.0.2'),('2tkookumv8ioma8q0fg2359nn6',1583931980,'','172.18.0.2'),('2ub724t4baaue488r0cvakfmr7',1583919489,'','172.18.0.2'),('2vkj3rrfvopr2q3pnc89mkkevk',1583921672,'','172.18.0.2'),('2vnf7fdgnk5u6hcli54pleda40',1583931279,'','172.18.0.2'),('2vvkdnudo33lhjmlf96vs3poad',1583925958,'','172.18.0.2'),('30fdkdngi4ocqfs4brvic9v8il',1583931913,'','172.18.0.2'),('30ruo6vrd3m1ti3noab6v1v449',1588945928,'','172.18.0.5'),('30s5ehnb7jf4s7gh6lvu7kv58d',1583931976,'','172.18.0.2'),('31lqu6nvro9vocg21svhaaq90l',1583931243,'','172.18.0.2'),('31mtcarfqo328fk4ivn2uq5vp4',1583928423,'','172.18.0.2'),('31ph0v469qmdcubev1j7ltjg73',1583926011,'','172.18.0.2'),('32b2lpuq2a2d8845jof5s3fj1c',1588945961,'','172.18.0.5'),('32c86ten1cmvlvci50aqeu7u4k',1583922301,'','172.18.0.2'),('348o95q6hrekskadg9dspglffq',1583926014,'','172.18.0.2'),('34ejj9v28mhqdrccrgkjrous01',1583925958,'','172.18.0.2'),('364brdak51gu0g9v3v2q0rseld',1583930274,'','172.18.0.2'),('36m5pi564pfqf6qvf7d3diqge2',1583930230,'','172.18.0.2'),('36opoe2it8srrdauhihkjjss6u',1583930230,'','172.18.0.2'),('36qij1tev4ahqdhbkgpstn10r8',1583921771,'','172.18.0.2'),('38766smngejbpv6f8niqh564oe',1583931143,'','172.18.0.2'),('38ab0ffhd59c4vd9029bolod3b',1583921774,'','172.18.0.2'),('38o7g9o798odriir84h7ruf6jn',1583921672,'','172.18.0.2'),('3aef3tnd3ltihn7u8bn2cesbhr',1583931497,'','172.18.0.2'),('3ckqgme39diuv8k5r0q8j7tn0j',1583925961,'','172.18.0.2'),('3dha5sfbteotuptjrdn1li5ot9',1583931034,'','172.18.0.2'),('3dju9me4po1c3q1lsu9egv7cuo',1588945929,'','172.18.0.5'),('3e381us32mjm214s6kbvovorpk',1583931979,'','172.18.0.2'),('3egfcmorm9gcpvje5r7p86j1u4',1583921698,'','172.18.0.2'),('3ft387p0c3slv6g2h43d7otdgo',1583930274,'','172.18.0.2'),('3fuji2kp2htvphj81g1kntpoel',1583931913,'','172.18.0.2'),('3ghsq5t0l26evj2cv3i39j3vfn',1583931110,'','172.18.0.2'),('3gk03m3qje3gp12nd8sjkepcjr',1583921672,'','172.18.0.2'),('3gll6k6ki2eio7o9187q4vsb42',1583922301,'','172.18.0.2'),('3gnar70cne6irmuuicj69hvtsv',1583931246,'','172.18.0.2'),('3gudbodmnrbnk20cbndcpnaok7',1583931979,'','172.18.0.2'),('3h72scsmoojg9hep72nv81tf1i',1583928420,'','172.18.0.2'),('3hlb69e2gpo7ej8rqnu28kd4a7',1583931143,'','172.18.0.2'),('3ikmr0uua0fkq0abp1ljbd0547',1583931500,'','172.18.0.2'),('3jqdecgpjtrqhprocd94me5q4i',1583931282,'','172.18.0.2'),('3jvkal4ii2cp0d7usqvg1876lh',1583931496,'','172.18.0.2'),('3k3f1sbersl02psmpp076ilbbo',1583931978,'','172.18.0.2'),('3kmjt46n797t95ou5pq4f3itu1',1583931283,'','172.18.0.2'),('3le51o8h9seh5kuro0vegrth96',1583931450,'','172.18.0.2'),('3lh9te35i4dv4nblms0kljgko0',1583921669,'','172.18.0.2'),('3m2p19u596o4pkuce1fq3hvceb',1583931144,'','172.18.0.2'),('3mrb42d7n7u588cqsqj5446uel',1583921669,'','172.18.0.2'),('3mt0kelmk3ddv4docc7db4uohv',1583931447,'','172.18.0.2'),('3n03m4bjsqmbetaq5tmhv1rpap',1583926014,'','172.18.0.2'),('3n4ock3co3qfueog5gh8dfn38h',1583919492,'','172.18.0.2'),('3n9cqchhhlenlc8hslbh3ds6l5',1583921696,'','172.18.0.2'),('3oq59ock5gjaup33emd146tj8e',1583931975,'','172.18.0.2'),('3p5d9fpoqhmbng6nkc3f5r3au2',1583931015,'','172.18.0.2'),('3p9d6l2k8a4m3vp4f76jik6dkn',1583931282,'','172.18.0.2'),('3pbeif11aqu9vckg5kuvq2qe0b',1583931976,'','172.18.0.2'),('3qluvr5lnrve8vrkgsnjco7rvg',1583931246,'','172.18.0.2'),('3r1m9p79am7el2632baognusk8',1583931979,'','172.18.0.2'),('3re20jnu37lk296fc2583to2lf',1583925997,'','172.18.0.2'),('3stfaavkepb0uhkfdkk8rhua0t',1583919493,'','172.18.0.2'),('3tf4or4bakv4em8e1ahbe236nf',1583931031,'','172.18.0.2'),('3uia8sjsuiec1ap1osvo50fqbk',1583928420,'','172.18.0.2'),('405qcsaju9ecl5cv133jspno5b',1583931140,'','172.18.0.2'),('41c6i6m6lbatgmdnvc8ija7oln',1588945960,'','172.18.0.5'),('41d1eus4q6aq465tpa888mo0a4',1583931910,'','172.18.0.2'),('41na95jgdl5bi1fcjc0gklk9o8',1583931107,'','172.18.0.2'),('4223tp0qk0go8ep4c4fr9rhh94',1583930296,'','172.18.0.2'),('4287jafd8ij5hplsvuvqhmjj8l',1588945929,'','172.18.0.5'),('42r1ihmkvlumbn75oh7muiibb1',1583930229,'','172.18.0.2'),('436ov3hjlvkoqfmk2as0o9oest',1583931496,'','172.18.0.2'),('43um9r4ov976hn95itg4c0p6jr',1583931111,'','172.18.0.2'),('44kuo1j4vqg5jbgkssac3abe35',1583931107,'','172.18.0.2'),('45h03gumieb5a946sjc0ufqi8k',1583931910,'','172.18.0.2'),('468q1ebge6dmfcbfp0odnj7c29',1583931913,'','172.18.0.2'),('46d6nc0ggcilmc5f9osq67p0ss',1583921800,'','172.18.0.2'),('46l318ivdvsg5hecsi1vabbqrl',1588945961,'','172.18.0.5'),('471oqfe0780fc1gfu65sdb99q7',1583931497,'','172.18.0.2'),('47nlch1nfjdssof3vbv4nj7qi7',1583919492,'','172.18.0.2'),('48mkrmdfce9hjsvl8hedel4h4f',1583931497,'','172.18.0.2'),('49pjvi9fhqsa6bs6p3j3b2nosg',1583931107,'','172.18.0.2'),('4a2j6jco05v1nnjf8gs30t2jua',1583922301,'','172.18.0.2'),('4ahkvl2tcmujlp2ob4kc9fbslo',1583919492,'','172.18.0.2'),('4ainfbe4i7af67ula8c144amr5',1583931910,'','172.18.0.2'),('4c164ttjlirg460k7o6qe860ro',1583925961,'','172.18.0.2'),('4ci22eq2n1vve2q3tsatpn0sik',1583931111,'','172.18.0.2'),('4d309pr4mvrvlve1adugq6t88f',1583921672,'','172.18.0.2'),('4efkftsammh74t5ata48at761k',1583931140,'','172.18.0.2'),('4fhj4pm0jrkcec4qksd6cuqkf9',1583931980,'','172.18.0.2'),('4fmtojs6p1jaur7sov5flit4k9',1583931448,'','172.18.0.2'),('4gcr1lfegcrkrfkbjn6se0mheg',1583921698,'','172.18.0.2'),('4h978b1nd9opmel6hbogkh1m7h',1583931033,'','172.18.0.2'),('4hqab3csftvqcqg4om0e73nasi',1583925958,'','172.18.0.2'),('4k3u7lun1humhfc6ihnah2fjje',1583931107,'','172.18.0.2'),('4kh190jhg3tcfr5eut1f192ege',1588945928,'','172.18.0.5'),('4kqer6qmhmngec9bkop04b3hdd',1583930296,'','172.18.0.2'),('4l566hbe12d51dr6ig0d2gnkaj',1583921696,'','172.18.0.2'),('4lu8jr6usidan9rlu9batg743v',1583931976,'','172.18.0.2'),('4mi6mnf27e9854c653h6kbeav9',1583931034,'','172.18.0.2'),('4mq1f6ldfofpo5qmd38ofat2gn',1583931283,'','172.18.0.2'),('4nlbel3fvir9j3spok928c0kj2',1583931140,'','172.18.0.2'),('4obvek52cit9n06bvfi3h498v0',1583931110,'','172.18.0.2'),('4p92jp0hu7nmlp7k0vokt0mq3c',1588945929,'','172.18.0.5'),('4q4rcs0jn32kchc5rib2i3h682',1583931497,'','172.18.0.2'),('4q4rv7nhq9uh3saigsgrlofp16',1583931031,'','172.18.0.2'),('4rqb854flfcgnlrakcioqjq1si',1583931140,'','172.18.0.2'),('4rrqj82mj2kg9krkd4o2mcuolp',1583922301,'','172.18.0.2'),('4t7sk247qss9lg4bt5d8nfgjl7',1583931910,'','172.18.0.2'),('4trdbk2rv6rntakf4jitqs9m0v',1583928421,'','172.18.0.2'),('4u1qvn5f7n4nvhfj9j5d0ahh3v',1583931451,'','172.18.0.2'),('4u3ftlsb6vcu0tic854t845eu4',1583921669,'','172.18.0.2'),('4vc2rm07mtmeu20a1jpi83ohb7',1583921669,'','172.18.0.2'),('4vmbr1ggls9qt61mc12bnaac9d',1583930230,'','172.18.0.2'),('4vut8csknjf1sbcrftf1l6bp3k',1583931976,'','172.18.0.2'),('504h68kou9p2kkftfd33n1pd3l',1583931140,'','172.18.0.2'),('507mgg3dqq1bqea24fl764v9ck',1588945961,'','172.18.0.5'),('50rq0875pqujmqft4uiqsaebcl',1583931110,'','172.18.0.2'),('51ggorp13ed9maainc0b7ib64a',1583931451,'','172.18.0.2'),('51np7pnhtu933hco7k9ajfeo0q',1583921771,'','172.18.0.2'),('51sc6idc51q3j6vjt6d71k5jnm',1583931910,'','172.18.0.2'),('524glr51937f64q9chsuicnead',1583931282,'','172.18.0.2'),('53mcbg52tspn979too11raendm',1583925958,'','172.18.0.2'),('53thphih1tf0jrit207m80ldsk',1583931976,'','172.18.0.2'),('53vpum27if9dott0f95l58f8pa',1583921771,'','172.18.0.2'),('54m6snqvfqns30jcv6d84864od',1583928420,'','172.18.0.2'),('54ohrvk4nnq6mh5j75is1vgfbr',1583931242,'','172.18.0.2'),('558ijcoverqnjb9n6vodk7pmls',1583931279,'','172.18.0.2'),('564sgkkk653rc0nvpf2f5bsiqf',1583931499,'','172.18.0.2'),('56m018597n97q9au5ovungg13m',1583931031,'','172.18.0.2'),('56mr8pvl73gqo824cto560mq3o',1583930274,'','172.18.0.2'),('57c1n4m4glvj47qs1him4bmmmk',1588945929,'','172.18.0.5'),('57dihr520ks67055u7mj9aojn0',1583931031,'','172.18.0.2'),('58frlo3uuvnumav0oqdakq7l4j',1583931910,'','172.18.0.2'),('5aa5c4vu7rcj5re3jehp6rl0ml',1583931910,'','172.18.0.2'),('5b5sjf2op4lrmblh23qrq0mhs4',1583925961,'','172.18.0.2'),('5bog10mahh9jikekujqk5kr7is',1583931243,'','172.18.0.2'),('5booohoj5v16m5a76ikkv6ipmj',1583931976,'','172.18.0.2'),('5btupcs1gbf24hpvftmqm8ohp4',1583931447,'','172.18.0.2'),('5casi4t1254ipm6iod9mb9db1k',1588945961,'','172.18.0.5'),('5conld886pk05a88ssvdeh6se7',1583921774,'','172.18.0.2'),('5ctqk2rqm1iueis0chr0f9sqd3',1588945961,'','172.18.0.5'),('5dbm5i1gknnlm9qu38riitgt45',1583930274,'','172.18.0.2'),('5dohlj773165jc3uj6t9misdf7',1588945959,'','172.18.0.5'),('5ea1qifing35lcteq790lk8c74',1588945961,'','172.18.0.5'),('5eebb58hc6irpbuqg8m74uaio8',1583930296,'','172.18.0.2'),('5fqc3s6vig590uekb1b1mruleo',1588945960,'','172.18.0.5'),('5fvn52g2jovnv9sp4g7g4c39dj',1583921695,'','172.18.0.2'),('5g0bn8rhdci5eufrevqfb3kahk',1583931245,'','172.18.0.2'),('5g7mplkn1ihrgcmpr48jldnhr9',1583921774,'','172.18.0.2'),('5h634e0dbktkv7co95aol4agap',1583921774,'','172.18.0.2'),('5hg4g2sodc78ltr1ijpuh87lp1',1583931144,'','172.18.0.2'),('5i0qnco9bm9mbl6atgdbc1mba9',1583931910,'','172.18.0.2'),('5ia9l9cl5eaena9sjmsf23tf86',1588945961,'','172.18.0.5'),('5ib553tr6oe7l5rqo1ct2fv5am',1583930296,'','172.18.0.2'),('5idk3kcf37cghhfsom2v2ng6dv',1583931913,'','172.18.0.2'),('5ijiajjo7kvuo1ui8oj6s5efso',1588945961,'','172.18.0.5'),('5ip1uvscl61llirud056s6c6ja',1583931451,'','172.18.0.2'),('5ji3rb3m7e97j4i6qcl5b9a3an',1583931497,'','172.18.0.2'),('5lpt5q9aranm2ubade0ms85uoe',1583931975,'','172.18.0.2'),('5m7r1i6lithpi0jhifq10bv4sh',1583926014,'','172.18.0.2'),('5mestiqf36qthacu907ero5r8i',1583931278,'','172.18.0.2'),('5mtcec7bfqsu2svrmbnaceuovk',1583931496,'','172.18.0.2'),('5okqood0pmr83usv0bdg5unfjb',1583931913,'','172.18.0.2'),('5qjbg4a4jci9v7oehn9vep8s3m',1588945961,'','172.18.0.5'),('5rnrnf6hef2b5ukfvl53good26',1583930274,'','172.18.0.2'),('5sfl8phlb675mauglngtpfgsmk',1583931450,'','172.18.0.2'),('5sj009us9e0tc1qhmkc5pdmag0',1583931034,'','172.18.0.2'),('5sjha78nkmmua6ar9hnukggafo',1583931447,'','172.18.0.2'),('5t0a1nv3qmvdub1o7t6rcerkr4',1583931976,'','172.18.0.2'),('5ufp3134kecon3kulavu8o69e6',1583925961,'','172.18.0.2'),('605i2gb6n5ufjj3ua684u27s56',1583921771,'','172.18.0.2'),('60lrms51h7hejs28a85pfpac1b',1583926014,'','172.18.0.2'),('60nqb9tbvn6h8fnri0iubp0tg3',1583921670,'','172.18.0.2'),('63t14c26sl7kq65g3nqgldramj',1583931279,'','172.18.0.2'),('64dm6si3qfhtk4h4ej7m4eqsnq',1583925994,'','172.18.0.2'),('64q7jrakrvvlgq6emc4798lj0c',1583928420,'','172.18.0.2'),('65hlrqh8hl9drgf8oa7ehf1rhv',1583931447,'','172.18.0.2'),('66vocfqd450d4t4obk4o5cgleq',1583931497,'','172.18.0.2'),('67jqqi18upfepffe951seid34j',1583931279,'','172.18.0.2'),('68r19238htmaikm0ogpqhkdkq3',1583931282,'','172.18.0.2'),('68r4b2rv28gtlpjh5jo9372v68',1583925994,'','172.18.0.2'),('6a5n31mhui94cpm6fdak431kvv',1583922303,'','172.18.0.2'),('6b0pr4vp2fr7m9udu1578nq40v',1583931245,'','172.18.0.2'),('6c4upb84dh543k07v5ppdmqg7j',1588945960,'','172.18.0.5'),('6cd516rabif14km34kn3m7b06v',1583931500,'','172.18.0.2'),('6csle91bhimu7onnb97q3vl595',1583930296,'','172.18.0.2'),('6d1oak7tog9v7jkudfld7e40ik',1583931976,'','172.18.0.2'),('6dn67sc7dpbarso4jpv35mq4f5',1583931279,'','172.18.0.2'),('6dvupfcs2vfb9tblf1b3ropti5',1588945960,'','172.18.0.5'),('6e5v7nkboogoi1rbj776va9fej',1583931500,'','172.18.0.2'),('6fsf7gnfo4o8kuf4uomg6nip8m',1583931447,'','172.18.0.2'),('6gmtfh5m102fv6dadfe6sbgan0',1583922304,'','172.18.0.2'),('6hh8mqsvhqpm3mvsn9l0jlf3su',1583921797,'','172.18.0.2'),('6ib1clskhdfjt5jbdbbiq9kv9a',1583921773,'','172.18.0.2'),('6j1thg7hi7q4e76fhat62c4eqk',1583931242,'','172.18.0.2'),('6j6aiu0knvl9t08qg2lnlucu0p',1583931108,'','172.18.0.2'),('6jbq22jfcfgu49jqbd70eqgk8i',1583930274,'','172.18.0.2'),('6jhglmdg50uapvmi50c04nh435',1583922304,'','172.18.0.2'),('6jted9qngj7qsgq56tff3q1c9b',1583926011,'','172.18.0.2'),('6kbmodib8e6e5cddvrol1t8ukj',1583931497,'','172.18.0.2'),('6kpq3g7hqsasth8p4nu927kfon',1583931140,'','172.18.0.2'),('6lhamfeo01pthi1n5vbqbuel9v',1583931282,'','172.18.0.2'),('6ll15r06gc4qfssk8up5cn58jo',1583931110,'','172.18.0.2'),('6m279bjvs03qe5rh5ippg9oah5',1583921771,'','172.18.0.2'),('6n073dqmh1tqaj4684q5hd3did',1583925994,'','172.18.0.2'),('6nu5fh7smt7ab3gahlngak04j8',1583930230,'','172.18.0.2'),('6pbh82ne5h8bsbqa4vkle1b7ve',1583922301,'','172.18.0.2'),('6q2patqham63lbrgj8idto7m3m',1583921774,'','172.18.0.2'),('6qoid4lfk5kjb81nj0lsvqp8l3',1583931034,'','172.18.0.2'),('6r2ndai07l0ae65csq26f1p6ce',1583931279,'','172.18.0.2'),('6smim283fs76us7rspdmn9m16i',1583931245,'','172.18.0.2'),('6tnnvpo5ijn0mlmn4nq4pg8rm3',1583931976,'','172.18.0.2'),('6toc5e164p9k6gcaomajb83ugf',1583925961,'','172.18.0.2'),('6uhjv2hd4lvj4vt7fjp97h468k',1583931034,'','172.18.0.2'),('703a1t9ofd4j2ejdgj6957bv6t',1583931979,'','172.18.0.2'),('708vsd3hjj2ekqvugiv9ncllha',1583925994,'','172.18.0.2'),('718lkvcju4de2d924euq7v5ko2',1583931278,'','172.18.0.2'),('71i06vii32nm9tivlr7164in49',1583931451,'','172.18.0.2'),('72spledaj8nadsdk5llormum62',1583931245,'','172.18.0.2'),('73ks5mtgpu3tekld2mr5pm6977',1583921672,'','172.18.0.2'),('73vvqps7n4rqqnsjhm68rkcoin',1583931282,'','172.18.0.2'),('747r8dv6tr7in1aakh2ub4a35o',1583921672,'','172.18.0.2'),('74m9ccdfguo4knghc1vfpi3al7',1583921672,'','172.18.0.2'),('76107l22jpuk8cg2oop7l8i1rj',1583930275,'','172.18.0.2'),('7657pg19elvpeja8vv8mb3p66q',1583931282,'','172.18.0.2'),('76mbsrpjlbqmj6ibj9hufq88qh',1583931144,'','172.18.0.2'),('77dpubapf4mcdk519o9m3h6apu',1583926014,'','172.18.0.2'),('77pbvjo4jcj1ghfc85l6ncinek',1583930296,'','172.18.0.2'),('78e5abjvnhfenm69e951bg3s32',1583921696,'','172.18.0.2'),('78orrm1n7i662sa3aiuh6b6d2f',1583931450,'','172.18.0.2'),('794lsgp9c3rpn94sgjrjdmsapo',1588945929,'','172.18.0.5'),('79bec8u0ssfoabuaprbhn647o3',1583921800,'','172.18.0.2'),('79dtaren5oo0dc8oqbaigd43a9',1583931980,'','172.18.0.2'),('79hmtj6uva6q61r5qcrpovv7qf',1583931979,'','172.18.0.2'),('7a6gshbkelhhpqlugjq0hlopp8',1583921771,'','172.18.0.2'),('7agfc5qq56dgenmsjuepusnmke',1583931913,'','172.18.0.2'),('7apj6nsodgs091k8rgoscctdsu',1583931031,'','172.18.0.2'),('7aquq127o1q8fj6ntm7l5m6ap4',1583919489,'','172.18.0.2'),('7b8fhmgjkg8qe16prjblgo7bkv',1583931978,'','172.18.0.2'),('7bd8eadeop9ntf8an3v81lijjh',1583928423,'','172.18.0.2'),('7c0nf8qqq0gbuokr8ek10fsfap',1583931242,'','172.18.0.2'),('7ci9n9u9hrccjgcs694m2mu70s',1583921698,'','172.18.0.2'),('7cos20sb12i1paa5cf1pehblqg',1583931451,'','172.18.0.2'),('7cqni54m8rlj75t5idk4p37obh',1583921774,'','172.18.0.2'),('7d6nqorloc9s5064poi9uiv9uo',1583931448,'','172.18.0.2'),('7e3b9rsc9ddrofesr77mmsp3k8',1583931140,'','172.18.0.2'),('7e4asiq66sbkdhhc4q9tiol238',1583931448,'','172.18.0.2'),('7evf6o07svfl2m3amunri612j9',1583931450,'','172.18.0.2'),('7f5ngqlr152ijvvqete5fsd8v7',1583928424,'','172.18.0.2'),('7f840pqjm9m8tgo606g4qfethg',1583931242,'','172.18.0.2'),('7gr5m31779pok2lnoord6msam7',1583926011,'','172.18.0.2'),('7hliqcntbaaf7i9n3c5nujnepj',1583931108,'','172.18.0.2'),('7i8m4skve2nicbkgdu816kpdc2',1583921669,'','172.18.0.2'),('7irl4sq04fcgpknej7s9s73nle',1583931500,'','172.18.0.2'),('7jl7mtlv68t8d9hde2uho133le',1583931110,'','172.18.0.2'),('7k2o85uar6vb4f6bbd9flr5vrp',1583919493,'','172.18.0.2'),('7kb14dn3297dcajib3ah26l3hu',1583931976,'','172.18.0.2'),('7ldg1f7ntu8a113ve8l1djffn1',1583928420,'','172.18.0.2'),('7lk92arhuh2irhmm3hd1j6ui6j',1583931140,'','172.18.0.2'),('7m0n8oqkrskk0dvnba8d3ba7jd',1583925958,'','172.18.0.2'),('7msh946mm7smblqr7br35l6qm8',1583931451,'','172.18.0.2'),('7nss50ustp2qks31gupl4s50fo',1583931451,'','172.18.0.2'),('7ocpkun95p4o6shsui9t39hvp7',1583931500,'','172.18.0.2'),('7omajhr49e1mkcs3oo99p3vcvp',1583931497,'','172.18.0.2'),('7ooqaqvtkenu4m5fap6evj0smp',1583931140,'','172.18.0.2'),('7p4cd346ri4vsi009u2rtl8uks',1583922304,'','172.18.0.2'),('7pa6ufergen6mu6hdic8j31eth',1583931243,'','172.18.0.2'),('7q8inoo2b9vkcj42kkcmh33k9l',1583922304,'','172.18.0.2'),('7qh5fpirj6lllnnavetst4dcu8',1583930229,'','172.18.0.2'),('7rifnmcenqjtrgk9oboo4pv3u0',1583921695,'','172.18.0.2'),('7s759ik2an3e91av6nh2ru156q',1588945929,'','172.18.0.5'),('7th4btkjsn9adac78heuau2dn9',1583928421,'','172.18.0.2'),('7tmsak4jl2ca00jbfrnlhdpo6f',1583931243,'','172.18.0.2'),('7ukls1ff2d5np2j8dm2qbr7nsn',1588945960,'','172.18.0.5'),('7uscmd3u4u1ukha898alnk7s33',1583931447,'','172.18.0.2'),('7voif66f4o2lhrahu35cqcf7l1',1583931111,'','172.18.0.2'),('7vqnohdf22pos7r61gti1p08hs',1583921771,'','172.18.0.2'),('80ljc7q0j90gtj2u265aih16ar',1583931450,'','172.18.0.2'),('80odkrd6to577ko3p10p0ls1ko',1583931448,'','172.18.0.2'),('812uklf3jpk2t4l934m63m2hu6',1583928423,'','172.18.0.2'),('81rld1kflmcm9154hkkaso49ua',1583931975,'','172.18.0.2'),('82hc6qkq7c2jvjaic3gvcrhhv3',1583931245,'','172.18.0.2'),('82tbek38brhlvifas8rm94rfog',1583921801,'','172.18.0.2'),('85bjpg101gahj2trdtu9f5rvab',1583931279,'','172.18.0.2'),('85okqd457us58i935rifblee9g',1583931496,'','172.18.0.2'),('85vcomma46r8o11kjdrlnldtb8',1583931242,'','172.18.0.2'),('862l5299ce1lvv96o0un6nlk2t',1583931245,'','172.18.0.2'),('8806cbtmdajed5b6i0rrmjo0da',1583925961,'','172.18.0.2'),('883fbnl4rp5du4ct64k6jjqodl',1583922304,'','172.18.0.2'),('88oa67tpkoaf3piup9heqrc7vk',1583931975,'','172.18.0.2'),('89eietjt9cbnl01ebitrbfjhk2',1588945928,'','172.18.0.5'),('8a4iffa0j8e64fg2b039dtv4ln',1583931107,'','172.18.0.2'),('8aeoeh3iuljbtj9r3pd03hdi5s',1583926011,'','172.18.0.2'),('8bkj69qh11khkc9vd25bia97v6',1583931282,'','172.18.0.2'),('8d9r7sep3art31ad4faur5vfv9',1583930230,'','172.18.0.2'),('8dtg4j1lirnodrrvqkuip33v4b',1583931451,'','172.18.0.2'),('8du3hkpmr4q7bcvgg501gr3o8q',1583931980,'','172.18.0.2'),('8e3kri1bud1emsb7dqjormcg82',1583919492,'','172.18.0.2'),('8eculnnaa9bfue66vjfbe3h10t',1583921774,'','172.18.0.2'),('8g8edus6o502ee9at15cethb7e',1583919492,'','172.18.0.2'),('8gnov8gnfe3pdg4hqvq4kk4lrq',1583921800,'','172.18.0.2'),('8gvo5l0ntnvhop851oo7skp0c0',1583921798,'','172.18.0.2'),('8hamg7hjevgu0ea01bmbc5jq6l',1583925997,'','172.18.0.2'),('8i8ierpkin2pvh1cscnrchi8h9',1583925958,'','172.18.0.2'),('8iqqe8golqanchti3r2f85585g',1583931980,'','172.18.0.2'),('8jm170jj3qsh1dad6dh6m5219d',1583930274,'','172.18.0.2'),('8jp56v651pp3nslfmrfhtv8skt',1588945960,'','172.18.0.5'),('8kmlmigsc0sidsodi3n48qnp6a',1583931245,'','172.18.0.2'),('8kqaoaemmkvq5lhv3oa6usohnv',1583921798,'','172.18.0.2'),('8l65sqi88vcglbni4urk3pbul8',1583931107,'','172.18.0.2'),('8neks1r7meq6jc31cmpsqib1qf',1583931140,'','172.18.0.2'),('8nlo0uo0aq65avrrkuebpu10i0',1583921800,'','172.18.0.2'),('8o7n9b94p5eou92078fn67blh2',1583921771,'','172.18.0.2'),('8of569ddcc8q0mm34m0tbevhtb',1583925997,'','172.18.0.2'),('8p2r7nqv15eho1ka5fobimtibu',1588945960,'','172.18.0.5'),('8plmt2t5ha6ldthl9a0bp1fp4t',1583921798,'','172.18.0.2'),('8qb9ic1r1dvphho8khmsg05862',1583922301,'','172.18.0.2'),('8qepb9shjg61kb7q9l9p01hsg9',1583921696,'','172.18.0.2'),('8rp3um4b8oi59c3n5gri34sj0q',1583931015,'','172.18.0.2'),('8s5qi5kc942000nsjun9io7jan',1583931447,'','172.18.0.2'),('8tq78o10sh5flt1sfh6rd346ph',1583926014,'','172.18.0.2'),('8tr3dhjdcteec95iukrrmlbbft',1583931499,'','172.18.0.2'),('8v0rf6qljhrkmo3ob7b79j6dh7',1583931242,'','172.18.0.2'),('8v9de1g2mjqpjubca59frv8gk1',1583931245,'','172.18.0.2'),('8vp7sqamg1kvhoernqnu3ufdkb',1583930230,'','172.18.0.2'),('9109hjcluo4tkt0aud2n5dsll6',1583928420,'','172.18.0.2'),('916ksrndonmfu57ceomul8tsgm',1583931110,'','172.18.0.2'),('91742sh9835hvad7m1irjr0s5k',1583921774,'','172.18.0.2'),('93brikqhk989dq96820tsivah6',1583931111,'','172.18.0.2'),('97v3lmmbkuno18nhcjndntd6e6',1583931140,'','172.18.0.2'),('99jq1rnjhnqt02ern3noq90k0m',1583921797,'','172.18.0.2'),('99rfkmnvnt9j7bmer1dlotuvji',1583925993,'','172.18.0.2'),('99rnhfq3b6sah1r4i1fci668pl',1583931497,'','172.18.0.2'),('9bba0neeq3l7rfdccojcj8guco',1583926014,'','172.18.0.2'),('9blbdg84jeqqkgtielr86rj44k',1583926013,'','172.18.0.2'),('9cr1asm5l1b672h42177osm5bq',1583921801,'','172.18.0.2'),('9d0b8cpp8b0t4fh5adcsg0vsff',1583926011,'','172.18.0.2'),('9d1jjpmfs3tj7lo51teh7m864p',1583931975,'','172.18.0.2'),('9d2hn718bevcj7pe1g3mbr3f76',1583931144,'','172.18.0.2'),('9d556idrq5c1c1n570r4gqo4iq',1583921798,'','172.18.0.2'),('9dolpueog66iimg8em88e5gutm',1583919489,'','172.18.0.2'),('9dstc2itfmtppj9n8305bq3e9p',1583921696,'','172.18.0.2'),('9eusskg384h20lciogk2lvf7b7',1588945961,'','172.18.0.5'),('9feiofhnrsqcnqilr6ipom81on',1583931140,'','172.18.0.2'),('9ghflmlrejicffglcvulr51pas',1583931140,'','172.18.0.2'),('9ha0dajhcdpur3cobntadk08uv',1583931979,'','172.18.0.2'),('9hc5bqvgshqg79ctap4c9k5bgt',1583931976,'','172.18.0.2'),('9jq2rk8fjqfhf278746ltdmijr',1583931910,'','172.18.0.2'),('9khlf72o8gs804teaphj61dc0v',1583931282,'','172.18.0.2'),('9ll2oe5ku0ao8bpce7jpc0p52g',1583931979,'','172.18.0.2'),('9oip9g3jhtdfav8lvla2sh9p21',1583931497,'','172.18.0.2'),('9peb9ivog4rj4ms407gksm9nse',1583921801,'','172.18.0.2'),('9qcfbutcbct22daqvr4nle60uj',1583931245,'','172.18.0.2'),('9r1m65jjca143js02rh3qen6mt',1583931500,'','172.18.0.2'),('9r5lcv9e27524iq2k6p2t1dbl3',1583921698,'','172.18.0.2'),('9rooiu05n165a8kuuc3o8onsrp',1583931499,'','172.18.0.2'),('9sbffgg1c1hgude9opj5g3fgbr',1583931913,'','172.18.0.2'),('9spd3i4fhhtrkhamptfkhdjqmv',1583921696,'','172.18.0.2'),('9su2vqhea3ouuj9mv9ao37epkv',1583931447,'','172.18.0.2'),('9t25fqnmkff5pakdpvubqlq5hf',1583921797,'','172.18.0.2'),('9td8nmlke9su9fdit3b8gimnve',1588945929,'','172.18.0.5'),('9vctebr0ds83am2tvhrdkvcmm9',1583931282,'','172.18.0.2'),('a152a5qaj04u7a4r819m3a4msr',1583931140,'','172.18.0.2'),('a1cs19id8of44qrpiovg9ce5go',1583931111,'','172.18.0.2'),('a31apm12kqg96vb1lih674j407',1583921698,'','172.18.0.2'),('a381a54ofl4o1n7gm6nva08ij1',1583931913,'','172.18.0.2'),('a3gjrnpf5u2u8hdun4h01ibnll',1583921672,'','172.18.0.2'),('a4eh0ub8at08qhi3s523avvtp6',1583931245,'','172.18.0.2'),('a4pp8msneblqqbthj3oaua5809',1583931913,'','172.18.0.2'),('a4ulvqqrikhu5ibunva5nd30ap',1588945928,'','172.18.0.5'),('a5mc8s8076fsm5ijsp83h34ri8',1583930274,'','172.18.0.2'),('a5u1itf9eb0hhdubitc0mofvtf',1583931143,'','172.18.0.2'),('a5ut1pll52vsappa90ng3l29ae',1583928423,'','172.18.0.2'),('a6nar06eim91pgr14egqsqfsl7',1583931242,'','172.18.0.2'),('a6ruipv835n50s82e0c4q6j94m',1583931110,'','172.18.0.2'),('a7s4d2onos2ts10psdn275k7mi',1583925958,'','172.18.0.2'),('a8le5thkc21jfvqdj8qlr5ba58',1583931111,'','172.18.0.2'),('a9egqffdmr7v81fs4l90o7s971',1583921798,'','172.18.0.2'),('a9f51e81qqg80btn0vkqvlo0cq',1583922301,'','172.18.0.2'),('aa7vvflseth19t2pge7pjvppg4',1583931279,'','172.18.0.2'),('ablep8thtdnitkqbsi02qublh2',1583930230,'','172.18.0.2'),('ac1fl55cifib30osq1gprd83h6',1583925958,'','172.18.0.2'),('ac3kbvri2uf5v8u9kaeofnm96j',1583931110,'','172.18.0.2'),('acfvs6rgdp3gttbp68i6i4tdgj',1588945960,'','172.18.0.5'),('ae1fup21dmm0r6aktpcnmv1c9t',1583921672,'','172.18.0.2'),('aerp68dfams92thhcruv5f36h4',1583931448,'','172.18.0.2'),('aevff29c65g11r0letcp0h6jh8',1583921800,'','172.18.0.2'),('aj5r8cu04ob4sobt68cu99pv4l',1583931242,'','172.18.0.2'),('ajgafruk4ngmj834gajk3kcfto',1583925996,'','172.18.0.2'),('ajt4e1g139k22r3c84oq3ga6cm',1583919489,'','172.18.0.2'),('akcvr7mski1pccq3m99c6bhp6m',1583930296,'','172.18.0.2'),('akgp3ves4he49ln8eik5t96qjk',1583922304,'','172.18.0.2'),('aki7710483vnnucubj38nivicm',1583931110,'','172.18.0.2'),('alrm06slhpg543nodjree6e72c',1583925996,'','172.18.0.2'),('alrndp49kv3qs4mrr1lnmh95qn',1583925958,'','172.18.0.2'),('am7hmnrjug9oea51pludjkmsl8',1583931910,'','172.18.0.2'),('am8kd76s1qv4af1bk42f9rj726',1583931144,'','172.18.0.2'),('amvfmgedd0mnodttvog50othca',1583926014,'','172.18.0.2'),('an5v79ofpea83jrd4eo83qukbc',1583921801,'','172.18.0.2'),('an6bd1o2ddhgbrvg3e53udl6ef',1583931015,'','172.18.0.2'),('anacr5j7h7fitp4776rtvf8to1',1583931911,'','172.18.0.2'),('anq4pnt3qkoc05ep309cf8keu8',1583921771,'','172.18.0.2'),('aoi9ascaiu9le0hs049qbobese',1583930274,'','172.18.0.2'),('aonbognajjq36denrl36riirfi',1583931143,'','172.18.0.2'),('apu4q7ra28pam0epjlm9732u6e',1583928423,'','172.18.0.2'),('aqkndt3hmkc62t5emqs0lo5nh0',1583931278,'','172.18.0.2'),('ass7knp87m66lkatbsakjdjq46',1583921774,'','172.18.0.2'),('atg4amn88jjli8rag31oveolpj',1583931282,'','172.18.0.2'),('aurin130sertpu57gtdvfgj5ro',1583919489,'','172.18.0.2'),('av9kd61jipbeqh5nam1g4dc6sr',1583928420,'','172.18.0.2'),('b04l415a2vh7pip99k9vhvgkvt',1583921771,'','172.18.0.2'),('b1714n2etuhka7vnlmqa13r3o6',1583931107,'','172.18.0.2'),('b1jthmn1jl51149j76c16vm4ip',1583931447,'','172.18.0.2'),('b1tbgrg798b8eib2uo5ie25lq7',1583931497,'','172.18.0.2'),('b2ea0pk7fb56ens2bkj8voncec',1583931448,'','172.18.0.2'),('b4nadm9ah7m5ms4ba4ml3j5ais',1583931031,'','172.18.0.2'),('b5u8saebqn58rkpt6588onkrj0',1583926011,'','172.18.0.2'),('b6f6khbbkhhbsed7gge4qe6u38',1583926014,'','172.18.0.2'),('b6p163ii4iknmlfmsrbc9gcqpt',1583931034,'','172.18.0.2'),('b8hntaqv1du91nt83m3mldmj06',1583931910,'','172.18.0.2'),('b8iiff54dnt31321ka42crr5g8',1583931279,'','172.18.0.2'),('b8u799levg4e4un0kpo6g6idhb',1583931279,'','172.18.0.2'),('b90r6749gjsmo0fdk488crnqan',1583931451,'','172.18.0.2'),('b90t6jcsrkvkpaf1as4uveirjs',1583931913,'','172.18.0.2'),('b98njcdk56i385qbdamgbtkvmh',1583921670,'','172.18.0.2'),('b9rphmj2sus3dp2i5u32rt8qb1',1583931447,'','172.18.0.2'),('bat3bp4tggheahbir92622356j',1583931451,'','172.18.0.2'),('bcek9bk9ep669nrnvgisnj50hq',1583931976,'','172.18.0.2'),('bd2eks0477ofbiir3rdpo83121',1583925997,'','172.18.0.2'),('be2umffes93r0ua1gpnar384pj',1583931143,'','172.18.0.2'),('be4sv4lfusumau9njn0ubm20o4',1583931140,'','172.18.0.2'),('bermumh88bd8mf3dm4ihol70gs',1583930274,'','172.18.0.2'),('bf1c2kbdltvgv5eaip55rcu3u0',1583931451,'','172.18.0.2'),('bgp4qihqme1l2208it0c8ph394',1583931282,'','172.18.0.2'),('bhed58c6lejenth1idpms3750k',1583921670,'','172.18.0.2'),('bhoshodolstqeji53b6s8beicf',1583931282,'','172.18.0.2'),('bhtfhmn6buadupb70dq9sf7a1o',1583926011,'','172.18.0.2'),('bi5ej50n3hh783ctt0a8qc86c8',1588945961,'','172.18.0.5'),('bi9ki5bta7a8mh3frcbjrd9a92',1583926014,'','172.18.0.2'),('bifhtsut9vuueo82itee8eh1i4',1583931448,'','172.18.0.2'),('bjs78dpdbvoibso2og9es018fd',1583931282,'','172.18.0.2'),('bk9o1ie7mlqkia6fatie7g7sv4',1583931279,'','172.18.0.2'),('bla0l235o8ob86jqnabou5o9gd',1583921797,'','172.18.0.2'),('blb516167bbvvlqh73fk1us39u',1583931015,'','172.18.0.2'),('bm2l0ves1a6mtba9kgsmfiedg0',1583921771,'','172.18.0.2'),('bnp7o24e5sea4uvqic7jdvpo0d',1583931245,'','172.18.0.2'),('bnt2c2vmneqoe0i69gcg9npebn',1583931140,'','172.18.0.2'),('bouop2d83d88r3mqvjsukle1q2',1583919492,'','172.18.0.2'),('bp40as5ar0365alhb1gv9m1lg9',1583931980,'','172.18.0.2'),('bpmfpavsgvf6b4o8aifrisn98c',1588945928,'','172.18.0.5'),('bq2q7p97glmbbanrq7g46qfb4q',1588945960,'','172.18.0.5'),('bq8pa4jeti5kc61dmt319oo61l',1583931279,'','172.18.0.2'),('bq8to5h07fkadphvrbstd1dno4',1583931500,'','172.18.0.2'),('br50upqgn3jabsn0amj62t8ssc',1583926011,'','172.18.0.2'),('bruhaecb6k32aem949f5593rbb',1588945994,'ipamusername|s:5:\"Admin\";ipamlanguage|s:11:\"en_US.UTF-8\";lastactive|i:1588945994;csrf_cookie_user-menu|s:32:\"43u1U7KCSqeqACHf-xzI6Byw9fKcLjrj\";csrf_cookie_address_14|s:32:\"4nlX2ZVNriBFe76TI7COPpqQ5k21_iZG\";csrf_cookie_address_add|s:32:\"1uXnKB99ml-37_E3Z5VJvtYXZfB8PNLU\";','172.18.0.5'),('bs25voal0epifa9f61q8uhoob8',1583931278,'','172.18.0.2'),('bs8c3placsd1b085u39vdl3jp7',1583931140,'','172.18.0.2'),('bspiru6j7fkltauniptbcr5m16',1583928423,'','172.18.0.2'),('btnbfi5cu1ri9ll9fitme1a5ee',1583931246,'','172.18.0.2'),('btonnpulut8rcg62aefcupri4g',1583931497,'','172.18.0.2'),('buagtvmuev87ft7vknfnok7k8k',1583931496,'','172.18.0.2'),('bv5lin616k4v3fpm2v0ehq91it',1583931913,'','172.18.0.2'),('bvdtcal5er482o6sg278o6vlus',1583931451,'','172.18.0.2'),('c04scsecv5smfki8n807lm84o1',1583928420,'','172.18.0.2'),('c0i6c7v57i51ak1kp4hsno2pjg',1588945928,'','172.18.0.5'),('c169tt7khcgb1a5vvcaim7i58p',1583922304,'','172.18.0.2'),('c216mmmq298qq6r2ajvko8nk1s',1583931910,'','172.18.0.2'),('c240rq21q1s17gmmqjkvsfrqts',1583931015,'','172.18.0.2'),('c436sclcgv63k784aa4p2fbl9o',1583931139,'','172.18.0.2'),('c4gh88mer4keevfnmo2ffes1kg',1583931246,'','172.18.0.2'),('c5vi2ok3p9ldh9da2hvfjdl525',1583931278,'','172.18.0.2'),('c6f062l9j0c1pjtjjtcud4phvo',1583931451,'','172.18.0.2'),('c89hp20n5qvamteojr24bbhaq6',1583931143,'','172.18.0.2'),('c89o9emji7akjal5n15qm4ijuq',1583931031,'','172.18.0.2'),('c8utp6t8k57ko2umrmctme3jvj',1583931245,'','172.18.0.2'),('c90kmdivqn4vbkcth20rhig55j',1583931031,'','172.18.0.2'),('c9dp8r43dtu1vi9ob310nl2ghk',1583921797,'','172.18.0.2'),('c9ml1boubrjj3pd3q67kef6414',1583930296,'','172.18.0.2'),('cal9kh0t98tqq3m6qno19f2qag',1583931144,'','172.18.0.2'),('cb5mnedipug1na2mi6ct3ojtm1',1583931447,'','172.18.0.2'),('cc7np4hm8tjpr6ks4bi0j671cr',1583931279,'','172.18.0.2'),('ccarmr5q3lma4os6b4rnai2v8g',1583921672,'','172.18.0.2'),('cdcoht5ioig7mio9g0h57vjge3',1583931913,'','172.18.0.2'),('cdrm74jtt81po4k91vdp5j7acr',1583931245,'','172.18.0.2'),('ceda86ee5ne15eh1e0eleam55d',1583931497,'','172.18.0.2'),('cennhn7g9055i3rkr97r38p728',1583925994,'','172.18.0.2'),('cf2aokjnc6ldv5o5d8h6c57c8l',1583931108,'','172.18.0.2'),('cf5rtu1uhnphnqnl375j0t20q2',1583931107,'','172.18.0.2'),('cffc9ogck4ubafc88efon10hjo',1583925994,'','172.18.0.2'),('cg58qcq9d48i72dj7l3ca9ekku',1583930230,'','172.18.0.2'),('cgng4accg0qemkikudpqrki34u',1583931031,'','172.18.0.2'),('cgrcjshv50gtmuhj99ltn9vre2',1583921698,'','172.18.0.2'),('ch48joqu55rtcof7sc3ea3sb4j',1583931450,'','172.18.0.2'),('ch9f3dokimaddsrupdukkl7c50',1583931500,'','172.18.0.2'),('chd9b9024nb385m6qepj4n2kqk',1583931975,'','172.18.0.2'),('cho6ml1m7mnsauj05k8q6eq593',1588945929,'','172.18.0.5'),('chpsqvaee1g6o9cs9943p9hj86',1583931015,'','172.18.0.2'),('chs1g9kn686scrl1alh6lv72m9',1583931978,'','172.18.0.2'),('ci7b1gm254ipqbikdghea6d4dn',1583925997,'','172.18.0.2'),('cjg3s3pqu05p5mqqd77vpoou8t',1583925961,'','172.18.0.2'),('ck225mi95hkmjoef258vq1igpi',1583931497,'','172.18.0.2'),('clb11d3h8ehqtqnjfrq3n9fd2a',1583931979,'','172.18.0.2'),('cljejtquse3sg0g0se44t7155h',1583931242,'','172.18.0.2'),('cm8jk9hl4ptmgiobl5465q2t4u',1583921672,'','172.18.0.2'),('cmcdcvkeir6ll06oll98dilepj',1583921698,'','172.18.0.2'),('cnp32p52nskjp1o9ctjr1f5orh',1588945960,'','172.18.0.5'),('co0v4ce9a05ajt1vmi819ovh01',1583925994,'','172.18.0.2'),('cpcaulfkh3uhar8de61q6v1o5f',1583931107,'','172.18.0.2'),('cph1ms55cbbfnc5icmmrh2a8cp',1583931980,'','172.18.0.2'),('cpngrsupoo7cfr7i3pbjq9hcb7',1583926011,'','172.18.0.2'),('cq54q9aqj9jcj47s81hkga74nd',1583931246,'','172.18.0.2'),('cru7d3es521pi1odbjck2urhln',1583921800,'','172.18.0.2'),('css5mqhfgedh3hqljuord9alml',1583931245,'','172.18.0.2'),('ct5itobvu67t8hgj1gn2ndpn7f',1583931496,'','172.18.0.2'),('cu1d216ga9i1enl0o2j8omuh50',1583925997,'','172.18.0.2'),('cunj6df8cseqko8n4e0peupbj9',1583931496,'','172.18.0.2'),('d2786s0j7ahcdt907538es79im',1583925997,'','172.18.0.2'),('d3c7vnisqgh8m22q3vfv106dlt',1583930296,'','172.18.0.2'),('d3d6u820gpbjcs1smog3p4m585',1583925958,'','172.18.0.2'),('d3rmemp8hpg786gvdp17e0m8sr',1588945928,'','172.18.0.5'),('d4rn6b40cq598s9hdjba1q3t7r',1583928424,'','172.18.0.2'),('d5h8p2d04s6nk8lh5tksbnstsh',1588945960,'','172.18.0.5'),('d6jjkon4hju5tr4q58vfeuarm8',1583931108,'','172.18.0.2'),('d75kp46do54nqih7ice5ro4kct',1583931140,'','172.18.0.2'),('d88ucumdnivejcesd44oolf9s1',1583931496,'','172.18.0.2'),('d94davv9on2tcm7ocb857uae3d',1583931242,'','172.18.0.2'),('d9a40oah24oksuj9la3o9r1qnq',1583931144,'','172.18.0.2'),('d9j41k0nso5ou80bvkpr4u4d94',1583926011,'','172.18.0.2'),('d9ksuugjgacrvfse23tb8bopq4',1583921669,'','172.18.0.2'),('dama1aip8890so5d52sjdevvu7',1583931500,'','172.18.0.2'),('dbvhmurio2fupdrk1e1v10925r',1583921774,'','172.18.0.2'),('dcocqdc1rck2csk1ctrgu3n1c1',1583925994,'','172.18.0.2'),('deib5bsfot21vhtgd3c3osoi70',1588945929,'','172.18.0.5'),('df0o259pub81j2m5ngj0hceahq',1583921695,'','172.18.0.2'),('df8915urnemkng6o8eifnth9pp',1583931910,'','172.18.0.2'),('dh2s68j6t323voo0r6oe7n2lth',1583931451,'','172.18.0.2'),('dh8333lkcdkjo1md4fce826v23',1583931450,'','172.18.0.2'),('dir2n053fkpcviju6j1o0nlh6t',1583925993,'','172.18.0.2'),('dj3n0r9ihtblasllobfmulgtgf',1583931975,'','172.18.0.2'),('djvdej26dtkmlhv4etkcqjfae6',1583928421,'','172.18.0.2'),('dk8chmdi5faltlbbopnekkaset',1583931979,'','172.18.0.2'),('dkj2mk36oc9buql3et33gueuqs',1588945929,'','172.18.0.5'),('dkoli8fdcba6cte2bbk2q6ubnc',1583931979,'','172.18.0.2'),('dl0evonvstomfvb6hjrqj02bgo',1583928420,'','172.18.0.2'),('dnc1qtblmfdla7f90nihgit1qo',1583921771,'','172.18.0.2'),('dnp8vdfha6vasg9p1ng6jrhedk',1583931144,'','172.18.0.2'),('douo54pg8pudp75dukfq5mikod',1583931282,'','172.18.0.2'),('dp8l455s17ghemc73o0ickl28s',1583928420,'','172.18.0.2'),('dq53c46goin5heopr06snudehs',1583931451,'','172.18.0.2'),('dq7evepq5ogf6ukqk5oaisikm6',1583931979,'','172.18.0.2'),('drc4q9rkgkgqm5gmd1on6vgsb4',1583925996,'','172.18.0.2'),('drd6gjjg552tirnqu80rd6jlk9',1583921695,'','172.18.0.2'),('drkerir9fdlt6d5ne8hcorn80k',1583931979,'','172.18.0.2'),('dsuk80je920a7q1teav0irilkl',1583931450,'','172.18.0.2'),('dt0tgmv5kee668shliqd80387m',1583931140,'','172.18.0.2'),('dt3lgat4e9ukot1m9i94t4v1vs',1583931279,'','172.18.0.2'),('dt8qm3eqpou3t3avt3qbhuvbg3',1583922594,'ipamusername|s:5:\"Admin\";ipamlanguage|s:11:\"en_US.UTF-8\";lastactive|i:1583922594;csrf_cookie_user-menu|s:32:\"Vn4P157nNa2D4UcIqUiwtOGpdDQHy_--\";csrf_cookie_address_11|s:32:\"Izd4r3L4KsCcy3kkQhHgIPll-GTvkoi_\";csrf_cookie_address_12|s:32:\"a-V9nQ-YjXanlu5Q9zlL1GKUXHU6HfM2\";csrf_cookie_address_add|s:32:\"Dj1JKJaRSo4eWVPDjTgP8MWGbSIrjfxq\";csrf_cookie_address_21|s:32:\"wFQDKpcC_PDFBq2Aj4SflykvJIWUMUe6\";csrf_cookie_address_13|s:32:\"iRk_cvFPRLNtvqrJ0jsj0_1ZLlK6bDF5\";csrf_cookie_address_14|s:32:\"25w7ZWgutYxPGflfTH0zb0hEXIdqteuo\";csrf_cookie_address_15|s:32:\"CDN-eLZgybAG37Abjxieu3zxj17mFkuP\";csrf_cookie_address_16|s:32:\"qA-GFeZEGa_vuDZVm6fpXRIT4Fu2difo\";csrf_cookie_address_17|s:32:\"mtTkxpWzK2TZeAAAlwgHY7E2P_1mimaw\";csrf_cookie_address_18|s:32:\"QqvBDxBIYnUt6sK1AZ4hdU-tQ7RiImVc\";','172.18.0.2'),('dtrvci91drqk1bici627meqva7',1583931242,'','172.18.0.2'),('dutjpq6cnp5k2iacdq4s0l8g88',1583931282,'','172.18.0.2'),('dv08p6m42roq52otr0glvncuk5',1583921698,'','172.18.0.2'),('dvih7hhe61t55ideqrkh40sggl',1583931499,'','172.18.0.2'),('e07vpm4a33nae57gkh3bl20p03',1583931447,'','172.18.0.2'),('e163eootoalbosk9sp0736snr2',1583931243,'','172.18.0.2'),('e1v8e8q5fhgk1uij3r31v8ho9a',1588945929,'','172.18.0.5'),('e2pidfls8qlbl01fuk6sp1ghpt',1583931279,'','172.18.0.2'),('e2sb9c97sr3i2pn0d3qrc1uoq2',1583931979,'','172.18.0.2'),('e3dkpajklf0rdhell5032vqvur',1583919493,'','172.18.0.2'),('e3sdr9om1p6o161gre8e99843u',1583931139,'','172.18.0.2'),('e58mp9q1ar2aeqm984dqnoo46i',1583921698,'','172.18.0.2'),('e5epm5faphejh1r7lpd8sgdd7e',1583931451,'','172.18.0.2'),('e658ifq0dvjl4qjt98nekd5gec',1583922304,'','172.18.0.2'),('e683dumapmj9h5a9ktk4gn9ihe',1583931140,'','172.18.0.2'),('e6cm8m96kgjbn16ia7dk374gvj',1583931448,'','172.18.0.2'),('e6d92aaoc1rqs52nd6j3oug9nu',1583931031,'','172.18.0.2'),('e6fln1tlovbcnr2t7c804k00ld',1583921696,'','172.18.0.2'),('e7hvspfuq81p1oebr8fg3o5rpp',1583921698,'','172.18.0.2'),('e82131el3skc5mq4mvvr5qflgl',1583921774,'','172.18.0.2'),('e8a6fjiii2dpokcit2jgb5i8it',1583926011,'','172.18.0.2'),('e8bh3u5qqlc91b3kp04vvu86a5',1588945928,'','172.18.0.5'),('e9598hgni7umv2p8s5rcs48ovr',1583931976,'','172.18.0.2'),('eb2tq79mn0mr8bpb6nb24gumg4',1583931500,'','172.18.0.2'),('eb5hen1biabsvq5ehbjq5m6rg6',1583931245,'','172.18.0.2'),('eb6neshieuj9hqbm6c8o31oh5a',1583922301,'','172.18.0.2'),('ebg9bo9d1u2muc35a6366g5b64',1583919489,'','172.18.0.2'),('ebidso0ds5pg6oq6rdfpgdfoil',1583931246,'','172.18.0.2'),('eck43ntusc2rhajko5ttf2l3ro',1583921672,'','172.18.0.2'),('eclr77nqahhsbr8n8o96807v78',1583921669,'','172.18.0.2'),('ecrncsvm4d8nr39esnpigdgj82',1583931496,'','172.18.0.2'),('edmfco56h8uecar11k3acooq47',1583931031,'','172.18.0.2'),('eejiaioso73hlajfp5rgm5c3gt',1583931500,'','172.18.0.2'),('ef9r5jo4hoqseb2dvuig80c8sl',1583921800,'','172.18.0.2'),('efg809jssbuef80kpavdh63dfd',1583925958,'','172.18.0.2'),('eggrufk0ta82ibkdmu3cmcu83v',1583926014,'','172.18.0.2'),('ehiktcamv0hauuem7sc8vl6gte',1583931910,'','172.18.0.2'),('ehltfcjhp4d7nvkffcmnsi9kbs',1583925997,'','172.18.0.2'),('ekrnln5dd7n1jbnun2nbkj82am',1583921670,'','172.18.0.2'),('el9nrgkq8nv5j312hifc4c3i79',1583931497,'','172.18.0.2'),('emk5ob585jt9a9uif4508oiim4',1583931031,'','172.18.0.2'),('en1u4i36vi3aaapt10o83ib09d',1583921800,'','172.18.0.2'),('enf39no81q5vjlfgjiek6pe5ch',1583931496,'','172.18.0.2'),('enkp19qsmfikd514hlmt3564pv',1583930230,'','172.18.0.2'),('ep23oe2kqrunevrq64of29sntr',1583925994,'','172.18.0.2'),('ep37tvj7975q03itrf42aie4ao',1583926014,'','172.18.0.2'),('ep5gdemijj8520m1ns1o8k1li7',1583921774,'','172.18.0.2'),('eqvp2gcnprpll2sktvjoccekn6',1583931979,'','172.18.0.2'),('er16h71a43ev2d33ociblb70ds',1583931139,'','172.18.0.2'),('es5fe3emq2o70qroitdnblsrh5',1583921771,'','172.18.0.2'),('et358aksmnl6dnn0aqnkjdocvf',1583931913,'','172.18.0.2'),('etnovh810fqqtbnj6rumnsh6i9',1583931034,'','172.18.0.2'),('ev989jad52ifjnai9nqretpjnp',1583931450,'','172.18.0.2'),('evdll951csbajcu2bmd1n2t6kh',1588945929,'','172.18.0.5'),('evurpd43s3vsb58moir6ftotm0',1583931910,'','172.18.0.2'),('f14hdejc9bpcpln4t219vmom18',1583921695,'','172.18.0.2'),('f15kej4ose235shrtn19j0n3lj',1583930296,'','172.18.0.2'),('f1ph1mgcec248gkanpn0vi10gi',1583931243,'','172.18.0.2'),('f20lraq3nfrps1vf6d2lmsm9sj',1583931913,'','172.18.0.2'),('f3nmbaumcvdt3dngh8h3nuek61',1583930296,'','172.18.0.2'),('f42grjicnlp4b7f8rjs6oghpkp',1583925961,'','172.18.0.2'),('f4fv05ktlq9rnbq478mt3bo24o',1583931279,'','172.18.0.2'),('f58t7m0vmdks46rk8nr9b2188h',1588945929,'','172.18.0.5'),('f5fspm7a0t9ic8sjla2np4m44b',1583931107,'','172.18.0.2'),('f5ii3ruiupgr4tt2pvtelfd57j',1583931034,'','172.18.0.2'),('f661prvlf790jfdg9s6m491o8f',1583931976,'','172.18.0.2'),('f6hcd5a689d8g1d8k2e4eb59h1',1583931496,'','172.18.0.2'),('f6rcc85in4v0f5njq1aakup2kk',1583925961,'','172.18.0.2'),('f752p3d8u3fe3fl2nfo3fuusd5',1583921698,'','172.18.0.2'),('f8nu6cpavo4fdgerf2r4o26790',1583931976,'','172.18.0.2'),('f8rfi2rvidj07l0j2olfc2rd7i',1583931282,'','172.18.0.2'),('f90kj53gok7c8aa8as34obdk6c',1583931975,'','172.18.0.2'),('f90oh6skle7rktqtsmjh5d6jh8',1583931110,'','172.18.0.2'),('f98f9bdtqoo5cvanbrlk19gflh',1583930274,'','172.18.0.2'),('featf40rig1mooj5k07dfnqb0e',1583931447,'','172.18.0.2'),('feemduuqp843o3q7b8btcnus59',1583931282,'','172.18.0.2'),('feg8ob2fvohqm08s4ajmh4b93u',1583931496,'','172.18.0.2'),('fev9h34tcqdugofvvr0fq7k3fo',1583930274,'','172.18.0.2'),('fha5dr9qed0j474a3thde3mpnq',1583931031,'','172.18.0.2'),('fhg7el3s4j8n3lptvftk2qnpve',1583931975,'','172.18.0.2'),('fhpc5h8p2o3ietp0hg9pmeedle',1583931144,'','172.18.0.2'),('fjd8iund09of5k7f5qh9amg9dt',1583931447,'','172.18.0.2'),('fl2cfh2qn1cj0koi35959m1opg',1583931500,'','172.18.0.2'),('fmo603ssof89sbh546lhht40oi',1583919493,'','172.18.0.2'),('fo7os45g4ivnk98q1js83dk33j',1583922303,'','172.18.0.2'),('foiu7j8fr6hscfjnnnbjrr8dpd',1583921771,'','172.18.0.2'),('fqetrudq48d6mfj8f8qljcokl3',1588945961,'','172.18.0.5'),('fqfiukk4h0pjku2dl21sscmajq',1583926014,'','172.18.0.2'),('fqt9fplulrpg2kh31ttbh66sfp',1583925959,'','172.18.0.2'),('frbha0uo4uciqrugs97tmlor8c',1583931496,'','172.18.0.2'),('fs1335amkdgs3nfvdcggel3lo4',1583931913,'','172.18.0.2'),('ft08fh7468btt2rdqje2e7hg3u',1583931140,'','172.18.0.2'),('ft8epp86eefpsdch8oc246dmom',1583931242,'','172.18.0.2'),('fth9lhjj3qrfk09atdi08pvop0',1583931447,'','172.18.0.2'),('ftkb6737o0v8vbfhrtami25dd3',1583921698,'','172.18.0.2'),('fu2n1o9ea28oegahghs1ts6ve2',1583930296,'','172.18.0.2'),('fvm2dr5r25fmf2qfrq866af3o5',1583931245,'','172.18.0.2'),('g1o27tmq38f0g2fumb1s9l6kt1',1588945960,'','172.18.0.5'),('g2qje0dijog58alh4n5v2ljldf',1583931281,'','172.18.0.2'),('g3ohjjkulbk6gkkn205e54edkg',1583931140,'','172.18.0.2'),('g3upjfqmok8pnm1ol2ekci59a0',1583922304,'','172.18.0.2'),('g444eser1ro9ptvu64j68f4nr9',1583921771,'','172.18.0.2'),('g5diajogo4tqcu35s5nfbj08rj',1583931976,'','172.18.0.2'),('g6for87t2qv0o03264do4fsacg',1583931913,'','172.18.0.2'),('g6fto5kdjc08rvhn7gbf86u705',1583931913,'','172.18.0.2'),('g6gaks6vo78vcljra31qrfdqgo',1588945928,'','172.18.0.5'),('g6i91lfnb4e210k53ofvgqv9qo',1583931110,'','172.18.0.2'),('g6o5cdcl6gqho6iif5mthd39sk',1583931108,'','172.18.0.2'),('g6op75m8tvblacdttekdfg05gc',1583931242,'','172.18.0.2'),('g7mo5h0rjje3vtk4uaskmcuops',1583930230,'','172.18.0.2'),('g9llo4jkj14e06lsh19q22p8pu',1583921774,'','172.18.0.2'),('g9stlkifrf9tg7al1tcqa5sv4v',1583926011,'','172.18.0.2'),('gcfrmdnvo03475jqjn51nn1gqs',1583925961,'','172.18.0.2'),('gfcln09jtg866rj871s6cpd53e',1583931031,'','172.18.0.2'),('ggjb58md6kql4n6nt8u19g1cue',1583926014,'','172.18.0.2'),('ggpl94pme09sc8gsec6vt3b112',1583919489,'','172.18.0.2'),('ghngdrnihncmmdt78ioisfu1dm',1583931913,'','172.18.0.2'),('girhejnm7i74smf1asduhk5k35',1583922303,'','172.18.0.2'),('gk5hlpqq1r0v0hhbii61rtrk18',1583931496,'','172.18.0.2'),('gl0o1b2n2hnpn172tt21m6p9f7',1583931107,'','172.18.0.2'),('gl2udcmo577kq485gvgidc4t77',1583931140,'','172.18.0.2'),('glkh262rhq2muudfrpjkdevqac',1583931034,'','172.18.0.2'),('gluj9vmgaobkh3acu17npddcc7',1583931975,'','172.18.0.2'),('gn4s8dimv1m7ab7goedprvbuhg',1583931031,'','172.18.0.2'),('gngonro9oiuoks5ipjsesujdnk',1583931497,'','172.18.0.2'),('go48hk96kj6p87l1k7oc6rfqio',1583931108,'','172.18.0.2'),('gojmkt14u5nb6dn6vvogm7bib2',1583931015,'','172.18.0.2'),('gpcn54inr8dhrml64pnnhucdao',1583925996,'','172.18.0.2'),('gr3dqakj489hc9j4846k91g72q',1583921800,'','172.18.0.2'),('grj7ji1hu932gm3pfaks8sh01e',1583931282,'','172.18.0.2'),('gs8t7iif52f57k01bvmef91dg8',1583930296,'','172.18.0.2'),('gtdomecacavnhhu8d5jpca22ui',1583922304,'','172.18.0.2'),('gucdo8a1mbda6emhmpi8n1s2cg',1583926011,'','172.18.0.2'),('guce9m324fq45f855kta9gkbg2',1583931034,'','172.18.0.2'),('gufoolmo7b366c6f10hc2lk05p',1583925958,'','172.18.0.2'),('gujlj4r1gppqb8ukq7qch5aj4c',1583931144,'','172.18.0.2'),('gumooq5c6m18i999i5b73p3s7p',1583919493,'','172.18.0.2'),('gvn97kqn69nqer4cfaljqs31sb',1583922301,'','172.18.0.2'),('h0b8tbbs5ok3fabs0hvu4rutj6',1583931497,'','172.18.0.2'),('h0hh0dul5mjtb686gl7vfj1n62',1583931108,'','172.18.0.2'),('h0tdfk0ijsb8jlea254c9jmsri',1583925994,'','172.18.0.2'),('h0vqjdpu5bojagf12ve9se1ub3',1583921771,'','172.18.0.2'),('h11bcbp06an0agv96vobtbk3fg',1583931107,'','172.18.0.2'),('h1d3ms0d3r0pu3p686pieis896',1583921800,'','172.18.0.2'),('h1qk2ah1ben17775a4954s5a68',1588945929,'','172.18.0.5'),('h2ne717g0j971389rsnbnb1q99',1583930296,'','172.18.0.2'),('h2v03qmlbqfbit92dpih4s0bmq',1588945960,'','172.18.0.5'),('h3mlfq14bacn8m3ruuhl7kagoa',1583931111,'','172.18.0.2'),('h626n7oaj41ua9glk65gbbcs16',1583921695,'','172.18.0.2'),('h6frqikgvpdblbg51p63293aj5',1583931913,'','172.18.0.2'),('h76oj63v27h8lr1i0i93st6snl',1583931242,'','172.18.0.2'),('h7p6bpie47l68k0eedba3pm3gd',1583931447,'','172.18.0.2'),('h96bm75qg4m5bu0fq8jp8dcieh',1583925996,'','172.18.0.2'),('h9am765h68hrc9ichl0haffn19',1583931450,'','172.18.0.2'),('h9s6a2ffkrh19hcieu3650hfoq',1583931034,'','172.18.0.2'),('h9t7k3g4sucfjditqnvnb3pmu6',1583928420,'','172.18.0.2'),('h9uhrmqkj514s5q2php980873b',1583919489,'','172.18.0.2'),('ha962rt8mtk5onh15v8hgmbion',1583925993,'','172.18.0.2'),('hb48m9cq3ag260uh0rd1qu5sj3',1583931497,'','172.18.0.2'),('hbbcmd17nen1mmqt4o5n9e4uus',1583931282,'','172.18.0.2'),('hbeq84c0ac197m5hcc0ocgnmet',1583931015,'','172.18.0.2'),('hcpptgh9av04m6llf8645c677f',1583931279,'','172.18.0.2'),('hcu6s3u4g5rkldce0nr3psckg1',1583931500,'','172.18.0.2'),('hd4kfude5t8cm6ril2eol99qru',1583921774,'','172.18.0.2'),('hd8p9c7qdnhmr24uufvq8n2g76',1583931143,'','172.18.0.2'),('hdj2660c27qqgltn78te4mfvt7',1583928420,'','172.18.0.2'),('hdmgv7qbr34gl21emuj4cn5l88',1583928421,'','172.18.0.2'),('heajnapu2vpm4ctq7jd6fd86nv',1583931034,'','172.18.0.2'),('heibajqkpgnn4q7ig01q72ajrc',1583928420,'','172.18.0.2'),('hevqqd985s9ahtbdomfrar0gb8',1588945960,'','172.18.0.5'),('hfj4oinboeq5vt1th0fqoj5ooo',1583931279,'','172.18.0.2'),('hgajqtup25cqfburokda980jfp',1583931245,'','172.18.0.2'),('hgo4s5ltm2tf1ig7mvbhu5h1v4',1583931451,'','172.18.0.2'),('hitb1aandqva2djj6nev9kflek',1583931282,'','172.18.0.2'),('hjkqu11dnklik7emr24qgq3uv4',1583925994,'','172.18.0.2'),('hk3s1rd94n3gfin259807lpvb2',1583931108,'','172.18.0.2'),('hmdrnnkq0iccjkotqeiuafltlb',1583931979,'','172.18.0.2'),('hmn9rspgg0v3efpnrv33bb207l',1583921669,'','172.18.0.2'),('hmvc2t35oulljnim9ddl7j6huq',1583931910,'','172.18.0.2'),('hn7rivb630lfe01s07nvggtib4',1583931282,'','172.18.0.2'),('hooimea6st1srakv7ara95cr83',1583925961,'','172.18.0.2'),('hp8khg14e4g0pim7fqg4ohbtap',1583931140,'','172.18.0.2'),('hpl2gi1lug69v22437jkl27lc9',1583930274,'','172.18.0.2'),('hpv2m5vgbmutp42oo2dj0kb4th',1583931278,'','172.18.0.2'),('hqkoenb3qro5qlqdinvvkhu8c9',1583931031,'','172.18.0.2'),('hsbtt6iuph8ms0gsijvcjise58',1583928421,'','172.18.0.2'),('htose36f7t0591h0flqsa8iib1',1583925961,'','172.18.0.2'),('hu3pv7vra0jgab3966ug3jokvs',1583931279,'','172.18.0.2'),('huf11i33kmj9f7a77ilelrf2d0',1583931447,'','172.18.0.2'),('huobf6u9savofkqb9j65haal4f',1583930274,'','172.18.0.2'),('hv0d05lfit1k6gvhkh3cs6i2ti',1588945961,'','172.18.0.5'),('i12jnj703o30sbec21qeh6um26',1583931283,'','172.18.0.2'),('i15auton4ena0reh2n9teffim8',1588945929,'','172.18.0.5'),('i33febf9qikmsib5gtanp4q2b2',1583931111,'','172.18.0.2'),('i3apv8oqakgk9dtnmq7kjasfqq',1588945960,'','172.18.0.5'),('i3pvs8qgh2rb0bfa6vl713l9q6',1588945961,'','172.18.0.5'),('i5065lionkgfo0beh99rq0obil',1583931913,'','172.18.0.2'),('i54vg71fb4osmoamb4cp4gm76b',1583921771,'','172.18.0.2'),('i5fv4uivthgd27rhuoqa4lommr',1583922301,'','172.18.0.2'),('i5jdg95tunbim26bf5e024kj6t',1583921771,'','172.18.0.2'),('i6b66vqoqimmc73f768jvh9hgs',1583922304,'','172.18.0.2'),('i7dn0sjee1fadmlatdueeervap',1583926011,'','172.18.0.2'),('i80bdkenoq2vp4k3086dbu2n7t',1583931913,'','172.18.0.2'),('i81177af6q8j0bt4rab5ihlgk3',1588945928,'','172.18.0.5'),('i8asinc2sak1506agpf3hs5ac4',1583931144,'','172.18.0.2'),('iali99l9v76eqjf4v34g6ftb5h',1583931914,'','172.18.0.2'),('ibr5a0gmakji7i29co5l9um7s1',1583921801,'','172.18.0.2'),('ida8u5b75em6pq9kak1eapq5at',1583931497,'','172.18.0.2'),('ideb5hm7eq50epgahc6g4ja0o0',1583931976,'','172.18.0.2'),('idlp6h7akfk3f9e6hra1jtkoe4',1583931500,'','172.18.0.2'),('ieg9bp6tpqd61ep49taqgc25pt',1588945961,'','172.18.0.5'),('ieoilkc9173vinm7t657hrg4a3',1583931140,'','172.18.0.2'),('ig8fhlf1n8h6cj6kttvv5qcfel',1583931913,'','172.18.0.2'),('igg2c2oki4veo28gkfeg5b9u36',1583931978,'','172.18.0.2'),('ignhf3v1p8cn2muaophrdffbpu',1583925996,'','172.18.0.2'),('ihfpbg4vc5p4tnt1khqvvmse80',1583925959,'','172.18.0.2'),('ihhgk1ttb5n22kiuum10ecoh2f',1583931497,'','172.18.0.2'),('ii0lck4ma2vgrkf38p9dgbsne6',1583931279,'','172.18.0.2'),('iji7l32u57ur4iq1uomvnh7tmb',1583931015,'','172.18.0.2'),('ijm8msmegbbst43q6lvidso3hu',1583931975,'','172.18.0.2'),('il2o4p02gcdi1c72lftvan7pu2',1588945929,'','172.18.0.5'),('im8amfqcjj91dn0jf5oscvdatm',1583931278,'','172.18.0.2'),('imdfh3fqcjhhosa4l31rtc88k2',1583919493,'','172.18.0.2'),('in3katmp1i8mt2d54rci5e7rvk',1583921670,'','172.18.0.2'),('inq8mm9fco7n9f65ked914tqp0',1583921695,'','172.18.0.2'),('intbp7sftb1hor86akjqk356ct',1583926014,'','172.18.0.2'),('io3utlca71toqgtukvo9jqau8q',1583931245,'','172.18.0.2'),('iod3smft5442deh1h76qkek2pj',1583930274,'','172.18.0.2'),('ip0f64fvc60uh9i570v0lt9e6o',1583931144,'','172.18.0.2'),('ipmjud515q3iqseone9ps5r26d',1583921672,'','172.18.0.2'),('ippc350nf9e7n87sohtas22ggs',1583921695,'','172.18.0.2'),('iqqj1km8v3sjrtilehm94o4ghk',1583931279,'','172.18.0.2'),('ir45aslh2hn9aj73vop7gcfd01',1583921774,'','172.18.0.2'),('ir8ftq06ddu22mb02rttjorkcf',1583921672,'','172.18.0.2'),('irfgfcnsvv1e2e0ga3f0rm99of',1583931034,'','172.18.0.2'),('iro2uldifr465pj0kd8qg026bu',1583921797,'','172.18.0.2'),('itcbi4su2mcneqho7lpjgej2v5',1583931975,'','172.18.0.2'),('itrvk7vqomhtgmmobc818ekgci',1583930274,'','172.18.0.2'),('itve9rbmoe3oauts973ksr4kog',1588945960,'','172.18.0.5'),('iub5vq7o4kid0t65a8482n1jp1',1583931140,'','172.18.0.2'),('iut7cd7eqrtvu9811g1ui59qit',1583931279,'','172.18.0.2'),('iv3107oj1kcqo2qdbeck2fk5jq',1583931245,'','172.18.0.2'),('ivi0paakku1fbnt7e31subl8fv',1583926011,'','172.18.0.2'),('ivq6ckjvpp1phqntktogplbks7',1583921771,'','172.18.0.2'),('ivrhojfknm2tpi2ftt5of2sokf',1583931976,'','172.18.0.2'),('j06pej4crb7bekc4va1qd9e01t',1583931242,'','172.18.0.2'),('j11aqo16pdgk9u128n9in7097a',1583931110,'','172.18.0.2'),('j128tia37r4lmojspe3rahhvb8',1583926011,'','172.18.0.2'),('j1akuenp8pkfig2tdkj655p1ha',1583925961,'','172.18.0.2'),('j2a0ng9pg1hve5n8j2o5sknfjg',1583931143,'','172.18.0.2'),('j2t9aqh31lolu3u52m00gpl7n4',1583931497,'','172.18.0.2'),('j323kjg2m65du001rbaenki4en',1583931450,'','172.18.0.2'),('j451ibgv7o1iosb8s2fliqb63i',1588945928,'','172.18.0.5'),('j46cn3429sqokl9l0jlmhp7b6f',1583931910,'','172.18.0.2'),('j4i35e0qav04j9etjq4serq8a1',1583926011,'','172.18.0.2'),('j6jqrd5e8kut4tk5ikqiuqb6mc',1583928423,'','172.18.0.2'),('j6p7tfh174dmhbrn5pm1caiih7',1583931500,'','172.18.0.2'),('j7s1eba7j3krjseqsfn7pmovc5',1583925997,'','172.18.0.2'),('j86j81ri53olfm04i4f1kshlt4',1583921800,'','172.18.0.2'),('j8hqkenggoghfqnjugm2tq78op',1583921798,'','172.18.0.2'),('j8t2innl90g0ksrgp6jmpb8lql',1583921774,'','172.18.0.2'),('j94bnobogmkgukobhaih89prqr',1583931500,'','172.18.0.2'),('jabo02og9u28n67rot5heuue88',1583931447,'','172.18.0.2'),('jae18ifomttfndqelmfkqv8g7k',1583931246,'','172.18.0.2'),('japog96c46v3c90c2grl9jbrj9',1588945960,'','172.18.0.5'),('jbavrf6hgeb3acvdis4vqk26g9',1583931497,'','172.18.0.2'),('jbr6q4hkvvum9kqbmsd17v64j9',1583931140,'','172.18.0.2'),('jbt3o9n8saqf4qt1sdf2vevpl1',1583931144,'','172.18.0.2'),('jc1c1534rplh02sb9p50ugtv8j',1583931975,'','172.18.0.2'),('jd8la88u6eubjotmvhl1g34i9g',1583931144,'','172.18.0.2'),('je2hvv2516d9g3faieebes8aot',1583931107,'','172.18.0.2'),('jeiaf48rj233eg9530u65boe73',1583931242,'','172.18.0.2'),('jejkpdn6cq0liqhnhalqbq64vd',1588945929,'','172.18.0.5'),('jem5eikdegd5260a8pb4ct13rr',1588945961,'','172.18.0.5'),('jfn761c71uorb9197g9d77huj2',1583931910,'','172.18.0.2'),('jg2jkkkhlrmldise5fml557598',1583921695,'','172.18.0.2'),('jhhgice8qg0mjdgdqmkpoh4di4',1588945961,'','172.18.0.5'),('ji8em31b609k28abtlu58aqegj',1583931500,'','172.18.0.2'),('jib444mk0em0gbvb43lavj87p8',1583930296,'','172.18.0.2'),('jieni1a199g4941si2td6976ng',1583925958,'','172.18.0.2'),('jise2a3nnlqjejbqq1bl5n3og5',1583921698,'','172.18.0.2'),('jj5dtrgm43kv3kqiv5sbnk25s7',1583931496,'','172.18.0.2'),('jjdq585v53l8bpm8lt225ejc6t',1588945960,'','172.18.0.5'),('jjn30d7ek0ihb3upiesv9s4r8i',1583930230,'','172.18.0.2'),('jlmdktc07ga5dn3ikii8o8disn',1583931448,'','172.18.0.2'),('jm30tr5piv33iudlq4kac7c543',1583921696,'','172.18.0.2'),('jmg9sgm62qebckr7jgsjialce6',1588945929,'','172.18.0.5'),('jmmg0m5nu1h1oik80k9eotrra0',1583931451,'','172.18.0.2'),('jn3vk2qk1ggajm4emkmu3v18of',1583921800,'','172.18.0.2'),('jnj9pb356hpeblgaskjr74uckt',1583925961,'','172.18.0.2'),('jo6jjcg5v2ln6u4v72ofbd8g8j',1583931447,'','172.18.0.2'),('jpgjuvkn97adhk5891vu88in70',1588945928,'','172.18.0.5'),('jpq97erk4qa0194hfjp5g11qjv',1583931497,'','172.18.0.2'),('jqig3hbdlrbptuftgfm7k9ses8',1583921669,'','172.18.0.2'),('jtbe8a30q8f1r52p1mik96tc42',1588945928,'','172.18.0.5'),('jue3d9c7t6ekar7c9gd4fdn02o',1583931500,'','172.18.0.2'),('jup1e4pk5g58mua5pgj1j1pd15',1583922301,'','172.18.0.2'),('juuqihb8kaaujcrf8ehi9pqtqe',1583931975,'','172.18.0.2'),('jvhk06dt08msnb2rtm6b116sgb',1583925996,'','172.18.0.2'),('jvqfjejt7sp67g4fodo2ajt07b',1583931910,'','172.18.0.2'),('k04pnp83uv81vv55i2kga3innd',1583931242,'','172.18.0.2'),('k1vv8bpe1ui2saefggsrqjq4pk',1583931447,'','172.18.0.2'),('k20dv1nqrqjrmafd6c6i9nf335',1583931033,'','172.18.0.2'),('k25m2tmch2ome6jd9fvmt4u9a6',1583931451,'','172.18.0.2'),('k2cnprmdmks6ncpf7e8sip1k4g',1583926011,'','172.18.0.2'),('k2dp0n3vcg4f56f8iil4eo3grc',1583921797,'','172.18.0.2'),('k2hc972tqj85v0e9cv7f7m3djk',1583931978,'','172.18.0.2'),('k2qmutkm2n1clm3j68lheb75bk',1583921669,'','172.18.0.2'),('k4bp89udh5trq62t52isp2pa71',1583931282,'','172.18.0.2'),('k4tllv6mgnetkiofvr6kmq56bc',1583922301,'','172.18.0.2'),('k5tfcntnr5pparsl8b74mj8v8c',1583931034,'','172.18.0.2'),('k8n59rfk6j8hjenspiln6l4ab3',1583921696,'','172.18.0.2'),('k8q5r9ns2pe90okiugr1kganqn',1583931283,'','172.18.0.2'),('k9hdmhtnmc2tf60gh5i0nv69sh',1583919489,'','172.18.0.2'),('kateett34b69btuhc619uhnevk',1583931034,'','172.18.0.2'),('kb2h2mch3u77nbeberlkqpkkaj',1583925994,'','172.18.0.2'),('kb8ccho829oblad7q7t771sesm',1583931111,'','172.18.0.2'),('kck36mrgv19rgqjlh98o3744kn',1583931031,'','172.18.0.2'),('kcukbrcngvok8t50a3ki13uhf6',1583930274,'','172.18.0.2'),('kf4kvoo025ll37rc06sqv1etad',1588945960,'','172.18.0.5'),('kfhq916d04ntiogrr0rt59bln5',1583925996,'','172.18.0.2'),('kfot1rt7kej2na7u6gsni1l6vv',1588945928,'','172.18.0.5'),('kgi6cvkpnugufus8mqakrilid4',1583931451,'','172.18.0.2'),('kgiteuuluenhcvc7okatqn9isp',1583931031,'','172.18.0.2'),('khbgmjp2p41ljjifcte69t4qjk',1583931447,'','172.18.0.2'),('khevvkc36qd8g8bfob2ufvm4g3',1583931034,'','172.18.0.2'),('khgd5c9osjosl470elv8qqmf83',1583931282,'','172.18.0.2'),('kifkaq01hafpuqsmr7f8vpiuds',1583931108,'','172.18.0.2'),('kk5n9j1j97kq1raisud8ei11mh',1583931499,'','172.18.0.2'),('kk6r8kknplv1jiu2sdsfne8dmo',1583928424,'','172.18.0.2'),('kka4h493psohpc41lh96k956sr',1583925961,'','172.18.0.2'),('kki662o06iu7no48779hd7u8gj',1583919488,'','172.18.0.2'),('kl1feanrmfmuk4dd8te4os899s',1588945961,'','172.18.0.5'),('kl34dlfpn36bjidp5qpdbruotd',1583931500,'','172.18.0.2'),('kn58u9ucu871q74de38ddu4v7o',1583931282,'','172.18.0.2'),('kn8bs8sb0c8veoc6v7ri47ljl8',1588945929,'','172.18.0.5'),('kneoj6gf9hv0k529ah02m7vrf1',1583930296,'','172.18.0.2'),('ko562l16s5rb14ou6mmdop9cpg',1583922301,'','172.18.0.2'),('kob2oghups3inrsjfbfbadi9jb',1583926014,'','172.18.0.2'),('kqcegrlqv17jdabro7i0p837bn',1583931245,'','172.18.0.2'),('kqtb2v1lanrmaeo8bfp2ah5c8s',1583931913,'','172.18.0.2'),('kroj3fvibkv1i31i902ruierso',1583921797,'','172.18.0.2'),('kssdiv2mrqrq370h5f5ua8vq6r',1583931910,'','172.18.0.2'),('ksv6tdb4jpj7a49lt5dd2d8ibg',1583928423,'','172.18.0.2'),('ktdiofvc0r8le3qs1qq1pmdiun',1583919490,'','172.18.0.2'),('kucb98le0s0fuduinlfcmlieae',1583922304,'','172.18.0.2'),('kv0qrgb1s95sj4uq0gdeiuvumo',1583931496,'','172.18.0.2'),('kvtoung59d6go764dn6vjv8a49',1583931910,'','172.18.0.2'),('l0d6dhftjgnm7bsc31e5mjk2r4',1583931033,'','172.18.0.2'),('l1j1hb2tmvjvtevsjessssg546',1583921672,'','172.18.0.2'),('l1r0enjogsp1td47pv465lt46a',1583919493,'','172.18.0.2'),('l2a9oootmj32klvkdnn17p2d9o',1583921798,'','172.18.0.2'),('l2obcp42oe9pfv9dio781h67rf',1583922303,'','172.18.0.2'),('l3tavo834sdq29sqg25633uvc3',1583931499,'','172.18.0.2'),('l48ferndn34p6p0nfs453rb6ls',1583931980,'','172.18.0.2'),('l6d05bebh6gcb776rh9fbsprm8',1583921669,'','172.18.0.2'),('l7asoklpse83v6ljigr3j1sshg',1583931447,'','172.18.0.2'),('l7qlcof60qrr8over6vjm9gheb',1583931031,'','172.18.0.2'),('l7qo5d5ek8q2k9ngrjkq9kgal9',1583921698,'','172.18.0.2'),('l7s2v4bqumqedp1j1u35rk92r2',1583930229,'','172.18.0.2'),('l83mlv64ct4pd34is08p6hjd1q',1583928421,'','172.18.0.2'),('l85s9fnm4812v04adkfijoes22',1583925958,'','172.18.0.2'),('l8lmfnuq90pg43prrjlesudjqu',1583921698,'','172.18.0.2'),('l96b8rgckrnt686gcm2sc49ffp',1583921800,'','172.18.0.2'),('lahps1toegf5f6f0l9stmehphi',1583922303,'','172.18.0.2'),('lal7hgasr9qs3af2g7cjuvvvou',1583931107,'','172.18.0.2'),('lbdj57jbt38cilpkmli1nq6lv6',1583931910,'','172.18.0.2'),('lbe2ge8npm1fiisc3bm92ra4ab',1588945960,'','172.18.0.5'),('lbmgtqh9loupfl45kuam5ovfjd',1583930296,'','172.18.0.2'),('lbsjqmhl9kmb7tuqsc8j1cj22j',1583931910,'','172.18.0.2'),('lc4uijrn8g91ioc32dusmldi6u',1583931913,'','172.18.0.2'),('ld01udoash9n3jnaar9f0mmscv',1583931279,'','172.18.0.2'),('ldsu8274l5uj5f30m6qsmt47k2',1583931108,'','172.18.0.2'),('le2smmvpntonklggtijiqsugaq',1583921669,'','172.18.0.2'),('leci71ak4ots718sp8t2b6emdt',1583921669,'','172.18.0.2'),('levd5njvr2971svl3u0j8kju34',1583931448,'','172.18.0.2'),('lflap4er5puf7j3t273c2hj68m',1583931451,'','172.18.0.2'),('lge14vt8hmjafkvgpdkf4avnmc',1583931500,'','172.18.0.2'),('lh4mih0nvgjal0l2qithvv1uce',1583921669,'','172.18.0.2'),('lh7qp0q1ogro69iq03vr808mg6',1583925994,'','172.18.0.2'),('lhf81os3t9e4061ofaspvr0087',1583921773,'','172.18.0.2'),('liq9sjs98qjuj4ue2g2b6hjtl1',1583921774,'','172.18.0.2'),('liv5k2mbrcmf5clomrajh5kin3',1583921797,'','172.18.0.2'),('lkep9s8jek7q9hbqvfl5aeen4r',1583931975,'','172.18.0.2'),('lkjb5a7onl28tcpeo8va0pleg5',1583922301,'','172.18.0.2'),('lkjln847mi97607uljfn3f93po',1583921801,'','172.18.0.2'),('lkvg5senifofve9i569tf0prjh',1583931111,'','172.18.0.2'),('lls9gv9cnfoc88bd5fd7ds8bot',1583931246,'','172.18.0.2'),('llvmb5901ccrr68nnrtr6tpk93',1583926011,'','172.18.0.2'),('lm45et5khbj6gkcp78vduopmgl',1583931144,'','172.18.0.2'),('lql467ld09rt6edgv9bbr78oid',1583921797,'','172.18.0.2'),('lqubccvhptdmd5t4rm5ledfb4r',1583930274,'','172.18.0.2'),('lrc715720cm92lok0ridoeffrd',1583931279,'','172.18.0.2'),('lrsec0td4oj4aj0flal1teupkl',1583925958,'','172.18.0.2'),('ls92gsm1a8vi8f2larfilje594',1583926014,'','172.18.0.2'),('ltnfcc6afi77pt6juj1li2l5gt',1583921672,'','172.18.0.2'),('ltu5eiee0sp8hlbi02eks3uqlg',1583931976,'','172.18.0.2'),('lu1eabic72rbd5c7go6uhl0sen',1583921774,'','172.18.0.2'),('lu4cr5spabqle6b0los5cmt4td',1583931979,'','172.18.0.2'),('lu668m57oi88bau2ljtd2gshtf',1583931107,'','172.18.0.2'),('lv1sjce92orslvut3eb9djecsa',1583921797,'','172.18.0.2'),('lv513ie3tpk4ffsnbec5fns32u',1583925958,'','172.18.0.2'),('m0rkhkv8dqbgpblk3rlfdkpoid',1583931500,'','172.18.0.2'),('m1uae91gmtroa978ii8dgttlck',1583931910,'','172.18.0.2'),('m433vegl2ficmurldoa8tufhno',1583926014,'','172.18.0.2'),('m4el7i8mlosdmdj5466m23k5l7',1583928420,'','172.18.0.2'),('m6rkeo6ajgm057n3653brotvu1',1583930274,'','172.18.0.2'),('m7d56a498c7t8d1o3ao3ba2680',1583931246,'','172.18.0.2'),('m7vec89a90t0icirl307bicfdc',1583925959,'','172.18.0.2'),('m7vtam14ftae5ddbeap79jl8at',1583931450,'','172.18.0.2'),('m84b2b6nmcdigsgttjl25gfaqn',1583931976,'','172.18.0.2'),('m85fvlddp0hkah2blieivmv3pt',1583921797,'','172.18.0.2'),('m9m7b0f8if4kaib7247eisa9ld',1583926011,'','172.18.0.2'),('m9ne1e8u3uvf82lh3ph2k4a6d2',1583921800,'','172.18.0.2'),('maaeh5l6156cfp2h75n9kp4cin',1583930229,'','172.18.0.2'),('maj8jofer2arr4a3tgi0e9p6qd',1583931976,'','172.18.0.2'),('mbfegba35irqod2vu8fbdbtkts',1583931447,'','172.18.0.2'),('mbfvjht0piv8vhuur4j67et954',1583931282,'','172.18.0.2'),('mbplqasncnqd3t1jgogn4n8lr3',1583919493,'','172.18.0.2'),('mbr9lm3br3de9omvf8uovg8f9l',1583931450,'','172.18.0.2'),('mfa7hr590cl0s4pk92hdqsd0li',1583931279,'','172.18.0.2'),('mfja8cg4s5cu1bhbi3ffptv1ko',1583921801,'','172.18.0.2'),('mhsuiod89nuaj7bo8ubleioo5m',1583928420,'','172.18.0.2'),('mht0cqcpf7e57u98umg4js4e8m',1588945928,'','172.18.0.5'),('miejlvkijq829v2tfmd87ihho5',1588945928,'','172.18.0.5'),('miobojh05q8dm510ucnv7ii7er',1583921798,'','172.18.0.2'),('mj65gec0oteoqnsj2qn4feon0a',1583931910,'','172.18.0.2'),('mjtjb555pnam5mopq02ot3r118',1583931242,'','172.18.0.2'),('mk7tvp9kqprots9fqogd9lp68c',1583921698,'','172.18.0.2'),('mka33gmat9t0anth26816sbogc',1583931033,'','172.18.0.2'),('mkjuqf22iddhqb0nmi4vfcnl56',1583930230,'','172.18.0.2'),('mkkagdngo119h6342au9b8e69j',1583921798,'','172.18.0.2'),('mldpn10tv1r258ltt2u84u7nlf',1583921672,'','172.18.0.2'),('mllibgj34s2kea1vgg29a7b666',1583931279,'','172.18.0.2'),('mme17nmjomh2o8mot1dl21000u',1588945928,'','172.18.0.5'),('mmf7s83avbf9ob0831fgdgrpjh',1583931143,'','172.18.0.2'),('mmom1in83stme3due17h5106qj',1583931140,'','172.18.0.2'),('mns1kag8ogd8un3beuhv28t3qv',1583931245,'','172.18.0.2'),('mo831vn5jvvsoebppscf41hott',1583931034,'','172.18.0.2'),('moq073r56ef4pn21tm6hbgcgut',1583931913,'','172.18.0.2'),('mpbppddrihtt7epcrc135cqu49',1588945960,'','172.18.0.5'),('mr2kd7g9p1orrqfjha195egecv',1583931980,'','172.18.0.2'),('mr3kjbtcjfckb48t8i7br9c8lj',1588945960,'','172.18.0.5'),('msh5ggbhpmlnqlq6pcu9l0ll87',1583921670,'','172.18.0.2'),('mt6bo29e76vc7mihm8lgbu6sf4',1583931243,'','172.18.0.2'),('mtautshh4r77095ii8adhi1rpe',1583931913,'','172.18.0.2'),('mtc2gak7p4iqtgprq7em5akhm5',1583931500,'','172.18.0.2'),('mtkhbj6or2kq9trdeinqh1nedv',1583931448,'','172.18.0.2'),('mtmac1shq4fr2vnumcnpjs8rr1',1583928423,'','172.18.0.2'),('mupom9vcv7p34ehsvd944293kb',1583922301,'','172.18.0.2'),('mut8brhc0p3ite27utgf1o6vn9',1583931451,'','172.18.0.2'),('n2dm562ofa0dfbqnepcbo4i3nt',1583931140,'','172.18.0.2'),('n3520pvv0ihrsb2tbsdfascqqc',1588945959,'','172.18.0.5'),('n3qgihsj5hfrtrvr53pbhrjvf5',1583931015,'','172.18.0.2'),('n5bs0db7194uvrvdl2mijv0i5h',1583921672,'','172.18.0.2'),('n72mlher259vu7bghkuaibnv2c',1583925996,'','172.18.0.2'),('n8hcou8j9p88teeibchi76i6s2',1583931242,'','172.18.0.2'),('n8odon75353f9n54efhucefnp9',1583931910,'','172.18.0.2'),('n8splppfa3njtpl0lfm0tuqro6',1583931107,'','172.18.0.2'),('n97um0jjkvf2addc3m7q3td11c',1583921771,'','172.18.0.2'),('n9a408dlpljhgn46erfrtb5dfp',1583921774,'','172.18.0.2'),('nami995h9q5eeap4bcu3o92l84',1583925994,'','172.18.0.2'),('nb04pv47etv8e0p0hq0j26rrbj',1583921669,'','172.18.0.2'),('nbtc5feo35l74g2utgkbfm0meg',1583921800,'','172.18.0.2'),('nc6ptijrl6std13u16bqpbu19c',1588945929,'','172.18.0.5'),('ndh20kjrvvqr98hocf009am3ln',1583922301,'','172.18.0.2'),('ne1h0vc65e18lf0gadbkhpl2mv',1583930230,'','172.18.0.2'),('nf2qkkvinf2hmqipnqpo9tnqgt',1583931979,'','172.18.0.2'),('nfho8v1i37k1t40293puok2h90',1583925961,'','172.18.0.2'),('ngjmfofcpjvvq42otq5vphanlm',1583931914,'','172.18.0.2'),('ngr8o65mvil6o215v0jm7rm3a3',1583931913,'','172.18.0.2'),('nijeaefk55h5ptn0d41p763tt8',1583926013,'','172.18.0.2'),('nj2f2d4luj77gcr08ioietgjq7',1583921669,'','172.18.0.2'),('nj6jlmbr7v3gmlp21nf2bjjihd',1583931910,'','172.18.0.2'),('njeandpo41a1k2p3l225h21ap7',1583931975,'','172.18.0.2'),('njmqumae101s17eajpn27ugi8j',1583931030,'','172.18.0.2'),('nkb8ssmtl23sscsfdouo6d7nh9',1583928420,'','172.18.0.2'),('nkspmsloo6j6496dmas76vm5bj',1583931108,'','172.18.0.2'),('nl5kotsn4hue79t9j989ccjl8p',1583931979,'','172.18.0.2'),('nlobbbdrhqj36d361oe8pkqeae',1583931143,'','172.18.0.2'),('nmrd1a0in5up5qnpjhdtrf6i7m',1583931978,'','172.18.0.2'),('no6n8b2n1q76b3vjdf5csbeh8j',1583931497,'','172.18.0.2'),('nohvgcuo3749gtd2qi9j61l2ec',1583919492,'','172.18.0.2'),('nojgh3d5v9goucnk4u1dggie2v',1583919493,'','172.18.0.2'),('np50tku3fm5amo5popj8fdgasn',1588945929,'','172.18.0.5'),('np5o5f9gv867912i8n8a632tv1',1583931497,'','172.18.0.2'),('np7ud2jkha9kquf1n32m9hfkvk',1583931031,'','172.18.0.2'),('nqdvqohqb6cje40k3nvvc3pie3',1583931143,'','172.18.0.2'),('nqjf142h2pg0qekjnog7ii354g',1583925961,'','172.18.0.2'),('nqs50j4pvshtna5c62rl8cc2dq',1583926014,'','172.18.0.2'),('nqv0789m9olcdi1ub4m8hqgqok',1583925961,'','172.18.0.2'),('nrabjvciv49nd7hem7nalgm15p',1583921695,'','172.18.0.2'),('nrn070bis6s7bof81bkuvub4s6',1583931448,'','172.18.0.2'),('nruuvggbn2cqha8p7vlmhfge7l',1583921672,'','172.18.0.2'),('ns1viedldbadbl7j4kq2fhpb38',1583931283,'','172.18.0.2'),('nscra5krbvb4cnvv4u9dgm374u',1583931107,'','172.18.0.2'),('nskr8t4sc39nhqlom64iofhmu3',1583928423,'','172.18.0.2'),('nssjram8sfdh1ic2a561lkpm7i',1583921797,'','172.18.0.2'),('nsus5a1egaurr3atgqea23kmd6',1583921672,'','172.18.0.2'),('ntd1ri5j69i3lnmj570fstmun7',1583931913,'','172.18.0.2'),('ntri3om1aacim21jg49qh7fh2k',1583919493,'','172.18.0.2'),('nuid8ivr261q20ms0n29icrqs8',1583931107,'','172.18.0.2'),('nvefvs0bfai66lqgd7i3anpc8v',1583931242,'','172.18.0.2'),('o03to9fafcb2dqk38foq2jbhtr',1583921698,'','172.18.0.2'),('o0k98uves4ft4ukoe2k0o25o5i',1583931110,'','172.18.0.2'),('o0nio99l66soapv6n1q9crdssp',1583931451,'','172.18.0.2'),('o1f3kpsb3i4f9ljufipmuk070c',1583925958,'','172.18.0.2'),('o1taob2il1q7nbfh8durhvuuat',1583931034,'','172.18.0.2'),('o2sscnsaflsgi8nsie6j4csd74',1583930296,'','172.18.0.2'),('o3ec3ll8b0utulgfem5qaej25r',1583931913,'','172.18.0.2'),('o3j114tsdqu3t0i3lrp849p618',1583931279,'','172.18.0.2'),('o3k2n4h95vk47sqadsnq6b1k4g',1583931496,'','172.18.0.2'),('o44f6bc650gvgs45pvfeidotnp',1588945928,'','172.18.0.5'),('o546h144ec73cdfchfp8r09mvn',1583931910,'','172.18.0.2'),('o6c4s20j7gcabl0u0ulft7jkrr',1583931245,'','172.18.0.2'),('o7ecgkhoa0j4tafgvbbrnk1j85',1583928423,'','172.18.0.2'),('o7nfs688f72rddq18gvhmgmoee',1588945960,'','172.18.0.5'),('o873vl9dafitshm9voijkt2pt1',1583926011,'','172.18.0.2'),('o8f511mkmth1kbag4jd1dfp8cc',1583931500,'','172.18.0.2'),('o8ugcv9pn5f7arcf2a3mp1b8cu',1583931245,'','172.18.0.2'),('o91eje9481oll84nd84h8drjq6',1583931913,'','172.18.0.2'),('o93nsdek719mj0m1uatdbhqdme',1583931500,'','172.18.0.2'),('o9n4ke89k09j7bisje64leh9qv',1583925996,'','172.18.0.2'),('oaibqt2ki25iadrddclec22lf6',1583921695,'','172.18.0.2'),('oaolnjlnkg8a9of67ar39konjc',1583931976,'','172.18.0.2'),('ob43tpu6j14iu4epr9qtc7avqd',1583922301,'','172.18.0.2'),('obi53bebs4neubl5gjb6306fas',1583925997,'','172.18.0.2'),('ocltqjtm5bk8gi76lnqv7lpfsp',1583931451,'','172.18.0.2'),('ocnppu97176k0ia3oalocnbm1c',1583922303,'','172.18.0.2'),('ocs2u9n3ujimg4qfickl9uj3il',1583931242,'','172.18.0.2'),('of4for4bfme9b9ui2l56ocf59a',1583931910,'','172.18.0.2'),('ofjvk4d3hqbna10bu0be0d311o',1583931447,'','172.18.0.2'),('oge1e8d7co6nvahtkjnnh78787',1583921698,'','172.18.0.2'),('ogmt5p9u4oeljv1rqb1mv5c137',1583921669,'','172.18.0.2'),('oh4mfotqjc59gsjclear4qbk5c',1588945961,'','172.18.0.5'),('oimubsmkukk8gs4p2lk59glrff',1583919488,'','172.18.0.2'),('oj83j3jjifgduagakksbsi8plh',1583931451,'','172.18.0.2'),('okkgvsgeq809o57el23jg91pgt',1583919493,'','172.18.0.2'),('oksr7h2aqdn25l9dmg0a24d8l0',1583931450,'','172.18.0.2'),('ome2l184fogk51oad93dk7lbar',1583931140,'','172.18.0.2'),('omeom2j017lmea2u3n62ub80v4',1583931144,'','172.18.0.2'),('omf41ck47ljvrrs0bv9t6fmnvh',1583930274,'','172.18.0.2'),('onjt39sdr2kips4bnnv28u2tdv',1583931450,'','172.18.0.2'),('ontko5cbo2kfqa27hnigqhl14e',1583931910,'','172.18.0.2'),('ooam91gijeoksvupi9dmvpmtif',1583921698,'','172.18.0.2'),('oohfn93jkf09kkvp8ropvc2gc7',1583931279,'','172.18.0.2'),('op0ek72aouva60hkr18hgk0upu',1583931910,'','172.18.0.2'),('opklmer5pme01q5b4a7n3tmirt',1588945960,'','172.18.0.5'),('oq0ou3imehd34ir7d7bficf9lm',1583931110,'','172.18.0.2'),('oq92c0i5aabb4mpc2ia0da2oc2',1583925961,'','172.18.0.2'),('oqfe4hofeodue1in47klg1jhi8',1583931975,'','172.18.0.2'),('oqgrhi0dbk6dpb19mn2mc9qei5',1583921698,'','172.18.0.2'),('oqgtjnfq0tcivej2vjub62u9df',1583921800,'','172.18.0.2'),('oqu20ot9lsnai1qtmn5pvtnc8n',1583931279,'','172.18.0.2'),('or1qs4imqh4ica53va856cnsk9',1583931143,'','172.18.0.2'),('or9tkob8nbr359ak4n39ehq932',1583928423,'','172.18.0.2'),('orb10t3eo48l59pa7qefja9ef1',1583921771,'','172.18.0.2'),('orlubr09uu7o6q5fo82k3a9hrl',1583919489,'','172.18.0.2'),('orupmnmbab8ng7qo9c64jco0iv',1583930274,'','172.18.0.2'),('ososadq58qqaf24d02i2b10a7t',1583931279,'','172.18.0.2'),('otheprfs7h9pjs8aa02btlsr46',1583931139,'','172.18.0.2'),('otl0s0lkmq4jfkvg4mb95iup1s',1583931282,'','172.18.0.2'),('ou7iipuim4qjbb3sndh4qaekub',1583921774,'','172.18.0.2'),('oucsuk0pr2qm3qeqa4vgadnph8',1583931015,'','172.18.0.2'),('oufolsautde0fgaveoqsg7ire9',1583931976,'','172.18.0.2'),('ov2urk5h6dpjbm3tlc3r7abla5',1583921774,'','172.18.0.2'),('ovhdkhm2skvddng8edqcs8pv8q',1583931975,'','172.18.0.2'),('ovrl9v3slasabanu2p834294ep',1583931242,'','172.18.0.2'),('p12s7jbdj4st8i0eae6hd9ab1m',1583919490,'','172.18.0.2'),('p1jbg57i6uc07a1sjk2i7thkhj',1583931910,'','172.18.0.2'),('p4e2ps7ju18rv0flo7dbif28il',1583921798,'','172.18.0.2'),('p595p773qmc4c7h1f5pgtrueq4',1583925994,'','172.18.0.2'),('p5d0r00upbipprmig7lfnm1fl4',1583931242,'','172.18.0.2'),('p5fnv2obvs09lhfd7f3nuln8gt',1583931979,'','172.18.0.2'),('p5pcnfc8b0eelb4vjhotlb6si5',1583931110,'','172.18.0.2'),('p5r2c10etn1qdljjsu2sdh20s9',1583931500,'','172.18.0.2'),('p77pui0360jkbf150qfsqhljo5',1583919493,'','172.18.0.2'),('p7jt3uicnbrlk3cgffa258aj0e',1583925958,'','172.18.0.2'),('p8dpnj8spvmf4ato55qjmn3oaj',1583922304,'','172.18.0.2'),('p955pakkc6rih65dil33p0bl4g',1583928421,'','172.18.0.2'),('pc5nksshjojhqb65pehve6d2te',1583928423,'','172.18.0.2'),('pcam8mv3lgq7aiuuscgm22upbo',1583930274,'','172.18.0.2'),('pctras8c9v3r61j74a3pva4eau',1583931108,'','172.18.0.2'),('pd4fohtao24p4i4791r7g1v699',1583931282,'','172.18.0.2'),('pdon6kh8717n93njfcff5731qo',1583931140,'','172.18.0.2'),('pe1hmb9g0j736qv4ab2cs5ls6g',1583930296,'','172.18.0.2'),('pfkuhoehuf894sc1uet4486n2v',1583921773,'','172.18.0.2'),('phjs08k1s4o21keuo5gd326j7g',1583931143,'','172.18.0.2'),('pjd6n17hkluuem5llron9pp7jv',1583930296,'','172.18.0.2'),('pjt1hac1m5v8rmeshfaaomh74k',1588945929,'','172.18.0.5'),('pk73gs33a47dqcfo1t0k33ib1r',1583928423,'','172.18.0.2'),('pkb5n43q4afcq2avm3b77udfii',1583919493,'','172.18.0.2'),('pl4rrvu3hp6l7vjj5keaiddjn8',1583921797,'','172.18.0.2'),('pp4j55ulvchb5jto9rqofc563o',1583931144,'','172.18.0.2'),('pprohthd3q3pvku2j4bhqub97v',1583925994,'','172.18.0.2'),('pqc8nkke8sid8qj8brvoeoap6h',1583931979,'','172.18.0.2'),('pqcbksfuacf78mpaukih2bd3am',1583922301,'','172.18.0.2'),('pqlscs646ha5014nlojmbn95pc',1583921670,'','172.18.0.2'),('prd0jc35bnfv5888gh2uj2qa4t',1583931448,'','172.18.0.2'),('pruu50iulcpfl1ehml8ol9n1cu',1583931496,'','172.18.0.2'),('ps8kpt28dn1nvpqsi6eklb235e',1583925958,'','172.18.0.2'),('psghdikl8g0102mke8ehsb1ulu',1583930229,'','172.18.0.2'),('pu0v1jingddn09sa4g6v0tmnsh',1583919489,'','172.18.0.2'),('pu19v073u5q4to38gvq3tjguah',1583930230,'','172.18.0.2'),('pud69c523r63cpb6otabr7e60u',1583931447,'','172.18.0.2'),('pue08e0blbdcljq2g1bfn0d3ho',1583928423,'','172.18.0.2'),('pvvjubrctqriobcup46homnb8g',1583931979,'','172.18.0.2'),('q39i92ge9bv21etmtgc3d7j4l7',1583921771,'','172.18.0.2'),('q3k6626d3k8oll9kcjsbh2eknv',1583925961,'','172.18.0.2'),('q3pnpdusbu849e5c7u6q328hb6',1583931282,'','172.18.0.2'),('q4eb0elc320vjeeek8tg4esdhc',1583930230,'','172.18.0.2'),('q52bj9vv7iv0461ugpqd9f8fp8',1583921670,'','172.18.0.2'),('q5b8908e2avkibl405fct7ban4',1588945928,'','172.18.0.5'),('q65ps8u9l5993mdgskvsnfjg9v',1583931279,'','172.18.0.2'),('q6j2s6cqfeu1drdju9ov0tb930',1583919489,'','172.18.0.2'),('q83nm0d419qlq5j2jhc27q205a',1583919493,'','172.18.0.2'),('q84nagt4qgajgeccin087qvn6r',1583931279,'','172.18.0.2'),('q8dhmq77ov79pvsh3r3pb4ee5r',1583931496,'','172.18.0.2'),('q8ub8p5p0ffih4aap9cer00bc9',1583931913,'','172.18.0.2'),('q9di3vl32du8vbdsdk0ehq3l13',1583925997,'','172.18.0.2'),('q9jhak20ki4brvm19eq9d9uvgt',1583921672,'','172.18.0.2'),('q9ll52q6diotgmh00pti60ehil',1583931282,'','172.18.0.2'),('q9nlvtj8km2b39im0cg36rpeum',1583921672,'','172.18.0.2'),('qa66cfdtb842v8burmnk4gdhcf',1583931975,'','172.18.0.2'),('qa8vlita48j771m935pkpf7gsj',1583931282,'','172.18.0.2'),('qaekm1tk68ie6ss450ukr45s1a',1583926011,'','172.18.0.2'),('qb0n6ph7e2i5br1d2kupsv9n5e',1583928423,'','172.18.0.2'),('qc54q06l305ufekgrknqv2kn45',1583931031,'','172.18.0.2'),('qc8eaumgsfil04phhm8bhjgoao',1583921672,'','172.18.0.2'),('qcvva43nmhi2bflkk7pe8h8i5n',1583931246,'','172.18.0.2'),('qdahocfp90719hbmanbhdgmsle',1583931499,'','172.18.0.2'),('qddsso2v6g4a0lqa0569nqo2hf',1583930229,'','172.18.0.2'),('qdlclho0fgu5soi2b0e948pohk',1583931447,'','172.18.0.2'),('qdmtu661ekampbn5c23rd3q4vs',1583931499,'','172.18.0.2'),('qh6se03f6ibaqp62tkqq4v0rgh',1583930296,'','172.18.0.2'),('qi3b6cp657f3unq5so6tbaqf0f',1583931139,'','172.18.0.2'),('qitsvgmdjdd1k9cjfvdb6jqumn',1583926014,'','172.18.0.2'),('qjgqejoh12vtl53ma124eqgsik',1583931976,'','172.18.0.2'),('qji723qricfnb1g51f7u1njhn0',1583926011,'','172.18.0.2'),('qjiibuj0ciqg76irm0ht34irrq',1583931979,'','172.18.0.2'),('qjmb735oa2bjc3b7ptt13edemi',1583931242,'','172.18.0.2'),('qjpnhrb2a0kq0gj448rauj9epc',1583922301,'','172.18.0.2'),('qk2ilk0vqoum4c2t80opctngqu',1583926011,'','172.18.0.2'),('ql52a35fpu2dm3pqam9ilr3m8j',1588945929,'','172.18.0.5'),('qlgj7db4oo5akbje37r82tuhnv',1583931910,'','172.18.0.2'),('qm2ohvm9133a1lp03ld785gnpj',1583931034,'','172.18.0.2'),('qm33mbtifvp3v1c2nf40nu1ean',1583931031,'','172.18.0.2'),('qm8rqjiqhsnlfjd9bj6o89tdq7',1583919492,'','172.18.0.2'),('qne3brsuhr1gseq3snrge7la1s',1583930274,'','172.18.0.2'),('qnin0fga31qt4i7ca33m1h3ltm',1583921698,'','172.18.0.2'),('qonvcinvsaqm7gcps3r5skdrt3',1583921672,'','172.18.0.2'),('qoortt4h91k68o6ar5etpggvr2',1583931279,'','172.18.0.2'),('qoplfirj6qmvlsl4i8bfohti20',1583922301,'','172.18.0.2'),('qos824qrgq8ksosmohg8jv2klh',1583931279,'','172.18.0.2'),('qpj1btfb2l9b11fn0tkth1h42p',1583926014,'','172.18.0.2'),('qpkjoh59gm62ujt7q909vmqj2t',1583925959,'','172.18.0.2'),('qqcorfaf11gv7u0pcsfv6n2kor',1583919492,'','172.18.0.2'),('qqrcc5q8a202qn2mcpaplkh6pt',1583930274,'','172.18.0.2'),('qssl2fc2i5fi68bchsvlhsvgoo',1583919489,'','172.18.0.2'),('qvcd5bl6mu03638e7t23endtlv',1583921800,'','172.18.0.2'),('qvocr9re1hqc6n010jl180sv9m',1583919493,'','172.18.0.2'),('r04t6kb70t87a94rn5k4hgh8ef',1583919489,'','172.18.0.2'),('r06sfgoglb8cb62at4bsqkotf9',1583919489,'','172.18.0.2'),('r08jl0cdug4212jii2q3phs9ot',1583931107,'','172.18.0.2'),('r0bgi8ta1opnobof2cfsve12l3',1583931283,'','172.18.0.2'),('r3f09nrsb8jdcltdrvf4f0l9ra',1583921774,'','172.18.0.2'),('r3i5r4fam94ibh5o3h08g8vuua',1583919490,'','172.18.0.2'),('r4fkgjof8gmtl3aqe6dmsfjn2m',1583931245,'','172.18.0.2'),('r571s6h4ov2erh4opokio5nfm0',1583925958,'','172.18.0.2'),('r6r7ic6i21o70fuov0c95dd8en',1583931913,'','172.18.0.2'),('r73vk1ej6r135ig09hdd9ag4m4',1583931979,'','172.18.0.2'),('r851npbdg9gh4a6jf4av2rb6lv',1583931910,'','172.18.0.2'),('r8n4nh8gfu1g58tcpovhh8c11v',1583931500,'','172.18.0.2'),('rb49uohbrfmpg3rbnmpdh3jvug',1583922304,'','172.18.0.2'),('rb6c5rag8qa3ur63rafqjo23rf',1583925994,'','172.18.0.2'),('rbgrpvpmkof4l9j2esjp66ru4u',1583921696,'','172.18.0.2'),('rbqea8rco2lo27okuoav1bunrc',1583921771,'','172.18.0.2'),('rcritnh13s5qj6dra3m9v1n45f',1583931913,'','172.18.0.2'),('rcvpt1ir2g4d0hq2dkodj5jam2',1583931282,'','172.18.0.2'),('rdlp5ko0urf1m2a473urj9v2qf',1583925994,'','172.18.0.2'),('rep5ajq58goop8h83gjo92onhq',1583931242,'','172.18.0.2'),('rf9b0pls7rrgf8eqasfsb7b2ts',1583922303,'','172.18.0.2'),('rfaban5875tusfrdp32dksvquk',1583931245,'','172.18.0.2'),('rfgnsn6mepfh6imustmnmjgqkv',1583928423,'','172.18.0.2'),('rg87ip87fes2lfffohbf2mi6du',1583931245,'','172.18.0.2'),('rgeb38jc8vdocrpgpe0knk3720',1583931976,'','172.18.0.2'),('rgij8hh62025ejfl0ahshgklfk',1583931144,'','172.18.0.2'),('riddma9c5039b3c9jv2d18bq6l',1583921771,'','172.18.0.2'),('rihl33kucpsvrsqo8r6edgl4mk',1583931975,'','172.18.0.2'),('rj3f4m7ai4b4qc22cgfrce0nk9',1583931500,'','172.18.0.2'),('rk8f4bejturnhea0toaj0iucup',1583931448,'','172.18.0.2'),('rkanok6e0lsnrnv1biklor88h1',1583931279,'','172.18.0.2'),('rkcsfpr1vu4v8snlbnmieq3leb',1583922301,'','172.18.0.2'),('rknnnk5ubv66ob4v8ptt1kpfq2',1583926014,'','172.18.0.2'),('rlarc96l7a5mjuupec5250upq5',1583921695,'','172.18.0.2'),('rmdfvjfe670t7b5mr263tjje2p',1588945960,'','172.18.0.5'),('rn2f7s0kbn96fuou3simovvud3',1583926014,'','172.18.0.2'),('ro0lt9e3sb956h8uoa5i99mhts',1588945960,'','172.18.0.5'),('romu2nvpi4jhdcd1i91rktnp8h',1583931496,'','172.18.0.2'),('roq3skc5757vfv2e5reeq3bun9',1583931279,'','172.18.0.2'),('rpsel5micsjtnesmruv2v5h8qd',1583928420,'','172.18.0.2'),('rqa9j3bv2u7b611ufucukhegh2',1583919489,'','172.18.0.2'),('rr8m8ppjpvpcc8tadvs3jpdain',1583921670,'','172.18.0.2'),('rtdvb5rs6lve6u6d586jiu1glm',1583931497,'','172.18.0.2'),('rts2ajkge3hm95l1pta2i67buj',1583919492,'','172.18.0.2'),('ru9p5bp7le8asslpq77kugulj7',1583928423,'','172.18.0.2'),('rums87nujrfhu8mj12v63cu9h1',1583931447,'','172.18.0.2'),('rv8335eugj9kikr0nudder4r6f',1583931144,'','172.18.0.2'),('s0bsgp9bq8gitult5rs9fbibof',1583931979,'','172.18.0.2'),('s32idcokbeuvd63hg6e9qus7g0',1583931140,'','172.18.0.2'),('s36v3ndbp76a091gspqkmf1kci',1583931976,'','172.18.0.2'),('s4554mjsiad2e6uj3ndq9ad6ug',1583931975,'','172.18.0.2'),('s4lq656ikt24t7fqv0f2e3np1l',1583931110,'','172.18.0.2'),('s6p470bqttq6b482l29vb72koo',1583931910,'','172.18.0.2'),('s6sfohn83q2prulf2mi6ou2i7m',1583925958,'','172.18.0.2'),('s7dvhc6at4771qvmaagb760a3l',1583926011,'','172.18.0.2'),('s7eqn73cefd4jn4dmkvbjkvb6g',1583931279,'','172.18.0.2'),('s87jkts1bjvptuif4k4qup13h0',1583922301,'','172.18.0.2'),('san1sq1ct24967j3hs1vkk0bt3',1583921695,'','172.18.0.2'),('sana76m2nngv8pa2b8l79t3vbq',1583931451,'','172.18.0.2'),('sb7id0tqoriibtppl2v9pnhchd',1583931913,'','172.18.0.2'),('sbk2c5q8qkk47enq9il2ne7k2m',1583925959,'','172.18.0.2'),('sd5j1su5csqda6jqbflfqquqnr',1583925994,'','172.18.0.2'),('sdbougbvma0auhldbv7c1sd88g',1583930230,'','172.18.0.2'),('seap11t9p2mth3h4fvfjv65419',1583931976,'','172.18.0.2'),('sejt41id6qrms71icgggacvr82',1583931282,'','172.18.0.2'),('sendoul8kh0s6jhjc60f2qgmt4',1583925997,'','172.18.0.2'),('sfm2722s49bmpoldm80gjsl23r',1583931448,'','172.18.0.2'),('sfqhu4sdknf21av7emateffjko',1583931111,'','172.18.0.2'),('sgjl1jpp9utfl9h8uuq4s4hang',1588945929,'','172.18.0.5'),('sgo61e1pd1c4u9i7avrh6854k7',1583919488,'','172.18.0.2'),('she10v0mmt0uvbrclclc8i7f8s',1583931979,'','172.18.0.2'),('sjb4kia7gtodbo7bm8fd30gfom',1583930230,'','172.18.0.2'),('sjrt711et78okqkmfel0kq0917',1583925997,'','172.18.0.2'),('skjqfiqralue4s3jga8sml5u1d',1583919493,'','172.18.0.2'),('sl2vrc62l4ct3kdcmtds46ovmp',1583931243,'','172.18.0.2'),('sm8r107q6vgr42uq8de8cg7r29',1583931031,'','172.18.0.2'),('smceia1lqgmd4hi53e30o4n1i3',1583931447,'','172.18.0.2'),('so80oa0dbhui5uiapcvqflv7ku',1583930296,'','172.18.0.2'),('soc3s3so92f5dd1fat1k7hnlqm',1583919489,'','172.18.0.2'),('sp1dpegi20ft33r42hmsh0la1a',1583925993,'','172.18.0.2'),('sq6i49us44n0ob4uou6c1q9la0',1583931979,'','172.18.0.2'),('sq7uqf1muhvhao1jgdln1pcelp',1583921672,'','172.18.0.2'),('sq851btndghetvgeihq9jb2f0c',1583931108,'','172.18.0.2'),('sqstefi5rrr7mhtgtg03hmqe21',1583931110,'','172.18.0.2'),('sr39oih2qaejpmmv3gb6n7p0p0',1583921774,'','172.18.0.2'),('srjjtfenlrvdjlqg8rqeb74h2e',1583930296,'','172.18.0.2'),('ssgu2nh4a9u62cvcbch7sbqap5',1583931243,'','172.18.0.2'),('sss3v7155s6n1p64sgl66o0hhh',1583930230,'','172.18.0.2'),('st009kjc88jfd6llr6aa5dqjaf',1583931497,'','172.18.0.2'),('stia124hjrk9hmpqm0o0ir03kq',1583925994,'','172.18.0.2'),('stull4gdfd7hpuhccbfvn1v96u',1583931110,'','172.18.0.2'),('su87c2bf99kie5rrevhop2gf9a',1588945961,'','172.18.0.5'),('supvkuih39vjenvn1ni7lcvc6v',1583925994,'','172.18.0.2'),('t07f19fruiithhv9cci8ed71np',1583928421,'','172.18.0.2'),('t16hbhjop8kh9ng264hn1o5vjg',1583931447,'','172.18.0.2'),('t1ivtnej3v7lu2erijbf6tedev',1583930230,'','172.18.0.2'),('t1n054esjdhra2vt8410d9opuq',1583921771,'','172.18.0.2'),('t20peeia79sfllcohj9r7aqaji',1583931496,'','172.18.0.2'),('t2gse0e4o1mp3qjgjocq9opd16',1583931282,'','172.18.0.2'),('t2lne9tlu3omcf5q22561r06t0',1583922304,'','172.18.0.2'),('t3ah5vgiooisbf5gl32a41det7',1583931031,'','172.18.0.2'),('t3bgqod5fk6sinvuumt38gcp16',1583931975,'','172.18.0.2'),('t3ddujm0recndc78jdpo64j3to',1583931279,'','172.18.0.2'),('t4cjp665c8mr4o4kp65612rrf7',1583928420,'','172.18.0.2'),('t520gg1j9mdth124q9i6r50r94',1583931975,'','172.18.0.2'),('t5hhhrtguqj3lm514vksbs0790',1583921771,'','172.18.0.2'),('t5lkicqibondks7ea89pj6tjl3',1583922304,'','172.18.0.2'),('t9do7fovkkl1epjhd1hjkrcpfk',1583925961,'','172.18.0.2'),('t9ndee1a02ms342ne10ltk1678',1588945960,'','172.18.0.5'),('ta48f27mv3jg4bk6guuusp49or',1583921800,'','172.18.0.2'),('taincukbktgvsa6u1nfvgjrqka',1583926011,'','172.18.0.2'),('takj9kmqdgholu45gaq0lf2vvs',1583930296,'','172.18.0.2'),('tasg7frb94epm2o2df29hp1tb0',1583925961,'','172.18.0.2'),('tboe8ujs5du4bofo374raii6r8',1583931447,'','172.18.0.2'),('tbu8plh7hn0kvl318aqs1vlaia',1583931447,'','172.18.0.2'),('tc7kh26uqauv16at9gb3bdch1l',1583931110,'','172.18.0.2'),('tcf9f27ega2lq1ctpodu6mfbpn',1583931015,'','172.18.0.2'),('tch55q4h7nsfgil3i3ekf2ci3i',1583931245,'','172.18.0.2'),('tcupg1nn20fva7ghq68a5t8u9f',1583928420,'','172.18.0.2'),('tdu68l94dd5h79808s24lh7960',1583930274,'','172.18.0.2'),('tekdpav27u0ab8aijesj6ivkbe',1583931034,'','172.18.0.2'),('tfc5v0vthn8uc5sfhnceu5r977',1583928423,'','172.18.0.2'),('tg842d8j7d2sudo1j2h5qtt61g',1583931980,'','172.18.0.2'),('tgt9t39kvf565lrg035ddsggs1',1583931107,'','172.18.0.2'),('tgtugvjfk19api0q6thhgngfsd',1583931143,'','172.18.0.2'),('th1b0umpre9r5s50e8ctrbk369',1583931242,'','172.18.0.2'),('thg0rpomkifsh6sb5jirbuodin',1583930229,'','172.18.0.2'),('thkiveit7qt95d5h0gho7m6s08',1583931108,'','172.18.0.2'),('tisn90ssa3n1k69bov0na3abet',1583931283,'','172.18.0.2'),('tit7aamqgk9mgsedlqbgtav74f',1583931245,'','172.18.0.2'),('tiurvsdkuf4bb1ol1at8sp10ue',1583931110,'','172.18.0.2'),('tj6artcvb6udr6orgijqqmpr5v',1583919492,'','172.18.0.2'),('tj91lel3jahslq5vlkpv1u4imu',1583928423,'','172.18.0.2'),('tjcttqg2g31ego742h6qltcefk',1583925961,'','172.18.0.2'),('tjpbtso0e5rbsvbsocakehatcu',1583925997,'','172.18.0.2'),('tk5r3fvqqhsmoliqf5utd68uci',1583931496,'','172.18.0.2'),('tkb6hun7jad1gi8b918c6p6oi3',1583921797,'','172.18.0.2'),('tkgltepa3c466ht8ij0phvbn14',1583931110,'','172.18.0.2'),('tmbon6s43vavk67eartkidq4t4',1583922301,'','172.18.0.2'),('tq45au98ifcpmh3j7t3k2e3pld',1583919490,'','172.18.0.2'),('tq84igd52t0inflplbk2uk4s6r',1583931111,'','172.18.0.2'),('tqka3vbarj6d69diockvnqvkj6',1583931913,'','172.18.0.2'),('tqm4qkdqbcr618cu71p0fm6i6v',1583922301,'','172.18.0.2'),('trh9lfdgdls2qgu1s67rem3629',1583931496,'','172.18.0.2'),('tshd40slbgt6obslb3v5mfucp3',1583931447,'','172.18.0.2'),('tsoqcsuav4mbtu6qtdne04t57h',1588945960,'','172.18.0.5'),('tsqqgjp3ap3ic5ch9qgct0vmef',1583931450,'','172.18.0.2'),('ttg8fedlovvsd0160190enp72p',1583921698,'','172.18.0.2'),('tu9icc9iqsr888oij7rtrrggag',1583931110,'','172.18.0.2'),('tuortt9m2idgr2uomgjepcpp1c',1583931451,'','172.18.0.2'),('tvdpnkqeeiqskedlh95vr1hidi',1583931279,'','172.18.0.2'),('tvnd831vm6fhj8d5d956fa3vna',1583931451,'','172.18.0.2'),('u08kdmpk1s2ccfljaduei5nicv',1583921800,'','172.18.0.2'),('u0c3ohds0924k0l6qv4i6ijo2q',1583931282,'','172.18.0.2'),('u0fk5130r8ah9akb5u06soqd57',1583931282,'','172.18.0.2'),('u0pmbgovc0a71ld9nlmnnuja9a',1583922304,'','172.18.0.2'),('u0ufc6ghbru17c6vomaf937hhk',1583931978,'','172.18.0.2'),('u1h1u43kte7rl34vlaugg85242',1583931031,'','172.18.0.2'),('u29ct18ajqc51o1bigq8t1keta',1583931500,'','172.18.0.2'),('u2i41cqed37qjtjb5sippagvif',1583919492,'','172.18.0.2'),('u3228udq7i3hdk3nnvf18r25vh',1583930229,'','172.18.0.2'),('u349pfd9lufqi1gis1s9eetl6a',1583925958,'','172.18.0.2'),('u36eblv35te3e87ksdotjnpta3',1583931143,'','172.18.0.2'),('u44sda0qdbuhropjhic1on2ema',1583931030,'','172.18.0.2'),('u4aioegrlkmr0ha9pdr43h9rlt',1583931450,'','172.18.0.2'),('u4l4p1c1hif8lu7bf0rnq4clfj',1583931500,'','172.18.0.2'),('u4rkhlcrbf7989ljdg5goi5m8a',1583931910,'','172.18.0.2'),('u501ep17i18utmfc1k1eg8sj2t',1583931015,'','172.18.0.2'),('u519mo56php8gf9f3nnmev2gek',1583931279,'','172.18.0.2'),('u5f8bu4n71vpqnr1pqrustfcv4',1583921797,'','172.18.0.2'),('u6thh5sc2akhsc96gdogn9bn30',1583919489,'','172.18.0.2'),('u71tui48v4bnikjd4uv3ju35fe',1583931450,'','172.18.0.2'),('u813ejsmlet2942t00ilcgdr4f',1583931242,'','172.18.0.2'),('u9lk8hdk6bks3lg8fv0gv5ag3s',1583921800,'','172.18.0.2'),('u9mvpt1ji9uk2f91pkj7iejl8m',1583931108,'','172.18.0.2'),('u9uh93qipfjk4p2pum3km4v5aj',1583921695,'','172.18.0.2'),('uad89bhrooejjq3tecmv6cvmde',1583931034,'','172.18.0.2'),('uainbc518vku9mchmp71qjrqpc',1583925961,'','172.18.0.2'),('uarict75h4trn0716oe68kg40r',1583921669,'','172.18.0.2'),('ubkm657vnbjvcml48emm3uca21',1588945928,'','172.18.0.5'),('ubramphjesaioakgbcgqrr5m7e',1583922301,'','172.18.0.2'),('udqe9ia5ohak9huq3nkbqapgvp',1583930274,'','172.18.0.2'),('uf2tdea35nso3doibaaebme66e',1583931031,'','172.18.0.2'),('ugc30m59oumqgr5f10qnkr9ugl',1583931975,'','172.18.0.2'),('ughgvrfrb5ovgcps1fgdc24uu4',1583921695,'','172.18.0.2'),('uh5ed3hh5l70lbbp7t5lsniu3v',1583931979,'','172.18.0.2'),('uhctiom1ssoque92omkl81ke6j',1583925961,'','172.18.0.2'),('uj8snrum7pjm4t489kiisi1msm',1583931979,'','172.18.0.2'),('ujgptvmllcumuo14mvr9jd6tc9',1583931279,'','172.18.0.2'),('ujimmo3a91nj4uaru21cjnvugn',1583921698,'','172.18.0.2'),('ujji35i0hk4re5l4ep2oej1qlp',1583931245,'','172.18.0.2'),('ujnh5pj0f1vt9tkmmntjoe2jh1',1588945928,'','172.18.0.5'),('ukbjeb87c2rvfl8a61uup0458b',1583921797,'','172.18.0.2'),('uke5vnd1gru0eaeorh57q18eru',1583922304,'','172.18.0.2'),('ukeiaj0qo9dfsqtvtapc97pjum',1583931500,'','172.18.0.2'),('ukq3a787g1eoht9oorqmik3a0j',1583921698,'','172.18.0.2'),('ul8vvp0ko16p1jb3gcenu74qdv',1583921699,'','172.18.0.2'),('ulomgavd0uffjfhjr6em6hv1df',1583921800,'','172.18.0.2'),('umd3cejhvkoa0rugiig8r7b877',1583931111,'','172.18.0.2'),('umfdiu1i39fnfovf43o161l139',1583931282,'','172.18.0.2'),('umguarjup0p2k306msj28rv3du',1583931243,'','172.18.0.2'),('umi6bdn83qqse187o3qa8f3pur',1583931110,'','172.18.0.2'),('unj9h8a5dproaunr8shutaglrj',1583931108,'','172.18.0.2'),('uplh0t6af9afqh9dh1qen1bt2f',1583921672,'','172.18.0.2'),('uqbnvlla08l5j7isbcqviolko0',1583931450,'','172.18.0.2'),('uqjc8bc4p6vrrau2cgfr9fmdpb',1583931448,'','172.18.0.2'),('uqu7casorj9eq2c7jblgamh67f',1588945960,'','172.18.0.5'),('urtkstdtrb836shh40v31i8kj5',1583931140,'','172.18.0.2'),('us6huhohaq35d9v6ptifmuqde5',1583928423,'','172.18.0.2'),('us7onk8vikvv8glvo7fqth9ofs',1583931499,'','172.18.0.2'),('usmdv5il3a0trcmkl5g0umiof9',1583925997,'','172.18.0.2'),('utg8tof5vi61f2tnd7lmruvg6h',1583931979,'','172.18.0.2'),('utpdb3lgtumuuc157ab3js3od0',1583931107,'','172.18.0.2'),('uulu51noa8ujqo0ol5emmkq7aa',1583930296,'','172.18.0.2'),('uvgndq6pdfq3sjl0q2f651tedh',1583930296,'','172.18.0.2'),('uvo2gn8grcbrs61tei9fk4ltc6',1583931140,'','172.18.0.2'),('v1l3upjcfo2dlu7sm4kce4o9es',1583925997,'','172.18.0.2'),('v1rcarf99joivshco2bcpth8i0',1583931140,'','172.18.0.2'),('v1u6d61s3cqilnor586ujovndk',1583931143,'','172.18.0.2'),('v2pmh0tspbl6qd60o25pdgb7ie',1583931500,'','172.18.0.2'),('v3dn78hup3qj7kmeti549fclqs',1583931140,'','172.18.0.2'),('v46gir6vj3upag7qhigaikluje',1583931980,'','172.18.0.2'),('v58kpo6atr9a4l92f1uerejf7r',1583928423,'','172.18.0.2'),('v5josk293sou49t695j8f4m7r9',1583931910,'','172.18.0.2'),('v60r0iff8pb25l8mllgblp1sfh',1583931242,'','172.18.0.2'),('v6b47u41k01elo8bgpf20j7k92',1583931111,'','172.18.0.2'),('v7fu4jebp8onk02mip0sjflo3l',1583931031,'','172.18.0.2'),('v9h7pgv0mdonf6o6q4okfr558h',1583921672,'','172.18.0.2'),('v9ljec47aaqo09g81361frn9p4',1588945929,'','172.18.0.5'),('va5623o0kn1pjmqhbq9doc55ej',1583921774,'','172.18.0.2'),('vavv71ft2uu1kvaqpl5rfn5sma',1583931500,'','172.18.0.2'),('vb0b9674v16kc6tmmpd8u6jml1',1583931979,'','172.18.0.2'),('vbes1fe0ncek9mok99g427kt4k',1583931034,'','172.18.0.2'),('vbhlflbnbbnufhnbu3vtj4lt2l',1583931496,'','172.18.0.2'),('vblei55d3qn0nvtnggloq3is52',1583925994,'','172.18.0.2'),('vbsnm42dvaeg4ft5js77gs8hks',1588945929,'','172.18.0.5'),('vdc5138n0s4tjgb05il4kjhvie',1588945929,'','172.18.0.5'),('vdedfiokr6q0bctphf26j2k2or',1583931242,'','172.18.0.2'),('vdf165g6ms1r6rc76ipr5clgic',1583921774,'','172.18.0.2'),('vdr1o1sem08v9vcl1gfpaadgtc',1583922301,'','172.18.0.2'),('vel65egdcv1u8dme3iig2edu3p',1583926014,'','172.18.0.2'),('vf0i352gia6btv3ag9qlv1cjuc',1583919490,'','172.18.0.2'),('vfauv94jcisjbp7nkeg2o7edv8',1583931246,'','172.18.0.2'),('vfb27g7vg3itttses01u8hores',1583931497,'','172.18.0.2'),('vfdtger4b1upq4s707585hrt6r',1583925997,'','172.18.0.2'),('vg0i7ca6tdi2cj1uh8gs7go909',1583931448,'','172.18.0.2'),('vg9adsm3l9flr1b8797jueaa94',1583921698,'','172.18.0.2'),('vhrjrk1ktpll2mupfrtn8uuccl',1583931034,'','172.18.0.2'),('vie7nq1fmaleq6eppfpc2pb3u1',1583931976,'','172.18.0.2'),('vj3t1ucgpe4arn47suteuohqtg',1583931283,'','172.18.0.2'),('vk0eukb8ltl9f5ts7h1ni2rji4',1583931500,'','172.18.0.2'),('vml8k8upvtgr098qtfnr389ctn',1583928423,'','172.18.0.2'),('vnon35va60e3kk2o7jt3k9r1op',1583928420,'','172.18.0.2'),('vo1m712opji6li3hnsq6jui8lo',1583931034,'','172.18.0.2'),('vodclf50pk31fu0e7b1nv4gr8n',1583931279,'','172.18.0.2'),('vopq7pn9dbtsupaq6od27dh5hg',1583931976,'','172.18.0.2'),('vq4gonoq7mjvm2kkj1p0l5b7ea',1583931143,'','172.18.0.2'),('vqft95g675uui7j4leqm202eg6',1583931980,'','172.18.0.2'),('vqgiv1and6avqci82o0esadaok',1583930296,'','172.18.0.2'),('vqr50eg3u42dsf5qmmq4sg0pn2',1583931448,'','172.18.0.2'),('vru5ph5dkv66nd0r4cpi1mb4qe',1583931243,'','172.18.0.2'),('vtmq37bkkfd3phb61pc7tgk8ek',1583926014,'','172.18.0.2'),('vu3mepamspdhvjtjvv36chgqjq',1583925958,'','172.18.0.2'),('vuc7pd8uhrae4i1tg6jv6av42e',1583931279,'','172.18.0.2'),('vuippc9t2b1e4osl9dbl3dqih6',1588945961,'','172.18.0.5'),('vvueqsrihgspnp308s0ksa7477',1583930296,'','172.18.0.2');
/*!40000 ALTER TABLE `php_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pstnNumbers`
--

DROP TABLE IF EXISTS `pstnNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pstnNumbers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` int(11) unsigned DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `deviceId` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pstnNumbers`
--

LOCK TABLES `pstnNumbers` WRITE;
/*!40000 ALTER TABLE `pstnNumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pstnNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pstnPrefixes`
--

DROP TABLE IF EXISTS `pstnPrefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pstnPrefixes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `prefix` varchar(32) DEFAULT NULL,
  `start` varchar(32) DEFAULT NULL,
  `stop` varchar(32) DEFAULT NULL,
  `master` int(11) DEFAULT 0,
  `deviceId` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pstnPrefixes`
--

LOCK TABLES `pstnPrefixes` WRITE;
/*!40000 ALTER TABLE `pstnPrefixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pstnPrefixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rackContents`
--

DROP TABLE IF EXISTS `rackContents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rackContents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `rack` int(11) unsigned DEFAULT NULL,
  `rack_start` int(11) unsigned DEFAULT NULL,
  `rack_size` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rack` (`rack`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rackContents`
--

LOCK TABLES `rackContents` WRITE;
/*!40000 ALTER TABLE `rackContents` DISABLE KEYS */;
/*!40000 ALTER TABLE `rackContents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racks`
--

DROP TABLE IF EXISTS `racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `size` int(2) DEFAULT NULL,
  `location` int(11) unsigned DEFAULT NULL,
  `row` int(11) NOT NULL DEFAULT 1,
  `hasBack` tinyint(1) NOT NULL DEFAULT 0,
  `topDown` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `customer_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `customer_racks` (`customer_id`),
  CONSTRAINT `customer_racks` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racks`
--

LOCK TABLES `racks` WRITE;
/*!40000 ALTER TABLE `racks` DISABLE KEYS */;
/*!40000 ALTER TABLE `racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subnetId` int(11) unsigned DEFAULT NULL,
  `ip_addr` varchar(100) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT 2,
  `owner` varchar(128) DEFAULT NULL,
  `requester` varchar(128) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `processed` binary(1) DEFAULT NULL,
  `accepted` binary(1) DEFAULT NULL,
  `adminComment` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routing_bgp`
--

DROP TABLE IF EXISTS `routing_bgp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routing_bgp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `local_as` int(12) unsigned NOT NULL,
  `local_address` varchar(100) NOT NULL DEFAULT '',
  `peer_name` varchar(255) NOT NULL DEFAULT '',
  `peer_as` int(12) unsigned NOT NULL,
  `peer_address` varchar(100) NOT NULL DEFAULT '',
  `bgp_type` enum('internal','external') NOT NULL DEFAULT 'external',
  `vrf_id` int(11) unsigned DEFAULT NULL,
  `circuit_id` int(11) unsigned DEFAULT NULL,
  `customer_id` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vrf_id` (`vrf_id`),
  KEY `circuit_id` (`circuit_id`),
  KEY `cust_id` (`customer_id`),
  CONSTRAINT `circuit_id` FOREIGN KEY (`circuit_id`) REFERENCES `circuits` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cust_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `vrf_id` FOREIGN KEY (`vrf_id`) REFERENCES `vrf` (`vrfId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routing_bgp`
--

LOCK TABLES `routing_bgp` WRITE;
/*!40000 ALTER TABLE `routing_bgp` DISABLE KEYS */;
/*!40000 ALTER TABLE `routing_bgp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routing_subnets`
--

DROP TABLE IF EXISTS `routing_subnets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routing_subnets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('bgp','ospf') NOT NULL DEFAULT 'bgp',
  `direction` enum('advertised','received') NOT NULL DEFAULT 'advertised',
  `object_id` int(11) unsigned NOT NULL,
  `subnet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`object_id`,`subnet_id`),
  KEY `bgp_id` (`object_id`),
  KEY `subnet_id` (`subnet_id`),
  CONSTRAINT `bgp_id` FOREIGN KEY (`object_id`) REFERENCES `routing_bgp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subnet_id` FOREIGN KEY (`subnet_id`) REFERENCES `subnets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routing_subnets`
--

LOCK TABLES `routing_subnets` WRITE;
/*!40000 ALTER TABLE `routing_subnets` DISABLE KEYS */;
/*!40000 ALTER TABLE `routing_subnets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scanAgents`
--

DROP TABLE IF EXISTS `scanAgents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scanAgents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` set('direct','api','mysql') NOT NULL DEFAULT '',
  `code` varchar(32) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scanAgents`
--

LOCK TABLES `scanAgents` WRITE;
/*!40000 ALTER TABLE `scanAgents` DISABLE KEYS */;
INSERT INTO `scanAgents` VALUES (1,'localhost','Scanning from local machine','direct',NULL,NULL);
/*!40000 ALTER TABLE `scanAgents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `masterSection` int(11) DEFAULT 0,
  `permissions` varchar(1024) DEFAULT NULL,
  `strictMode` binary(1) NOT NULL DEFAULT '1',
  `subnetOrdering` varchar(16) DEFAULT NULL,
  `order` int(3) DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `showVLAN` tinyint(1) NOT NULL DEFAULT 0,
  `showVRF` tinyint(1) NOT NULL DEFAULT 0,
  `showSupernetOnly` tinyint(1) NOT NULL DEFAULT 0,
  `DNS` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (3,'section1',NULL,0,'[]','1','default',NULL,NULL,1,1,1,NULL),(4,'section2',NULL,0,'[]','1','default',NULL,NULL,1,1,1,NULL);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `siteTitle` varchar(64) DEFAULT NULL,
  `siteAdminName` varchar(64) DEFAULT NULL,
  `siteAdminMail` varchar(64) DEFAULT NULL,
  `siteDomain` varchar(32) DEFAULT NULL,
  `siteURL` varchar(64) DEFAULT NULL,
  `siteLoginText` varchar(128) DEFAULT NULL,
  `domainAuth` tinyint(1) DEFAULT NULL,
  `enableIPrequests` tinyint(1) DEFAULT NULL,
  `enableVRF` tinyint(1) DEFAULT 1,
  `enableDNSresolving` tinyint(1) DEFAULT NULL,
  `enableFirewallZones` tinyint(1) NOT NULL DEFAULT 0,
  `firewallZoneSettings` varchar(1024) NOT NULL DEFAULT '{"zoneLength":3,"ipType":{"0":"v4","1":"v6"},"separator":"_","indicator":{"0":"own","1":"customer"},"zoneGenerator":"2","zoneGeneratorType":{"0":"decimal","1":"hex","2":"text"},"deviceType":"3","padding":"on","strictMode":"on","pattern":{"0":"patternFQDN"}}',
  `enablePowerDNS` tinyint(1) DEFAULT 0,
  `powerDNS` text DEFAULT NULL,
  `enableDHCP` tinyint(1) DEFAULT 0,
  `DHCP` varchar(256) DEFAULT '{"type":"kea","settings":{"file":"/etc/kea/kea.conf"}}',
  `enableMulticast` tinyint(1) DEFAULT 0,
  `enableNAT` tinyint(1) DEFAULT 1,
  `enableSNMP` tinyint(1) DEFAULT 0,
  `enableThreshold` tinyint(1) DEFAULT 1,
  `enableRACK` tinyint(1) DEFAULT 1,
  `enableLocations` tinyint(1) DEFAULT 1,
  `enablePSTN` tinyint(1) DEFAULT 0,
  `enableChangelog` tinyint(1) NOT NULL DEFAULT 1,
  `enableCustomers` tinyint(1) NOT NULL DEFAULT 1,
  `link_field` varchar(32) DEFAULT '0',
  `version` varchar(5) DEFAULT NULL,
  `dbversion` int(8) NOT NULL DEFAULT 0,
  `dbverified` binary(1) NOT NULL DEFAULT '0',
  `donate` tinyint(1) DEFAULT 0,
  `IPfilter` varchar(128) DEFAULT NULL,
  `IPrequired` varchar(128) DEFAULT NULL,
  `vlanDuplicate` int(1) DEFAULT 0,
  `vlanMax` int(8) DEFAULT 4096,
  `subnetOrdering` varchar(16) DEFAULT 'subnet,asc',
  `visualLimit` int(2) NOT NULL DEFAULT 0,
  `theme` varchar(32) NOT NULL DEFAULT 'dark',
  `autoSuggestNetwork` tinyint(1) NOT NULL DEFAULT 0,
  `pingStatus` varchar(32) NOT NULL DEFAULT '1800;3600',
  `defaultLang` int(3) DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `vcheckDate` datetime DEFAULT NULL,
  `api` binary(1) NOT NULL DEFAULT '0',
  `scanPingPath` varchar(64) DEFAULT '/bin/ping',
  `scanFPingPath` varchar(64) DEFAULT '/bin/fping',
  `scanPingType` set('ping','pear','fping') NOT NULL DEFAULT 'ping',
  `scanMaxThreads` int(4) DEFAULT 128,
  `prettyLinks` set('Yes','No') NOT NULL DEFAULT 'No',
  `hiddenCustomFields` text DEFAULT NULL,
  `inactivityTimeout` int(5) NOT NULL DEFAULT 3600,
  `updateTags` tinyint(1) DEFAULT 0,
  `enforceUnique` tinyint(1) DEFAULT 1,
  `authmigrated` tinyint(4) NOT NULL DEFAULT 0,
  `maintaneanceMode` tinyint(1) DEFAULT 0,
  `decodeMAC` tinyint(1) DEFAULT 1,
  `tempShare` tinyint(1) DEFAULT 0,
  `tempAccess` text DEFAULT NULL,
  `log` set('Database','syslog','both') NOT NULL DEFAULT 'Database',
  `subnetView` tinyint(4) NOT NULL DEFAULT 0,
  `enableCircuits` tinyint(1) DEFAULT 1,
  `enableRouting` tinyint(1) DEFAULT 0,
  `permissionPropagate` tinyint(1) DEFAULT 1,
  `passwordPolicy` varchar(1024) DEFAULT '{"minLength":8,"maxLength":0,"minNumbers":0,"minLetters":0,"minLowerCase":0,"minUpperCase":0,"minSymbols":0,"maxSymbols":0,"allowedSymbols":"#,_,-,!,[,],=,~"}',
  `2fa_provider` set('none','Google_Authenticator') DEFAULT 'none',
  `2fa_name` varchar(32) DEFAULT 'phpipam',
  `2fa_length` int(2) DEFAULT 16,
  `2fa_userchange` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'phpipam','Sysadmin','admin@domain.local','domain.local','http://localhost',NULL,0,0,0,0,0,'{\"zoneLength\":3,\"ipType\":{\"0\":\"v4\",\"1\":\"v6\"},\"separator\":\"_\",\"indicator\":{\"0\":\"own\",\"1\":\"customer\"},\"zoneGenerator\":\"2\",\"zoneGeneratorType\":{\"0\":\"decimal\",\"1\":\"hex\",\"2\":\"text\"},\"deviceType\":\"3\",\"padding\":\"on\",\"strictMode\":\"on\",\"pattern\":{\"0\":\"patternFQDN\"}}',0,NULL,0,'{\"type\":\"kea\",\"settings\":{\"file\":\"/etc/kea/kea.conf\"}}',0,1,0,1,1,1,0,1,1,NULL,'1.4',25,'1',0,'mac;owner;state;switch;note;firewallAddressObject',NULL,1,4096,'subnet,asc',24,'dark',0,'1800;3600',0,'2020-05-08 13:52:15','2020-05-08 15:52:15','1','/bin/ping','/bin/fping','ping',128,'Yes',NULL,3600,0,1,0,0,1,0,NULL,'Database',0,1,0,1,'{\"minLength\":8,\"maxLength\":0,\"minNumbers\":0,\"minLetters\":0,\"minLowerCase\":0,\"minUpperCase\":0,\"minSymbols\":0,\"maxSymbols\":0,\"allowedSymbols\":\"#,_,-,!,[,],=,~\"}','none','phpipam',16,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settingsMail`
--

DROP TABLE IF EXISTS `settingsMail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settingsMail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mtype` set('localhost','smtp') NOT NULL DEFAULT 'localhost',
  `msecure` set('none','ssl','tls') NOT NULL DEFAULT 'none',
  `mauth` set('yes','no') NOT NULL DEFAULT 'no',
  `mserver` varchar(128) DEFAULT NULL,
  `mport` int(5) DEFAULT 25,
  `muser` varchar(64) DEFAULT NULL,
  `mpass` varchar(64) DEFAULT NULL,
  `mAdminName` varchar(64) DEFAULT NULL,
  `mAdminMail` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settingsMail`
--

LOCK TABLES `settingsMail` WRITE;
/*!40000 ALTER TABLE `settingsMail` DISABLE KEYS */;
INSERT INTO `settingsMail` VALUES (1,'localhost','none','no',NULL,25,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `settingsMail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subnets`
--

DROP TABLE IF EXISTS `subnets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subnets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subnet` varchar(255) DEFAULT NULL,
  `mask` varchar(3) DEFAULT NULL,
  `sectionId` int(11) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `linked_subnet` int(11) unsigned DEFAULT NULL,
  `firewallAddressObject` varchar(100) DEFAULT NULL,
  `vrfId` int(11) unsigned DEFAULT NULL,
  `masterSubnetId` int(11) unsigned NOT NULL DEFAULT 0,
  `allowRequests` tinyint(1) DEFAULT 0,
  `vlanId` int(11) unsigned DEFAULT NULL,
  `showName` tinyint(1) DEFAULT 0,
  `device` int(10) unsigned DEFAULT 0,
  `permissions` varchar(1024) DEFAULT NULL,
  `pingSubnet` tinyint(1) DEFAULT 0,
  `discoverSubnet` binary(1) DEFAULT '0',
  `resolveDNS` tinyint(1) DEFAULT 0,
  `DNSrecursive` tinyint(1) DEFAULT 0,
  `DNSrecords` tinyint(1) DEFAULT 0,
  `nameserverId` int(11) DEFAULT 0,
  `scanAgent` int(11) DEFAULT NULL,
  `customer_id` int(11) unsigned DEFAULT NULL,
  `isFolder` tinyint(1) DEFAULT 0,
  `isFull` tinyint(1) DEFAULT 0,
  `state` int(3) DEFAULT 2,
  `threshold` int(3) DEFAULT 0,
  `location` int(11) unsigned DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `lastScan` timestamp NULL DEFAULT NULL,
  `lastDiscovery` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterSubnetId` (`masterSubnetId`),
  KEY `location` (`location`),
  KEY `sectionId` (`sectionId`),
  KEY `vrfId` (`vrfId`),
  KEY `customer_subnets` (`customer_id`),
  CONSTRAINT `customer_subnets` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnets`
--

LOCK TABLES `subnets` WRITE;
/*!40000 ALTER TABLE `subnets` DISABLE KEYS */;
INSERT INTO `subnets` VALUES (7,'167772160','8',3,'huge subnet',NULL,NULL,0,0,0,0,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(8,'167772160','24',3,NULL,NULL,NULL,0,7,0,3,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(9,'167772416','24',3,NULL,NULL,NULL,0,7,0,4,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(10,'2886729728','12',4,NULL,NULL,NULL,0,0,0,0,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(11,'2886729728','24',4,NULL,NULL,NULL,0,10,0,5,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(12,'2886729984','24',4,NULL,NULL,NULL,0,10,0,6,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subnets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userGroups`
--

DROP TABLE IF EXISTS `userGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userGroups` (
  `g_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `g_name` varchar(32) DEFAULT NULL,
  `g_desc` varchar(1024) DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userGroups`
--

LOCK TABLES `userGroups` WRITE;
/*!40000 ALTER TABLE `userGroups` DISABLE KEYS */;
INSERT INTO `userGroups` VALUES (2,'Operators','default Operator group',NULL),(3,'Guests','default Guest group (viewers)',NULL);
/*!40000 ALTER TABLE `userGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `authMethod` int(2) DEFAULT 1,
  `password` char(128) COLLATE utf8_bin DEFAULT NULL,
  `groups` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `role` text CHARACTER SET utf8 DEFAULT NULL,
  `real_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `domainUser` binary(1) DEFAULT '0',
  `widgets` varchar(1024) COLLATE utf8_bin DEFAULT 'statistics;favourite_subnets;changelog;top10_hosts_v4',
  `lang` int(11) unsigned DEFAULT 9,
  `favourite_subnets` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `disabled` set('Yes','No') COLLATE utf8_bin NOT NULL DEFAULT 'No',
  `mailNotify` set('Yes','No') COLLATE utf8_bin DEFAULT 'No',
  `mailChangelog` set('Yes','No') COLLATE utf8_bin DEFAULT 'No',
  `passChange` set('Yes','No') COLLATE utf8_bin NOT NULL DEFAULT 'No',
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `lastLogin` timestamp NULL DEFAULT NULL,
  `lastActivity` timestamp NULL DEFAULT NULL,
  `compressOverride` set('default','Uncompress') COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `hideFreeRange` tinyint(1) DEFAULT 0,
  `menuType` set('Static','Dynamic') COLLATE utf8_bin DEFAULT 'Dynamic',
  `menuCompact` tinyint(4) DEFAULT 1,
  `2fa` tinyint(1) NOT NULL DEFAULT 0,
  `2fa_secret` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `theme` varchar(32) COLLATE utf8_bin DEFAULT '',
  `token` varchar(24) COLLATE utf8_bin DEFAULT NULL,
  `token_valid_until` datetime DEFAULT NULL,
  `module_permissions` varchar(255) COLLATE utf8_bin DEFAULT '{"vlan":"1","vrf":"1","pdns":"1","circuits":"1","racks":"1","nat":"1","pstn":"1","customers":"1","locations":"1","devices":"1"}',
  `compress_actions` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`username`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin',1,'$6$rounds=3000$fPjzAjTagh02KXUu$Ei5x75utSIu/gTFzp3wWVz3qDqu2FQQskxIDouGiKSCnTnq4G30K/lZbPTQRy4X0/GMKigpF3JHNu0uSyI6of1','','Administrator','phpIPAM Admin','admin@domain.local','0','statistics;favourite_subnets;changelog;access_logs;error_logs;top10_hosts_v4',9,NULL,'No','No','No','No','2020-05-08 13:53:14','2020-05-08 15:52:13','2020-05-08 15:53:14','default',0,'Dynamic',1,0,NULL,'',NULL,NULL,'{\"vlan\":\"1\",\"vrf\":\"1\",\"pdns\":\"1\",\"circuits\":\"1\",\"racks\":\"1\",\"nat\":\"1\",\"pstn\":\"1\",\"customers\":\"1\",\"locations\":\"1\",\"devices\":\"1\"}',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersAuthMethod`
--

DROP TABLE IF EXISTS `usersAuthMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersAuthMethod` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` set('local','http','AD','LDAP','NetIQ','Radius','SAML2') NOT NULL DEFAULT 'local',
  `params` varchar(2048) DEFAULT NULL,
  `protected` set('Yes','No') NOT NULL DEFAULT 'Yes',
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersAuthMethod`
--

LOCK TABLES `usersAuthMethod` WRITE;
/*!40000 ALTER TABLE `usersAuthMethod` DISABLE KEYS */;
INSERT INTO `usersAuthMethod` VALUES (1,'local',NULL,'Yes','Local database'),(2,'http',NULL,'Yes','Apache authentication');
/*!40000 ALTER TABLE `usersAuthMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlanDomains`
--

DROP TABLE IF EXISTS `vlanDomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlanDomains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `permissions` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlanDomains`
--

LOCK TABLES `vlanDomains` WRITE;
/*!40000 ALTER TABLE `vlanDomains` DISABLE KEYS */;
INSERT INTO `vlanDomains` VALUES (1,'default','default L2 domain',NULL);
/*!40000 ALTER TABLE `vlanDomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vlans`
--

DROP TABLE IF EXISTS `vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlans` (
  `vlanId` int(11) NOT NULL AUTO_INCREMENT,
  `domainId` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `number` int(4) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `customer_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`vlanId`),
  KEY `customer_vlans` (`customer_id`),
  CONSTRAINT `customer_vlans` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlans`
--

LOCK TABLES `vlans` WRITE;
/*!40000 ALTER TABLE `vlans` DISABLE KEYS */;
INSERT INTO `vlans` VALUES (1,1,'IPv6 private 1',2001,'IPv6 private 1 subnets',NULL,NULL),(2,1,'Servers DMZ',4001,'DMZ public',NULL,NULL),(3,1,'10_FIRST',10,NULL,NULL,NULL),(4,1,'11_SCND',11,NULL,NULL,NULL),(5,1,'12_THRD',12,NULL,NULL,NULL),(6,1,'13_4TH',13,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrf`
--

DROP TABLE IF EXISTS `vrf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrf` (
  `vrfId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `rd` varchar(32) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `sections` varchar(128) DEFAULT NULL,
  `editDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `customer_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`vrfId`),
  KEY `customer_vrf` (`customer_id`),
  CONSTRAINT `customer_vrf` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrf`
--

LOCK TABLES `vrf` WRITE;
/*!40000 ALTER TABLE `vrf` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `wid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wtitle` varchar(64) NOT NULL DEFAULT '',
  `wdescription` varchar(1024) DEFAULT NULL,
  `wfile` varchar(64) NOT NULL DEFAULT '',
  `wparams` varchar(1024) DEFAULT NULL,
  `whref` enum('yes','no') NOT NULL DEFAULT 'no',
  `wsize` enum('4','6','8','12') NOT NULL DEFAULT '6',
  `wadminonly` enum('yes','no') NOT NULL DEFAULT 'no',
  `wactive` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'Statistics','Shows some statistics on number of hosts, subnets','statistics',NULL,'no','4','no','yes'),(2,'Favourite subnets','Shows 5 favourite subnets','favourite_subnets',NULL,'yes','8','no','yes'),(3,'Top 10 IPv4 subnets by number of hosts','Shows graph of top 10 IPv4 subnets by number of hosts','top10_hosts_v4',NULL,'yes','6','no','yes'),(4,'Top 10 IPv6 subnets by number of hosts','Shows graph of top 10 IPv6 subnets by number of hosts','top10_hosts_v6',NULL,'yes','6','no','yes'),(5,'Top 10 IPv4 subnets by usage percentage','Shows graph of top 10 IPv4 subnets by usage percentage','top10_percentage',NULL,'yes','6','no','yes'),(6,'Last 5 change log entries','Shows last 5 change log entries','changelog',NULL,'yes','12','no','yes'),(7,'Active IP addresses requests','Shows list of active IP address request','requests',NULL,'yes','6','yes','yes'),(8,'Last 5 informational logs','Shows list of last 5 informational logs','access_logs',NULL,'yes','6','yes','yes'),(9,'Last 5 warning / error logs','Shows list of last 5 warning and error logs','error_logs',NULL,'yes','6','yes','yes'),(10,'Tools menu','Shows quick access to tools menu','tools',NULL,'yes','6','no','yes'),(11,'IP Calculator','Shows IP calculator as widget','ipcalc',NULL,'yes','6','no','yes'),(12,'IP Request','IP Request widget','iprequest',NULL,'no','6','no','yes'),(13,'Threshold','Shows threshold usage for top 5 subnets','threshold',NULL,'yes','6','no','yes'),(14,'Inactive hosts','Shows list of inactive hosts for defined period','inactive-hosts','86400','yes','6','yes','yes'),(15,'Locations','Shows map of locations','locations',NULL,'yes','6','no','yes'),(16,'Bandwidth calculator','Calculate bandwidth','bw_calculator',NULL,'no','6','no','yes'),(17,'Customers','Shows customer list','customers',NULL,'yes','6','no','yes'),(18,'User Instructions','Shows user instructions','instructions',NULL,'yes','6','no','yes');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-08 13:54:28
