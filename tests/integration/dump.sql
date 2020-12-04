-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: phpipam
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

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
INSERT INTO `api` VALUES (1,'development','developcode',1,NULL,'ssl_code',0,0,0,0,'2020-12-04 16:23:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES (1,'subnet',1,1,'delete','success','2020-03-07 11:23:23','[details]: \r\n[id]. 1\r\n[subnet]. fd13.6d20.29dc.cf27..\r\n[mask]. 64\r\n[sectionId]. IPv6 (id 2)\r\n[description]. Private subnet 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. Root\r\n[allowRequests]. False\r\n[vlanId]. IPv6 private 1 [2001]\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(2,'section',2,1,'delete','success','2020-03-07 11:23:23','[details]: \r\n[id]. 2\r\n[name]. IPv6\r\n[description]. Section for IPv6 addresses\r\n[masterSection]. Root\r\n[permissions]. / \r\n[strictMode]. False\r\n[subnetOrdering]. / \r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 0\r\n[DNS]. / \r\n\r\n'),(3,'subnet',6,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 6\r\n[subnet]. 10.65.22.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. DHCP range\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 0.0.0.0/ [My folder] (id 5)\r\n[allowRequests]. True\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(4,'subnet',5,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 5\r\n[sectionId]. Customers (id 1)\r\n[description]. My folder\r\n[masterSubnetId]. Root\r\n[resolveDNS]. 0\r\n[customer_id]. / \r\n[isFolder]. 1\r\n[location]. None\r\n\r\n'),(5,'subnet',3,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 3\r\n[subnet]. 10.10.1.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(6,'subnet',4,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 4\r\n[subnet]. 10.10.2.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 2\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(7,'subnet',2,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 2\r\n[subnet]. 10.10.0.0\r\n[mask]. 16\r\n[sectionId]. Customers (id 1)\r\n[description]. Business customers\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. Root\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(8,'subnet',3,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 3\r\n[subnet]. 10.10.1.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(9,'subnet',4,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 4\r\n[subnet]. 10.10.2.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 2\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(10,'subnet',6,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 6\r\n[subnet]. 10.65.22.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. DHCP range\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 0.0.0.0/ [My folder] (id 5)\r\n[allowRequests]. True\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(11,'section',1,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 1\r\n[name]. Customers\r\n[description]. Section for customers\r\n[masterSection]. Root\r\n[permissions]. / \r\n[strictMode]. False\r\n[subnetOrdering]. / \r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 0\r\n[DNS]. / \r\n\r\n'),(12,'section',3,1,'add','success','2020-03-07 11:24:25','[details]: \r\n[name]. section1\r\n[description]. / \r\n[strictMode]. True\r\n[subnetOrdering]. default\r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 1\r\n[masterSection]. Root\r\n[permissions]. / \r\n[id]. 3\r\n\r\n'),(13,'section',4,1,'add','success','2020-03-07 11:24:36','[details]: \r\n[name]. section2\r\n[description]. / \r\n[strictMode]. True\r\n[subnetOrdering]. default\r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 1\r\n[masterSection]. Root\r\n[permissions]. / \r\n[id]. 4\r\n\r\n'),(14,'subnet',7,1,'add','success','2020-03-07 11:26:02','[details]: \r\n[id]. 7\r\n[isFolder]. 0\r\n[masterSubnetId]. Root\r\n[subnet]. 10.0.0.0\r\n[mask]. 8\r\n[description]. huge subnet\r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(15,'subnet',8,1,'add','success','2020-03-07 11:26:46','[details]: \r\n[id]. 8\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.0.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 10_FIRST [10]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(16,'ip_addr',11,1,'add','success','2020-03-07 11:26:59','[details]: \r\n[ip_addr]. 10.0.0.1\r\n[id]. 11\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host1\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(17,'ip_addr',12,1,'add','success','2020-03-07 11:27:11','[details]: \r\n[ip_addr]. 10.0.0.2\r\n[id]. 12\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host2\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(18,'subnet',9,1,'add','success','2020-03-07 11:27:40','[details]: \r\n[id]. 9\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.1.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 11_SCND [11]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(19,'ip_addr',13,1,'add','success','2020-03-07 11:27:50','[details]: \r\n[ip_addr]. 10.0.1.1\r\n[id]. 13\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host3\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(20,'ip_addr',14,1,'add','success','2020-03-07 11:28:03','[details]: \r\n[ip_addr]. 10.0.1.2\r\n[id]. 14\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host4\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(21,'subnet',10,1,'add','success','2020-03-07 11:28:56','[details]: \r\n[id]. 10\r\n[isFolder]. 0\r\n[masterSubnetId]. Root\r\n[subnet]. 172.16.0.0\r\n[mask]. 12\r\n[description]. / \r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(22,'subnet',11,1,'add','success','2020-03-07 11:29:26','[details]: \r\n[id]. 11\r\n[isFolder]. 0\r\n[masterSubnetId]. 172.16.0.0/12 (id 10)\r\n[subnet]. 172.16.0.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 12_THRD [12]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(23,'subnet',12,1,'add','success','2020-03-07 11:30:01','[details]: \r\n[id]. 12\r\n[isFolder]. 0\r\n[masterSubnetId]. 172.16.0.0/12 (id 10)\r\n[subnet]. 172.16.1.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 13_4TH [13]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(24,'ip_addr',15,1,'add','success','2020-03-07 11:30:20','[details]: \r\n[ip_addr]. 172.16.0.1\r\n[id]. 15\r\n[subnetId]. 172.16.0.0/24 (id 11)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host5\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(25,'ip_addr',16,1,'add','success','2020-03-07 11:30:29','[details]: \r\n[ip_addr]. 172.16.0.2\r\n[id]. 16\r\n[subnetId]. 172.16.0.0/24 (id 11)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host6\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(26,'ip_addr',17,1,'add','success','2020-03-07 11:30:50','[details]: \r\n[ip_addr]. 172.16.1.1\r\n[id]. 17\r\n[subnetId]. 172.16.1.0/24 (id 12)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host7\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(27,'ip_addr',18,1,'add','success','2020-03-07 11:31:01','[details]: \r\n[ip_addr]. 172.16.1.2\r\n[id]. 18\r\n[subnetId]. 172.16.1.0/24 (id 12)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host8\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(28,'ip_addr',11,1,'edit','success','2020-03-07 12:39:03','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => dmz, group1\r\n'),(29,'ip_addr',12,1,'edit','success','2020-03-07 12:39:20','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => group2\r\n'),(30,'ip_addr',13,1,'edit','success','2020-03-07 12:39:37','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(31,'ip_addr',14,1,'edit','success','2020-03-07 12:39:45','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(32,'ip_addr',15,1,'edit','success','2020-03-07 12:40:11','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => dmz, group2\r\n'),(33,'ip_addr',16,1,'edit','success','2020-03-07 12:40:20','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(34,'ip_addr',16,1,'edit','success','2020-03-07 12:40:31','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: web1 => NULL\r\n'),(35,'ip_addr',11,1,'edit','success','2020-03-11 11:27:18','[hostname]: host1 => host1.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(36,'ip_addr',12,1,'edit','success','2020-03-11 11:27:28','[hostname]: host2 => host2.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(37,'ip_addr',19,1,'add','success','2020-03-11 11:27:40','[details]: \r\n[ip_addr]. 10.0.0.3\r\n[id]. 19\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(38,'ip_addr',20,1,'add','success','2020-03-11 11:27:52','[details]: \r\n[ip_addr]. 10.0.0.4\r\n[id]. 20\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid.hostname\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(39,'ip_addr',21,1,'add','success','2020-03-11 11:28:10','[details]: \r\n[ip_addr]. 10.0.0.5\r\n[id]. 21\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. moreinvalid.hostname.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(40,'ip_addr',21,1,'edit','success','2020-03-11 11:28:38','[hostname]: moreinvalid.hostname.local => moreinvalid..hostname.l\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(41,'ip_addr',13,1,'edit','success','2020-03-11 11:29:05','[hostname]: host3 => host3.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(42,'ip_addr',14,1,'edit','success','2020-03-11 11:29:10','[hostname]: host4 => host4.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(43,'ip_addr',15,1,'edit','success','2020-03-11 11:29:22','[hostname]: host5 => host5.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(44,'ip_addr',16,1,'edit','success','2020-03-11 11:29:28','[hostname]: host6 => host6.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(45,'ip_addr',17,1,'edit','success','2020-03-11 11:29:42','[hostname]: host7 => host7.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(46,'ip_addr',18,1,'edit','success','2020-03-11 11:29:52','[hostname]: host8 => host8.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(47,'ip_addr',22,1,'add','success','2020-05-08 15:53:13','[details]: \r\n[ip_addr]. 10.0.1.3\r\n[id]. 22\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. WINDOWS.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(48,'ip_addr',23,1,'add','success','2020-05-21 10:30:21','[details]: \r\n[ip_addr]. 10.0.0.6\r\n[id]. 23\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. gateway.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[is_gateway]. True\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(49,'ip_addr',24,1,'add','success','2020-05-21 10:44:24','[details]: \r\n[ip_addr]. 10.0.1.4\r\n[id]. 24\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid.i\r\n[description]. invalid gateway hostname but valid gateway ip\r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(50,'ip_addr',24,1,'edit','success','2020-05-21 10:44:37','[is_gateway]: False => True\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(51,'ip_addr',22,1,'edit','success','2020-05-21 10:48:43','[is_gateway]: False => True\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(52,'ip_addr',24,1,'edit','success','2020-05-21 10:48:51','[is_gateway]: False => True\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(53,'subnet',13,1,'add','success','2020-05-21 10:51:41','[details]: \r\n[id]. 13\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.2.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(54,'ip_addr',25,1,'add','success','2020-05-21 10:52:05','[details]: \r\n[ip_addr]. 10.0.2.1\r\n[id]. 25\r\n[subnetId]. 10.0.2.0/24 (id 13)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. lonely.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. lonely_group\r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(55,'ip_addr',11,1,'edit','success','2020-12-04 15:44:19','[description]: NULL => this is host host1.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(56,'ip_addr',12,1,'edit','success','2020-12-04 15:44:43','[description]: NULL => this is host host2.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(57,'ip_addr',22,1,'edit','success','2020-12-04 15:45:14','[description]: NULL => a host based on windows os\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(58,'ip_addr',14,1,'edit','success','2020-12-04 16:17:25','[description]: NULL => characters \"not allowed\"\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipaddresses`
--

LOCK TABLES `ipaddresses` WRITE;
/*!40000 ALTER TABLE `ipaddresses` DISABLE KEYS */;
INSERT INTO `ipaddresses` VALUES (11,8,'167772161',NULL,'this is host host1.localdomain.local','host1.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 14:44:19',NULL,'dmz, group1'),(12,8,'167772162',NULL,'this is host host2.localdomain.local','host2.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 14:44:43',NULL,'group2'),(13,9,'167772417',0,NULL,'host3.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:44:37',NULL,'web1'),(14,9,'167772418',NULL,'characters \"not allowed\"','host4.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 15:17:25',NULL,'web1'),(15,11,'2886729729',NULL,NULL,'host5.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:22',NULL,'dmz, group2'),(16,11,'2886729730',NULL,NULL,'host6.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:28',NULL,NULL),(17,12,'2886729985',NULL,NULL,'host7.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:42',NULL,NULL),(18,12,'2886729986',NULL,NULL,'host8.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:52',NULL,NULL),(19,8,'167772163',0,NULL,'invalid',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:30:21',NULL,NULL),(20,8,'167772164',0,NULL,'invalid.hostname',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:30:21',NULL,NULL),(21,8,'167772165',0,NULL,'moreinvalid..hostname.l',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:30:21',NULL,NULL),(22,9,'167772419',NULL,'a host based on windows os','WINDOWS.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 14:45:14',NULL,NULL),(23,8,'167772166',1,NULL,'gateway.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,NULL,NULL,NULL),(24,9,'167772420',1,'invalid gateway hostname but valid gateway ip','invalid.i',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:48:51',NULL,NULL),(25,13,'167772673',NULL,NULL,'lonely.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,NULL,NULL,'lonely_group');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,'2020-03-07 11:20:18',NULL,'172.20.0.1','Database installation','Database installed successfully. Version 1.4.026 installed'),(2,2,'2020-03-07 11:20:57','admin','172.20.0.1','User login','Invalid username or password'),(3,0,'2020-03-07 11:21:02','admin','172.20.0.1','User login','User phpIPAM Admin logged in'),(4,0,'2020-03-07 11:22:15','Admin','172.20.0.1','settings object 1 edit','Object id=1 in settings edited id: 1 siteTitle: phpipam siteDomain: domain.local siteURL: http.//localhost siteLoginText: NULL prettyLinks: No defaultLang: 0 inactivityTimeout: 3600 siteAdminName: Sysadmin siteAdminMail: admin@domain.local api: 1 enableIPrequests: 0 enableMulticast: 0 enableRACK: 1 enableCircuits: 1 enableLocations: 1 enableSNMP: 0 enablePSTN: 0 enableCustomers: 1 enableThreshold: 1 enableVRF: 0 enableDNSresolving: 0 vlanDuplicate: 1 decodeMAC: 1 vlanMax: 4096 enableChangelog: 1 tempShare: 0 enableNAT: 1 enablePowerDNS: 0 updateTags: 0 enforceUnique: 1 enableRouting: 0 enableFirewallZones: 0 maintaneanceMode: 0 permissionPropagate: 1 link_field: NULL log: Database donate: 0 visualLimit: 24 theme: dark subnetOrdering: subnet,asc subnetView: 0 scanPingType: ping pingStatus: 1800;3600 scanPingPath: /bin/ping scanFPingPath: /bin/fping scanMaxThreads: 128'),(5,0,'2020-03-07 11:22:57','Admin','172.20.0.1','api object creation','New api database object created id: NULL app_id: development app_code: developcode app_permissions: 0 app_security: ssl_code app_lock: 0 app_lock_wait: 0 app_nest_custom_fields: 0 app_show_links: 0 app_comment: NULL'),(6,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Subnet truncate','Subnet Private subnet 1 id 1 truncated'),(7,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Subnet Private subnet 1 delete','Subnet Private subnet 1 deleted id: 1 subnet: 336395549904799703390415618052362076160 mask: 64 sectionId: 2 description: Private subnet 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 1 vlanId: 1 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: fd13.6d20.29dc.cf27..'),(8,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Section IPv6 delete','Section IPv6 deleted id: 2 name: IPv6 description: Section for IPv6 addresses masterSection: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} strictMode: 1 subnetOrdering: / order: / editDate: / showVLAN: 0 showVRF: 0 showSupernetOnly: 0 DNS: /'),(9,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet My folder id 5 truncated'),(10,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet DHCP range id 6 truncated'),(11,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet DHCP range delete','Subnet DHCP range deleted id: 6 subnet: 172037632 mask: 24 sectionId: 1 description: DHCP range linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 5 allowRequests: 0 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.65.22.0'),(12,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet My folder id 5 truncated'),(13,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet My folder delete','Subnet My folder deleted id: 5 subnet: 0 mask: / sectionId: 1 description: My folder linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 0 vlanId: 0 showName: 0 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 1 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 0.0.0.0'),(14,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(15,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 1 id 3 truncated'),(16,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Customer 1 delete','Subnet Customer 1 deleted id: 3 subnet: 168427776 mask: 24 sectionId: 1 description: Customer 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.1.0'),(17,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(18,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 2 id 4 truncated'),(19,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Customer 2 delete','Subnet Customer 2 deleted id: 4 subnet: 168428032 mask: 24 sectionId: 1 description: Customer 2 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.2.0'),(20,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(21,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Business customers delete','Subnet Business customers deleted id: 2 subnet: 168427520 mask: 16 sectionId: 1 description: Business customers linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.0.0'),(22,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 1 id 3 truncated'),(23,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet Customer 1 delete','Subnet Customer 1 deleted id: 3 subnet: 168427776 mask: 24 sectionId: 1 description: Customer 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.1.0'),(24,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet truncate','Subnet Customer 2 id 4 truncated'),(25,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet Customer 2 delete','Subnet Customer 2 deleted id: 4 subnet: 168428032 mask: 24 sectionId: 1 description: Customer 2 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.2.0'),(26,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet truncate','Subnet DHCP range id 6 truncated'),(27,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet DHCP range delete','Subnet DHCP range deleted id: 6 subnet: 172037632 mask: 24 sectionId: 1 description: DHCP range linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 5 allowRequests: 0 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.65.22.0'),(28,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Section Customers delete','Section Customers deleted id: 1 name: Customers description: Section for customers masterSection: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} strictMode: 1 subnetOrdering: / order: / editDate: / showVLAN: 0 showVRF: 0 showSupernetOnly: 0 DNS: /'),(29,0,'2020-03-07 11:24:25','Admin','172.20.0.1','Section created','New section created name: section1 description: NULL strictMode: 1 subnetOrdering: default showVLAN: 1 showVRF: 1 showSupernetOnly: 1 masterSection: 0 permissions: [] id: 3'),(30,0,'2020-03-07 11:24:36','Admin','172.20.0.1','Section created','New section created name: section2 description: NULL strictMode: 1 subnetOrdering: default showVLAN: 1 showVRF: 1 showSupernetOnly: 1 masterSection: 0 permissions: [] id: 4'),(31,0,'2020-03-07 11:24:55','Admin','172.20.0.1','api object 1 edit','Object id=1 in api edited id: 1 app_id: development app_code: developcode app_permissions: 1 app_security: ssl_code app_lock: 0 app_lock_wait: 0 app_nest_custom_fields: 0 app_show_links: 0 app_comment: NULL'),(32,2,'2020-03-07 11:25:51','Admin','172.20.0.1','Subnet creation','Failed to add new subnetSQLSTATE[22007]: Invalid datetime format: 1366 Incorrect integer value: \'Add\' for column `phpipam`.`subnets`.`vlanId` at row 1'),(33,0,'2020-03-07 11:26:02','Admin','172.20.0.1','Subnet created','New subnet created id: 7 isFolder: 0 masterSubnetId: 0 subnet: 167772160 mask: 8 description: huge subnet vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(34,0,'2020-03-07 11:26:37','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 10 name: 10_FIRST description: NULL domainId: 1 customer_id: NULL'),(35,0,'2020-03-07 11:26:46','Admin','172.20.0.1','Subnet created','New subnet created id: 8 isFolder: 0 masterSubnetId: 7 subnet: 167772160 mask: 24 description: NULL vlanId: 3 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(36,0,'2020-03-07 11:26:59','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.0.1 action: add id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: zSo7Yfy7ggwVtMUAXkyGBJZWWwL8oNkx hostname: host1 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(37,0,'2020-03-07 11:27:11','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.0.2 action: add id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: KUFQt8CaAc-nR2mEOBCfNF0tL5r3lwdH hostname: host2 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(38,0,'2020-03-07 11:27:37','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 11 name: 11_SCND description: NULL domainId: 1 customer_id: NULL'),(39,0,'2020-03-07 11:27:40','Admin','172.20.0.1','Subnet created','New subnet created id: 9 isFolder: 0 masterSubnetId: 7 subnet: 167772416 mask: 24 description: NULL vlanId: 4 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(40,0,'2020-03-07 11:27:50','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.1.1 action: add id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: m6OlwrYlW0r-jyzisBf7_8p6vKH960f3 hostname: host3 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(41,0,'2020-03-07 11:28:03','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.1.2 action: add id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: im0pQgsa2cVigLp6o41583j6z8Wxy-HZ hostname: host4 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(42,0,'2020-03-07 11:28:56','Admin','172.20.0.1','Subnet created','New subnet created id: 10 isFolder: 0 masterSubnetId: 0 subnet: 2886729728 mask: 12 description: NULL vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(43,0,'2020-03-07 11:29:21','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 12 name: 12_THRD description: NULL domainId: 1 customer_id: NULL'),(44,0,'2020-03-07 11:29:26','Admin','172.20.0.1','Subnet created','New subnet created id: 11 isFolder: 0 masterSubnetId: 10 subnet: 2886729728 mask: 24 description: NULL vlanId: 5 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(45,0,'2020-03-07 11:29:57','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 13 name: 13_4TH description: NULL domainId: 1 customer_id: NULL'),(46,0,'2020-03-07 11:30:01','Admin','172.20.0.1','Subnet created','New subnet created id: 12 isFolder: 0 masterSubnetId: 10 subnet: 2886729984 mask: 24 description: NULL vlanId: 6 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(47,0,'2020-03-07 11:30:20','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.0.1 action: add id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 172.16.0.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: qquRP0lOWvltnCdfsr0AQBsqeOWF-QTh hostname: host5 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(48,0,'2020-03-07 11:30:29','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.0.2 action: add id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 172.16.0.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: F5VZqR6FpHykKIjLrIesv0va6aD-Ekxj hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(49,0,'2020-03-07 11:30:50','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.1.1 action: add id: 17 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 172.16.1.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: HiscF1SBKjl1sI73w8WVDl7Lc40fAcs7 hostname: host7 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(50,0,'2020-03-07 11:31:01','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.1.2 action: add id: 18 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 172.16.1.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 4OGwZO6DRsZ8w_-0Zh7whmRWlTFp1c_s hostname: host8 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(51,0,'2020-03-07 12:37:14','Admin','172.22.0.1','User logged out','User Admin has logged out'),(52,0,'2020-03-07 12:37:21','admin','172.22.0.1','User login','User phpIPAM Admin logged in'),(53,0,'2020-03-07 12:38:36','Admin','172.22.0.1','Custom field add','Custom Field add success (custom_ansible_groups) name: custom_ansible_groups oldname:  action: add table: ipaddresses csrf_cookie: Qa1WanrrZR6HBHBUgP1qnW80JHE0iuMt Comment: field add the host to a ansible group fieldType: text fieldSize:  fieldDefault:  ftype: text'),(54,0,'2020-03-07 12:39:03','Admin','172.22.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: vMCK38RTFw051AhucvL7Rl3rjsqeAKIS nostrict: yes hostname: host1 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(55,0,'2020-03-07 12:39:20','Admin','172.22.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: Buh1RYx4aTMjZKa8ucWJo4tI7WKgDrdT nostrict: yes hostname: host2 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(56,0,'2020-03-07 12:39:37','Admin','172.22.0.1','Address updated','Address 10.0.1.1 updated ip_addr: 10.0.1.1 action: edit id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772417 mac_old: NULL PTR: 0 addressId: 13 csrf_cookie: 02FLnUYNc37phrWkyl0m1cdlqQyP48jT nostrict: yes hostname: host3 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(57,0,'2020-03-07 12:39:45','Admin','172.22.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: tMLuzkicihuBqgtKVvvQOM8ID71H9uZw nostrict: yes hostname: host4 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(58,0,'2020-03-07 12:40:11','Admin','172.22.0.1','Address updated','Address 172.16.0.1 updated ip_addr: 172.16.0.1 action: edit id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729729 mac_old: NULL PTR: 0 addressId: 15 csrf_cookie: D5GnFXwZ6jN9F-6F535BwKUxL0vOgILT nostrict: yes hostname: host5 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(59,0,'2020-03-07 12:40:20','Admin','172.22.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: Nv_P-qb9PiJU5mhhyygLJQv5dN3fA9h3 nostrict: yes hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(60,0,'2020-03-07 12:40:31','Admin','172.22.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: uOhx68wZvJTJ7C81hg0dZnJTuaw4gYJo nostrict: yes hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(61,0,'2020-03-07 13:08:41','Admin','172.22.0.1','settings object 1 edit','Object id=1 in settings edited id: 1 siteTitle: phpipam siteDomain: domain.local siteURL: http.//localhost siteLoginText: NULL prettyLinks: Yes defaultLang: 0 inactivityTimeout: 3600 siteAdminName: Sysadmin siteAdminMail: admin@domain.local api: 1 enableIPrequests: 0 enableMulticast: 0 enableRACK: 1 enableCircuits: 1 enableLocations: 1 enableSNMP: 0 enablePSTN: 0 enableCustomers: 1 enableThreshold: 1 enableVRF: 0 enableDNSresolving: 0 vlanDuplicate: 1 decodeMAC: 1 vlanMax: 4096 enableChangelog: 1 tempShare: 0 enableNAT: 1 enablePowerDNS: 0 updateTags: 0 enforceUnique: 1 enableRouting: 0 enableFirewallZones: 0 maintaneanceMode: 0 permissionPropagate: 1 link_field: NULL log: Database donate: 0 visualLimit: 24 theme: dark subnetOrdering: subnet,asc subnetView: 0 scanPingType: ping pingStatus: 1800;3600 scanPingPath: /bin/ping scanFPingPath: /bin/fping scanMaxThreads: 128'),(62,2,'2020-03-11 11:26:50','root','172.18.0.1','User login','Invalid username'),(63,2,'2020-03-11 11:26:53','root','172.18.0.1','User login','Invalid username'),(64,0,'2020-03-11 11:26:58','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(65,0,'2020-03-11 11:27:18','Admin','172.18.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: Izd4r3L4KsCcy3kkQhHgIPll-GTvkoi_ nostrict: yes hostname: host1.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(66,0,'2020-03-11 11:27:28','Admin','172.18.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: a-V9nQ-YjXanlu5Q9zlL1GKUXHU6HfM2 nostrict: yes hostname: host2.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(67,0,'2020-03-11 11:27:40','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.3 action: add id: 19 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.3 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 7QcJkJCM3AubgVq2e6XKPD_0iiKagMVF hostname: invalid description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(68,0,'2020-03-11 11:27:52','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.4 action: add id: 20 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.4 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 8uXMH80PUCCgpgT0pJzrRWY9hflV9m_O hostname: invalid.hostname description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(69,0,'2020-03-11 11:28:10','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.5 action: add id: 21 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.5 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: Dj1JKJaRSo4eWVPDjTgP8MWGbSIrjfxq hostname: moreinvalid.hostname.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(70,0,'2020-03-11 11:28:38','Admin','172.18.0.1','Address updated','Address 10.0.0.5 updated ip_addr: 10.0.0.5 action: edit id: 21 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772165 mac_old: NULL PTR: 0 addressId: 21 csrf_cookie: wFQDKpcC_PDFBq2Aj4SflykvJIWUMUe6 nostrict: yes hostname: moreinvalid..hostname.l description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(71,0,'2020-03-11 11:29:05','Admin','172.18.0.1','Address updated','Address 10.0.1.1 updated ip_addr: 10.0.1.1 action: edit id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772417 mac_old: NULL PTR: 0 addressId: 13 csrf_cookie: iRk_cvFPRLNtvqrJ0jsj0_1ZLlK6bDF5 nostrict: yes hostname: host3.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(72,0,'2020-03-11 11:29:10','Admin','172.18.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: 25w7ZWgutYxPGflfTH0zb0hEXIdqteuo nostrict: yes hostname: host4.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(73,0,'2020-03-11 11:29:22','Admin','172.18.0.1','Address updated','Address 172.16.0.1 updated ip_addr: 172.16.0.1 action: edit id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729729 mac_old: NULL PTR: 0 addressId: 15 csrf_cookie: CDN-eLZgybAG37Abjxieu3zxj17mFkuP nostrict: yes hostname: host5.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(74,0,'2020-03-11 11:29:28','Admin','172.18.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: qA-GFeZEGa_vuDZVm6fpXRIT4Fu2difo nostrict: yes hostname: host6.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(75,0,'2020-03-11 11:29:42','Admin','172.18.0.1','Address updated','Address 172.16.1.1 updated ip_addr: 172.16.1.1 action: edit id: 17 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 2886729985 mac_old: NULL PTR: 0 addressId: 17 csrf_cookie: mtTkxpWzK2TZeAAAlwgHY7E2P_1mimaw nostrict: yes hostname: host7.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(76,0,'2020-03-11 11:29:52','Admin','172.18.0.1','Address updated','Address 172.16.1.2 updated ip_addr: 172.16.1.2 action: edit id: 18 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 2886729986 mac_old: NULL PTR: 0 addressId: 18 csrf_cookie: QqvBDxBIYnUt6sK1AZ4hdU-tQ7RiImVc nostrict: yes hostname: host8.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(77,2,'2020-05-08 15:52:03','root','172.18.0.1','User login','Invalid username'),(78,0,'2020-05-08 15:52:13','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(79,0,'2020-05-08 15:53:13','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.1.3 action: add id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.3 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 1uXnKB99ml-37_E3Z5VJvtYXZfB8PNLU hostname: WINDOWS.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(80,2,'2020-05-21 10:29:26','root','172.18.0.1','User login','Invalid username'),(81,0,'2020-05-21 10:29:32','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(82,0,'2020-05-21 10:30:21','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.6 action: add id: 23 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.6 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: FR91Hnm12VeJ6GEZ94_nkthCrFLvsCUt hostname: gateway.localdomain.local description: NULL mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(83,0,'2020-05-21 10:44:24','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.1.4 action: add id: 24 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.4 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: x2tNfl9gDQpRxuThSzyHXpU1yGKvp6e3 hostname: invalid.i description: invalid gateway hostname but valid gateway ip mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(84,0,'2020-05-21 10:44:37','Admin','172.18.0.1','Address updated','Address 10.0.1.4 updated ip_addr: 10.0.1.4 action: edit id: 24 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772420 mac_old: NULL PTR: 0 addressId: 24 csrf_cookie: NYEAsSuVsYxbibhET_ctjfOuFeTTYLRZ nostrict: yes hostname: invalid.i description: invalid gateway hostname but valid gateway ip mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(85,0,'2020-05-21 10:48:43','Admin','172.18.0.1','Address updated','Address 10.0.1.3 updated ip_addr: 10.0.1.3 action: edit id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772419 mac_old: NULL PTR: 0 addressId: 22 csrf_cookie: t-C98w_35yfRAMAlS93vq6q-OzJ1mxm7 nostrict: yes hostname: WINDOWS.localdomain.local description: NULL mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(86,0,'2020-05-21 10:48:51','Admin','172.18.0.1','Address updated','Address 10.0.1.4 updated ip_addr: 10.0.1.4 action: edit id: 24 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772420 mac_old: NULL PTR: 0 addressId: 24 csrf_cookie: Ut9pIsab92TD0FXzxsla9UmWblzVfotU nostrict: yes hostname: invalid.i description: invalid gateway hostname but valid gateway ip mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(87,0,'2020-05-21 10:51:41','Admin','172.18.0.1','Subnet created','New subnet created id: 13 isFolder: 0 masterSubnetId: 7 subnet: 167772672 mask: 24 description: NULL vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(88,0,'2020-05-21 10:52:05','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.2.1 action: add id: 25 subnet: 10.0.2.0/24 subnetId: 13 section: 3 subnetvlan: 0 ip_addr_old: 10.0.2.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: Z-w43WIQDld1UK7O1i2yDvrwZYPiWplG hostname: lonely.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: lonely_group PTRignore: 0 excludePing: 0 type: single'),(89,2,'2020-12-04 15:43:11','root','172.18.0.1','User login','Invalid username'),(90,2,'2020-12-04 15:43:20','admin','172.18.0.1','User login','Invalid username or password'),(91,0,'2020-12-04 15:43:23','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(92,1,'2020-12-04 15:43:35','Admin','172.18.0.1','Database upgrade','Database upgraded from version 1.4.r25 to version 1.42.r25'),(93,0,'2020-12-04 15:44:19','Admin','172.18.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: iU0jE1AgCoYFyznhgSGFYpRtqAJOpVp8 nostrict: yes hostname: host1.localdomain.local description: this is host host1.localdomain.local mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(94,0,'2020-12-04 15:44:43','Admin','172.18.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: IBEj9B-lFxKnDOn_ERT8hX9kL2wDzk4S nostrict: yes hostname: host2.localdomain.local description: this is host host2.localdomain.local mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(95,0,'2020-12-04 15:45:14','Admin','172.18.0.1','Address updated','Address 10.0.1.3 updated ip_addr: 10.0.1.3 action: edit id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772419 mac_old: NULL PTR: 0 addressId: 22 csrf_cookie: ZnN2XAmofrRYTtO4VGD8o_TOD9dWe3z5 nostrict: yes hostname: WINDOWS.localdomain.local description: a host based on windows os mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(96,0,'2020-12-04 16:17:25','Admin','172.18.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: iFri0SdeTkxUKEx4jMlpXTVwEmM7HlV5 nostrict: yes hostname: host4.localdomain.local description: characters \"not allowed\" mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL');
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
INSERT INTO `php_sessions` VALUES ('00cf1jhf3v00l53eev0n13q4gr',1590051524,'','172.18.0.5'),('00iqbqgugki1j7m1i13koa7o0d',1607094939,'','172.18.0.5'),('00pis5sl4g5r9l45k7gnuq6no8',1590049886,'','172.18.0.5'),('01230469a9qggle1mgqadnej3p',1590051521,'','172.18.0.5'),('014pqb2nemt1e043agk9on32e4',1590050693,'','172.18.0.5'),('028gfrgj2r8lqkc95jdoj3mkqm',1607094879,'','172.18.0.5'),('03024r494jbegtkjq275ek5cep',1590051137,'','172.18.0.5'),('0360ftd8mdtgsd6bd0r3dno73d',1590051542,'','172.18.0.5'),('04q84f80hsabcndop4d8m1r7ht',1607094821,'','172.18.0.5'),('056fi256te13dim747vhlbv6k0',1590050405,'','172.18.0.5'),('061ctphv997mkhkd4mu9fcts4l',1590050522,'','172.18.0.5'),('06488dkcvt2cfqotstdp038d86',1607095001,'','172.18.0.5'),('0787qel366d208hi2c9iglq4ap',1590050522,'','172.18.0.5'),('08b3d8ea58bo8ut6qj0emaggsf',1607093517,'','172.18.0.5'),('0aincu585ktm9ma3u71l9pcp3l',1607095170,'','172.18.0.5'),('0akim3920bc388ma6k0f6a64oc',1590050845,'','172.18.0.5'),('0argcibcqn7sn9d93ev9ttp4s3',1607093250,'','172.18.0.5'),('0blub8q8d7hb8jsqqoetgesdmo',1590050688,'','172.18.0.5'),('0c1he8bn8b5q482p5tj1ps3e63',1590051135,'','172.18.0.5'),('0cms6pbaj4fgr7qkm11senc70t',1590050944,'','172.18.0.5'),('0cutfrcrhmhh05f8dqiruke2j2',1607095396,'','172.18.0.5'),('0e836c98cgmq6rpaj7a0prbtt6',1607095000,'','172.18.0.5'),('0f8kohgjs12verrr6926ung87f',1607094716,'','172.18.0.5'),('0f9o1ucbqcib87oq3ljf9oepqa',1607093517,'','172.18.0.5'),('0g9s565aakna1h0e899hfip37v',1590051475,'','172.18.0.5'),('0gr3vnsbco8jrmsl71omocq571',1607095348,'','172.18.0.5'),('0hk5t1658308esadrdaeaa9ef3',1590050403,'','172.18.0.5'),('0i8fd89qu4bopf2f6n4q32bfqd',1590051478,'','172.18.0.5'),('0iaq1sio2djmvrgllvrv086o9m',1590050009,'','172.18.0.5'),('0j1b0dphu1lt9dn38o6nllm25f',1590050688,'','172.18.0.5'),('0ju87ucu5b3dqb7eptg7g35lk2',1590050009,'','172.18.0.5'),('0k0a4h07fff04m77in42romcgq',1607093250,'','172.18.0.5'),('0kflre7ims72ug4psnca32q6fh',1607095396,'','172.18.0.5'),('0kg59ic004cbobtrgskntmpqn6',1590050474,'','172.18.0.5'),('0la42mu4s4de2igl6pvchic1au',1607095052,'','172.18.0.5'),('0la6fbcc4baeba3ui21gns4brv',1607093517,'','172.18.0.5'),('0m978lh27j1tq7g60v5d0t96is',1590050577,'','172.18.0.5'),('0mdr09mv74ihi3h2kvk81fcsn6',1607093250,'','172.18.0.5'),('0mmuh9qkeos4rhmsapka9mtq4k',1590049886,'','172.18.0.5'),('0mqjp9lcrvn1g7d2kqpc435c5u',1590051424,'','172.18.0.5'),('0n3blfo0oqqih8qcd4m8400uba',1590051524,'','172.18.0.5'),('0ndgt7s8tn033bvrtkqjm6d765',1607094822,'','172.18.0.5'),('0ossf2hccaqn74s2f5gmfjdvpf',1607094879,'','172.18.0.5'),('0p1a3r4bqlpf41ffesjjp858h6',1607095169,'','172.18.0.5'),('0p81dfogdlrl7967g2a557oh3s',1590050403,'','172.18.0.5'),('0pcebu28tsv9ipbf0dvlqjaud8',1590050471,'','172.18.0.5'),('0picvncl3a54cuncej9e6a4stt',1590051138,'','172.18.0.5'),('0plavc0r9g7v1q5ubaa8hoi7pf',1590050948,'','172.18.0.5'),('0qnb9cdb4etcv20hh49qocrnj5',1607094821,'','172.18.0.5'),('0ri1lerqg447ad9m83p2ak8l6a',1590051545,'','172.18.0.5'),('0rphcudo0jpdlmn652altrsmdt',1607095347,'','172.18.0.5'),('0rqenf25dl4jv89mdsfo80egnj',1590051545,'','172.18.0.5'),('0rtbgnql4m6fi00a7cektg5fv8',1590050403,'','172.18.0.5'),('0s4rl1h2b91h5oq6skrnqmtusb',1590050849,'','172.18.0.5'),('0s93e3hh4u9chlpj0ul73fp0oa',1590051478,'','172.18.0.5'),('0sufltqk3bbnf1pnb7bo0k4ic3',1590051521,'','172.18.0.5'),('0t2ivf3jhnjom5b4sim57fn7qa',1590049886,'','172.18.0.5'),('0t42bshm535sv7svu56d9c9aqb',1590050574,'','172.18.0.5'),('0tp9pf0aeqho7pkcldn2ns3u40',1607095052,'','172.18.0.5'),('0tpcaqj2gh1ucbhomm8nsjk4mo',1590050471,'','172.18.0.5'),('0u8nfaqpad0a5soq1khnc4dtr1',1590051476,'','172.18.0.5'),('0unl575unbperfadgisar27hgk',1607094622,'','172.18.0.5'),('0v5rr0e7nvfu4f541ha9j119qu',1590051134,'','172.18.0.5'),('0vol3ra3rajacmpdrk6mhg8hub',1607095348,'','172.18.0.5'),('0vu6ctqgf7ubg33fgsf485u71t',1590051026,'','172.18.0.5'),('1045b2vo8ava7qseibpja1d7qn',1590050522,'','172.18.0.5'),('10p6sd673varoe7fk67davv45k',1590051134,'','172.18.0.5'),('11m5kih6sm95r92s6ikdurld5l',1590050522,'','172.18.0.5'),('11qglu2ib035hqt1nctj6rh90o',1590051421,'','172.18.0.5'),('11smj6bsk05h0nc86c1aapjmnu',1590051521,'','172.18.0.5'),('11tj32qs0gs9lik8hhl8i2c760',1607093250,'','172.18.0.5'),('12bbrgriirqics5r3l3701hj25',1607094671,'','172.18.0.5'),('13178i08bcpoml1d83ou470v5q',1607094821,'','172.18.0.5'),('14298lrp711m4ottnhofg1v7l5',1590051138,'','172.18.0.5'),('14cmc9rcv3kuaegb3b19s42l7g',1607094879,'','172.18.0.5'),('14mvp5p4ih3tn0avaldvosk6hf',1590050574,'','172.18.0.5'),('14qatupelsic7gfneqljgd0vmn',1607093250,'','172.18.0.5'),('1550ftrqrt3v9ggejqrqupbt6n',1590051421,'','172.18.0.5'),('157n8mdcs14kf064tcq9d9g925',1607093329,'','172.18.0.5'),('158nr7t39n46guo1vv623nekv2',1590050525,'','172.18.0.5'),('16atlrec7kqj0bta0406lp7k2a',1590051520,'','172.18.0.5'),('1771nb455sls5s4fin64fo03o4',1607093250,'','172.18.0.5'),('17jd5a129e8er85vghosni23rt',1590050689,'','172.18.0.5'),('17mfmiu050qsppgj747qn7hbb0',1607094940,'','172.18.0.5'),('17rlv27fpo9pef18fobk41kbpe',1607095169,'','172.18.0.5'),('18lch82i7quia4jd9c8ba7i6rv',1590050948,'','172.18.0.5'),('18o146v8vgo4theflt0emp08ca',1590050525,'','172.18.0.5'),('196qls6385jf37qpthmu8qlb0s',1590051521,'','172.18.0.5'),('196u36k7pbotflqk0sv1k2t2tv',1607094822,'','172.18.0.5'),('1a6fk491s9p3n7r021flpj3ov5',1607094622,'','172.18.0.5'),('1agjusb80atk4hfgc2p68gp9f8',1590051524,'','172.18.0.5'),('1amlk2t3n4kjvcjauj2savb3r9',1590051022,'','172.18.0.5'),('1ariol7e5n9i4pdog4mr65bhsc',1590050525,'','172.18.0.5'),('1b2db5li5n6qtvte5i3ijb1im3',1607093866,'','172.18.0.5'),('1bc7471dolbd0tsepbgenqnnvd',1607094939,'','172.18.0.5'),('1csi4d3bjd14bosri6lbbeemap',1590050472,'','172.18.0.5'),('1d32rl3fvecvkcg1tv9dloptb7',1590051138,'','172.18.0.5'),('1d8ghad5tpm85kv2pc0mpor463',1590050522,'','172.18.0.5'),('1dh965ep5ribtbqspkbcudqett',1590050845,'','172.18.0.5'),('1dj719v0c1dahc5fe8nenh4b2o',1590051023,'','172.18.0.5'),('1dmkotqtuvhru1gulmvr9kj5gq',1607094939,'','172.18.0.5'),('1e145v7qu4cmkf7rfmq2nm3sd7',1590051135,'','172.18.0.5'),('1e2qqq4djtrtls5eh233f81otv',1590050522,'','172.18.0.5'),('1e4osinpgv85deetodnfivsr5f',1607095347,'','172.18.0.5'),('1eaqesum6d990aot8mjklb8f63',1590051521,'','172.18.0.5'),('1eca1es90q4soqqgf15hscgbbr',1590050403,'','172.18.0.5'),('1ffbnph7a7m3lhhpjfliblru6v',1590051478,'','172.18.0.5'),('1fjgivr2k5llhnt8l8igmdgl43',1607094822,'','172.18.0.5'),('1fokceuhrrbpqfk6rfp526jqge',1590050524,'','172.18.0.5'),('1hbjhgrb5lhuu6d4h5rrdlfkhi',1590050848,'','172.18.0.5'),('1i1786n98qgh65ale9rj1oecui',1590049886,'','172.18.0.5'),('1itn69k8dcslg2jbomba9v5du2',1607095348,'','172.18.0.5'),('1j4u6dm421o2fdrdt0bfm47vcd',1590051524,'','172.18.0.5'),('1j62chikni2lejjm9tlk80n8n3',1590051026,'','172.18.0.5'),('1j908gq5oi251idas3a4d38nai',1590051542,'','172.18.0.5'),('1juh9jah1n81s5kctm0behh5rf',1590051026,'','172.18.0.5'),('1k0d4kbftm36l53cc74k3aader',1590050848,'','172.18.0.5'),('1l4c9thma5ho55duso7f3mvpd0',1590051543,'','172.18.0.5'),('1lqbqhjsf81vkh3bb7l3o4vktt',1590051478,'','172.18.0.5'),('1mfu7fbepe1nunh2j3pbrrsrom',1607094939,'','172.18.0.5'),('1mrgv3ku8jhfquc0193qajt4mj',1607093329,'','172.18.0.5'),('1n81vrutgdg6881e3lgefguaho',1590051524,'','172.18.0.5'),('1nfmaqmcd0k5oo0ctsamecup5q',1590051523,'','172.18.0.5'),('1nrffsu8lrthc24d2apcmapr8l',1590051545,'','172.18.0.5'),('1ntg98r6lirmckhkp2bgbasebu',1590050403,'','172.18.0.5'),('1nvmka7jsblant8slre41p1rvd',1590050577,'','172.18.0.5'),('1okqmcuv8s1o77c62rbplg3tt3',1590051521,'','172.18.0.5'),('1q0bfkas8u6j2tn7f4hhkko4r9',1607094940,'','172.18.0.5'),('1q6523i3c60nbuqot07t0eqv8d',1590050945,'','172.18.0.5'),('1q75sn99vklv6lrkgf6825o89v',1607094670,'','172.18.0.5'),('1qai8pl8sqtav71oho6iqqnbu5',1590050949,'','172.18.0.5'),('1qbjob8phq1o3bjudg296dcutk',1607094880,'','172.18.0.5'),('1qten4n4kamg1hnleb7ghnf8t0',1607095052,'','172.18.0.5'),('1r2rq9878fjil9lmtv9huigh04',1590051135,'','172.18.0.5'),('1sej7pbsi4t43ir1fj6vlgsefc',1590050406,'','172.18.0.5'),('1tenqthf5b81fircnia275iptj',1590051424,'','172.18.0.5'),('1ukjopbit0ktf296a08b1e3i2l',1590051138,'','172.18.0.5'),('1uoqhcc3gk9ep981jmpl5f1d2j',1607095396,'','172.18.0.5'),('1vn3753rskorbic039k1c9pjn0',1590051134,'','172.18.0.5'),('204q9ps9kp8724i0pjagqquear',1590051475,'','172.18.0.5'),('226l0gsrh9ve1rci86p8s52vjq',1607095348,'','172.18.0.5'),('22bcjsv41898563gu19tist8rj',1607093250,'','172.18.0.5'),('231ejtuhptme4mcb2s76jvctve',1607094015,'','172.18.0.5'),('2373ervuqka5443jekbp4m7bk7',1590051478,'','172.18.0.5'),('23p0d4lh36klllv6hmvmjebl4c',1607094841,'','172.18.0.5'),('24oi2l799n4egdm17h1pjboepe',1607093250,'','172.18.0.5'),('24omsuiokl5g5tnnpi9939jg3a',1590050525,'','172.18.0.5'),('25261p42qr3a2p7a8k41qm4sm0',1590050946,'','172.18.0.5'),('25682e322l6a8ut6eenpfhgu4v',1590051421,'','172.18.0.5'),('25746g8kct3tarbo6e19i44dhr',1607095000,'','172.18.0.5'),('25phdthrrh6c7gte9un0j1hiav',1607093250,'','172.18.0.5'),('27pbepum3ffq0ovv17al94pl93',1590051476,'','172.18.0.5'),('289hb85jm76v9suhl2qd9j1a1p',1607094611,'','172.18.0.5'),('28p7ea4rvtf04sf64m5bq9gli5',1590050522,'','172.18.0.5'),('292lb2dgmjuk7sem7jjnhdu3eb',1607094879,'','172.18.0.5'),('29tlm7vuju6k2kj3mjbjups0rn',1590050406,'','172.18.0.5'),('2b1fbg19anmjce5pti44mgm85p',1607093330,'','172.18.0.5'),('2b2hgq5v6mrm78ovba37q7cki3',1607095348,'','172.18.0.5'),('2b74qq3ba1v8p3g7duu2gmf12r',1607093517,'','172.18.0.5'),('2bl0d9mrun77hm095htb153gbi',1590051478,'','172.18.0.5'),('2c5m6hj608fn4pakkhe7eudn7n',1590051026,'','172.18.0.5'),('2csu9usack7rkkk6gm0hmpsddp',1590049918,'','172.18.0.5'),('2d98fhnev0hu01j34fvdf2lkts',1607095348,'','172.18.0.5'),('2dafho23ki0tvl5lipfa3r40g8',1590051138,'','172.18.0.5'),('2dgfk7fbqm91tjnnjncbl398hf',1590049919,'','172.18.0.5'),('2e2bfg5r0cl19j2o4jte5sn7m7',1590049918,'','172.18.0.5'),('2em65qqg5nqv6efg9h6do79bqp',1590050949,'','172.18.0.5'),('2fogmstrl056iq4v6udfbgmmh3',1607095396,'','172.18.0.5'),('2fsoar820bee1flfs7r3c1ajmb',1590051521,'','172.18.0.5'),('2g5j4l1puvus58k117u82jop14',1590051520,'','172.18.0.5'),('2gh56vm5pup5l4m2gbhoumrb7i',1590051476,'','172.18.0.5'),('2hitmvaa04ah74jikat3he4m1s',1590050405,'','172.18.0.5'),('2i3olkeio83l6lt2bo8vhgenla',1607093250,'','172.18.0.5'),('2ira5vukt78rl4gd0fgqre6l2t',1607095052,'','172.18.0.5'),('2jf3hk3nc7t8cvidviksaonu3c',1607094939,'','172.18.0.5'),('2l974h03np9630nanb7ub5q6nl',1590050574,'','172.18.0.5'),('2ld40b33v8ol2e5733kjfbrgqc',1607093517,'','172.18.0.5'),('2llr5fqq1k9kb4pm2iknp6vrn8',1590051479,'','172.18.0.5'),('2lutkr3cgnoc7t96u4oe42md8m',1590050525,'','172.18.0.5'),('2man53dm04tmad4lbiqk28l7ss',1607093516,'','172.18.0.5'),('2maoetqhfj6q6i2ju1nevkopu6',1607094670,'','172.18.0.5'),('2mt4k4iq603tick76mivsbappt',1607094822,'','172.18.0.5'),('2njnfpntpnfn6684qiu01kulhe',1590050946,'','172.18.0.5'),('2nl5tvgjjol6cnok5klu3pdqn1',1590050845,'','172.18.0.5'),('2o552im1foq6hvj8r5e1pnplc1',1590050471,'','172.18.0.5'),('2odm8egseb3eu243sbvdoc8qal',1590051543,'','172.18.0.5'),('2oockdj8v82q06m7a80s5b30ln',1590051544,'','172.18.0.5'),('2pdq5oahih4sl900sp0u2jtc79',1607095000,'','172.18.0.5'),('2psqai1sl4ibjko1opmer5p9hq',1590050522,'','172.18.0.5'),('2q554tdp2jf2he6366mvo2q53n',1590050471,'','172.18.0.5'),('2q78ut7ttpab2faate06ji51nq',1590050521,'','172.18.0.5'),('2r72hsjq0q236uj9p0jnjjq099',1590050946,'','172.18.0.5'),('2r9v3br0b7mrlf07hsijs1j3ct',1607093331,'','172.18.0.5'),('2rk813sl7468t9v2js347e1t5u',1590050849,'','172.18.0.5'),('2rvui13b2um9282ohnc0t4sgct',1590050471,'','172.18.0.5'),('2sa91dv1mshhuo60o4dm48btog',1590051423,'','172.18.0.5'),('2sfcr03o5je16cqpskescguq1g',1590050574,'','172.18.0.5'),('2t3ibqhsltj1klf1p5b7vilaoq',1590050949,'','172.18.0.5'),('2tfpr18a25lila4gnaivq03keu',1607094880,'','172.18.0.5'),('2u69o63ieoam56qsa00f8cu54l',1590050473,'','172.18.0.5'),('2ua0ltleuh4tg23v27k5jbf3p4',1590050949,'','172.18.0.5'),('2ucdboilij06sjavjih7p41e1j',1590051521,'','172.18.0.5'),('2upu66qq4ma8qc1628i8p0f3sr',1590050576,'','172.18.0.5'),('2uur1r0oblmgm4f0fkj1bcb3av',1607095052,'','172.18.0.5'),('2v1cufetdv52ikvqnpd2ukotkl',1590051138,'','172.18.0.5'),('2v9aqg5ob6smh0idhlg8oar9ug',1590051543,'','172.18.0.5'),('2vt82ddilst803ctg8vm4lsi2u',1590050474,'','172.18.0.5'),('307ikgqf4h12d9mku2ao6b39c3',1590049918,'','172.18.0.5'),('308076s6r12rgeobqakkgpv4or',1590050692,'','172.18.0.5'),('30ibk275gbmfto891negn0ugam',1590050474,'','172.18.0.5'),('30l2h4erk09rrsim13sh5qo8qa',1590051424,'','172.18.0.5'),('30o5rltucutte0mahtfauqgdd9',1590050406,'','172.18.0.5'),('310jckk0914n4cr7m3s7l4vcpc',1590050846,'','172.18.0.5'),('31ij0vu541k6ul2q4nn82km8kp',1590050848,'','172.18.0.5'),('31ngrq6qmdp2gkb67tjj5jmotq',1590051542,'','172.18.0.5'),('31qtms55akbva93b7lknn8p16d',1607093250,'','172.18.0.5'),('320hol1t6fd7ihpufqvh01lprh',1607095396,'','172.18.0.5'),('32kie46ggro33m4gcap3uhe18q',1590050692,'','172.18.0.5'),('3360gfnj411vbs36g812a73inh',1607094610,'','172.18.0.5'),('339ef65s2envpe9hvm0vmti2o3',1590050689,'','172.18.0.5'),('33fqrprgc7j4cpn8k0nq2uqo80',1590050574,'','172.18.0.5'),('33uf0a1mc03ugk4tcomhjumgv7',1590050576,'','172.18.0.5'),('35ikkj36p37hrc1bopss8hrmbn',1590051523,'','172.18.0.5'),('35j62o07d9qvcqi5ifrmjtj6o1',1590050945,'','172.18.0.5'),('35m7di5v1mnnigk5124tfv13ei',1607094622,'','172.18.0.5'),('35mmh4el9d8idao0jchdjpvmql',1590051476,'','172.18.0.5'),('36i5l073o356dkuvqvd0c9689q',1607093961,'','172.18.0.5'),('36kv43derk52e2gljpdtqhr14s',1607095348,'','172.18.0.5'),('36lsa0rjcd78ov3dgtq312e6ou',1607095348,'','172.18.0.5'),('36mic1a70a9hmg2v7bs7n0ekm8',1590050844,'','172.18.0.5'),('370ga1rrfhtdoebhd8le6mlcl5',1607094823,'','172.18.0.5'),('37apmp0ppncjg931i6puqu9djo',1607095052,'','172.18.0.5'),('382i3r9qaebcc2suh7q49c0tmv',1607094939,'','172.18.0.5'),('38hdkok1u7u6bijoja3mnflia8',1607095053,'','172.18.0.5'),('38q0ll7ovvlbtnjo9s79ffs3b4',1607093516,'','172.18.0.5'),('39v5rajkkpnm8uml19vv8ahlak',1590051138,'','172.18.0.5'),('3aol6ab8t212jpfpf9j7s5trl2',1590051421,'','172.18.0.5'),('3bfo88s0tgtlsj6med84ouep7l',1590051026,'','172.18.0.5'),('3c0a8uvu8hq9c218b7t2br93m3',1590050692,'','172.18.0.5'),('3c328lvnui6rk0g3866mu7p85e',1590050945,'','172.18.0.5'),('3cgu348pn3tcoki2uoku5i254r',1607094622,'','172.18.0.5'),('3coma6p2h6u2amupe3moro5dko',1607094417,'','172.18.0.5'),('3d38q3ivhsl7kn9vr5g69ej02c',1590051135,'','172.18.0.5'),('3dbdp94mu781e1jtkoaj3c16ht',1590051138,'','172.18.0.5'),('3dlrq85fd3eoq1koq62msm3426',1607093330,'','172.18.0.5'),('3e69d87h5auuv30ei9t2is98kn',1607093517,'','172.18.0.5'),('3f5jttvsq4527nf5d5u7c4flgg',1590050522,'','172.18.0.5'),('3f72rc2a6uavo1jg7unigioph5',1590051475,'','172.18.0.5'),('3fnbnkfhk1vu8ho1mref0u1vlt',1590050471,'','172.18.0.5'),('3fpoleiac1434qcfkcov382dnc',1590050689,'','172.18.0.5'),('3fttevpj9sobujhgfupkkfg5gg',1607093331,'','172.18.0.5'),('3h4ds420afcnbq977reea14ldl',1607095347,'','172.18.0.5'),('3h555o7aovoecsq6r0f530llk3',1590050471,'','172.18.0.5'),('3i8ukncfq2vg7qd9ddmqe3cq4v',1590049886,'','172.18.0.5'),('3igac1m3r6c2mupqaap40dh5c3',1590051421,'','172.18.0.5'),('3ilsf6vria2fhn7s4oampr7l0j',1607094670,'','172.18.0.5'),('3j5f9dhtlqrqcbkiq99kmksu23',1607095052,'','172.18.0.5'),('3jal4d4bkgus91v73mur5vrkhg',1590051523,'','172.18.0.5'),('3jir0esu7tq88pfoleci3fm0pj',1590050945,'','172.18.0.5'),('3jjqbv3ut1b46c54alfpb4t05j',1590050473,'','172.18.0.5'),('3js21eetp28g44c956scmjnfus',1607094611,'','172.18.0.5'),('3k8pub45ndtdljd3kg3fbchs0s',1607095001,'','172.18.0.5'),('3knqinnb8t3jq7dr51o7ed1rlj',1590051424,'','172.18.0.5'),('3kpr6lum3kfcsnnvqnh8d5p0mq',1590049886,'','172.18.0.5'),('3m3214d229si1psbcn44jpvkvf',1590050689,'','172.18.0.5'),('3nftbg2i9fpkdmdnietib67499',1590050406,'','172.18.0.5'),('3njqmdgephj3cjphn0ru0imll5',1607094669,'','172.18.0.5'),('3nl7fg3p83a46omq5v7io4atk2',1607095169,'','172.18.0.5'),('3o3552qkq99pcl85cp76ljv7e1',1607093250,'','172.18.0.5'),('3oh1n7mq7l5uc4puh8n8b5gv7h',1590051524,'','172.18.0.5'),('3oo5tr007rlbha9alcjlgai807',1590051027,'','172.18.0.5'),('3or2r619toc15ufv29hpduh1ob',1607094671,'','172.18.0.5'),('3q45ua2dg4k8pa072eucf9o06m',1590051421,'','172.18.0.5'),('3qf1jld7o72afb7g1r8bhvgrrl',1607094873,'','172.18.0.5'),('3qhjmerre1daa7m8839sprsqhn',1590050525,'','172.18.0.5'),('3rfdq7skt0d5g8p79eudjt95dj',1590050015,'','172.18.0.5'),('3rp657qr8k0h6m2igh5na0so0b',1607094881,'','172.18.0.5'),('3rr1m0q7siqilpibaoffmknvjq',1607093329,'','172.18.0.5'),('3s2h0m9e3aad79bui60dodo4or',1590051421,'','172.18.0.5'),('3sb2igd17hr9nr1g88nq8q825p',1607095347,'','172.18.0.5'),('3sm7if6qu1g672p3i7t5duu5po',1590051424,'','172.18.0.5'),('3t6ku08ekolucj1imq8nps0jrg',1607094417,'','172.18.0.5'),('3teqoh23agf6207fo0ndmv9uqb',1607094670,'','172.18.0.5'),('3tr7sb9d71q754plak8psmh0vr',1607094879,'','172.18.0.5'),('3u0s0d4op7goevq3vc013musuk',1590051478,'','172.18.0.5'),('3u1f04q50967oip38ecfgrn92m',1607095001,'','172.18.0.5'),('3u3d1jk0d4vsc8cpdphj6ak48f',1590051545,'','172.18.0.5'),('3v19euk6co6f3n2leso3hehaev',1590050574,'','172.18.0.5'),('3v1bf7l805kvps2f3c1mn7jdh3',1590051542,'','172.18.0.5'),('3v2jb3d4v3545htdc1cqsh1qnf',1607095396,'','172.18.0.5'),('3vahvjulnc4qconair1i4tmse6',1590051475,'','172.18.0.5'),('3vakdrtf3258h9e32hospl5vdu',1590051475,'','172.18.0.5'),('3vlldkti8hfaq2uaotmfk9qioi',1590051475,'','172.18.0.5'),('4035gtaf8qceelio7td3348qtb',1607093251,'','172.18.0.5'),('406gqd4vm00ssdtu4tgb3q15sq',1590051478,'','172.18.0.5'),('40orvbmg13c69jmrlvjoo23ibc',1590051476,'','172.18.0.5'),('419gdr3lisokfc91qcboqi0m9b',1590051521,'','172.18.0.5'),('41jc1k8f3beinbe383mkp79oj8',1590051478,'','172.18.0.5'),('420dgn4mbopeohedrc894f7otk',1590050403,'','172.18.0.5'),('423ibjetd8pmv58223eil30b8j',1590051026,'','172.18.0.5'),('42od12a3jb9g8hh6mv1hrsv0c3',1590051023,'','172.18.0.5'),('43hdus6m7qeci4j7v3th1ja9op',1590050689,'','172.18.0.5'),('43uvsi3sb0eh178fdf5tad57ih',1590050472,'','172.18.0.5'),('440ks61ucp08ik8a18rn31bigl',1607093330,'','172.18.0.5'),('447r9ous3cemg5ghecpai7somc',1590050845,'','172.18.0.5'),('44ceisagie14uigtq67koil11i',1590051524,'','172.18.0.5'),('44su7h8uqs5eoip7hspsct1hg2',1590051478,'','172.18.0.5'),('45asgvipkrhrgtue5sck7c2i1g',1607094822,'','172.18.0.5'),('46k8dql6n3b8fn1ui136ntlhcb',1607095348,'','172.18.0.5'),('46qaeona2k5u9qhk05eg70r63c',1607095001,'','172.18.0.5'),('4770hsfqna71v8tgdb0n1kf4kv',1607094416,'','172.18.0.5'),('47e4bdllee4r4ssquv628lv1cu',1607094329,'','172.18.0.5'),('47v14koci77jt9fe5kufkmnpap',1590050844,'','172.18.0.5'),('48qppcu71tuc5jjcm1397lugpt',1590051424,'','172.18.0.5'),('48t0vtg2r36p0msvt9enefhp7n',1607094020,'','172.18.0.5'),('4934m30s40d35n06oupjbql8p6',1590051524,'','172.18.0.5'),('49nbgemun2bsqbfpqs805t5ech',1607093250,'','172.18.0.5'),('4b70eesnaff8i8brd99k2phuct',1590050577,'','172.18.0.5'),('4bhuip0nuta93eo5r61rvkg9tl',1607094671,'','172.18.0.5'),('4bo4q515ahk48ed0litjcvlers',1590051478,'','172.18.0.5'),('4chv6epoh2ebb9kf4db69ghfk7',1607094822,'','172.18.0.5'),('4cvd08r4tuu26ig0dphnfmigir',1590050403,'','172.18.0.5'),('4dj2to4c61bfcfhkg2ld1r5mdn',1590051475,'','172.18.0.5'),('4dvtm99pkjbhl1sa2c1nqfud5l',1590051023,'','172.18.0.5'),('4e9dcs2hq4pa7mleb7e0r65imo',1590050844,'','172.18.0.5'),('4f1ighgel027l3fefl9v8j6ubp',1607094417,'','172.18.0.5'),('4gelfs8lin29gou85rceej25d5',1590050406,'','172.18.0.5'),('4h0j2snavugm86hes7q7164e97',1590050574,'','172.18.0.5'),('4id6nv9v1mdb7pm7ga3tlq8lse',1590051545,'','172.18.0.5'),('4ihlg7r90punelg1056488s7sr',1590050949,'','172.18.0.5'),('4isgb91fbfu8m3ta92ggmub2pg',1590050522,'','172.18.0.5'),('4iu1ocuamv90t6unjbk6i8rot5',1590051138,'','172.18.0.5'),('4j1utl0gi1j56optl7accmd0jd',1590051421,'','172.18.0.5'),('4j6ilhm80ualmusqks69refkgt',1590049919,'','172.18.0.5'),('4jgqetbgj1ishd2o5ah59q17p3',1590051524,'','172.18.0.5'),('4jpjrdtie57v9kakifues3s34s',1590050949,'','172.18.0.5'),('4kim6j4kr4blas8to53ksv58a9',1607094671,'','172.18.0.5'),('4lep2sih6mnrp2cmov089dnc0j',1590050015,'','172.18.0.5'),('4lhp3qmaco9uimi38nova5bi2f',1607095001,'','172.18.0.5'),('4m1qp1b1pg3d9sv08fmirutcr5',1590050948,'','172.18.0.5'),('4oekjcvbo7cdm6v17h5k9n6e61',1607094610,'','172.18.0.5'),('4pkrg78ahlmema1d5jqonbraee',1607094670,'','172.18.0.5'),('4prs4c58ru7h67ntt10r787d0f',1607093330,'','172.18.0.5'),('4q3linsd4s88ak81of907oukle',1590050689,'','172.18.0.5'),('4qc6nh32aq4nld0k36go5552e9',1607094053,'','172.18.0.5'),('4qgln3e5uf22ootn08v30fr1mq',1607094716,'','172.18.0.5'),('4rdhu0f4bvd9gfkdr5o7l27g7e',1590050406,'','172.18.0.5'),('4s2prr4ptalfusmsv5smhvnrkq',1590050406,'','172.18.0.5'),('4sjq0909nkrilg7njed374mvi9',1590050406,'','172.18.0.5'),('4t28q98ivla5gcm663bht3s2fe',1590051521,'','172.18.0.5'),('4t84g48htq92m44ne7oplt12v5',1590050949,'','172.18.0.5'),('4u56lhi3t465s65m5hokoe03dc',1607095396,'','172.18.0.5'),('4vc3pbudrnhjoojj169adk5uef',1607093250,'','172.18.0.5'),('4vd7iljvkprc1mt0bfpkd3jisl',1590051521,'','172.18.0.5'),('4vfi047oj0sl88q9j4ea1g2pa3',1590051138,'','172.18.0.5'),('4vjj12p1r3vda6h4bq4j139f6k',1607094879,'','172.18.0.5'),('4vjthpplf3h5dug1lt9ade2bdq',1607095169,'','172.18.0.5'),('4vloi6ta6omb05ops4diigb6f8',1590051521,'','172.18.0.5'),('4vpimuss3e8tj27ch7j99u5evk',1590051543,'','172.18.0.5'),('5062dl0eos5hcuoi5s7nom6r0u',1607095348,'','172.18.0.5'),('50qg0p3h3v62ig9t7tu4duobjl',1607094880,'','172.18.0.5'),('517k4frlqorrgprnga2lbhel7t',1590051424,'','172.18.0.5'),('519hsnv4bdmkror1bcam1hfvou',1590051024,'','172.18.0.5'),('51f8dmjinodrgeamiogv937lnl',1590050403,'','172.18.0.5'),('5217l14dptqfhc46ch1lru3m3p',1590050844,'','172.18.0.5'),('52g0edkhcmikhm5aru9a22en4j',1590050693,'','172.18.0.5'),('52orsrop2i1clbm1qe8nva3895',1590049886,'','172.18.0.5'),('52ssnn6k0p9i62fboknpo45hsd',1607095348,'','172.18.0.5'),('5306oprfapqvjl4vfe03ti1b3u',1607095395,'','172.18.0.5'),('54abojmpqcu35u25e62oe4m9pn',1590051022,'','172.18.0.5'),('54es9ckhngm809aepnu3d12l9o',1590051135,'','172.18.0.5'),('54knlfcu4v37tin0n7pduhnm75',1607095169,'','172.18.0.5'),('54qmodhooleblii8qvd4bjan80',1590050574,'','172.18.0.5'),('55an11a8g5l4ff7qqeqbpe4lpk',1590051524,'','172.18.0.5'),('56118qvkl4hjmed6qhr1dlfnra',1607095052,'','172.18.0.5'),('565j0p2lm19ij2rfins561nc3s',1607094822,'','172.18.0.5'),('56trfg3sm7a09c0co6fuj0q4qr',1607093330,'','172.18.0.5'),('56uolgg7mt77cgmh6dta633a5b',1590051134,'','172.18.0.5'),('57o2d5t9nbus3db6sepb0pkpqd',1607095170,'','172.18.0.5'),('57vg2v44rtv3skvpa26009f7cu',1590051424,'','172.18.0.5'),('58861gc0fs8cc1k8lnurhai578',1607094611,'','172.18.0.5'),('599tjrv622uiut1rcf8783fhd3',1590050574,'','172.18.0.5'),('59s7j9r24fhhb5bh480943dudd',1607093329,'','172.18.0.5'),('59uai5md0c7sor4jbbo9ihchm9',1590051545,'','172.18.0.5'),('5a8pqbb495uckn1nkc17mohr4g',1607093250,'','172.18.0.5'),('5abbcvd7iv88loc8aauuq8803r',1607095348,'','172.18.0.5'),('5aducjqtrm9j9gep66bnljvf03',1607094939,'','172.18.0.5'),('5apbgbhlg87vccpf52re9mde5f',1607094610,'','172.18.0.5'),('5ars407mk5sir0f3p7g0r4feaj',1590049918,'','172.18.0.5'),('5auo8t1h4c6l0g8ut50qqmmo12',1590050849,'','172.18.0.5'),('5b1n4ljgnms9vmpluihcrj9m28',1607095000,'','172.18.0.5'),('5cc76uvkth42qp4olfn5do2dk9',1590050693,'','172.18.0.5'),('5csd9r1rguum2aukj10d578iqi',1607094622,'','172.18.0.5'),('5dk2svatv77a00vbpmr7usjkg1',1607095348,'','172.18.0.5'),('5dl1em47idble7t6t8lu0o76co',1607094671,'','172.18.0.5'),('5dn86ft57o8snarvqamgc3t7hu',1590051545,'','172.18.0.5'),('5dpp1uhhvcu04n4481qrsleg5u',1590051524,'','172.18.0.5'),('5dtici6t3bugoncctclneb8jvd',1607095169,'','172.18.0.5'),('5enkrp4kiprpnqgreos1ja4lmc',1607095001,'','172.18.0.5'),('5eub3rod4ckl5q41a7r08a8mqf',1607093981,'','172.18.0.5'),('5euileqvmotfpeevtf0l1sqk5d',1590051479,'','172.18.0.5'),('5fq4dm0ca0qcam3fom6r44chns',1590051478,'','172.18.0.5'),('5ge0jc7f7hm069uc8gcu1focpk',1590050574,'','172.18.0.5'),('5gtlfo9gmlavti7kd3k26060af',1607095347,'','172.18.0.5'),('5h0hi0vpjs7hp6qjs3ic6ta3ol',1590051138,'','172.18.0.5'),('5ho01skanjv4qcmjicfumu5nvn',1607093864,'','172.18.0.5'),('5iberuarc2m911bisesigp06ap',1590049918,'','172.18.0.5'),('5iedk2ive1bou84n5v0vnojbbs',1590050945,'','172.18.0.5'),('5igijjjcv2q24t7cld09bj84r6',1607094610,'','172.18.0.5'),('5invfv33nm7sukknluih2plib1',1590051521,'','172.18.0.5'),('5j0i7fdd2rg95bev3r0d0qudf9',1590050574,'','172.18.0.5'),('5jkbc600j34av8mgtdrjr6po4f',1607095348,'','172.18.0.5'),('5jknuofn3o4413i8pra1vb9og0',1590050403,'','172.18.0.5'),('5khp3f4ajfn3piidt883ndor3j',1590051134,'','172.18.0.5'),('5kobkuqjumeuvnrqcg5c58ki3q',1607094880,'','172.18.0.5'),('5lag9v0a3cnkf7uf33p6omb28b',1607093516,'','172.18.0.5'),('5m9i071sekftqqrbt2cpi87qi3',1607094671,'','172.18.0.5'),('5mc7m694fuk981qfvqnu4mv6qs',1590050848,'','172.18.0.5'),('5me5o3je0c54gaiq0ctim6n67p',1590051026,'','172.18.0.5'),('5mniajlumgl17an1h2dhom1jqo',1590050692,'','172.18.0.5'),('5n6eu58770fh4nu5irddp1ib8r',1607095348,'','172.18.0.5'),('5n94491i2opttc86mspvhibvu9',1590050948,'','172.18.0.5'),('5ncrgtumc1d868phigl395r8p8',1607094671,'','172.18.0.5'),('5nhmrrkg0nii6m7j36j3q6g3id',1590051023,'','172.18.0.5'),('5o73bop9apuuhn235jn6ve95b8',1590051023,'','172.18.0.5'),('5pd4266jth1a91b85ohkg1f195',1590050692,'','172.18.0.5'),('5prs8fc5f124kef0jflbvllc95',1590051524,'','172.18.0.5'),('5q0eot4dvvhcnluq8qoa67b9q8',1590050403,'','172.18.0.5'),('5qvh7u2br2vg0dh9nrn8792dth',1590050406,'','172.18.0.5'),('5r84li15v5ot66dq7rdsk8gum6',1590051544,'','172.18.0.5'),('5rc2fqg8p9thr49hg7qgfb1vmd',1590050525,'','172.18.0.5'),('5rcobmtamn39ao54o5j996hfj1',1607094622,'','172.18.0.5'),('5rmtniusdmu60oj7c73f3l2m4c',1590049886,'','172.18.0.5'),('5s5jk9n3603kv5cug3qddb84tg',1607095001,'','172.18.0.5'),('5s8vn0cej8i77e2gu5pqt85gfo',1590051421,'','172.18.0.5'),('5sr7a1tkpl1e6ghpv1s50u76ce',1590050474,'','172.18.0.5'),('5t6spgj9vd2u940f3otncjv1sj',1590050525,'','172.18.0.5'),('5t8d907g2sl4ol95mk17otpqk7',1607094611,'','172.18.0.5'),('5ta13osep9lba01k0tj7ja9veb',1590051134,'','172.18.0.5'),('5tqtefi0dt5f8tsefvhb8rgt4r',1607095000,'','172.18.0.5'),('5ve9882et7um8vt3eobetpnpai',1590051545,'','172.18.0.5'),('61ccn4vf0nc28f0gd016t3a36v',1607094821,'','172.18.0.5'),('61r15lj7b587q5bafo3iacm96i',1590050471,'','172.18.0.5'),('62fmp05nnpi4p263ojicjrhjh7',1607095169,'','172.18.0.5'),('639urv5i1sibiu34rmuog8a1ie',1590050689,'','172.18.0.5'),('63gakvpkq9gtgpqmcth18d0ja1',1607095052,'','172.18.0.5'),('63vq2otpfd4a7tit40v6dpk7bu',1590050471,'','172.18.0.5'),('640tt3d9j3loee5jf4ajtcv4vr',1590050471,'','172.18.0.5'),('64ef9cr0fi56f43rlmla18lsss',1607094610,'','172.18.0.5'),('64kn1dppeduvn15vjg1oo58f0f',1590050689,'','172.18.0.5'),('64l4upgnsk57dokl2r4v8fk707',1590051478,'','172.18.0.5'),('65d5oevav1hafu84gqfjdkscjb',1607093517,'','172.18.0.5'),('65df98piub7cuer88c3t5em2fl',1607095001,'','172.18.0.5'),('65j46c51pee7dtlm2gn2bm7sq4',1590050525,'','172.18.0.5'),('66ogmtm8r1vgsjakv23pnqjhil',1590050692,'','172.18.0.5'),('67213nporhkhoiudfn8s908p1a',1590049886,'','172.18.0.5'),('676pbaq8dvvg0gn0rfd08759dk',1590050692,'','172.18.0.5'),('67nqa97fv3r3505115vo3g2pu5',1590051542,'','172.18.0.5'),('686kgroeh40obkrmlcci502ouj',1607093329,'','172.18.0.5'),('68mrrdkrpnqu590qkmkomd8l6g',1607093517,'','172.18.0.5'),('69snm1givtbi6rckfq548q9jnu',1607094416,'','172.18.0.5'),('6a1tpt04pcd4av9dalemv2obek',1607095001,'','172.18.0.5'),('6amtbebrl57rben3ihegah2kev',1607095396,'','172.18.0.5'),('6an5li8e0sllkhm98htp1t1agc',1607094821,'','172.18.0.5'),('6b3ke8stj48ufhkhribuas7mtq',1607093517,'','172.18.0.5'),('6cftrpb55a9pqnnlita52pmcrh',1590050848,'','172.18.0.5'),('6ci18le64qplq028orat2f01bm',1607093517,'','172.18.0.5'),('6d14ih0ij9vark7tj555cr0unc',1590051545,'','172.18.0.5'),('6dhem806sj30i0u0jd6oscansd',1590051545,'','172.18.0.5'),('6doj6cvpko37c4untal02qajq6',1590051024,'','172.18.0.5'),('6dr034inrcha2vbsuavqfbn0kr',1590051544,'','172.18.0.5'),('6e2dvm95cf2dhm3nhioqdib9fr',1607095347,'','172.18.0.5'),('6ffo0vjcon0m7ir4ra1eapcrtc',1607095396,'','172.18.0.5'),('6fhoku0rg5c7vsr4q2r1u5vjth',1607094880,'','172.18.0.5'),('6flv3fah38fotbqa9h9pv5cf0k',1590051424,'','172.18.0.5'),('6fmruva2uadgrjhouuecatche2',1590051424,'','172.18.0.5'),('6gm1dtg3h4q38pia08n234i68q',1607094670,'','172.18.0.5'),('6gusbuj8lrimr8gm917c6rc25o',1590050471,'','172.18.0.5'),('6h2a0267lrfa22e2j86b3o305h',1590050577,'','172.18.0.5'),('6h4k6cemnnm2ft54nc25um8kl6',1590049918,'','172.18.0.5'),('6hbebdlgd75k7paulvsbo8t082',1607095348,'','172.18.0.5'),('6hmbt9vgqcs34b61bi63u4vita',1590050471,'','172.18.0.5'),('6hrnbidfde61b212snpl6s7k70',1607095396,'','172.18.0.5'),('6hug7d05p2d902b26qu7ihn94v',1590051138,'','172.18.0.5'),('6i3p4ham6olf0ah1le9a285aan',1590051421,'','172.18.0.5'),('6ik2bbrauuf7td7v0efdte7h5q',1590051026,'','172.18.0.5'),('6jlcodphjhqsq2jrlufnc78fa6',1590051421,'','172.18.0.5'),('6ko4l42te36smblnctoj6fkhga',1607095396,'','172.18.0.5'),('6ks945n6ntge4jv6kslfc1kk7r',1590051523,'','172.18.0.5'),('6l8b4jkbeonmq1km628npsbrtp',1607094622,'','172.18.0.5'),('6lji8e0o1fbpipe11lo1pfkbau',1590050577,'','172.18.0.5'),('6lof7n8baubu4il4ak9n6ifqnk',1607093250,'','172.18.0.5'),('6mi20vikufkldvribh0mtgh519',1590050522,'','172.18.0.5'),('6mjiagormschq3cpds2q5in78m',1590050949,'','172.18.0.5'),('6nbc7p7tb3h627jp9ar09gs8a1',1590049918,'','172.18.0.5'),('6nbh2gkuemt5ogksc33rqov9qn',1590051424,'','172.18.0.5'),('6nj39q73o99fp1irpqqfjlbgh5',1590050944,'','172.18.0.5'),('6nll2bu3hfe95egp7qbfinknfe',1590051523,'','172.18.0.5'),('6oaulk7f8ud8tj8vf9aa3jerhe',1590050405,'','172.18.0.5'),('6paeho0iggju3codhd3cp04tqk',1590049918,'','172.18.0.5'),('6pnpcacb42632q40q68353iqge',1590051475,'','172.18.0.5'),('6q12soojc7us5hbp3qccihhldu',1590050689,'','172.18.0.5'),('6q49741eiah2od8a5sif7313bg',1607094417,'','172.18.0.5'),('6q5ub85ik7rk06vqpbs610og8q',1590050522,'','172.18.0.5'),('6qakdciejomjpoki47gd6c9nfr',1607095169,'','172.18.0.5'),('6qf5fhs00r5i0bpj81i9o1a09b',1607093330,'','172.18.0.5'),('6qglfiauhvi74990rrateefg79',1607093516,'','172.18.0.5'),('6rfajka6b04j72fbod1co3o3th',1607095347,'','172.18.0.5'),('6rk9jl0n1rpl1d7g1e8tfs6nsv',1607093330,'','172.18.0.5'),('6rmkrnu3s3a7dtjeud3ri7cvk9',1590050945,'','172.18.0.5'),('6rnhl03067e5f4kp5betnogqt7',1590049886,'','172.18.0.5'),('6rsff52loq32g65cv9va82fomc',1607094610,'','172.18.0.5'),('6s19fe711q1flbupdqgbeh14lb',1590050948,'','172.18.0.5'),('6si6sqa6hpca6rim5a83sd3j5g',1590051478,'','172.18.0.5'),('6stda1gdq14glo0gj663b7d7iq',1590051543,'','172.18.0.5'),('6te54jhuqsr9kh3ic25lort6bq',1607095395,'','172.18.0.5'),('6u1nu8q4eh2ta8n0jrct10haj0',1590050403,'','172.18.0.5'),('6uo8d5ingc1ohvfn89au8bh61r',1607094416,'','172.18.0.5'),('6urg90njtg65isf0r4eq4a3uc2',1590051545,'','172.18.0.5'),('6v1cu4me073pn35k0m77pj2e9d',1590051135,'','172.18.0.5'),('6v5p9emjedus9145l3r17lgv8j',1607094416,'','172.18.0.5'),('704cgm4p3gnk0enbmrouos2ku5',1590051421,'','172.18.0.5'),('70d56g36ql62fbihk3o47vjl6f',1590051423,'','172.18.0.5'),('70f1k290ar3q2hlqt7cmodedep',1607095052,'','172.18.0.5'),('70vtkg0locjpa0gilvvk1jtbi3',1607094671,'','172.18.0.5'),('71f1nahfmdsq5jred9ercnipk3',1607094329,'','172.18.0.5'),('71go3l6sjejt4m600pvbfqgh2g',1590050577,'','172.18.0.5'),('71jtuqb7ghfd1ls1q24dl51md1',1607094417,'','172.18.0.5'),('71qll06mhkse7rmu00qriqskha',1607094881,'','172.18.0.5'),('72pjl7lqjnfiib6dquvoc6elpv',1607094841,'','172.18.0.5'),('737oo04jpdn9naq4ip3dr4aqho',1590050577,'','172.18.0.5'),('73ie5g1ffoducmg1ambnadc7ib',1607094416,'','172.18.0.5'),('73je7uaici2t9u7scheq0iuurk',1590049886,'','172.18.0.5'),('73nb4h1o7vhd815s780uai03c9',1590051421,'','172.18.0.5'),('74tjkhhusifnkk768139lb5b2l',1590051475,'','172.18.0.5'),('7567mnbnimo8duhvug3jp2c3jn',1607094416,'','172.18.0.5'),('75hmmvmmhft6n7ct1f6qsopad2',1590049918,'','172.18.0.5'),('76cr2inst85mgu6asrpjvlhbrn',1607094416,'','172.18.0.5'),('7729parstujr4f4jq4u8aubpfl',1607095348,'','172.18.0.5'),('7747epee39u4c8cl5p950sqqek',1590050525,'','172.18.0.5'),('777fppc4bnec81r4dl1fb7duei',1590051545,'','172.18.0.5'),('77e8vqkn3hea28httvrccdn1pu',1590050406,'','172.18.0.5'),('77g2cr39oq8edm6fqpqgvutb02',1607094822,'','172.18.0.5'),('786pf0ebpasdncbm72m48tf183',1590051478,'','172.18.0.5'),('78l2rdr624n3g421j337mthg3t',1607093516,'','172.18.0.5'),('79bopncl5h6fg3hnklf1l1qjh6',1590050573,'','172.18.0.5'),('79pdtpan88vksf0m9015dec9n4',1590050573,'','172.18.0.5'),('7aakuibjl47q1j5hjb4rtt8m4m',1590050471,'','172.18.0.5'),('7acjuo305tffpnfetrrngtireq',1590051424,'','172.18.0.5'),('7ak39v0ckeg169od95eh09t2mk',1590050849,'','172.18.0.5'),('7b88aisrltd3vbv590hp4ff90f',1590051545,'','172.18.0.5'),('7blb3okalvutr3mcgm3pggdkck',1590050946,'','172.18.0.5'),('7bv9t9t66f6ukbnv7boih4hh77',1590050688,'','172.18.0.5'),('7dviib4id38tevikaons4s5n6o',1590050846,'','172.18.0.5'),('7e10ee0s35sgfab69pjgji783v',1590050692,'','172.18.0.5'),('7e435k7cfdv7kau5dlbl5r11tj',1607095169,'','172.18.0.5'),('7efvkvpgaj818j86dgfpjpejb1',1590051421,'','172.18.0.5'),('7es52lo3m35hdgnvf1e9vkmjf9',1607094670,'','172.18.0.5'),('7folsg7jhfjct65eedn9fd0let',1590051421,'','172.18.0.5'),('7fsfr54q2i1a699rvat9prl2jh',1590049918,'','172.18.0.5'),('7incjgf9k5kok1fgmeqk5k7sl0',1607093330,'','172.18.0.5'),('7iubfsdtnestl1t7m8k4b31vid',1590050848,'','172.18.0.5'),('7kf5iir5setvrg6n292kqq97t0',1607094881,'','172.18.0.5'),('7lbfj03hgqut6to6ohf3afmfv3',1590051478,'','172.18.0.5'),('7lojg7j39j305r48n5ra6m1294',1590051138,'','172.18.0.5'),('7loqfsgp2gd1bu5399rp5pp3k6',1590051421,'','172.18.0.5'),('7ms756knprd3dmugihmnmd60ru',1590050403,'','172.18.0.5'),('7muq3k2ptgmkg5hh6tau6f549p',1590051424,'','172.18.0.5'),('7n9usp5thleeahs84poq9t47ad',1590051521,'','172.18.0.5'),('7nuj2scabpdt1mj39hii3mpr1m',1607093330,'','172.18.0.5'),('7o1rtb9fdvrualb0m6mpq4j2dr',1590051542,'','172.18.0.5'),('7o5gqk5k15i4osbf2itpbe5um6',1607093331,'','172.18.0.5'),('7oill39ofqh056kdn5ooiules3',1607094940,'','172.18.0.5'),('7oje938iq8j3v3p7sk160jsaoh',1607094671,'','172.18.0.5'),('7ork8f3u67snqd9nl5d16dks5q',1607094873,'','172.18.0.5'),('7ot9b2hrlqa9na38bf1m3bbcju',1590050522,'','172.18.0.5'),('7p0e8rrhcikr9es6emdfrdmv6q',1607094670,'','172.18.0.5'),('7p6mpcgp02vuua1o3n1e9nvi75',1607095052,'','172.18.0.5'),('7pbsic2a9fj6ddi3fc7m0n75s2',1590051475,'','172.18.0.5'),('7pq20quiuq0umq72tc77ue2uvn',1590051523,'','172.18.0.5'),('7pqhdigj925mcqcq82blcjbs8h',1590050524,'','172.18.0.5'),('7qlrt13dlq97q0r669r4blfdnr',1590050692,'','172.18.0.5'),('7r9qmfaj7bbii9cn144kdghjac',1590051478,'','172.18.0.5'),('7rfu9pindd45igifjpkcuhrbku',1590050403,'','172.18.0.5'),('7rg3al6v88hgvg760qflh3lloa',1607094671,'','172.18.0.5'),('7riagq1ds76p2kcr780vd1d9t1',1590051478,'','172.18.0.5'),('7rj1d8v4gs4ia1ua93o2tm3d6e',1590051424,'','172.18.0.5'),('7rr3nfji29ujfq0ap5bhp8hrdt',1590050692,'','172.18.0.5'),('7rtj9t2bcp5nobm2pclak1i5qk',1590051543,'','172.18.0.5'),('7snv591s7nbjl7000l4ibisns8',1607095348,'','172.18.0.5'),('7sspa5g6fr3k14hln771qs03r1',1590050525,'','172.18.0.5'),('7t95opclc2einkspv29cnkl3bq',1607095396,'','172.18.0.5'),('7tcibp77bgu4effu50vvie1hgi',1590051544,'','172.18.0.5'),('7u73okoaqm5f6vc2fv7suaifn0',1590050405,'','172.18.0.5'),('7u7ocv1t223363mffft12kdist',1590051421,'','172.18.0.5'),('7unqvnpm5tej0b5ard8qdi7ncr',1590051135,'','172.18.0.5'),('7urfk7m9mg9s5uotmbtime2jis',1607094248,'','172.18.0.5'),('7vbbor6j77ug9g0oc6cc2pm8r6',1590051424,'','172.18.0.5'),('80fjf12p1gfmh5qer7i9avru0q',1607093516,'','172.18.0.5'),('81c0q18i23f8p6uhaffqaog1ml',1590050474,'','172.18.0.5'),('81h5s4dmh5kpeopurmth1nova0',1590050406,'','172.18.0.5'),('81hnao2j57h89k4a9nsd8e8ej8',1590050845,'','172.18.0.5'),('82gsm4v455mlqm86lcasputhu1',1590049918,'','172.18.0.5'),('82h5pad0492pura2nkint89l79',1607094941,'','172.18.0.5'),('82pgo1ol932kf4r1sbhaualh9k',1607095169,'','172.18.0.5'),('834d7at6jm7pr5pj2gpi9hlo8s',1590050949,'','172.18.0.5'),('849scogjktpf197qj5rig5npu6',1590050574,'','172.18.0.5'),('84bd9n0n455v6np2d255btqlgn',1607095348,'','172.18.0.5'),('8565r3e89mk6udelr8uff7ii8n',1590051421,'','172.18.0.5'),('85k97ku24rmqes86qpo74skfer',1607094416,'','172.18.0.5'),('864d31i5q1a5non2s1tvfej4f5',1590050577,'','172.18.0.5'),('86b1l44ih1sbpq6bqs3ob72ci0',1590050946,'','172.18.0.5'),('86tq9p37drbc412m9uj7cjjc7n',1607095348,'','172.18.0.5'),('86u5fktnd7lbtha7mab17dn9mr',1590050844,'','172.18.0.5'),('882jklkhmbub8mfhbfva77r530',1590050945,'','172.18.0.5'),('883rd0r1edef4e5gui574c769j',1590051479,'','172.18.0.5'),('88govmid559qrss1c7i4hrd0oi',1590051521,'','172.18.0.5'),('88rq2i2q089hprvjkje5fuq6h7',1607094416,'','172.18.0.5'),('893a1jc8ljcq8cn5p5m1tlkvmr',1590050471,'','172.18.0.5'),('894avh18rticak887i8g0iqj39',1590050406,'','172.18.0.5'),('89c5jp0iitqnemu26et9elk8sf',1590050474,'','172.18.0.5'),('89ebdt4b64fv7orlg7s3jpad6g',1590051543,'','172.18.0.5'),('89f8uo67n53e8nar9e4rldrl6o',1590051542,'','172.18.0.5'),('8a5k49rfhpe6i03bh0tls0da7g',1607094622,'','172.18.0.5'),('8a6n8vosdbn1a99t494am5vsng',1607094622,'','172.18.0.5'),('8adf3mn9s11khg6a89a5rdj94h',1590051134,'','172.18.0.5'),('8aktlnvltcotk5uofrhtclpnoc',1590050474,'','172.18.0.5'),('8bdc6qqtt3qf5vstgfhjgog8cb',1590050474,'','172.18.0.5'),('8beukbfardgfl3n7lgit7f9pv3',1590051476,'','172.18.0.5'),('8dif576b3kp2ha7o9c8jf3m4lh',1590051135,'','172.18.0.5'),('8dt7s7jcs4o7kp8esjvu4r2qg1',1607094416,'','172.18.0.5'),('8e6cha8guddeqfvoqn71kk18b8',1607095396,'','172.18.0.5'),('8elnt60g540mei8v9nu5jv4grg',1590049918,'','172.18.0.5'),('8eqeean5e2tfiisteelb582f8g',1590051137,'','172.18.0.5'),('8evp7b9nsigi88f4hdv94nlgk0',1607095396,'','172.18.0.5'),('8fbippaiaoiotqk9818o0vqqkd',1590051542,'','172.18.0.5'),('8gajvhspivulcup83n3aok38n1',1590049886,'','172.18.0.5'),('8gfgjmdlnq3724jdkg7s7oso6s',1590050525,'','172.18.0.5'),('8gupd7tb6m7nid7i1um5m4fiih',1590051476,'','172.18.0.5'),('8h2r3a0t8rdph988jufbfjbnqr',1590050845,'','172.18.0.5'),('8hen74ckr3lc5em199p6i236ga',1590051524,'','172.18.0.5'),('8iuoddo57d8tik9er0lvob70sa',1590050688,'','172.18.0.5'),('8jbg5esu3rr93akqmcf7d6k38i',1590051479,'','172.18.0.5'),('8jf6r2d96t22g6g7oug1nm9sel',1590050949,'','172.18.0.5'),('8k34d5kvaf9kq8ph7sh9b82vfi',1607094941,'','172.18.0.5'),('8k76orv2dppt62h2jdelprvdlt',1590050574,'','172.18.0.5'),('8kiklmvi2uu05fp07don6f866f',1590050691,'','172.18.0.5'),('8lh4gm5clkojq3ll998le7s5sk',1590050522,'','172.18.0.5'),('8mfj4hvqsfcrtq2ui0dt58rjla',1590050406,'','172.18.0.5'),('8mg6vm3ujd7jh7jtrcali3s5v3',1590050693,'','172.18.0.5'),('8mkbuu7s8hmqq89utb80nc7lp9',1607094610,'','172.18.0.5'),('8mlo8mon8ssblnknutbh3mnon8',1607094822,'','172.18.0.5'),('8mo12vkmnkrnbgb0gcnjj4olsj',1590051545,'','172.18.0.5'),('8nh9kobu2a16g6ouhmbplg7e4g',1590050403,'','172.18.0.5'),('8nrkug8splqt6vca1bnhb2vaug',1607094671,'','172.18.0.5'),('8o0n7v9n36hru1hnh4k973u8nn',1590050689,'','172.18.0.5'),('8o351utuuup2e0trov13gttd4o',1590051421,'','172.18.0.5'),('8o8dolk5s7hidkt7087foviv48',1590051134,'','172.18.0.5'),('8o9s6kdiht06gu4mngh6ln0jlb',1590051023,'','172.18.0.5'),('8ovhern83f3njkqild1jg7re58',1607094417,'','172.18.0.5'),('8pblqas225ublvmulg9ae37pvi',1590050473,'','172.18.0.5'),('8rcfnm50mu9d9dvjkku8hn01pl',1590050945,'','172.18.0.5'),('8rmi218fe8nje191bka21oitsb',1590051138,'','172.18.0.5'),('8rmmpa3amk1jo1pmdkuvv208jv',1590050848,'','172.18.0.5'),('8rrkoc2a0ltt5a2vcp97b9omco',1590051424,'','172.18.0.5'),('8rvs1l5hp864lgfr8u0mq0ovlt',1607095168,'','172.18.0.5'),('8sstm070d5dqc97niu9l08s7gi',1590051026,'','172.18.0.5'),('8thfk1uuu3430d289otk2hkssi',1590049918,'','172.18.0.5'),('8ttv59l6sktv9kaeo3uir8brav',1607092989,'','172.18.0.5'),('8tuq141reu4uf6hcmu1n0ht5kq',1607095053,'','172.18.0.5'),('8uhuq75eva27n291ogb1sp41nb',1607095052,'','172.18.0.5'),('8um202ebq67a503jbo7a7hsuo8',1590051545,'','172.18.0.5'),('8vlgubherh6ikhrvub9uebrp9g',1590050576,'','172.18.0.5'),('90cl8dnlq6046j7olh3dr228dk',1607094416,'','172.18.0.5'),('90hhijdjldanvqg6iuus72tqtg',1590050948,'','172.18.0.5'),('90i8484c6f1mn45ni2vf97bceq',1590051026,'','172.18.0.5'),('90j7v47tmtv1m6efa8bamnt975',1607094670,'','172.18.0.5'),('90os6pa6353k7nnl2j43li3j58',1607094716,'','172.18.0.5'),('91eknhfei45iiammkrld18cku9',1590051135,'','172.18.0.5'),('9237rrqeco4t4398dqp24tbdi9',1590049886,'','172.18.0.5'),('92f5hro3kv0djls1r4hvqhl0rk',1590050474,'','172.18.0.5'),('92g16usf6qnuk5ta1r6k57a5ip',1607095001,'','172.18.0.5'),('93577mnj50tuekn2ht4ghahs3r',1590051424,'','172.18.0.5'),('93qdhm2hi9n8g8soj3sg9f55ap',1607094416,'','172.18.0.5'),('9471k1h0dt8bol50m3phk97gm0',1590051524,'','172.18.0.5'),('94caofrss0holjjmidr6lg3d71',1590050525,'','172.18.0.5'),('94ltt2eu76a9ard1b9kasfdtov',1607095170,'','172.18.0.5'),('94s6hiplnuurks57l2t11t79hv',1607095052,'','172.18.0.5'),('95a5vfu9qvnnbpvridm6ig1r3p',1607095396,'','172.18.0.5'),('969i2qa8ilh1rre2jo7b2ifit7',1607095052,'','172.18.0.5'),('96j4u9f5g0co6qi5termfb87a9',1607094067,'','172.18.0.5'),('96kt0s5p1aoesjehb2fvbkdn3d',1590050474,'','172.18.0.5'),('96lptgpa3hue63l9c1j6206i42',1590050688,'','172.18.0.5'),('96tnbf5g2j9mivv5e3kmmugjpa',1590050574,'','172.18.0.5'),('97gn4j5iv26tkqleqnc9jmtdl6',1607094841,'','172.18.0.5'),('97kb2kecmvrev7ip49ld3ojh4r',1607093330,'','172.18.0.5'),('97nthhj95e7fgl0unfmqc5cnr7',1590050403,'','172.18.0.5'),('9801d28cf1tiqig8kvhbkcrioo',1590050577,'','172.18.0.5'),('9822imme7p18f6av9vo2raajne',1607095169,'','172.18.0.5'),('9837tjfvn5eigv1h32fgjibtv7',1590051475,'','172.18.0.5'),('987h7pcijmprvd9dmkbeif79pb',1607093330,'','172.18.0.5'),('988aok73715heo67r1at4lidg0',1590051135,'','172.18.0.5'),('98etvjgv5ku3pevlace6oe4r0l',1607094670,'','172.18.0.5'),('98skguhiiem09m7p1ndloj9ag6',1590051424,'','172.18.0.5'),('99hgschfui7h399i5h55udg1fr',1590050403,'','172.18.0.5'),('9a1go3ljkf7kk6rie7sqjotoms',1590051421,'','172.18.0.5'),('9aeu1dgefmtg4knm8eahhv9750',1590049960,'','172.18.0.5'),('9aickfe7gmv8ocu32q2584had0',1590050473,'','172.18.0.5'),('9as56tschpjmvvs0a2etlhf9qn',1590051135,'','172.18.0.5'),('9at76qcc9t24mjrhqhdidrjf1i',1607093329,'','172.18.0.5'),('9b03s4bl10dbmgn1pi8r9ve011',1607093516,'','172.18.0.5'),('9cb75tk40a2j2s8lvtmrmtpin9',1590050689,'','172.18.0.5'),('9cc8g8jd69l34hrvfc5ujb60pd',1607093517,'','172.18.0.5'),('9cfi8gengqi3j2cig9ksighf6h',1607093330,'','172.18.0.5'),('9chjdsu7m9r7jtqf900qicqq4n',1590050574,'','172.18.0.5'),('9e4l10sh3vn09unhsr2ue72rvq',1590051023,'','172.18.0.5'),('9e7fel77ff1jdd9oni7bkcb4je',1590050574,'','172.18.0.5'),('9ekt20mhfvh5h21r4eft3091mv',1607094880,'','172.18.0.5'),('9f3r5naaf8dv75me29s263a8rf',1590050693,'','172.18.0.5'),('9fb9clmubssntqr4mkpmh6185n',1607094941,'','172.18.0.5'),('9g0dd5l3oijkhvs1teok6jhrjq',1607094940,'','172.18.0.5'),('9g5fir1she1s6ddh2ia6q2s1o0',1590050845,'','172.18.0.5'),('9gl9p16ps8mu21fst9o6obsbdp',1590049886,'','172.18.0.5'),('9hasnib29668fvvuhivd7quksp',1590051524,'','172.18.0.5'),('9hbcbh6ca42cd3dmldr0raveov',1590051475,'','172.18.0.5'),('9hceaut2d5s3oenr153e9tlhg7',1590051478,'','172.18.0.5'),('9i9ubpnpu6gl9fm9fpubdj4fqe',1590051478,'','172.18.0.5'),('9k1tegpvto0tl0buj6hb1tb9k8',1607093331,'','172.18.0.5'),('9kt8smnv0n2obsi6dljlk4322d',1590051137,'','172.18.0.5'),('9kvtnk37n8b6mk3jguuega7hka',1590051138,'','172.18.0.5'),('9ldhlbndon31t8k9k41pmagavq',1590050403,'','172.18.0.5'),('9lhg7t9oaou2j4nhp7nkhca7f8',1590051475,'','172.18.0.5'),('9lov1ptcmt56j5qultbetdl3m7',1590051542,'','172.18.0.5'),('9mufcj093bv6cdkjm5sqr5b487',1590050403,'','172.18.0.5'),('9n1egidcb7ui6st4g6nogc5ja1',1590050846,'','172.18.0.5'),('9n41u5n0r7n6v78hvkt8t38vo9',1590049886,'','172.18.0.5'),('9nidkphk1tiv79jgpepv8thsgc',1607094416,'','172.18.0.5'),('9npkqesrj1k2bj8h9vpjar1q0c',1590050577,'','172.18.0.5'),('9pa8dc32a3vrfig4bqc5sokgp9',1590050577,'','172.18.0.5'),('9pu3a4vb7ak7nr7jt10uj01kgi',1607094669,'','172.18.0.5'),('9qed09v6n865gd36h94d03raj9',1607095396,'','172.18.0.5'),('9qmg0g9ci2f65nefepna66tkl9',1590050403,'','172.18.0.5'),('9rc92guqpotigbaf0f9b4lfe6v',1590050945,'','172.18.0.5'),('9rh5qp8esobas0lgbo9bklc3vr',1590051545,'','172.18.0.5'),('9s41ab5i84rd49176vgeod559o',1590050406,'','172.18.0.5'),('9s4tpkd33h6airbreeiskm84mc',1607095052,'','172.18.0.5'),('9s6mgs2c7ppguhl1odmps2vatr',1590050471,'','172.18.0.5'),('9shab3hsve0ek95p5pd7rfgqia',1590051423,'','172.18.0.5'),('9sup7outbl31cr15eki30du99p',1607094716,'','172.18.0.5'),('9t19kk6ordmnsrvu829q330bdd',1590051026,'','172.18.0.5'),('9t72gugoe3qs82jltkohqi7705',1590051475,'','172.18.0.5'),('9tkt7aekanprluh7fflmm28u9l',1590050692,'','172.18.0.5'),('9uf1v36prsv0ki6ufsjtipaiqq',1590050945,'','172.18.0.5'),('9uv72v0ub7rajnc9sq2nhv331p',1607093516,'','172.18.0.5'),('9vsh0g3vcbh5noflao4ulif0sh',1590050474,'','172.18.0.5'),('a04svvtdb13lc5ufdgoh04n7pg',1590050689,'','172.18.0.5'),('a0jhpm5j01nk6hb3injfqf39b7',1607095169,'','172.18.0.5'),('a0ng90k7k8vfu048bo0ocadrdr',1590050577,'','172.18.0.5'),('a0publj417r66k0duq9pp5ehd8',1607094823,'','172.18.0.5'),('a11ic3u3lfa7r8ic0rjfatgvdm',1590050577,'','172.18.0.5'),('a13e2g5gjsmi4avl33e6ka63nr',1590051134,'','172.18.0.5'),('a1cdeddtoh12sbpddcgbbi5vrg',1590051421,'','172.18.0.5'),('a2nhjm1brfvs5o9bhnsb8m2l6f',1590051524,'','172.18.0.5'),('a2s49m5antbqepmj980n2elpbh',1607093251,'','172.18.0.5'),('a4589g3fn8jfbl9stdhbtfcijt',1590050474,'','172.18.0.5'),('a459eu87qg4ckj34apdpm605ab',1590050948,'','172.18.0.5'),('a45s8suhqpspkuu2rs5a4uk24g',1590051424,'','172.18.0.5'),('a467ral31nppcpa6nsqorhah4v',1590050949,'','172.18.0.5'),('a481dgi80pp17764vgdfrinif7',1607094417,'','172.18.0.5'),('a4kpsj29nbdpuhqcdnlo5gu8hl',1590049886,'','172.18.0.5'),('a4p10mgsdgo2m10nku7mqq2a97',1590050471,'','172.18.0.5'),('a50vp2a0dbgsp2od75h92d2jdd',1590051478,'','172.18.0.5'),('a5snp4fb1vtdcbkfm9ufodkhm6',1590051424,'','172.18.0.5'),('a6hilqkjtk3qk17ev3hq7kaijf',1607095396,'','172.18.0.5'),('a6joq167o4ehrvpat9d364e6tp',1607094416,'','172.18.0.5'),('a7cam8lklrja9jtqtu1nvt21cl',1590050577,'','172.18.0.5'),('a8gj73a65krq9h5491278n9m89',1590051421,'','172.18.0.5'),('a8kdcmbno55ts60s61ndr3ab2e',1607095052,'','172.18.0.5'),('a8tr7dsj92t41v5g4of4vrra49',1590050471,'','172.18.0.5'),('a907cuila6dk8glu2d78185n0l',1590051134,'','172.18.0.5'),('a9c7pmd4l9j5f1kfpbvt2alhqo',1590051421,'','172.18.0.5'),('ab3b46ta0d0hno3rpc79vrlk4a',1590050848,'','172.18.0.5'),('ab43vrkqoa24hgo9qrlp8maijp',1590049886,'','172.18.0.5'),('ab4dvvcrngvef0g5k7trdrflc9',1607095052,'','172.18.0.5'),('abeogrbejagqcd0nup4le36l1q',1590050471,'','172.18.0.5'),('abhpcu86qputiov0b1qjj3pf8k',1590050577,'','172.18.0.5'),('abmmdap1l8shp7618uuc816gf6',1607093517,'','172.18.0.5'),('abn5r5vc00nen34qij7881u4j8',1590050576,'','172.18.0.5'),('acjj4shc4qptgh34eam8fkj4jo',1590051524,'','172.18.0.5'),('adnc5leetqi879m8agkfgmabmc',1590051524,'','172.18.0.5'),('aek1saehshp4r0kn19vjlsejdb',1590051424,'','172.18.0.5'),('af024in0l9d22pshkpd154qmho',1590050474,'','172.18.0.5'),('af15a0hjdb75953gc57jqumghg',1607094670,'','172.18.0.5'),('afcdfvvqdqa17k8pkho7ta46e8',1590049918,'','172.18.0.5'),('afq9q8b55mg2a3u3q114mltjl3',1607095348,'','172.18.0.5'),('afuluu7ptcim0smkb8kevlbber',1590050848,'','172.18.0.5'),('agjft52c6qorkmu1o7htknlm9n',1590050944,'','172.18.0.5'),('ahda9fg4o61i70vqdmeg5vcn69',1590050948,'','172.18.0.5'),('ahhjsr50d1754il79supppcp8s',1590050406,'','172.18.0.5'),('ahsg4611vihtaoor1i5g5p8ggu',1590050524,'','172.18.0.5'),('ai6n8bj6h7tdfedaf4l69av1sg',1590050949,'','172.18.0.5'),('ai8i1ri4g3nombguf62g1hthbc',1607094623,'','172.18.0.5'),('aiildan899rp2g363k2fboljlm',1607093330,'','172.18.0.5'),('al918r7d9got63foksrrdtq792',1590051027,'','172.18.0.5'),('ampe2s5gim87hdkfb7tqbq8rpr',1590051135,'','172.18.0.5'),('an4om5p4db97e7i8n5m7sucov0',1607095396,'','172.18.0.5'),('an7hdd07mjcs7g792fpc9kl2gi',1590051424,'','172.18.0.5'),('ana5fmrsp7b3ngi4pp7agihvr6',1607095000,'','172.18.0.5'),('ankoudq2lndajdodcbageb16qe',1590051524,'','172.18.0.5'),('anm7sjfg3hb9o5fferj6urotkg',1607094822,'','172.18.0.5'),('anovs0mf0t6n9i64kn9mjblogi',1607094118,'','172.18.0.5'),('anpdc9j0ubm1vsmp4cistj5c6b',1607095052,'','172.18.0.5'),('ao106jnkafip8utlq4772mmvqu',1590051545,'','172.18.0.5'),('ao3ca990vsclqag93377m31ibk',1590049918,'','172.18.0.5'),('ao99apbf4r701u1t4nmcqidfqd',1607093516,'','172.18.0.5'),('ao9vq6rmbivo7cmi08bsf715lq',1607093330,'','172.18.0.5'),('aogjhd4pdmvk4h7v716uc6j9iv',1590050522,'','172.18.0.5'),('aosp83if952v0l7nh3rvp0t7i4',1590050693,'','172.18.0.5'),('apmvi5uh3pbgl6sqbjlk3o9m0k',1590050849,'','172.18.0.5'),('apt60eoa8lv89cnpiccmft7tai',1590051542,'','172.18.0.5'),('aq1affv265lqfq1591ac77svcq',1590050845,'','172.18.0.5'),('aq531llnhhglngfddrmqfc08p5',1607094685,'','172.18.0.5'),('arhc2bopeu3gvosk0noj7gathe',1607093250,'','172.18.0.5'),('arq24vb37rfrvgfvvo05s1f55i',1607095169,'','172.18.0.5'),('asdbap4r5mq3jbdfujvoe32dk3',1590051421,'','172.18.0.5'),('asglql85vi353jdev8sskd9a47',1590050946,'','172.18.0.5'),('at1vgl7i1mhkv3q4l3969cpp6f',1590051545,'','172.18.0.5'),('at7r1ss8av7evo0go9lrr27srf',1590051476,'','172.18.0.5'),('atlktodu38meks2qc89n6s70dc',1590050848,'','172.18.0.5'),('au2289ui3ike6dabnutr7qes14',1590050692,'','172.18.0.5'),('av3cjidt467mnoc2t62braijcn',1590050846,'','172.18.0.5'),('b01q0u06gufndc6ien2k7rgj91',1607095170,'','172.18.0.5'),('b0lhaok0m49rji352bihgm3grq',1590050474,'','172.18.0.5'),('b0ssmtd821ua4tm1rb4j033797',1590050844,'','172.18.0.5'),('b1cdcl3mjo81ro68dfbsbbavtq',1590050693,'','172.18.0.5'),('b24lc1nt8dut9hrobjbj4de3ri',1590050689,'','172.18.0.5'),('b2pvlic6853lkrn2ar11i0e3cn',1607094939,'','172.18.0.5'),('b327pm5pp4st1s4cda07p3tg3b',1590051545,'','172.18.0.5'),('b348qmujaq6lrj8m4748ata29j',1607095000,'','172.18.0.5'),('b3brav3vqho466fq41t81r7lrg',1590050688,'','172.18.0.5'),('b5bdu15k6gk0du0mq5mklrphh4',1607094940,'','172.18.0.5'),('b5k7bdnv05c9mup0c0q9rd4ibn',1607094416,'','172.18.0.5'),('b6f0c2okjms0mbb2244m3reiqj',1590051024,'','172.18.0.5'),('b73vuc16hc3t89nuunvi87f9c2',1590051545,'','172.18.0.5'),('b7ldkm7qmlgahbskcggh0t9mlj',1590050406,'','172.18.0.5'),('b7mmc4o23mmldpcekrj2ch8s6t',1590050522,'','172.18.0.5'),('b7n9j2dbapck124h0ha478f4t7',1590050689,'','172.18.0.5'),('b827lq0pramk8po7aguptt95b0',1590050471,'','172.18.0.5'),('b8jlhqcpdr60bbglpc6jj4qkhk',1590050948,'','172.18.0.5'),('b8kk0b199avifh6ng9temlf0v4',1590050692,'','172.18.0.5'),('b9hsrj1tt83csevtuugf77lehj',1607095396,'','172.18.0.5'),('b9loggshgfva81tmdvlrv9crf8',1590050577,'','172.18.0.5'),('b9pho3s948172osnukj17rqc1f',1590050946,'','172.18.0.5'),('ba6lsvlm9h2h63q3ou2lqh4inm',1590051524,'','172.18.0.5'),('ba98ln2k5rn3nsrrdfm01gucpl',1590051135,'','172.18.0.5'),('bb4e35c65hdid0660c9hmaqkec',1590050522,'','172.18.0.5'),('bb4uoqrin6sfl5ct17u8kul9hp',1590051421,'','172.18.0.5'),('bb70arsf4e5l260i4ciio1gbo9',1590050688,'','172.18.0.5'),('bbbjsskk17cgfho2t0cl5e39rj',1590051423,'','172.18.0.5'),('bbdjplng2a158gq2oj1s6h2gb7',1607094417,'','172.18.0.5'),('bbl3ted3imlimv5oqfp35geee7',1607093330,'','172.18.0.5'),('bbt44r0n8p7af6hm7df1js5dae',1590051424,'','172.18.0.5'),('bc46acc0r5hst60777mel5d6td',1590050945,'','172.18.0.5'),('bc9533e0fttr9vmdledru5qe0u',1607095169,'','172.18.0.5'),('bcb2ptu110620pj0geeli4r8av',1590050844,'','172.18.0.5'),('bckmiv3h7li3a7npo1imf06mk7',1590051521,'','172.18.0.5'),('bct3blu2b1mf9s25cfgjls78d1',1590051520,'','172.18.0.5'),('bd5c625dud51r9iqeqbmn9n4ee',1590050474,'','172.18.0.5'),('bd816rj1sst3p7v6sfts1qv1ac',1590051137,'','172.18.0.5'),('bdk8bi2lupr18jces9vbhfvplb',1607094880,'','172.18.0.5'),('bdsji6ji4lrud8nnuhjh87r38r',1590050525,'','172.18.0.5'),('bdtlm2o4qp08ugdmvn13ajtrch',1590051026,'','172.18.0.5'),('beem38obes4nr9g9r6pkt28f9d',1607095348,'','172.18.0.5'),('bef8b8c37hg1uo5vh90mg25u6n',1590050522,'','172.18.0.5'),('begt6dvmm44i680t9h9sn4nh0v',1590051135,'','172.18.0.5'),('bfjr16p49saqe26p4jdqvm507j',1590050403,'','172.18.0.5'),('bg196lm1uql115mjk101uuhet6',1590051542,'','172.18.0.5'),('bg3crr9tbaqb5jm1hjniec79te',1607094822,'','172.18.0.5'),('bg4iriljc1inh8vnsq72micr4p',1590050474,'','172.18.0.5'),('bg74orb8klgs2rbbig2khpvq2u',1590051024,'','172.18.0.5'),('bgkcecprbjll2feu71q7kq6nrp',1607095169,'','172.18.0.5'),('bhhh5tp0cjidurq27hdet2vpeo',1607095000,'','172.18.0.5'),('bhmpuhfsjeel7copildhv511k4',1590051135,'','172.18.0.5'),('bi5gjmd1v0dj0hkdmj7rbb24m6',1590049886,'','172.18.0.5'),('bif01i7f5eg0u2ai7ltd52n5p1',1590050848,'','172.18.0.5'),('biv2b8itnc67k797javhfhb1sa',1590051524,'','172.18.0.5'),('bjh52p0qop9qud42qideqr83rf',1607095347,'','172.18.0.5'),('bjul9112mpqsm65uuf5kl0l2uc',1607093516,'','172.18.0.5'),('bkavc3s68hbtpa1hmb6ntdojo2',1590051138,'','172.18.0.5'),('bkrs6uv00mega9v69jgakmvlq4',1590051521,'','172.18.0.5'),('bkt79mf7v960up1e84s12qrtmr',1607095053,'','172.18.0.5'),('blkaace8gap3re0jncamq5gj4f',1607095348,'','172.18.0.5'),('blljubbphtqu9de7saar2etdma',1590051521,'','172.18.0.5'),('bna7jjp873096b4lrlepitino9',1607095396,'','172.18.0.5'),('bnj87ms475mcsomrdmn93mcsmu',1590051524,'','172.18.0.5'),('boaki4pmf5bj5fntavt7g6ksso',1607094880,'','172.18.0.5'),('boeg3bo2rse57cl8ngmftrotiq',1590050845,'','172.18.0.5'),('bp3mct7guehpq645cfp405i3do',1607095347,'','172.18.0.5'),('bp493peb09jb4kkrniefh9l9nf',1607095169,'','172.18.0.5'),('bpaqehops47c50r7ue5v0gph91',1590050846,'','172.18.0.5'),('bpiomhfb0lvm2j0q8gvc9m1q33',1590049918,'','172.18.0.5'),('bpvtdkajtuchnlt3mop035d4lq',1607094939,'','172.18.0.5'),('bq2sbrbrumfqq5kg56me4oe763',1590051134,'','172.18.0.5'),('bqbtgef7jesau1kgg95njjmh3m',1590051134,'','172.18.0.5'),('bqgl32pbf1qsa6lqrmiadfkkcg',1590050576,'','172.18.0.5'),('bqi5js53h9sv86c1d9nai95ce0',1607095170,'','172.18.0.5'),('bqjuenf9ckfea3jt3bbo1qhorh',1607095395,'','172.18.0.5'),('bqpbqmu6nhlqvjpjpm1frcqil2',1607094623,'','172.18.0.5'),('br112n8es5erj2e9bmhj6rsvsb',1590050521,'','172.18.0.5'),('br8l20nn773amdrailll24f12s',1590051521,'','172.18.0.5'),('brabot5hqrj6n4lmtg8ib67j7e',1590050849,'','172.18.0.5'),('brbkubvvejsfik7ltnt5lj5244',1590051545,'','172.18.0.5'),('brhpg3bs585q12n4df81qblkm3',1590050946,'','172.18.0.5'),('brk6cdv13933kftq22saik77l7',1607094823,'','172.18.0.5'),('bsiace7kta630rbbakiq6ott1q',1607094822,'','172.18.0.5'),('bt6iafd26qcnj1gc85n38ccto7',1607094416,'','172.18.0.5'),('btbcthkoe51kjv8f2l4qkccdjn',1590051421,'','172.18.0.5'),('btvi1ed6r8ana8ob1sn8kf5lop',1607093516,'','172.18.0.5'),('bufno8cgl5pt20l77r0ubf6tlc',1607094671,'','172.18.0.5'),('bupar46uegqpp1359691j4d66d',1590050522,'','172.18.0.5'),('bvub51n6rg0qthh5h2rht768rc',1590051424,'','172.18.0.5'),('c0rpo4j2p0fug9456eg710l2oe',1590051138,'','172.18.0.5'),('c0udamm2tc2dmalm3e59qqf2pt',1590049918,'','172.18.0.5'),('c14jc264jj6u31ra8chj4ihklc',1590050846,'','172.18.0.5'),('c15179ls0js6rsfh0vilnifsg6',1590050574,'','172.18.0.5'),('c1aqnftilj65p4pea7ktfh018m',1590050577,'','172.18.0.5'),('c1e6obc3nb0alah4ddi9bfmem7',1607094880,'','172.18.0.5'),('c1h5k3846atck8btjb1fmbad7q',1590050849,'','172.18.0.5'),('c2j0vkt6ve358ghcp9dj0s6fkk',1607095170,'','172.18.0.5'),('c2nnvf9cjcqpa13ig17urj304k',1607094622,'','172.18.0.5'),('c2oi9cch0q9vpcni2fitucjsmc',1590051476,'','172.18.0.5'),('c2r5ubo5v9loepg43fcl3fecb6',1590051545,'','172.18.0.5'),('c44qri3plerb91dd6i564vmcai',1590050403,'','172.18.0.5'),('c44vmc3umpr51fj1gigponvl2u',1590049886,'','172.18.0.5'),('c4u05qlj7ds2bqr28s1ud90609',1590050574,'','172.18.0.5'),('c4u8aoa17f6baqafvgd2gvg63d',1590050474,'','172.18.0.5'),('c529hemr97ql5lc4l4nqlql263',1590050849,'','172.18.0.5'),('c55aai68sim722cvqokk4cdu0t',1590050689,'','172.18.0.5'),('c569b11100jbifrmgds2v49uk8',1590050574,'','172.18.0.5'),('c5denqe6l7ebgtht5rkjs2ctm4',1590051542,'','172.18.0.5'),('c5dht224kv3h2o2ctoa4bnqv39',1590050474,'','172.18.0.5'),('c5fk17irrjc2l6tr3q7lregb6o',1607093249,'','172.18.0.5'),('c710gqe1kaleaicq3qr4pe5ao4',1607094880,'','172.18.0.5'),('c7a5u4l741cqpb8uh99jsjeds3',1590050949,'','172.18.0.5'),('c7hgncfj8etqd24a1ui5671uuf',1607093251,'','172.18.0.5'),('c82crc8e3do0rkm945k6quik1g',1590050849,'','172.18.0.5'),('c83vao693doau53tubmjcs6d5g',1607094670,'','172.18.0.5'),('c8h2q6cseipsgs26pa8qhc2eco',1590051521,'','172.18.0.5'),('c8lregln37iku64p486c5vcgaj',1590051521,'','172.18.0.5'),('c8sec2a4b801u6rv38tnn3d7co',1607095395,'','172.18.0.5'),('c98c5g76kpkjtmmklgaui77btt',1607094329,'','172.18.0.5'),('c9eq897oa7jvlcusuf1mr89jo1',1607094416,'','172.18.0.5'),('c9jk18ujnvjv4obs9n2dmia37s',1590051542,'','172.18.0.5'),('ca57ge7kv3poe0aaakfn1omg5r',1590051521,'','172.18.0.5'),('ca7dlgcjoemif0lriat1qvlo8e',1590051478,'','172.18.0.5'),('can91si62olv2bc4tufjrv8lfb',1607095395,'','172.18.0.5'),('cao7jjeh0q8gbb707pavvr27hd',1607094822,'','172.18.0.5'),('cb7geroue77rm5esboigck4hd8',1590051542,'','172.18.0.5'),('cbmdk7c01pk4gq2n4868jhrqvt',1590051521,'','172.18.0.5'),('cbr41bs2hh9t2s8rseeu8mmmj1',1590051026,'','172.18.0.5'),('cckh87j57cvpn5ili429clrrs4',1607095396,'','172.18.0.5'),('ccqdtvc9j1khaemg6o7erup0h9',1590051135,'','172.18.0.5'),('ccslhik5gbslil3c4p4ecjvp6f',1590051138,'','172.18.0.5'),('cd45khdski6t2sdqkh6ocpekhm',1590050944,'','172.18.0.5'),('cdfa0pnhi66mtdr2hajge2o3t3',1590051026,'','172.18.0.5'),('ce61q25mgi084udpt776q2k2kd',1590050689,'','172.18.0.5'),('ces91nch4kv0n2i5l2t1a6m28k',1607094670,'','172.18.0.5'),('cfjb9crig0dbkgnqfuun8os92n',1590051475,'','172.18.0.5'),('cfvijivk1s4g9f2eqr9fm4esfc',1590051134,'','172.18.0.5'),('cg7ssd0dsfvdemd7oolf3eoq7l',1590051023,'','172.18.0.5'),('cg8o225n5b2qjc6bc0vsmiumpc',1590050692,'','172.18.0.5'),('cgchuiu7ies9etl508a5vbpiva',1590051475,'','172.18.0.5'),('cghedgnor09v6mb15t1s6ro4vf',1607093329,'','172.18.0.5'),('cgi07s0rmhb8l8b02lqoke29s4',1590050576,'','172.18.0.5'),('cgoe02pj7dcljon417270n2d7o',1590050577,'','172.18.0.5'),('chc4rsh2egc9e8a7sk1jp0tmnr',1590050471,'','172.18.0.5'),('chcklconpht923h7fkoddl985m',1607094671,'','172.18.0.5'),('ciivohivfdokbvhg9rc95j93ui',1590051027,'','172.18.0.5'),('ciobbiovgqnqrhjsdlst0v4o70',1607094671,'','172.18.0.5'),('ciutt5qa5uj256rg6g39pbb2iu',1590051479,'','172.18.0.5'),('cjd5s8f0sb8dtr91odvc5mmold',1607094821,'','172.18.0.5'),('cjmgip2flbqs5m1q1qkpc537tn',1590050845,'','172.18.0.5'),('cjtt62etbrptro2ujr847f0k7o',1590051137,'','172.18.0.5'),('ck7jghc21tallam0haokm6vcjv',1590051521,'','172.18.0.5'),('ckc3ovh4hos91bddq29mcd9pkh',1590050405,'','172.18.0.5'),('cklmvbhac3eijl855md4g5m0bo',1590050689,'','172.18.0.5'),('ckmf414ut1tfl2vc48ksv2v3bn',1607095396,'','172.18.0.5'),('cm5rbgb204rabcanb00973gcee',1590051134,'','172.18.0.5'),('cm70e8lnnch5bjsa399ji505q7',1607094622,'','172.18.0.5'),('cn0vplstns9uj6ppgkpo19t5ek',1607094879,'','172.18.0.5'),('cp0bcn513edno94c61b7k6u1tn',1590051543,'','172.18.0.5'),('cp1oabkme9jtmirtg6fh68n2ts',1607094671,'','172.18.0.5'),('cqincik4frfh1p2kn7tirf9ifo',1607094841,'','172.18.0.5'),('cqvkne81ijfi57jea59n96cv0d',1590051023,'','172.18.0.5'),('crk8eoqiqvf9m8n6sth4rihvu6',1607094417,'','172.18.0.5'),('crl0n65j6orr2u5aa3et2vd1vq',1590050691,'','172.18.0.5'),('cs5mmp73mv64thv9k2o88ntpga',1590051545,'','172.18.0.5'),('csva803p1lb3nioubbr7qqd96l',1607094939,'','172.18.0.5'),('ct28et310g1gfujup091ramo4t',1590051521,'','172.18.0.5'),('ctlobi4qaphs5e7bjguhdc7bsu',1590051134,'','172.18.0.5'),('ctnesopp83rq2sk1m7h0brfnoq',1590049886,'','172.18.0.5'),('cu2411ol0l9ng30evnipkp91g3',1590051138,'','172.18.0.5'),('culscbbl35hvltdclh3nlqfhqp',1607094873,'','172.18.0.5'),('curb2iokfgrqdd813vomhsd29g',1590050691,'','172.18.0.5'),('cv3ktr3rosjuk4ant9f87j80gi',1590051542,'','172.18.0.5'),('cv6rrfaiu2rkou77lu7eg5l0ku',1607094880,'','172.18.0.5'),('cvupg8l3or6hvn37r1mms7qg6c',1607094716,'','172.18.0.5'),('d0dqdvfsit5sl343pnbvamruhh',1590051542,'','172.18.0.5'),('d0jqv1v0qpn2na301rjjh2ngh5',1607095000,'','172.18.0.5'),('d11s0hevsfgn4gvlnthiagce87',1590050473,'','172.18.0.5'),('d2plhpgp367qa5odggjhk3edmj',1607094821,'','172.18.0.5'),('d3gld4fhh4sg91u624qohumsad',1607094416,'','172.18.0.5'),('d4c4o14ara2bkbcjm7amllfgo5',1607095052,'','172.18.0.5'),('d4dqsfjt21u6dcatrlbfcerpvp',1590051135,'','172.18.0.5'),('d4e0uuetns2f5tc075clbl4144',1607095052,'','172.18.0.5'),('d4leb0bjtv7eaqdbavmca6rfdg',1590050845,'','172.18.0.5'),('d6kvcmk0sinbmbmt4d6f0s43iv',1590050405,'','172.18.0.5'),('d753romqvehgi9842vlfi3eb3c',1607094841,'','172.18.0.5'),('d7cvmm7d6sk73t8t9e18ogscos',1607094669,'','172.18.0.5'),('d8bmlvggsr4sulo647iopnp29s',1590051524,'','172.18.0.5'),('d98sbc7kkkoj8h0sk9tbce2qg2',1607094822,'','172.18.0.5'),('d9dpo10dg0fijppuog979c3sl4',1607095169,'','172.18.0.5'),('da9o4g4gh6fdb3ucsjqm4g408k',1590050577,'','172.18.0.5'),('dan2n5cq4efrsm7d4apd1i4uol',1607095169,'','172.18.0.5'),('dbak1n2eukdhpkga07qgc34t65',1590050522,'','172.18.0.5'),('dbaq02mvf3n6okkvdfcjmbgt5r',1607094329,'','172.18.0.5'),('dbbfn8v6hrm82f07e617n4njdp',1590050848,'','172.18.0.5'),('dbnhqavtq01vltouualh1da7k7',1607093250,'','172.18.0.5'),('dcq2k6hvmjn62jdbrffcsfmeah',1590050473,'','172.18.0.5'),('dcqpbibcrlccpr3die41f06trt',1607093516,'','172.18.0.5'),('dd8lhnl0eihsq6a1g1d0uqeqo1',1590050406,'','172.18.0.5'),('ddl644g3mu67vffn4r04jb5ks4',1590051423,'','172.18.0.5'),('ddmi879bsem6ode1r7pvl91dq5',1590051024,'','172.18.0.5'),('deih4fp3mpia1rrltfptcgjjtb',1590051542,'','172.18.0.5'),('dej82rt4hgnjbp35vvr2c2rhev',1590051475,'','172.18.0.5'),('dfgt745205bcjj8hkcd1rc6soh',1607094940,'','172.18.0.5'),('dg3avjg7b86hisn0g299mh16hu',1590050845,'','172.18.0.5'),('dglpm1f61s4820phfsd5m8vttl',1607093250,'','172.18.0.5'),('dh8ja8gd3cqlde7jcg8bl1uqpn',1607095348,'','172.18.0.5'),('di39pirohurjrh9dek8aco2oc4',1607095396,'','172.18.0.5'),('di3l2ugd03hkmcsetp4i8qdtog',1607093517,'','172.18.0.5'),('di839br99ltretscf80qh4tc3c',1607095348,'','172.18.0.5'),('dip6q7ijp5ih0sbk26nb1ltd17',1607095053,'','172.18.0.5'),('djckjcn2e7bsrc2q53kijmkvq8',1590050692,'','172.18.0.5'),('djl5fv6433p8jq2ph9p6uhle96',1607094880,'','172.18.0.5'),('djlgnrg82s2t472tcdaia4nked',1607095001,'','172.18.0.5'),('dkh4v469vv3erhabdj4knrnpvk',1590050471,'','172.18.0.5'),('dlfvfv5nrso0v6l65ou5j5r7ps',1590050403,'','172.18.0.5'),('dm0arakppu1fo1r1uc29n12h7r',1590051520,'','172.18.0.5'),('dmc976dtupub0rtid3quqdhrvi',1590051135,'','172.18.0.5'),('dmd45ippscdhc3lars1c7e5ev5',1607095396,'','172.18.0.5'),('dmveada3cg11h9u5kad1ll4tie',1607094622,'','172.18.0.5'),('dna4lobktriqv106ljti8p0n7o',1607094416,'','172.18.0.5'),('dnaqrjsf09a4reel2m9iqsdt3b',1590049886,'','172.18.0.5'),('dnfoabl9v6lfhkp8snjel218sl',1590051138,'','172.18.0.5'),('dopijvi219bbvqmrtlqqmhbrml',1607095000,'','172.18.0.5'),('dprn7ulerk38t41qc1c6j3gshq',1590050574,'','172.18.0.5'),('dq2h3v5uqvbc4728p5i40g05ub',1590051026,'','172.18.0.5'),('dqh9p9c45t33ndg1prg2f4dl0k',1607093249,'','172.18.0.5'),('dqkkifus9uda520775bkoj0je8',1607094417,'','172.18.0.5'),('dr17s6bttrpd0s11rdj4dtvkbv',1607095348,'','172.18.0.5'),('dr3vm2eebt5f0urk2bgccmkt75',1607094822,'','172.18.0.5'),('drl9ptiodd6gmijm7kern55hlv',1590050577,'','172.18.0.5'),('ds8do3e75040rrdojs2pankqd2',1590051421,'','172.18.0.5'),('dsl0lp1dnk94vbs5hhn357mkdt',1607095052,'','172.18.0.5'),('dt08o8eu0mpbfsol6em5ebcf1m',1590049918,'','172.18.0.5'),('dt19kfuduqug1jj04qnbt8grob',1590051137,'','172.18.0.5'),('dt4ej5tg5ueegtbl1rqusi96do',1590050471,'','172.18.0.5'),('dt99pnqv5h728258skr2h6lapd',1590049886,'','172.18.0.5'),('dthkff6v196gi7jd8bb60g05jm',1607094417,'','172.18.0.5'),('dto96shn2mcbk5virl9j9hqgoj',1590050949,'','172.18.0.5'),('duc9rsmhhtoj8vglnk7l7qdf5g',1590051542,'','172.18.0.5'),('duuui0mdv8o0biqnpqjfrfbd5h',1590051026,'','172.18.0.5'),('dvjtl2du0gnbbkr7l358ijmcfe',1590051545,'','172.18.0.5'),('e07vhr69mnl1a8u8nsv385gkr5',1590050522,'','172.18.0.5'),('e0jt71f05k8eua5335qt2ap8m0',1607094671,'','172.18.0.5'),('e0nlunqmb9q5dnuf3mtuouhmqf',1590049886,'','172.18.0.5'),('e1g2pu4g4egp8hnh5sq16mf2ae',1590050949,'','172.18.0.5'),('e1k95goaql5fsqkp9pl7kgt1l3',1590050693,'','172.18.0.5'),('e1n32uip48isqqckhp8eq5jknv',1607094329,'','172.18.0.5'),('e2akakp7gn68hua7a2aj51dbhn',1590050846,'','172.18.0.5'),('e2ckjjvf2ig3epsug2urltc7ce',1607094873,'','172.18.0.5'),('e2gul5fiakc444evhuop67ktr7',1607094879,'','172.18.0.5'),('e3fmpqqf332g904ok1ps7ve1rv',1590050471,'','172.18.0.5'),('e4749p751qbut3vj2l164rtr05',1607095395,'','172.18.0.5'),('e4991kuldqudjj963k63n4h0mn',1607094821,'','172.18.0.5'),('e49u121mfha74svi1f8p1kt1hq',1590050471,'','172.18.0.5'),('e4fa3v321u4che0lshiikjpa9q',1590050524,'','172.18.0.5'),('e4gcnnv0q12pbo53p0q5gkavm3',1590049886,'','172.18.0.5'),('e4hkgpvfj8g3r17s0cnratij25',1590051479,'','172.18.0.5'),('e5hspg5fi8uu0lfd5ug3hal8qk',1590051521,'','172.18.0.5'),('e5k93at933tqf0159s1l9alodn',1590050949,'','172.18.0.5'),('e6e1c0jpd3i933o98lbtvbqcvs',1590050525,'','172.18.0.5'),('e7oh0fb0q9atbuic7b9blqpucu',1607095396,'','172.18.0.5'),('e88d1a602pok45ifvk808gpdme',1590050845,'','172.18.0.5'),('e8jhtg91ul4560mmv51hj3bnmd',1590050574,'','172.18.0.5'),('e92vg55v4k46m95tusant7mu9q',1590050689,'','172.18.0.5'),('e9898s03o5nak39srvnc6a7fu9',1590050525,'','172.18.0.5'),('e9lthtkufopqp7jnvhaga8jptk',1590049886,'','172.18.0.5'),('e9oknlajrngmiagddgs8mcj3u8',1590051023,'','172.18.0.5'),('e9oq1d5hnam36qg6odl6m8uts2',1590051545,'','172.18.0.5'),('ea329r30dbi2jiev317tveneqr',1590051023,'','172.18.0.5'),('eaffqa1lntvh8q7nc42942fk2s',1607094821,'','172.18.0.5'),('eah4j2mu2oj312ohv5m5d85sqr',1607093516,'','172.18.0.5'),('eahgr2cb1mh3p2270c92b9o8vd',1590050574,'','172.18.0.5'),('ebjjr0i4kk49enf9egbr4h1cqp',1607094610,'','172.18.0.5'),('ebkvrgoehhhp9f2oh4qcgte8uc',1607094841,'','172.18.0.5'),('ecjebvgsnm2fcca6ge4k3uq6go',1590050474,'','172.18.0.5'),('ed5ln4qa2rjnd0bjeip1q2htie',1590049918,'','172.18.0.5'),('edrc8vd3pa69kpgch7ish8e8vv',1590051022,'','172.18.0.5'),('ee0fnl9b7rn11n9fo1tbqoa5sn',1607094610,'','172.18.0.5'),('ee2u8u0goqvo3dbcm50sa04tab',1607094879,'','172.18.0.5'),('eej4idrg1h5k9ib03d0hhq1eoi',1590050403,'','172.18.0.5'),('eepj7i5t9ti8rns6g6rhuod4cc',1590051479,'','172.18.0.5'),('eern5h5t6p4lm9lbjpracte7nk',1590051138,'','172.18.0.5'),('ef29d35f6fbalu55tuia8nltjd',1590050845,'','172.18.0.5'),('efdhrf809dh0ain3n5p5tergii',1590050946,'','172.18.0.5'),('eh9ri9r1b2egkb8g7mt3mql57f',1590051022,'','172.18.0.5'),('ehgf94cdu09trailciggr89ug5',1607095001,'','172.18.0.5'),('ehpl1np31er1624gl1l6u57hoq',1590051478,'','172.18.0.5'),('eidr8u7e1pnpgk5udst21dkbb0',1607094671,'','172.18.0.5'),('eifeojjh45i7bt2g94jnlt20o5',1607093251,'','172.18.0.5'),('eiiq6n07soidar79hf6alhdba6',1590050472,'','172.18.0.5'),('eiluem2p0sl26vki3c87d5mmo3',1607094415,'','172.18.0.5'),('eip39iod56sppuo0ijilkhtmmr',1590050692,'','172.18.0.5'),('ej0on6ek5kak96e2hfhd9luro0',1590051524,'','172.18.0.5'),('ekb3tpukgeb1fi74rlvc7kh50f',1590050522,'','172.18.0.5'),('ekdoq3tdeb1c7sj2r0b446cbui',1590049919,'','172.18.0.5'),('elmqe888vue52hvg75d0hsddq7',1590049918,'','172.18.0.5'),('elo06j4oa62i8pt0pj6fdn6ppa',1607094622,'','172.18.0.5'),('elpcs4r0cng7p3e407o1jtpteh',1590050948,'','172.18.0.5'),('elpokicvfni4j55j82ctcdmer2',1590051026,'','172.18.0.5'),('elroqb8vrdl1cgd9ck0v01bvbv',1607093331,'','172.18.0.5'),('emcjfa2amuu5gp6i7amr227sd3',1590051545,'','172.18.0.5'),('emeghnn5jla0v39ngfiogm1oev',1590050525,'','172.18.0.5'),('en2icib1pdlejdki3vit9eru24',1590051421,'','172.18.0.5'),('eo730n1uolp9a49otkg20l9kmg',1607094940,'','172.18.0.5'),('eoan2g88rkv7ncgmivbsl9bd32',1590051135,'','172.18.0.5'),('eop0oqgn80sgkvpqffu89pto84',1590049886,'','172.18.0.5'),('eosrakjs1fb7e0ruf140sqr0i2',1607094716,'','172.18.0.5'),('eqd85u0gsn1cl3j5530i722nln',1590050574,'','172.18.0.5'),('eqfloob9r40eii8uodl4qmedaa',1590050848,'','172.18.0.5'),('eqlhjesgp8s9g83ag5sr8orjue',1607093517,'','172.18.0.5'),('eqrsrpgco01gclj5re281rv25p',1590050692,'','172.18.0.5'),('er90ddarliffeq5kphm9ghoecf',1590051524,'','172.18.0.5'),('eres4npmhdui777uf94ts1mtjc',1607095000,'','172.18.0.5'),('erh6u88poemp0vqtbq2qb6iftd',1590050849,'','172.18.0.5'),('ero34malh8f2is9cjbb7pr95cu',1590051479,'','172.18.0.5'),('erq6lrgn5ah60hnoe95sdrghvf',1590051478,'','172.18.0.5'),('es9ldogcrtvmq74h4urf8s21v0',1607093250,'','172.18.0.5'),('eseg6g49hohcv6p6o73cdnivuo',1590051421,'','172.18.0.5'),('esekud4tlcoth98bjoelfdll9l',1590051421,'','172.18.0.5'),('esp01cqvsasgcmla43pmk2ioh2',1590051478,'','172.18.0.5'),('eu4nfrqqrs4ft8lphp1b5b16k9',1607095053,'','172.18.0.5'),('eu7fet3ucqd6v1kmglo9aj3egb',1607094610,'','172.18.0.5'),('euklhhdnj0cvmcs6o6e25q8b3m',1590050472,'','172.18.0.5'),('eut1ca8btoppjsrbn36frmothh',1590050474,'','172.18.0.5'),('evc0akhb60b1jf80cj600gec0j',1607093250,'','172.18.0.5'),('evr621vbap8e4sdbqq07no85ce',1607094100,'','172.18.0.5'),('f0sd6548cn81dhd6eq8gjd8mf7',1590050949,'','172.18.0.5'),('f1087hdfga46nqcdsv4mbepr1a',1590050474,'','172.18.0.5'),('f1b3ttf0hkupurcgt2koe9rqec',1607094416,'','172.18.0.5'),('f1m0svpkqlivcjdms5v25ifobb',1607095001,'','172.18.0.5'),('f2i67jilndpkjpside20ol2iid',1590050525,'','172.18.0.5'),('f3svdb4p6jrpjp0k3j0vgviu4l',1590049919,'','172.18.0.5'),('f5egts8mvchdsr0fk4b7l02bhm',1590051424,'','172.18.0.5'),('f5epkdefr7d273mq40k8tf6mnj',1590051138,'','172.18.0.5'),('f5ltld799t1rvt1jdri53k0ba1',1607095052,'','172.18.0.5'),('f6052a1cfdj6c53gnnlfm6m5p9',1607094416,'','172.18.0.5'),('f66bvna6iif3k1alosismuut0j',1590050403,'','172.18.0.5'),('f6oapd56dipi01ml763r1quhfk',1607094822,'','172.18.0.5'),('f7e8r8dftsrjsjdo6g2a52qfgl',1590049886,'','172.18.0.5'),('f7jppj4ia467a12aaagkb1l5ab',1607094939,'','172.18.0.5'),('f7kvmgvbuk58th13tmps3cev95',1607094822,'','172.18.0.5'),('f7ppek3hci1mq5cfv1i0tbcilp',1590050403,'','172.18.0.5'),('f7pqcbipbso7hmm3ca4s6ehlju',1590051524,'','172.18.0.5'),('f8536uf7mh59ri8vs4qmb6pj2q',1607095000,'','172.18.0.5'),('f8e5aqpo98t7o9jv16v1it25cp',1607093249,'','172.18.0.5'),('f8g67pr9shnas2vm3j93fs9imv',1607094610,'','172.18.0.5'),('f8hnflbkc87mlj3qnsrag236nf',1607094940,'','172.18.0.5'),('f9b8557nk5nsn7grhdebfapmq0',1590051026,'','172.18.0.5'),('fa01mdaoqmin2r5j1nqm5iv499',1590051545,'','172.18.0.5'),('fa2klhn30l7p023kdmf3lm4or6',1607094132,'','172.18.0.5'),('fa523r2k378711sfqnuteaeeh7',1590051521,'','172.18.0.5'),('fakdvmsikn43tle9f93akctte6',1590050945,'','172.18.0.5'),('falgekhmqbbjjil4evm4leh4fq',1590050949,'','172.18.0.5'),('fbdh952g48d146nfvhgp4ajgeu',1590050403,'','172.18.0.5'),('fc6gnlllhqoekkopdongndpfjb',1590051135,'','172.18.0.5'),('fcgli1j54ssjlp14eu3mubskqi',1607095396,'','172.18.0.5'),('fcsps7hk4eeho5lhemgdhaqnul',1590049886,'','172.18.0.5'),('fd1mrndoefct02gvpcgtejo1d8',1590051542,'','172.18.0.5'),('fdi7ol70ekshjki5pis40fn0fl',1590050522,'','172.18.0.5'),('fdtid9u72sd7jif5s7lcbhd9n1',1590051543,'','172.18.0.5'),('fedl38sum3nl4vr30mtqp02r5r',1590050948,'','172.18.0.5'),('feku81eo3g5ju8pqillgg53fka',1590050946,'','172.18.0.5'),('fet51nlirsdm7lt8dj4j86b5t1',1590051026,'','172.18.0.5'),('ffh0q3dvbu0c076gvpgcgh4brq',1590051524,'','172.18.0.5'),('ffrj0mhtg8jmt3mfi1445scatt',1607094941,'','172.18.0.5'),('ffu7r2gnam1efmn8f49ka9vo36',1590051475,'','172.18.0.5'),('fg30mhijd3tci6main2j9lnjnq',1590051544,'','172.18.0.5'),('fhgupmbui04bm3rdppjh467v6e',1607094416,'','172.18.0.5'),('fhvp1obngmtd6hb50ijpktcd49',1590050406,'','172.18.0.5'),('fi0hk145uas0obftnbrv0vg9ho',1590050849,'','172.18.0.5'),('fja3j44jap2dl9cf8gfc9b95h7',1590049886,'','172.18.0.5'),('fjkjp9jdfpvd8vamnn75pp67bt',1590051524,'','172.18.0.5'),('flrh36si9ndkun89o5idavvqjm',1590051479,'','172.18.0.5'),('fmb82bst9q17gmk0mdviefm5dr',1590051138,'','172.18.0.5'),('fn61fm6phplr18j29gfa4to0af',1590050474,'','172.18.0.5'),('fnkrnebvbr92rq4elgrm4cvnqt',1607095169,'','172.18.0.5'),('fnq3itsoi5npgcvt40v2bb5t4n',1607094941,'','172.18.0.5'),('fnt9nb9snjoft0e96f9dsc70ir',1590051521,'','172.18.0.5'),('fo62vrvcn0dpgc54he8dnugvlq',1607093329,'','172.18.0.5'),('fo8lj59atrrqdapa7j5icndvus',1590050521,'','172.18.0.5'),('fo93qj3u1k30q1vgqi09buc1o6',1590050574,'','172.18.0.5'),('fpcmumvkilv00vo6k11uaut8mr',1590050403,'','172.18.0.5'),('fqjbbj6vgtjn0v6hbgtk8c2gf5',1607093250,'','172.18.0.5'),('fr7cprtse81hf23eh1lcrk56mn',1590050406,'','172.18.0.5'),('fru41ni2afpum861l0t3mhhj2n',1590051475,'','172.18.0.5'),('fs167mtmpot5i75q5o7q8p4vq2',1590050577,'','172.18.0.5'),('fsgeeabfi755m85dphfsmqlv9k',1607094881,'','172.18.0.5'),('ft9gddpa9bvj9efpuc9mflod9r',1590050573,'','172.18.0.5'),('fu4h5pcr35vi7tikls791hp7fo',1590049886,'','172.18.0.5'),('fu6t3rt5q941ubvoii17j7b3b8',1590050471,'','172.18.0.5'),('fuepbru9f4rkbfk873bkf9uqrc',1590050474,'','172.18.0.5'),('fugh18sajaj3tc60efjjt40qqe',1590050524,'','172.18.0.5'),('fv4n6ss5oe6aopa49sb08o2mlp',1590050949,'','172.18.0.5'),('fviibk3quiqlgmuiq762vops33',1590050574,'','172.18.0.5'),('fviv02it57q15c8hko1apq7qr1',1590051424,'','172.18.0.5'),('fvpap4uthppe9banmg5qssbb7s',1590051475,'','172.18.0.5'),('g0lnq2nda7ad8jtj7el4u08adl',1607095053,'','172.18.0.5'),('g0r705qp1hun1cdct9h0cj02pv',1590050948,'','172.18.0.5'),('g11vqn05hula9icc45klvlod4v',1590050849,'','172.18.0.5'),('g1630vmtirfhpvrmc61v71kjb7',1590050474,'','172.18.0.5'),('g16aujbfg3feqf4588cr5h9i02',1607094622,'','172.18.0.5'),('g1g504fvqp9l1026td7r5i1348',1590051134,'','172.18.0.5'),('g1likp9om9d5jel9kbqbj0e58a',1590050949,'','172.18.0.5'),('g1va3o2tkhl3i8m59a6ukl3km0',1590051523,'','172.18.0.5'),('g24vnj6ndfcimjl6f9u2nkfrgo',1590051026,'','172.18.0.5'),('g3ar308cq72njjk1kl2cge0jg5',1590051026,'','172.18.0.5'),('g3bfo7m0s91gb1n01vamjilsce',1590050403,'','172.18.0.5'),('g45jolhb93oho2a2g2809nfkpb',1590051476,'','172.18.0.5'),('g461465h9hnbvq0tgfmqv5mlgl',1590049918,'','172.18.0.5'),('g4i14k3kalgasbfs0vfbq6l3kl',1607095052,'','172.18.0.5'),('g5duopkdq9vm4spg640te9ufs8',1607094822,'','172.18.0.5'),('g5vii7c6451a51vor70skc5von',1607095000,'','172.18.0.5'),('g61pbh28mh8prm0dp6qf7ddhpb',1590050848,'','172.18.0.5'),('g6ui1b6arvrgettrskepvm6kud',1607094939,'','172.18.0.5'),('g72hggq7c9bgkuvcql0p9p6snn',1590050525,'','172.18.0.5'),('g7k4jd57qfbcdm1nlfnep7pe0t',1607095396,'','172.18.0.5'),('g89lvjt0ottbdthn2v9bjgl7ta',1607094671,'','172.18.0.5'),('g8c2dg03polgdj2jjgbom8jq50',1590051424,'','172.18.0.5'),('g8dgubsqlg1da1fdpqc288s8cs',1590051542,'','172.18.0.5'),('g9c33vu3p9dnca0vanoq6tm2el',1590049918,'','172.18.0.5'),('g9e6j28eequmu3gapdlee8pc65',1590051424,'','172.18.0.5'),('ga1odc9326im0s5rd0uuqnde4m',1607095396,'','172.18.0.5'),('gamjvg05h3oqbpd6a865u95uir',1607095396,'','172.18.0.5'),('gasn8g9p9of0lj5q9587ujnnq3',1590049886,'','172.18.0.5'),('gbiudj7miik98qh96089qins43',1590051545,'','172.18.0.5'),('gbu6d9m1nt937cgrknahvi1vqg',1607095000,'','172.18.0.5'),('gbvd05c0v02rgkucu29o81fkjo',1607094610,'','172.18.0.5'),('gc0kho51qtdc2eq6edadnpcc2r',1590050945,'','172.18.0.5'),('gcb4vvk7sujdori3fr41bl4j71',1607095169,'','172.18.0.5'),('gch58ekd3ruc7ohviapdcv1fdk',1590050949,'','172.18.0.5'),('gcichnr9ehgjr8s5voal67gabd',1590050472,'','172.18.0.5'),('gd41ca9scat3e1svr121sovu4g',1590050521,'','172.18.0.5'),('gd59osr46gtfohk3s8vh40u3e7',1607095348,'','172.18.0.5'),('gdl01ai7speo8p39eq1ve8kkn7',1590050471,'','172.18.0.5'),('ge10skuqcocuti7ls2ugo47vtu',1590051135,'','172.18.0.5'),('geh8t2q3pgb2cof4ebivm90bf8',1590051135,'','172.18.0.5'),('gfd4ru5hkea0i4jbp8ggdnhr46',1607094873,'','172.18.0.5'),('gfdtr809le1cmh0o27o015g02v',1590051137,'','172.18.0.5'),('gfo0uf61rrrvv61mjblsdhccp8',1590051521,'','172.18.0.5'),('gg7tv3512jcllotinaafn3ev66',1607094329,'','172.18.0.5'),('ggve0djvekt8tkv9mv7ju0i9ei',1590050576,'','172.18.0.5'),('ghdf2pg51mrsq02kvfci846ou5',1590051521,'','172.18.0.5'),('ghe2vmrb7bd5ra5hjm98bfhdug',1607094939,'','172.18.0.5'),('ghh879srdmdipl26sf13325ggi',1607095001,'','172.18.0.5'),('ghqlmvle4tku4mn4pu29gr8sg3',1590051543,'','172.18.0.5'),('gj80o4s95kvv1sp61h17vvlf5o',1590051137,'','172.18.0.5'),('gjivpr3qum7bdtodrafn6u4vhu',1590050474,'','172.18.0.5'),('gk8189932ro99okbrpeu4b38s4',1607094416,'','172.18.0.5'),('gkfj46563j2psr13pl4cd2cite',1590050405,'','172.18.0.5'),('gkpa47ocuc9c9gmg9m8ec8l0i6',1590051478,'','172.18.0.5'),('gl9dpa4g1hqg5cuftk2pmnh4bi',1590050471,'','172.18.0.5'),('gldttavrf8cjkefoippgfrd98g',1590051478,'','172.18.0.5'),('glj3c5v1seagb6dvon2fnflcjg',1590050403,'','172.18.0.5'),('glsrc099m13fok05grhgo0u71g',1607094873,'','172.18.0.5'),('gmpu73upif88jf9eck1mlp40q2',1590050522,'','172.18.0.5'),('go8741nh41t5065ingnqapfmae',1607094670,'','172.18.0.5'),('goitbtrr735tnt6apqqgs0pipc',1590051421,'','172.18.0.5'),('gorovj1lf7cndq6qjsmp4ucok1',1590050405,'','172.18.0.5'),('gp5qk1tlm71lci612g3odacs22',1607093517,'','172.18.0.5'),('gpmipjm3h8q4lqdhcidbqgl6bh',1590051023,'','172.18.0.5'),('gqjbvror49geltm5pv6nbqr2h0',1590050577,'','172.18.0.5'),('gqjjjjopumma0co0g79lm4ncsh',1590050471,'','172.18.0.5'),('gqr99aq80f6fc6te0vcgluiem3',1607093330,'','172.18.0.5'),('gr56tmdldqkimlj02f2cvjlojl',1607095396,'','172.18.0.5'),('grifuvlpfs8213nfm06eltnsib',1607095052,'','172.18.0.5'),('grm3bsamvhfuumj0hodg570bdq',1607095001,'','172.18.0.5'),('grmv9ret1dkfgkhhl4o6l46f4a',1590051421,'','172.18.0.5'),('gs4b5sep0endlnv2blsrdsrttp',1590051421,'','172.18.0.5'),('gsupqht32i2k86riasl1b2cs8t',1607094080,'','172.18.0.5'),('gti6bk2ddr4jrcatd686dspr6k',1590051138,'','172.18.0.5'),('guj28po5cp7qi4si0v5a3nfmvp',1607094940,'','172.18.0.5'),('gv6tbbm7u6ueumhcejosbi9qm3',1590050577,'','172.18.0.5'),('gvho9smkap145ba5gf0uoc48i9',1590051475,'','172.18.0.5'),('h0lm1th10ifr2vbuaqgi6nqtha',1590050406,'','172.18.0.5'),('h0lqe3ms37j8rv3s093eno6j7i',1590051421,'','172.18.0.5'),('h0tbv9tc1nuuvkmt3ogphrc53j',1590050573,'','172.18.0.5'),('h0v9bgiinq452cv517iu9sk87g',1607093249,'','172.18.0.5'),('h11isd4f2n8ac7l6sbtojoiagi',1590051023,'','172.18.0.5'),('h2er4ehsb755vfsp54c9d84ji5',1590050692,'','172.18.0.5'),('h2p9rl0gckjfq7feo8url2lcm7',1590051545,'','172.18.0.5'),('h3pqvp52a1gr0ek0t79plduuoo',1590050574,'','172.18.0.5'),('h3u39t5ftn3ra3mecj6greui75',1590050949,'','172.18.0.5'),('h3vu1fp978sutmo7sisg7bgvad',1590050406,'','172.18.0.5'),('h49c44svoj55m6oig4jpae2vcm',1607095396,'','172.18.0.5'),('h4i52dias0ob3t2mcfvkudp75v',1590051479,'','172.18.0.5'),('h4ukru62sel5ju4tqq9mncu9f7',1590051476,'','172.18.0.5'),('h6fpsvqpur48j8lv01m3ptf6kp',1590050403,'','172.18.0.5'),('h73jtpc0v6ndlaemqtbve5urde',1590051542,'','172.18.0.5'),('h7e5kj930oudeqqfa148g1o485',1590049918,'','172.18.0.5'),('h7e8ptmrokp9t6avf7k54p3p4s',1607094611,'','172.18.0.5'),('h828cdmj6u4fbddpidhsfqkrpe',1590051520,'','172.18.0.5'),('h832novdictgpoievgipe29o40',1590051135,'','172.18.0.5'),('h87drnmitpm93leir9805kaera',1590050474,'','172.18.0.5'),('h87uod5cqob9i01ck026tn0dkm',1590051424,'','172.18.0.5'),('h8p01hn9e4g9d2ol88v2868611',1607094821,'','172.18.0.5'),('h98guin1hbhnmqo9u3k6hsan5k',1590050574,'','172.18.0.5'),('h9d0hpn5qg8tinmnusei8e441l',1590050949,'','172.18.0.5'),('h9lcgf4oij1vag0n2acnsnt07k',1590050688,'','172.18.0.5'),('h9lt52um59qb676044l7jsj99n',1590051545,'','172.18.0.5'),('hadh5kvsqlnccbno6cptteh956',1590051524,'','172.18.0.5'),('hae8j08sgqnnlhftp3eetslgtq',1607094670,'','172.18.0.5'),('hagssuba0d99j7jdvofo3ubfi7',1590050406,'','172.18.0.5'),('halr7jqag4oi61228pf45i0un1',1590050846,'','172.18.0.5'),('hb3piet4j5rpochoncm3m8j3l7',1590050574,'','172.18.0.5'),('hbn5v8tmbnoa2051latbts15b7',1590050406,'','172.18.0.5'),('hbrqvnaaue9bsksfr9j3su3q06',1607095053,'','172.18.0.5'),('hcc5jk50dnksurlupd1jtqr3cq',1590051423,'','172.18.0.5'),('hda2010k8r4kg4asj9f66p9jkj',1590050692,'','172.18.0.5'),('hdadi0dftkqm965d5r1fl5vob2',1590050846,'','172.18.0.5'),('hdfp07ca4g5u86k438r0abmmpf',1590049918,'','172.18.0.5'),('heqg43f7egn83djqqf529q7mv5',1590050845,'','172.18.0.5'),('hfjecvko6l3o0mtju9anp0f4gn',1607094417,'','172.18.0.5'),('hftmt4tt0bcqr85as5sv7kntcd',1590051023,'','172.18.0.5'),('hg1ufv01gnt9s2j7sski471s6b',1590050522,'','172.18.0.5'),('hg7j7rj19l7b692cfdvq802p47',1590050946,'','172.18.0.5'),('hgt1k7ljminaacnk1djemrv9f5',1590050474,'','172.18.0.5'),('hh44na7is88vnuv2a86ceg8aeb',1607093250,'','172.18.0.5'),('hhd99fjhadasla1tk3rp75bgvm',1590051524,'','172.18.0.5'),('hhec5akhvldp79t35eg4tq4qie',1590049886,'','172.18.0.5'),('hhuh73virtukog2puagulqrhu0',1590051022,'','172.18.0.5'),('hif9hnh502imje8dvf6f7rruq8',1590050574,'','172.18.0.5'),('hiliqlvmb0lan3dc40lqujgpme',1590050846,'','172.18.0.5'),('himh48gs2ia2un9kibehtkr9no',1590050946,'','172.18.0.5'),('hjl6agrjiufdnamfug09seh0l5',1607094939,'','172.18.0.5'),('hjlp94r9mf7a57p843cdhgdhat',1590051521,'','172.18.0.5'),('hjrojb9l768h24ug8gbh3kpsfb',1607093330,'','172.18.0.5'),('hk46uijhcv0ofplo9m4r9vbum0',1590050948,'','172.18.0.5'),('hk7t3r8kpc6qv6vp83iqij3vnf',1590050471,'','172.18.0.5'),('hmbhoijrs61snoaifnvaiogh1t',1607095052,'','172.18.0.5'),('hn2sntde20annqrl0lt4qdrt2q',1607094417,'','172.18.0.5'),('hn64fsr8tce4q55kimbcm8h6k5',1607094823,'','172.18.0.5'),('hnfn1pfapec11a85abo1cag325',1590050577,'','172.18.0.5'),('hnim77nq1e1d9167slcnfpo9mq',1590050576,'','172.18.0.5'),('hnqc14079rapp8v108289n3sh1',1607095052,'','172.18.0.5'),('hogul8hfalqh2dpt0jdic5fg17',1590050471,'','172.18.0.5'),('hou209rdsl2smsds5ha6c6g1te',1607095001,'','172.18.0.5'),('hp64nctc85npoehoebr8g44nc7',1590050944,'','172.18.0.5'),('hpa3s40qvp80eaq6qsandsbv31',1590050474,'','172.18.0.5'),('hpa909lcjrhsema4oh5rmdarjr',1590050474,'','172.18.0.5'),('hpc4lnu0vpmjfu4ffk7lhfilqb',1590050471,'','172.18.0.5'),('hq2j7m3dd58tgddpttrs06327b',1590051424,'','172.18.0.5'),('hq4gvmorarkc3fnbk6pjh9k7ee',1607094247,'','172.18.0.5'),('hq7h8ckjaav9kt4gmdhcgpa82q',1607095052,'','172.18.0.5'),('hs1unjm8mj2avgqk73psp93fh2',1590051138,'','172.18.0.5'),('hsfeko42gdvv3tic85kdp04nbf',1590050521,'','172.18.0.5'),('hsptm0bl133itu3pa7ltvup0ie',1590050473,'','172.18.0.5'),('hsrqag1as6r4115hai8ncrc2j6',1607094822,'','172.18.0.5'),('htk937vakfiqhmf6f4957rkmib',1607093516,'','172.18.0.5'),('hueqd5tkeln08kb47lq3an7fji',1590051521,'','172.18.0.5'),('huqd0cbmbhacofna2s5l0ig5ct',1590051023,'','172.18.0.5'),('huvui8ha04ifdq5fujpase79s0',1590051524,'','172.18.0.5'),('hv3viiamm04dhe73dn79r8n467',1590051478,'','172.18.0.5'),('hvm9ti371osr4s52b06sn5jhhh',1590051026,'','172.18.0.5'),('i10hk5ja7a8h1uf1gic22ed3f3',1607095396,'','172.18.0.5'),('i18g3b7mbo7ignbai94ale778k',1607095348,'','172.18.0.5'),('i1b0j2nhihim8rs35836jao9g8',1607093251,'','172.18.0.5'),('i1ndp3cfr44mqkvl4v476qtmcc',1590051475,'','172.18.0.5'),('i3068ibnvv1v1o5c7j0dparaq8',1607094940,'','172.18.0.5'),('i31n449ub58aml72a50rsli0p7',1607094670,'','172.18.0.5'),('i37ep8odl9c7apvaa2vkpm7ju2',1607094822,'','172.18.0.5'),('i3fp91msodb76cdf16dgqgbp82',1590050522,'','172.18.0.5'),('i43agj03h3vsgjgajao53uiisk',1590050403,'','172.18.0.5'),('i45i7t77t398gqvl4hekk9ruk2',1590049918,'','172.18.0.5'),('i49lqumtat0bb21gi3e8qkg9oc',1590050471,'','172.18.0.5'),('i4e5h6hm9tspp3pujpdtd1ur2f',1607094821,'','172.18.0.5'),('i4l1ubeitckj141m7486aa0o50',1607093251,'','172.18.0.5'),('i4ov5d0jpcgk9csegig3ajttr6',1607094940,'','172.18.0.5'),('i5f111ueoe6ehrvdj0e180jf2d',1590051022,'','172.18.0.5'),('i6fc1tfidrknmlmjopt2hoh9ta',1590050403,'','172.18.0.5'),('i7e0194ii37g9mmt9oqg2bku0c',1590050577,'','172.18.0.5'),('i7o71jjhokccr03se0angol1mo',1590050848,'','172.18.0.5'),('i7sdj8gemvotlon8rdgrdghdal',1590050689,'','172.18.0.5'),('i854obakljsop8cagvt6m2ecs4',1590051138,'','172.18.0.5'),('i8grkr4ud1ajqn3o9kf5iib0to',1607094841,'','172.18.0.5'),('i9jp07nj7gq04eld7k0fvbi0oc',1590050522,'','172.18.0.5'),('ia50tsot4qdo8v3atf68kvru9k',1590051524,'','172.18.0.5'),('iaginv36ub1f8f33e61p0kl8jd',1590051023,'','172.18.0.5'),('iahaaos48ag8400tureuk78vsf',1590050577,'','172.18.0.5'),('ib49e9m8bc5oqiqjqsr9l4gtt9',1607094822,'','172.18.0.5'),('ic00rt0pj2i3rtkj638llhsds7',1607095053,'','172.18.0.5'),('icdn9lf90v5t77qmguvitjegs6',1590051135,'','172.18.0.5'),('icmshajo7r2tast7116c7mrstm',1590050522,'','172.18.0.5'),('icptdivnfu5pcnuvmdqjlop0ao',1590050945,'','172.18.0.5'),('id6jmota5q98i5jm19frfu0lkk',1607094873,'','172.18.0.5'),('idcf74kjtkup0nh8ou9bip7och',1590049886,'','172.18.0.5'),('idnbc9v7mqblkjo638sfseoe6t',1590051138,'','172.18.0.5'),('idqdsbsh6cqumk09o1uncnng5m',1590051543,'','172.18.0.5'),('idr054hgmuvriv3t047vamfhp3',1607093331,'','172.18.0.5'),('if9rb3ogmtnh505tjmnvavsnef',1590051026,'','172.18.0.5'),('ifj3jc3gq3uq0hv7c5aenop17c',1590051545,'','172.18.0.5'),('igctbevq2d969gb499638eh4cg',1590050406,'','172.18.0.5'),('ihkp7djldai3cs3rek061dj285',1607095001,'','172.18.0.5'),('ihnt9kb07vrdukltap84p6q75m',1590051521,'','172.18.0.5'),('iicqjpka8od98jih8trlsadudn',1590050688,'','172.18.0.5'),('iicvt25ecd924jcr8nh4vjt3ca',1590050693,'','172.18.0.5'),('iids3pl55vmdggnmvj3e03jihp',1590049886,'','172.18.0.5'),('iiosmq4fedb2rbed43jtn41vhj',1590051424,'','172.18.0.5'),('ij306rbr9on1cqeb7ui42tfg7f',1590050406,'','172.18.0.5'),('ijstvldn5l0o50lgo0krimdc8j',1607095000,'','172.18.0.5'),('ilr3fcov8smsrur9nopq64tb5j',1590050473,'','172.18.0.5'),('ilsdri78fts6bebo9i950t6u6n',1607095396,'','172.18.0.5'),('im2magsefm58f81l460p2as7q7',1607094822,'','172.18.0.5'),('im7ei0e6a065bf168adfmkfs8l',1607093517,'','172.18.0.5'),('ima3v4mkenktkh09g0t3p8llko',1590050945,'','172.18.0.5'),('imcp0vt6lb3j3e08lsilgkf1pm',1590051134,'','172.18.0.5'),('imf20ocm1c7k2lterv69bgppla',1590051545,'','172.18.0.5'),('imo5jt032h6j0laebn7v1d1gp8',1607093331,'','172.18.0.5'),('in7as47bi93ug1oj0ssbm777m4',1607093249,'','172.18.0.5'),('inlrj7ueq6hktbm6rlahj5tjbt',1590049918,'','172.18.0.5'),('inpg0knqd47lkcodlgk47bikaj',1590050524,'','172.18.0.5'),('io1e22lbtfjp1mb4ces09k8v1v',1590050403,'','172.18.0.5'),('io5fio7262to88t14ddf0m0ir1',1590050945,'','172.18.0.5'),('ipffk5ucm3c5n0d0mn4sj0nmvs',1590051424,'','172.18.0.5'),('ipk1dlm128bi8hdg53nm8opmgi',1590050945,'','172.18.0.5'),('iqiqn3dg3r92n9lh3vehc07sbd',1590050574,'','172.18.0.5'),('iqk2pc1j5de236f08ge254a7cs',1590051545,'','172.18.0.5'),('iqouf6snn6sgl2rqbvs00n2lqk',1590050692,'','172.18.0.5'),('ir28cap73d98annvuutpof5fjh',1590051475,'','172.18.0.5'),('irik6pigsfsd4io6l26n7289o6',1590051138,'','172.18.0.5'),('is4fm3h0qgel4ehaorlr6q762k',1590050403,'','172.18.0.5'),('is69fbudvfaan369n2l78unh4k',1590050525,'','172.18.0.5'),('isi86mclffbm5lon5el2gcmfh6',1607095348,'','172.18.0.5'),('isucu75mc08rtnpu9c0ejmsn3p',1590051545,'','172.18.0.5'),('isuhkvl2mar83hpqpr7nr2fsb9',1607095169,'','172.18.0.5'),('it7tguibfrd43pl9fq5fu5534e',1607095396,'','172.18.0.5'),('iui6c247dd4puj9539oj3v7304',1607095053,'','172.18.0.5'),('ivmvv7efp8eqeqieus67ptf5ll',1590051024,'','172.18.0.5'),('j04kfslg54kfamgohbkuh5as7m',1590050689,'','172.18.0.5'),('j066v0tt0jd6vujsr14taib16q',1607093516,'','172.18.0.5'),('j0pbpdn0ae1uk1f7i2grbqppju',1607095000,'','172.18.0.5'),('j1t53idv53ic5nm3m4e2mle8uf',1590050693,'','172.18.0.5'),('j22seapimog1csrvqup9vv3qd8',1590051423,'','172.18.0.5'),('j2iq3lt2numueci8bn8vu89ttm',1590050945,'','172.18.0.5'),('j39avao6bko69f2i9agff2frdm',1590050474,'','172.18.0.5'),('j4080f6tvjc2ctk5emv59cv7qj',1607094685,'','172.18.0.5'),('j489v91098ui8tb9f416htquhj',1590050945,'','172.18.0.5'),('j496thfvt8943ec8rps1n4e1fn',1607094416,'','172.18.0.5'),('j4cr3391v356qit50f5fa51s4p',1590051545,'','172.18.0.5'),('j4pcge1qtgkarsl6q93kkmbpv0',1607093331,'','172.18.0.5'),('j4su7po3ge9j4n26f8rbecusdt',1607094940,'','172.18.0.5'),('j56j7messk38ig8936ftf2ahon',1590050403,'','172.18.0.5'),('j58hmh7p8b124hdr1cdng79rhv',1590050403,'','172.18.0.5'),('j63hqfefc630sk4ml28737e5eb',1590051521,'','172.18.0.5'),('j6f63h1u4vihemv5brfqns38bk',1607093328,'','172.18.0.5'),('j6fnbii914ktcukp9rlkk9j1lk',1607095347,'','172.18.0.5'),('j7bf7ajitchtg89vi5d2julol6',1590051421,'','172.18.0.5'),('j85qchu93j7l48ea0r9ifloocv',1590050949,'','172.18.0.5'),('j90bc130qj7p6tm3i0f3587dpu',1590050474,'','172.18.0.5'),('jadtedjvmsgb8e6umuiinq3046',1590051524,'','172.18.0.5'),('jbpbvvtdr5cb7ko48b3lpi5opm',1590051024,'','172.18.0.5'),('jbqhf509bbrr7a7s7eqrnubalf',1590051138,'','172.18.0.5'),('jbs76orhfc4udi09v5jdjoojmg',1590050471,'','172.18.0.5'),('jbt39f8esvahg7dqotudrskl8t',1590050524,'','172.18.0.5'),('jcdjbcnqa67sq3d956b1hf7ek0',1590049886,'','172.18.0.5'),('jcfivj5sircu7i0vi8flf6444h',1607095348,'','172.18.0.5'),('jd29iaktd08cv5p2mmksje0lpd',1607093517,'','172.18.0.5'),('jd4u71refksvtnsq7196loh2dm',1590051520,'','172.18.0.5'),('jd8po6rt5igc95cl9ulh2ba652',1590051545,'','172.18.0.5'),('jd9m5sl7jucptu7ut0t0sebn9s',1607093330,'','172.18.0.5'),('jdkmi5t543ml98a09mpv51hg4n',1590051138,'','172.18.0.5'),('jdmin2qu4i93qqjp6qdfrelskl',1590051542,'','172.18.0.5'),('jdmud0d6osfvjiobk7iu0lnbbg',1590050848,'','172.18.0.5'),('jdoohj9iqcbuburu0f4t1rmgua',1590050403,'','172.18.0.5'),('jeg9ps1gclb3di6tkn71cu39n5',1590051478,'','172.18.0.5'),('jelonnk4ml1nmaqtg304qp7hd9',1590050406,'','172.18.0.5'),('jeosnjv04h55s897d18cg53kia',1607093517,'','172.18.0.5'),('jes822b9gi4ptvasga4h8utvbc',1590051423,'','172.18.0.5'),('jf2sp1auishbk4rhb0el3kjk0s',1607095169,'','172.18.0.5'),('jf81vieug5s5keogd8o7aj596m',1607095395,'','172.18.0.5'),('jfkrveod3d8e7pt4v6qomgpq9f',1590051135,'','172.18.0.5'),('jfngrslnanjc4s409djndege2p',1607095170,'','172.18.0.5'),('jftri2jnl0o66q8kqcd0iu7oib',1607095052,'','172.18.0.5'),('jgb0r1dioq32jtpu66pvlkk7kc',1590050845,'','172.18.0.5'),('jha35udl3piodhgef9g7knm31g',1590050403,'','172.18.0.5'),('jhakgdip1cg49mnk72mmrmlnue',1590050849,'','172.18.0.5'),('jhbn105ufj46ft456m6iipje8e',1590050577,'','172.18.0.5'),('jhi4dcei3f6rn68028618vlre3',1590051475,'','172.18.0.5'),('jhkmiou82hcf1ti1cs8j7o60rr',1607093517,'','172.18.0.5'),('jho4bkoc1n2ggqmbs1k0rff9ce',1590050524,'','172.18.0.5'),('ji7857d2qmggbl328nfp5rdd8v',1607093516,'','172.18.0.5'),('jios4jlpe2f6bibckl62esk9nm',1590050473,'','172.18.0.5'),('jiq0lapvkmf33ipajhpmm65eju',1607094623,'','172.18.0.5'),('jjk0m61hi6j4pfkq60d9nbf8l4',1590050403,'','172.18.0.5'),('jjt8km03degj1it0p55m2iu22s',1590051026,'','172.18.0.5'),('jkcbgpt2dild8jm7650f0ctoui',1590050690,'','172.18.0.5'),('jkh6u73erj3vsc5ocki2fibkkm',1607095053,'','172.18.0.5'),('jlgrocoopatvfotq183p95k2bu',1607095396,'','172.18.0.5'),('jljc4fcrg8ulegdeof8ss6us5o',1590050525,'','172.18.0.5'),('jllujjstr0gcfp57t319febvqk',1607093516,'','172.18.0.5'),('jlniv75fn5r0t9leh19s3igvh1',1607094416,'','172.18.0.5'),('jmhqgl6ge0f2ahhbeagk6st6ul',1590050949,'','172.18.0.5'),('jmo18vmhlpt43mnjsu6l0m7a0q',1607094670,'','172.18.0.5'),('jnepahvhvj5o8jepcll3gn4v00',1590050689,'','172.18.0.5'),('jo0hfagbf78rgdljq6b03uon94',1590050577,'','172.18.0.5'),('jo4apg3g9mvtv1dgoutuuikdvl',1590050945,'','172.18.0.5'),('jof6ai4em4d9cb6e12k0n9988a',1590050577,'','172.18.0.5'),('jpditojggktn2l9qgj6kr2vklj',1590051026,'','172.18.0.5'),('jpehk5i5v6gciiak5bk35f2brm',1590051479,'','172.18.0.5'),('jpjf88gb4fnhvpq30rrpdfcq7a',1607094417,'','172.18.0.5'),('jq2hjii0mi67ei9vq28613lljo',1607095052,'','172.18.0.5'),('jqtptdn0dhlnbckjbqsdi39ck2',1590051135,'','172.18.0.5'),('jqvouijkpnh7g5vro3tgocncs2',1590049885,'','172.18.0.5'),('jrb2rjsd2jk5q3djkob34fbk87',1590050406,'','172.18.0.5'),('jrscq2f3egp5mihe75jjqgt2u4',1590050848,'','172.18.0.5'),('jsl1acrrjuaak812cte755d8ft',1590050688,'','172.18.0.5'),('jtsm9sh8arie6rkuphk91nt2vp',1607094841,'','172.18.0.5'),('jufrg3jnv107ntts321apn49vq',1607095396,'','172.18.0.5'),('jv6of5ghdspr9lmue7u7if93af',1607095348,'','172.18.0.5'),('jvcl2gbfova15p1bfi4rbvs1k5',1590051524,'','172.18.0.5'),('jvlpoovj8ss8pp49p3ac42a3sb',1590051524,'','172.18.0.5'),('jvnjedq8hhgk7fbl9p9gaar098',1590050525,'','172.18.0.5'),('jvqher637ipg8p2ht6q6ktg4d3',1590051544,'','172.18.0.5'),('k0u2u43ekhurv868082i9jm0np',1590051026,'','172.18.0.5'),('k1cosm9apo295v4se596u6737j',1590050522,'','172.18.0.5'),('k2btikujsdhtq5a36ueed5lq3r',1590050848,'','172.18.0.5'),('k2k12hoc7h4m7mtulsqr10f9g3',1590051023,'','172.18.0.5'),('k3n1o0gmgtfoadr8be0tgl1umj',1607094841,'','172.18.0.5'),('k5451kb3lj9i635pua06ojc5sk',1590051027,'','172.18.0.5'),('k5j15s37v6o7km0jbmj2q77r3c',1590050848,'','172.18.0.5'),('k5npb3rpilloj5emna8bdd2m1p',1590051023,'','172.18.0.5'),('k67t64qpka9m456b9a30nnnb07',1607093516,'','172.18.0.5'),('k6g52fbf20idshmh8c8s0hbpcf',1590050577,'','172.18.0.5'),('k76b7r554f1tfqquckc9r5nub9',1590051423,'','172.18.0.5'),('k77e0lcdk7rcb7i6e8n9obevih',1590049960,'','172.18.0.5'),('k7h5s6lhahr07sdscfbbptor93',1590050577,'','172.18.0.5'),('k7lrl4p7m2jfnb26f6f3ajpqut',1590050525,'','172.18.0.5'),('k8ltnjhh0gpfm3a2fb4ah8he79',1607094417,'','172.18.0.5'),('k95k2k6p8nhh5ad0ujv281psp2',1590050525,'','172.18.0.5'),('k9979gvgku5b4tbglgrh9abuve',1590050846,'','172.18.0.5'),('k9oa0cdbi33cd7i7s1totd5nc5',1590050689,'','172.18.0.5'),('k9qi63d8ohp4g6uo11hi3cm64t',1590050946,'','172.18.0.5'),('kadefjt719r00fgtar8jde8jo6',1607095348,'','172.18.0.5'),('kahlk790kevc4a287tlb6gu2oc',1607095348,'','172.18.0.5'),('kbbpkp2ach6mdgfs1ansjaqpuk',1590051135,'','172.18.0.5'),('kbnn9o5lllncphibjmcfud3gud',1590051026,'','172.18.0.5'),('kbopptq6mjrd6ibihar1mjk5pi',1590050574,'','172.18.0.5'),('kbou05eqdc29lpuuap6qu4rq3h',1607094622,'','172.18.0.5'),('kc0m9s5f0jva0f7b1j5omacj01',1590051024,'','172.18.0.5'),('kc36l9oi2vsd5kgvh05alitt4i',1590050525,'','172.18.0.5'),('kc461mm7h6ld11gt8usgtqmhqa',1590051475,'','172.18.0.5'),('kctmbqqj6uq2ccr5lcordgfcn4',1590050845,'','172.18.0.5'),('kd2csldi1ldp283q0pop4b4rmp',1590050845,'','172.18.0.5'),('kd8gqjcvs7090hq6vtunvmjosr',1607094415,'','172.18.0.5'),('kdscugtujov22javhoqlsp5t6v',1607093251,'','172.18.0.5'),('keoej2u24kjvlejal95kcrefq1',1607094822,'','172.18.0.5'),('kert6358pveo52mc57df524i81',1607094941,'','172.18.0.5'),('kev5nehjmm1ear9snavd36rmgo',1607094416,'','172.18.0.5'),('kf7mlhil8srrpc5j23cuuqnmsu',1590051421,'','172.18.0.5'),('kf80g98e707b6t9k3kshpo0qgt',1607094822,'','172.18.0.5'),('kfmsvumu0arssmcuon9tpc3q5r',1607095053,'','172.18.0.5'),('kg9qc3mm2n5l3feuauidj2o7ko',1590050577,'','172.18.0.5'),('kgh20cmk64nn7s9lfno5ntuvmu',1590050525,'','172.18.0.5'),('kglfp51nbbm9hlgnqs122adfno',1607094939,'','172.18.0.5'),('khdioja9ncqilljjm1nofmsagi',1590049885,'','172.18.0.5'),('khgehc48v86haj9c1kq66enqi8',1590050522,'','172.18.0.5'),('khrq3571lrgbdcnrmj1153t10v',1607095169,'','172.18.0.5'),('kiaqd0al73p7v1gn163s0o3sic',1590051026,'','172.18.0.5'),('kislcrft87bl686bsn0bbtjfbn',1590050474,'','172.18.0.5'),('kkq2otbrjsm59b1ftisurvdhek',1590050403,'','172.18.0.5'),('kkrsea1ql5a2tbjldfate291is',1607093516,'','172.18.0.5'),('kksn1a1lt8hd1bi3md98bjur5g',1607094880,'','172.18.0.5'),('klknm76pavvf4csel7ij08drk6',1607095053,'','172.18.0.5'),('kls857dk48hbaau1ce5b8pnh33',1607095395,'','172.18.0.5'),('km2t0r0l8oq21d39u89u1kaduj',1590050525,'','172.18.0.5'),('kmg1sd70dlsjl1330lkicmdtpv',1607095168,'','172.18.0.5'),('kn50odk1pghjjrcqm5psm4svnh',1607094940,'','172.18.0.5'),('ko0nk67fpqur25tmq65l9tfcvg',1590051521,'','172.18.0.5'),('kpfoakfn05bba8mrp325bqcupr',1607095047,'ipamusername|s:5:\"Admin\";ipamlanguage|s:11:\"en_US.UTF-8\";lastactive|i:1607095047;csrf_cookie_user-menu|s:32:\"uIMiJRqPprg3wuYIXmX_iMnF27WZMZiB\";csrf_cookie_address_11|s:32:\"iU0jE1AgCoYFyznhgSGFYpRtqAJOpVp8\";csrf_cookie_address_12|s:32:\"IBEj9B-lFxKnDOn_ERT8hX9kL2wDzk4S\";csrf_cookie_address_22|s:32:\"ZnN2XAmofrRYTtO4VGD8o_TOD9dWe3z5\";csrf_cookie_address_14|s:32:\"iFri0SdeTkxUKEx4jMlpXTVwEmM7HlV5\";','172.18.0.5'),('kpti3ickejj9m6556j6hkdidum',1590050946,'','172.18.0.5'),('kqaho5uav45spusk6ljob9r31u',1590050689,'','172.18.0.5'),('kqlril5i08mpnlhla10faliukc',1590050574,'','172.18.0.5'),('kreail2iu07gg82a258efht0cg',1590050525,'','172.18.0.5'),('krffpvp4o3h5nhku0bmhsl2qeb',1607093330,'','172.18.0.5'),('krqrtr8j7ukeashqvs4oefm2vv',1607094841,'','172.18.0.5'),('krrlao79dohj65krj8fl3e5d0a',1590050576,'','172.18.0.5'),('ksukvh8q5hutvbeoffdedppg51',1590051421,'','172.18.0.5'),('kt20hqm5upjk5tt9i0hgjjndcs',1590050845,'','172.18.0.5'),('kt20tri0tuusq51mauu47rek41',1607094416,'','172.18.0.5'),('ktg5icmil015q4f4snc0bev0d6',1590051421,'','172.18.0.5'),('kthbc60jbgdrkt8051fmpsmnha',1590050846,'','172.18.0.5'),('kthk41l5dr3h92kdrl9tjm6brj',1607094417,'','172.18.0.5'),('ktig6q7rc9vsbfcsu4gmc026cj',1607094670,'','172.18.0.5'),('kttrqo9chun045vse9ot2v52ns',1590049886,'','172.18.0.5'),('ku071ktb6sh5gfq113reu5c6ci',1590051137,'','172.18.0.5'),('ku0bfm84uqous67lnvpt7qboa2',1590051135,'','172.18.0.5'),('ku9dbj2q6hib9772avfvmnj8al',1607093250,'','172.18.0.5'),('kvqnrpmcusonhm6hfm9pop0gf2',1590050405,'','172.18.0.5'),('l0cda0ccrhs5u7u0h5p22a7i12',1607094940,'','172.18.0.5'),('l0e7qgd07o73h3o595gneoikp9',1590050948,'','172.18.0.5'),('l0fgc1pqr3sroa1v4ald6h5aip',1590051023,'','172.18.0.5'),('l0hi4g063it4cblt02pjiipnur',1607095001,'','172.18.0.5'),('l0i9hmhgebs4t5r4452rgvpml8',1590051545,'','172.18.0.5'),('l0t6d2sdvsnm6n0qr9f93likf2',1590050524,'','172.18.0.5'),('l2nkjrs2nm5mlhs6bhjdo35qha',1590050474,'','172.18.0.5'),('l2vsruf5c74hnk4amtgh8j6h1u',1590050688,'','172.18.0.5'),('l35ane4ush77qupolfgve7uvae',1590050848,'','172.18.0.5'),('l3ij22fnrk3jcgs7vr03hov72l',1590051134,'','172.18.0.5'),('l42legc18g8ne2jqmpo46um3ge',1607094670,'','172.18.0.5'),('l5256s144guunmc28bcjkn3l8k',1607094670,'','172.18.0.5'),('l695virl5u0u7oe1bru34thre5',1607094248,'','172.18.0.5'),('l6iphs52i1u16bevme8srmrs6c',1590050521,'','172.18.0.5'),('l6kjhoso47mfc9kbbcat55m0ck',1607094670,'','172.18.0.5'),('l6t39mnlila3h9bof50k1b4bkg',1590051542,'','172.18.0.5'),('l78lt26mvkah2655qlevvcnpbv',1607094841,'','172.18.0.5'),('l7cfrq6l3vnpuhen55adfpglcl',1590050522,'','172.18.0.5'),('l7jgp32qbsud6oe59f9onpnh1c',1590050471,'','172.18.0.5'),('l7ukslk9ql1kvfcpr2i24hosdo',1590050689,'','172.18.0.5'),('l82jn639v6advvstl2i7crsau7',1607094716,'','172.18.0.5'),('l836q328kj86c0pq62d3vu6tkb',1607093250,'','172.18.0.5'),('l85ra9m7bnlp3t33c0iiu3cbio',1590051476,'','172.18.0.5'),('l8c06j9nv3r71qh1b68gf1trcp',1607093330,'','172.18.0.5'),('l8h719at9jqd09lc09sh321uqn',1590050693,'','172.18.0.5'),('l8ltpp80hkjc20bntfetc1p6nn',1590051138,'','172.18.0.5'),('l8odjhcc52kqoi2eqoo76fcgrk',1590051524,'','172.18.0.5'),('l8tpce378pkmshcbbrs34pg69d',1607093329,'','172.18.0.5'),('l9532aiooq7892uc7ghl78k2lf',1590051542,'','172.18.0.5'),('l9chak6i307s5j97lbcbhemun0',1607093330,'','172.18.0.5'),('l9kdhb400ngqqkaou3lmahlf7c',1590050845,'','172.18.0.5'),('la1ahfr1v4v36qp1hse0v2nntq',1590050472,'','172.18.0.5'),('laei0qca5o5iofqoitt0se28kg',1590051138,'','172.18.0.5'),('laiegokrtjo78phib61uh82j1o',1590051475,'','172.18.0.5'),('lb01rna0n1df8s7353f7tlc48i',1607094939,'','172.18.0.5'),('ld3s4l24rofshv6tosktqljsk8',1607095000,'','172.18.0.5'),('ldftf1gtn41d0rme8uvpdd6ts5',1607094940,'','172.18.0.5'),('ldgsn37882h0ce067s8katqipi',1590050946,'','172.18.0.5'),('ldnvk6svha4chfcmqufs16hf5t',1590049918,'','172.18.0.5'),('le5dc6bvv8mfi407lakcpn00uo',1607093250,'','172.18.0.5'),('le6hhbl19at41c5hgkdptd145t',1590051421,'','172.18.0.5'),('leb3hll1srcc9scdm8me8rp3ga',1590051421,'','172.18.0.5'),('lg0mc15oeb170bkmdmrj0c31n3',1590049886,'','172.18.0.5'),('lg8cudfo0d1am314autc0qj3nq',1590049886,'','172.18.0.5'),('lgeaao238tfpmr6iq779da42qa',1607093250,'','172.18.0.5'),('lgf17tfrc5mb2df6ucn3c4n35u',1590049918,'','172.18.0.5'),('lh1p29509ua3ml1ro81rjcfppm',1590050845,'','172.18.0.5'),('lh2gc162jknlv6d5v46bfbucnd',1590051421,'','172.18.0.5'),('lhaqgelml1tguu6t4rfhdsbkj0',1607095001,'','172.18.0.5'),('lhpli26fnr4328k28n7bcuirp9',1590051475,'','172.18.0.5'),('li4s6dr1lklmqvdsuhhpnsj09h',1607093250,'','172.18.0.5'),('li8hf2i4mjjapcdgtra5et1tgh',1607095396,'','172.18.0.5'),('lig5i45iprls35rrrg0sds2lpb',1590051524,'','172.18.0.5'),('lk1mlktb9ia3miqhd1cls6v3t7',1590051542,'','172.18.0.5'),('lkc9pdj0uvtgtn336tpvsvm1f7',1590049886,'','172.18.0.5'),('lknv3gu9snkadue01vj2tgba4e',1590050522,'','172.18.0.5'),('ll5gpr6skcv7s64l6oqum1fu1r',1607095169,'','172.18.0.5'),('llt0aoh4r35ggg3qp402i6nlbr',1607093995,'','172.18.0.5'),('lm0nvhi0m80ip2qkm0dal0s466',1607093329,'','172.18.0.5'),('lm244o0fmtf0hkn48pdn468o5i',1590051424,'','172.18.0.5'),('lmlvd2gusf4h8i92v0c8rs8l5r',1607094873,'','172.18.0.5'),('ln54rpttskk2bja8mhd7gc3se8',1607094880,'','172.18.0.5'),('lnrb31ovdb2n4ng4f9h92ad2cl',1590049886,'','172.18.0.5'),('lo34fs7eq02e6g783p4bchqv8g',1607093250,'','172.18.0.5'),('lo5a6kk1u5e58csmhekhvehqgm',1590051478,'','172.18.0.5'),('lo6h9l3qcc6k68fsucfqraqpb4',1590050945,'','172.18.0.5'),('logq1edgl9ba0s0j7eti6mps50',1590051542,'','172.18.0.5'),('lompokeur1rg8ffr78rlad03dp',1590050848,'','172.18.0.5'),('lon5queaqu54irca8ig0oa0jfc',1590051421,'','172.18.0.5'),('lphhfjavfl06m64fp6i3kc802e',1590050948,'','172.18.0.5'),('lplqs9dme8vgiq0nl0scjae7tf',1590049918,'','172.18.0.5'),('lpni1jrli3k47e9531a2mel1ki',1607093250,'','172.18.0.5'),('lq1mg53vi3unq46jepp2758nvd',1590051027,'','172.18.0.5'),('lq456dkrfd9mej2tule7ulmh6j',1590051521,'','172.18.0.5'),('lq7uc88bm0jl17iau9ttmqmnfc',1590049918,'','172.18.0.5'),('lqco7j0vu2m5qaer9fgrn4vak4',1607094940,'','172.18.0.5'),('lqed71ejbimn9g693a9eq9bb1e',1590049918,'','172.18.0.5'),('lqfhrn3k1gfdlntdda22rusve6',1590051475,'','172.18.0.5'),('lqnk6pucq8m0c0eik09k1g3au4',1590051523,'','172.18.0.5'),('lqosc9g1259etfm7va15vkjcbi',1590050692,'','172.18.0.5'),('lqr6vec1sini868notsq3nodtr',1607095169,'','172.18.0.5'),('lr0eurr9a21j53m8kp4md65nd2',1590051476,'','172.18.0.5'),('lr1rt8cf2ko4vf2l0fcal0ni58',1590051478,'','172.18.0.5'),('lrpa8r53s1ciq26aeqluc2g4gb',1607094671,'','172.18.0.5'),('ls3s7avi27i6te3e4rgv85pi0g',1590051026,'','172.18.0.5'),('lsm05ivitcdcbb4t4l0bphdvbq',1607095169,'','172.18.0.5'),('lsta0o4ai013q9vll3u00o6aq7',1590051524,'','172.18.0.5'),('luj1tg18lp8uumcdfcu5f2n8ar',1607095347,'','172.18.0.5'),('lun3fjtra5nkd90ofrf892bv3v',1590050403,'','172.18.0.5'),('lvf53pffjnqpjhmp4nmaq8vsa2',1590051137,'','172.18.0.5'),('m0pffrh79cp6lqduqdi9167vn7',1590051023,'','172.18.0.5'),('m15eq8lnbq10rmtm9jd8n8ouas',1590050846,'','172.18.0.5'),('m1bfa742bu55vtc10g6js31o1b',1607094415,'','172.18.0.5'),('m1g8i6v9mimbb6rkpqvrfjc9tt',1607094873,'','172.18.0.5'),('m1j6gfp3e1dckiosiud4qskuje',1590050406,'','172.18.0.5'),('m224ohhgqs52mqloc5jsvleq5o',1607094622,'','172.18.0.5'),('m2ullc2qnk482jgc54e65esj6l',1607094716,'','172.18.0.5'),('m3274s91tf57g0ud24pmka1pgo',1607095395,'','172.18.0.5'),('m48ppt9uuv9tudl8svlnjbnicj',1607095001,'','172.18.0.5'),('m4g2lmo9k397r0gaqoc2vn6khv',1590051542,'','172.18.0.5'),('m523h6mlm9ug9tvlva1m56deff',1590050849,'','172.18.0.5'),('m5in19vovtetg386kok81la0qu',1590049885,'','172.18.0.5'),('m6k2jk6cc7uhoo7aqk9ueg08kt',1607094416,'','172.18.0.5'),('m87sp9grguluiql1a1b2nt5ev3',1607095170,'','172.18.0.5'),('m8gmvea8mpu8tpua8cc2gcm05b',1607094610,'','172.18.0.5'),('m8pvk7oo9tfdergr354d4gv88h',1607095348,'','172.18.0.5'),('m8r1if9u10o2jahn3r8vuho8k3',1607094873,'','172.18.0.5'),('m969cbil5iivi4uj7lad04av0c',1590050689,'','172.18.0.5'),('m9gvi1pig0apcl3mfoccnk17uf',1607095053,'','172.18.0.5'),('mat02u91bdlu9ras90s57f4n9n',1590050848,'','172.18.0.5'),('mb3fsvku4kg6ssiv25uo58imha',1590051024,'','172.18.0.5'),('mbav6ar4eg4far49bk0kj7pshv',1590051524,'','172.18.0.5'),('mbjartd337noom1s46nm2mobhr',1607094823,'','172.18.0.5'),('mbl30rgbds9mu1o5kg3aagobas',1590049886,'','172.18.0.5'),('mbmo3u4vqttbc8pbnfn3m74t8j',1590051421,'','172.18.0.5'),('mbrnhhecf00fckgdj59uu26o2t',1607095396,'','172.18.0.5'),('mbvlkf36lajqe8742i846nr5hh',1590050474,'','172.18.0.5'),('md09nh9e4rf3vmgj0igvrvvnch',1590050406,'','172.18.0.5'),('mdhi2tc6m0lf631m4ampkdf875',1607093250,'','172.18.0.5'),('mdrndb46insjjd8dmhiof02nq0',1607095000,'','172.18.0.5'),('me57qpjmnskpjfd3atqmfj5o6s',1590051135,'','172.18.0.5'),('me7i28dve5ftrvmrv4r0qt2jp0',1590051542,'','172.18.0.5'),('meupssejhg5rp6ol2e0pucvhr9',1590050574,'','172.18.0.5'),('mf30sadv7mrs25f8uasq7hq9nv',1590051421,'','172.18.0.5'),('mgf56f3per405gg6fabuu1etd3',1590050406,'','172.18.0.5'),('mgniid0aamf6sct04osaqod310',1607094417,'','172.18.0.5'),('mgpbsgn8h5ogduj9df2tll0916',1590051479,'','172.18.0.5'),('mh3mctrc3c8su4vk4qr1nhfh59',1590050949,'','172.18.0.5'),('mh4u78hevnhvidsn24lipc2oe0',1590050576,'','172.18.0.5'),('mhnl6qmdsfb12g7v35hqhnlkq3',1607094822,'','172.18.0.5'),('mhvgunthjfhlqr49t98jo89bcc',1590051521,'','172.18.0.5'),('mi64pr8j4tfnoqt701mt0c5hlu',1607093330,'','172.18.0.5'),('mig1ja174d506he34p5de98pmr',1590051138,'','172.18.0.5'),('min9gar9952oef2v1cnm22ltgs',1607094822,'','172.18.0.5'),('miohdoqc7dijmlog46v7rl2gbr',1590050945,'','172.18.0.5'),('miqrpcic53add7gcdlfs7nmu7n',1607094940,'','172.18.0.5'),('mj6lnsrbt4m9gq4rep34m7p0va',1590050403,'','172.18.0.5'),('mj9bhnvuptfm5t2htk1govn15v',1607095396,'','172.18.0.5'),('mjht3c9i6on2nl2bv8k64ce353',1607095348,'','172.18.0.5'),('mk3mbei104006nitekthgtuuh5',1590050845,'','172.18.0.5'),('mkfuk6aeen5c3osd86j357rv87',1607093516,'','172.18.0.5'),('mkr6n56kvl1taajdo000shsm6q',1590050848,'','172.18.0.5'),('mm7l5m7vhh3quss8s7438ru4r1',1590051135,'','172.18.0.5'),('mmbpafhacg4fi8bvdfoujclcpr',1590050522,'','172.18.0.5'),('mmfco96nbdpj8i3kcnlcf40nak',1590051026,'','172.18.0.5'),('mmj5u444nhg28iq0evijijj0v9',1590050525,'','172.18.0.5'),('mmq395uahfd7ageh7d655u0ncf',1607095168,'','172.18.0.5'),('mmtojavs9ho68bhvhdb3tmlhil',1607094822,'','172.18.0.5'),('mmtp3ucvqtoqudh0s031a9vg1r',1607093517,'','172.18.0.5'),('mnngeji0eg6kppretjh12qkul6',1607094670,'','172.18.0.5'),('mno4ja2oi2e4o48rqqvlptkiis',1590051421,'','172.18.0.5'),('mnvthhhte8s9ebst0cusaob6tr',1590050689,'','172.18.0.5'),('mo9k00cf4dmbl9f37uqkbqas14',1607094941,'','172.18.0.5'),('mogjdmpkamf8umfi9acp5jvbe2',1607094941,'','172.18.0.5'),('mosj0gr50n7a32ich39g89nh25',1607094841,'','172.18.0.5'),('mq0docqkjq0fmq9p6bhqu0pp50',1590050522,'','172.18.0.5'),('mq4b3hhlr041srpj6l3rtklua5',1590051542,'','172.18.0.5'),('mqq06n2ekl8g4spav7f61m0neg',1590051027,'','172.18.0.5'),('mr1b37n82qfvvvsf05sruagur7',1590051421,'','172.18.0.5'),('mr67sn7ks0p134ghkc7qjbd9f7',1590051137,'','172.18.0.5'),('mravb8n1euuooubhv0po68ucv8',1590051138,'','172.18.0.5'),('ms3be0mik81frjmd7idsrqdgk7',1590050525,'','172.18.0.5'),('msak8vnm39qq4oab5r4g3r8jmr',1590050471,'','172.18.0.5'),('msfg9ajdq1khbm8sac4vbf5pam',1590050574,'','172.18.0.5'),('mt0nc384fq6tli9d7go0akgcqq',1590051545,'','172.18.0.5'),('mt0ujna7ea4metb5uva4c08nf3',1607094940,'','172.18.0.5'),('mtflenm0l634o3sqil94b7tp6p',1590050689,'','172.18.0.5'),('mtslp2og1sb7dbbncujrcscr2u',1607095168,'','172.18.0.5'),('mu210tfe3df9ec8s0ulumbk0jo',1590050403,'','172.18.0.5'),('mu43epsddj9tg5ig80vc05j36j',1590050848,'','172.18.0.5'),('mug7ra92j7mv4omaiu3c9uup17',1590051027,'','172.18.0.5'),('mukujhe94fdvvpi4mvdbktpqp4',1590051475,'','172.18.0.5'),('mv2dn8i9up8vesktmo34g2uutj',1590051542,'','172.18.0.5'),('mvph9hg97gshnh4v62ebkef5sk',1607094939,'','172.18.0.5'),('n0kvc716sudc6880m6be02n6ao',1607094873,'','172.18.0.5'),('n0pk2hi3io7m3usirdjfujha1p',1607093330,'','172.18.0.5'),('n10oubp4q2srk64qnocul245qt',1590051521,'','172.18.0.5'),('n1pl59ri8df9pcak73pnkrjpb4',1590050471,'','172.18.0.5'),('n1s9vq98bo7kgqvv6sf8j145kc',1590049886,'','172.18.0.5'),('n26cmt6huehkk0op0fka8grr99',1590050690,'','172.18.0.5'),('n29jelt87ctbmk26vnr2cr4pcj',1590050522,'','172.18.0.5'),('n2t14u9mrchmdduubpap18cmlc',1590051137,'','172.18.0.5'),('n2tgkj8j1ellmav3k8glo4bd1u',1590049918,'','172.18.0.5'),('n327lcbl1l8jmbs6ivnjcv8spn',1607095000,'','172.18.0.5'),('n3r6cgte8lgjals7ep3q5rhuml',1590051544,'','172.18.0.5'),('n3vq5toi6hss5m5r7cvd2ni9ac',1590050405,'','172.18.0.5'),('n45t8f619i8i779a2ra68jbr4b',1590050525,'','172.18.0.5'),('n460sbcgepmg70neuo7k2vuinl',1607094048,'','172.18.0.5'),('n462iri5q1d6d1692e42acdjud',1590051027,'','172.18.0.5'),('n4petpokea5obed8pc9q4f8hge',1590050945,'','172.18.0.5'),('n5321gtbn0qu46ha786mhecmqe',1590050689,'','172.18.0.5'),('n5as3n0tlilufrkabds55ibedj',1590051026,'','172.18.0.5'),('n5v5m8d9h0ivlsg4i5gnkmmib6',1607094094,'','172.18.0.5'),('n61dbpf7ign6va34m7t8aruh8m',1590049886,'','172.18.0.5'),('n64k9fktjbqob5143udng9jtep',1590050474,'','172.18.0.5'),('n67qmskd8dng461orjgl7it1kt',1607095001,'','172.18.0.5'),('n6fra54hg007tviupamgfmol2n',1607094416,'','172.18.0.5'),('n7b7c0n6vu04k1a1t8b7cqcsqr',1590049886,'','172.18.0.5'),('n7et65qmchds2aev1o3i9enu80',1590051521,'','172.18.0.5'),('n7nrjikr8rmhsaf5epbsaa9i14',1590051542,'','172.18.0.5'),('n7v368cp35l8657dikp06vr0u9',1607094685,'','172.18.0.5'),('n89air960i3ianb836mgefs8to',1607095052,'','172.18.0.5'),('n914qgo5sn795t7m4h25pers4f',1590051024,'','172.18.0.5'),('n93gpvo9gmpftlrvbos9ks0arb',1607094671,'','172.18.0.5'),('n966bnvjnss743nommop6rdlnr',1607095396,'','172.18.0.5'),('na433l8icf6cmen4umn40219d8',1607095396,'','172.18.0.5'),('nb6e1bigh0vn3ebbg89grdfn84',1607094610,'','172.18.0.5'),('nb8525raei1j3kv4t5dmheo6aj',1590050693,'','172.18.0.5'),('nba35ta1pjqv7kkegafgqrafob',1607095052,'','172.18.0.5'),('nbmu3jjrn19io4fdgn4e9c9e27',1590050845,'','172.18.0.5'),('nbtre6qpfkjd8lgmm20m54no76',1590050848,'','172.18.0.5'),('nbv9kos6bte18ch3rq9tccbjkh',1590050948,'','172.18.0.5'),('nc0prsd2v9qs8b0al6qf06aecd',1590050524,'','172.18.0.5'),('nch1bllh0e9q2cqr84vahtaekp',1590049918,'','172.18.0.5'),('ncpq5bgjldg4s8lt6384vtno9h',1607094879,'','172.18.0.5'),('nd7eg4d2falqidosfuftqop0c1',1607095169,'','172.18.0.5'),('ndq3v805r4ajmtjnjb7e5h1vj1',1590050577,'','172.18.0.5'),('negada4o8ptvrpkstvkc8klr4t',1590050692,'','172.18.0.5'),('netbhfscjv15ppbbgkpcot61pr',1607095170,'','172.18.0.5'),('nfbrtgecht27tdqdt3ql3a2csj',1590050574,'','172.18.0.5'),('ngquooqk3d9fc11ckflajbd96b',1590051023,'','172.18.0.5'),('ngvphcl6t64nn5bf2kqafrfhmv',1590051542,'','172.18.0.5'),('nh6bgfe8ngl3oh0ov84ggm8e7e',1607094415,'','172.18.0.5'),('nhammfp29l8692c8r3cp391afm',1607094841,'','172.18.0.5'),('nhflbj4nre8f2lsgq8mn7iottn',1590050688,'','172.18.0.5'),('nhier2lul5hquko04n6d74q9pu',1607094939,'','172.18.0.5'),('ni87d94kt8vq8bcfafp5oglk00',1590051542,'','172.18.0.5'),('nj3ran205jte2ggt7kbjitqeqm',1590051542,'','172.18.0.5'),('nj507v6hp7atrsa8795jh5thk1',1607094669,'','172.18.0.5'),('nj8ar32jh07ajogu7ru6jqheh5',1590050524,'','172.18.0.5'),('njevmcv6dplbesf3v2krkbjaji',1590050525,'','172.18.0.5'),('nk5nmlvlvgf5g991h2p9tqorpo',1607095169,'','172.18.0.5'),('nkbst8hd7vinvt1lmt79j54l9j',1590050949,'','172.18.0.5'),('nkpn2mrdgk58iend1rtlspurmj',1607094939,'','172.18.0.5'),('nkvlhjknl51uofs03es8b3cemc',1607095348,'','172.18.0.5'),('nl3143pu3mdtbsab97tkgouvpq',1590050474,'','172.18.0.5'),('nms03pev7q7fno4hcc4btnvdh4',1590051421,'','172.18.0.5'),('nnkflsqadtj8fpb482mr1idudo',1590050946,'','172.18.0.5'),('nnsubflk3dh1r9muomh785e5uh',1607093250,'','172.18.0.5'),('nnubpgej8gp4ksbe31oqa4rdic',1607093250,'','172.18.0.5'),('noen74iufil9oc62c88mh2g5pk',1590051421,'','172.18.0.5'),('noi4c8d5s3sn44acbejlgpq9jh',1590051023,'','172.18.0.5'),('nojkutd44c21uvke3iaqdku5mt',1590050691,'','172.18.0.5'),('nov47kpvcntt46gi4ki1r8fpl2',1590050522,'','172.18.0.5'),('np5l93tchgdv4593kpi5p5v1to',1607093250,'','172.18.0.5'),('npi4jlh0or2ra117rd5siv3ah2',1590050845,'','172.18.0.5'),('npiiss6oqsjj0ic1moaq2gsps7',1590051138,'','172.18.0.5'),('nq22pnf0h3f7p30ak9u3i990i9',1590051424,'','172.18.0.5'),('nr5mhdb6i30bqd6shicp7t9hd1',1590049918,'','172.18.0.5'),('nriio0243cq5scjjjt7jicpbnv',1607094879,'','172.18.0.5'),('nt5el58ra7bbr6gekh2v4hfek8',1590050849,'','172.18.0.5'),('nt5f6oge9jgamnfo847f23mbqu',1590050472,'','172.18.0.5'),('nu5h5fpie3g7t122nb7rpkk8vq',1607094939,'','172.18.0.5'),('nu79ficofdftscomb2d2ma1avg',1607094416,'','172.18.0.5'),('nub0u16gcmb87n6n69sqstkboq',1607095348,'','172.18.0.5'),('nuuuqod1818m2v2tg7q4tpgibs',1607095169,'','172.18.0.5'),('nvmcipbkoqd042qrr4g32dm9ui',1607095169,'','172.18.0.5'),('o177p4ghk8mali6bd9igk3on4v',1590051024,'','172.18.0.5'),('o19ggnu4e400h672rs4f9lqv99',1607094670,'','172.18.0.5'),('o1gbc8ba93dts5jd4rm3vgaimv',1607094611,'','172.18.0.5'),('o1jh4renmp73jh350sd4hn7mvj',1590051545,'','172.18.0.5'),('o2hgjv19hb52ko05l0moh0vkmd',1590049886,'','172.18.0.5'),('o2q6m22n88qec6p88uqt19bmkl',1590050693,'','172.18.0.5'),('o36c3f29ijicg11n013nl9v2bq',1607094873,'','172.18.0.5'),('o3egpp4k58g1iu16qfgrj070fb',1590050848,'','172.18.0.5'),('o3l2f74ntc9mvmcbiamdike412',1607094622,'','172.18.0.5'),('o43t2voatk712dffdhmjqovnu2',1607094821,'','172.18.0.5'),('o441l4m5e2d8lden89om8bu80f',1607095052,'','172.18.0.5'),('o4kbeodiih25ud8euo4n03rm17',1607094880,'','172.18.0.5'),('o6ioijoa4kfmm1nroeo9c0tpnp',1590050577,'','172.18.0.5'),('o6ntgtsu6ienlkoi199t8v33kk',1607095170,'','172.18.0.5'),('o7epvb8atvihpjfqgvt8icpghu',1590051478,'','172.18.0.5'),('o7ugfbf9otipeuc2b1v55mtsml',1590050574,'','172.18.0.5'),('o7umpvv020traq9ql2cgs4spo8',1590050574,'','172.18.0.5'),('o86ecp202tgvevio811cluu2nq',1590051545,'','172.18.0.5'),('o8ei8m0d9jqvdlvs4f4e6ibiah',1590050689,'','172.18.0.5'),('o8p4qech2qvq8h5joejph26ogt',1590050689,'','172.18.0.5'),('o8t27h7fq7222plur4rjaqjs1i',1607095169,'','172.18.0.5'),('o96djbckq00n21tvkfvefqred6',1607093250,'','172.18.0.5'),('o9jppraqm4o44bnaaehhlg43fm',1607094610,'','172.18.0.5'),('oa0ipelaqhhm4bau79oipuqtdh',1590051542,'','172.18.0.5'),('oa6d5ecbvdfu27mon88p545f6k',1607095052,'','172.18.0.5'),('oa9fno7b759i4thopepbfll5sk',1607094881,'','172.18.0.5'),('ob5gglbvnvn439e359gq6h02a1',1590051479,'','172.18.0.5'),('ob7jcph77dev11ndhl93cr3v7n',1590049918,'','172.18.0.5'),('obkh7hnbmh446n014fuie237on',1607093331,'','172.18.0.5'),('obnnk5kmfkf0vjvckn8q7rndur',1607094880,'','172.18.0.5'),('oc6q08posibb21ldmav3sjpjng',1590051545,'','172.18.0.5'),('ocm7boi7soti9rirv8bq3cghia',1607093250,'','172.18.0.5'),('oe14qcd1jd8f6r32qa3ch21va4',1590051523,'','172.18.0.5'),('of2rnjl4qvr9fd0fcc5tev2vp9',1590050574,'','172.18.0.5'),('ofcjogstdaeuq9vr51usnp3en7',1590050403,'','172.18.0.5'),('ofj0ql9li55mle2379o8kev3hk',1590051135,'','172.18.0.5'),('ofmqk29bv6ri8h92dopvla7gsh',1607095348,'','172.18.0.5'),('ogf91c7uqjffs185s5sdb426nj',1590050474,'','172.18.0.5'),('ogfo0ebav3neq3sr7hieo04cu6',1590050845,'','172.18.0.5'),('ohnj8stkhdesdql132q1kjto62',1590050689,'','172.18.0.5'),('oing0oc0kgbtkca3s3qc41jti8',1590051543,'','172.18.0.5'),('oje3ok2locaq5jm2bspsubiq8h',1607095052,'','172.18.0.5'),('ojgtomc1fpqmj663lbarqptj7h',1607093331,'','172.18.0.5'),('okfp8ib1h7ru3537u2qhjmq9ft',1607093517,'','172.18.0.5'),('om5u9ofnuvci77abmbe042hmqu',1590051138,'','172.18.0.5'),('om776lqni0a3r0tgcttah6mm5j',1590050474,'','172.18.0.5'),('ompi658ef84t4vj6s2bne7hqn9',1607094873,'','172.18.0.5'),('on2ndhdf032715kkv121kgdiq0',1607095396,'','172.18.0.5'),('oneh9djqshqqab3r5f6t5m1vp2',1590050576,'','172.18.0.5'),('oodhuhpj0hsebldnpg8hlc1rgo',1607093331,'','172.18.0.5'),('op5u6msugsdtks0d9isgkto7e4',1607094999,'','172.18.0.5'),('opj40k1rn74kb8p7isqiktmijq',1590050948,'','172.18.0.5'),('opls7vonrg1qrppt7m1kqr9ki4',1607094822,'','172.18.0.5'),('opr06g6v7f46jok0ko3dbnj66q',1590051479,'','172.18.0.5'),('opv2vvuq7vq7f5el7eoou1jq63',1607094873,'','172.18.0.5'),('oqcdedqo08tsstlbusgut55dhr',1590050949,'','172.18.0.5'),('or7r2gjqimh4ait3q8hh7ibsgg',1590051026,'','172.18.0.5'),('orh7ja5g4jhpf9ogefq3cs4f4a',1590051478,'','172.18.0.5'),('orok5nsk8bp9csl0l5aj9cfgdu',1607094670,'','172.18.0.5'),('osh177bqp6n0hk3sq98invnbha',1590050471,'','172.18.0.5'),('oteagct5v631r6b93htbis7k51',1590050522,'','172.18.0.5'),('otg121pmcpj72fapp0p05frd84',1590050525,'','172.18.0.5'),('ou8vd4sf8eqk5erh53t9mktnde',1590050689,'','172.18.0.5'),('ouiu0m9079ju45bpgstq4c9kgb',1590050945,'','172.18.0.5'),('ovq6pueu7cvqohka97mb2936ln',1607094610,'','172.18.0.5'),('p01d6gafqfm7cdc9jf0kvml0k8',1590050403,'','172.18.0.5'),('p0dbagbde2rhgv4hk3bt3hrbcs',1607093517,'','172.18.0.5'),('p0emetu006b9cdrfodpc555ul5',1590050474,'','172.18.0.5'),('p0g0obnrctucr3s0ce8vr55vls',1590051524,'','172.18.0.5'),('p1crhknu6djs22vs422s10ik39',1590051424,'','172.18.0.5'),('p1p16oe6g31uahko3mc842okor',1590050574,'','172.18.0.5'),('p2a126u5ugkski7to734u15kjp',1607095000,'','172.18.0.5'),('p2ic9rjvfmpnatl1da9grha6ov',1590050474,'','172.18.0.5'),('p2uubd0t6pr0sq6vpfu7sm182d',1607094248,'','172.18.0.5'),('p337o76rchifou8l26t1iusufk',1607094881,'','172.18.0.5'),('p37l7jaq8nrahg1k0t1an1dbuo',1590050848,'','172.18.0.5'),('p3or4osn98csrv0narien1653n',1590051524,'','172.18.0.5'),('p49k2evprv13u1erlsvku9pn1v',1607095169,'','172.18.0.5'),('p544vsl03pr1a61jt9am5ci62h',1590050403,'','172.18.0.5'),('p5l3kr3oqrqhbt1p48eevjhgbb',1590050525,'','172.18.0.5'),('p63meb1n73h2jupcnj2ujo797i',1590050405,'','172.18.0.5'),('p6pbm80m5sleg2gksevfjece76',1590051138,'','172.18.0.5'),('p6vvg40c4ghejnffk489ju5v91',1590050525,'','172.18.0.5'),('p8jhficju7bg1bpvr2prcv5skn',1607094940,'','172.18.0.5'),('p8mqdsilcl5nd73aduchi7b0qb',1590050522,'','172.18.0.5'),('p8r6lpmfqsnd3s7ek57lkkes1a',1607095000,'','172.18.0.5'),('p8rc1pbl8bthhbthhlcm86o8j9',1590051544,'','172.18.0.5'),('p90br98al4c1k26m62kehgj8l2',1590050473,'','172.18.0.5'),('p9n6tr4u5uv5p03bi7j7ollv1n',1590051545,'','172.18.0.5'),('pa8f66ntbpta2o69154p5fmhm0',1590051137,'','172.18.0.5'),('pavgnok4qbat83sks44i3mrtst',1590051542,'','172.18.0.5'),('pb5ncrubuded75r7inumjm7ln9',1590050845,'','172.18.0.5'),('pbn5smejcq925sdqu7q6c4pk39',1590051478,'','172.18.0.5'),('pbstr47ujoavks9375e786348d',1590051545,'','172.18.0.5'),('pc9p9fh9a68jhlencla5lch6ao',1590051421,'','172.18.0.5'),('pcd2e0041pv18jt5r3o0qku4gi',1607094822,'','172.18.0.5'),('pcjcs2c4i9mvbl3mph786qebe7',1607094610,'','172.18.0.5'),('pcqoocdj60b9peoe2b1vidb7oc',1590050848,'','172.18.0.5'),('pdln9k3qo2jpu846fovr8rp3c2',1590049886,'','172.18.0.5'),('pdmfvnim4ej9khnsg57l28ph0h',1590050949,'','172.18.0.5'),('peo1onjf2ok232ht4mt0eif6po',1607094941,'','172.18.0.5'),('peoeck1ek2dgo6hil9kf54p67k',1590051543,'','172.18.0.5'),('pevboohlatq2dnk68n4q1258j8',1607093250,'','172.18.0.5'),('pfqbq1ghnblqlp8esoq33sbba5',1590050574,'','172.18.0.5'),('pg1ihlmbgl52a510gth560q08a',1590050406,'','172.18.0.5'),('pg3m2mfcp8trjk2c22bm98kdmn',1590051475,'','172.18.0.5'),('pgaiu4n6etupmlgpmo3ojeoiui',1607095053,'','172.18.0.5'),('pgjus93ioa6r13cnj20m01d9iv',1590050945,'','172.18.0.5'),('pglra6agr0ah8a6p587svh4lcj',1607095396,'','172.18.0.5'),('pgm44d0hf4ii7uppgeldnbj3gs',1590051520,'','172.18.0.5'),('pgrd4j64umfop76jn8nmvrjh9e',1607094669,'','172.18.0.5'),('pgshrlhqlebsehddc76rvlt0rb',1607094669,'','172.18.0.5'),('piaap7578s1abkc9hsm2ooj88m',1590051545,'','172.18.0.5'),('pijvjdctr9jaio824hrbs6cfi3',1590049918,'','172.18.0.5'),('pj191b77k2idmlusgol5sphema',1590050577,'','172.18.0.5'),('pjsc0dsddgmr967tapc5002hh2',1590050522,'','172.18.0.5'),('pkspk2ikri0q2rnvge2s7d0dq5',1607095169,'','172.18.0.5'),('pl5p73n82deu7n1dj8fpumiko2',1590051524,'','172.18.0.5'),('pl8vcovf35t9u66baiuhhg7sig',1607094622,'','172.18.0.5'),('pll2rc1ompphbpncp5skomhcfp',1590051026,'','172.18.0.5'),('pm1d8iqcllgvt7mlou37kp4d5l',1590050472,'','172.18.0.5'),('pmaubt2lnu2dsnsosr9jmkudsv',1607094416,'','172.18.0.5'),('pmi7h0d6h3j2slo6idqlajrr1p',1590051026,'','172.18.0.5'),('pn3b625n9vgckgg4s8pqnmc3rn',1590050576,'','172.18.0.5'),('pnfr0jtj798ffgeqt900ij9peb',1590050406,'','172.18.0.5'),('pnj67shtci6h81pbgdtvjba54v',1590051542,'','172.18.0.5'),('pnkqui6ksh2n4v0je9d9o7sjmg',1590050406,'','172.18.0.5'),('pnrqgmnbqn2n7h83ahpj7mlv63',1590051521,'','172.18.0.5'),('pnu961gs2idp325esuidln5gs6',1590050693,'','172.18.0.5'),('pp1m8l4bdr2lh53s5sk6ibgskg',1590051424,'','172.18.0.5'),('ppg78c4r3dubmcg0gqingpcctr',1590051424,'','172.18.0.5'),('pppcpce14ukea7j302fcnoup9g',1607094716,'','172.18.0.5'),('prto330f80t8q33el3g1ism1mb',1607095169,'','172.18.0.5'),('ps4fq84daar26j9i7n8ctbvqqn',1590051521,'','172.18.0.5'),('ps4vbrl68nnt8kmcrm4nu562ra',1607093250,'','172.18.0.5'),('pscudbn9la8q13svk8risbkcc6',1607094881,'','172.18.0.5'),('psk6e3osntam4dgmfq4jinkmbe',1590050522,'','172.18.0.5'),('psqpti3i5lgl4s4qs5ai6h1ogl',1590049918,'','172.18.0.5'),('pt891km03psijv2nupb040hvt0',1590051026,'','172.18.0.5'),('ptbs9pmq0el15qbg724oj12qk7',1590050945,'','172.18.0.5'),('ptchtfve97gtj1phhg1gnoa078',1590051024,'','172.18.0.5'),('pv0seci42vlmnl4pobqk61ehsv',1607093517,'','172.18.0.5'),('pvj3ul10qqaedgpdhmlth74j8m',1607093516,'','172.18.0.5'),('pvknc2km35unp71cc7lchroeba',1607094611,'','172.18.0.5'),('pvqlebkrtb6309q1gaa97upale',1590051545,'','172.18.0.5'),('q0nargaa9v52g4gucvhp716u85',1590051520,'','172.18.0.5'),('q23btnualeg8hn68tgoepbfn0m',1590050689,'','172.18.0.5'),('q2garo1u7ln46gfne3ogd59ovm',1590050403,'','172.18.0.5'),('q2h346f731gmbmfpm5ov5m05bp',1590050692,'','172.18.0.5'),('q2jjbhf4nceceolabo4et5fs3l',1590051421,'','172.18.0.5'),('q2qi9rbfrm4rudec5m1hjs8th0',1590051134,'','172.18.0.5'),('q3bf80g0j2e3bjg5rpo9e7ddt3',1590051421,'','172.18.0.5'),('q3kn964j1aig5v3rr8nev15mh0',1590051134,'','172.18.0.5'),('q43p7vrkdvvuk84ikdp5a7d8bm',1590051137,'','172.18.0.5'),('q59a6nc8cm815r3gc0iullr93m',1590049886,'','172.18.0.5'),('q5k269je7apptrbl0dkti5k289',1590051421,'','172.18.0.5'),('q65l4epkr743cefl89q2jorqfv',1607093250,'','172.18.0.5'),('q7is3ff1kpacf59os27vktnitd',1590050845,'','172.18.0.5'),('q9ovd0dpo70v517ui08csoc3se',1590050474,'','172.18.0.5'),('qa995601tojiclpfcg0llnqttp',1590051026,'','172.18.0.5'),('qaa168dl3tik7u7bg9ljj3cr2b',1590051475,'','172.18.0.5'),('qas65kh6teipebbigbjd5mi169',1590050849,'','172.18.0.5'),('qe86co173o6qkiarsts5uv2n90',1590050945,'','172.18.0.5'),('qf2ch91bcp1ba4d8coad93d4te',1590051024,'','172.18.0.5'),('qf4omhbgttvjt95i5k8drppvc6',1590050689,'','172.18.0.5'),('qfr3bk8dqhqiauuqmc93sluq5s',1607094873,'','172.18.0.5'),('qg3mc9fsjhir59mbqg1se2daso',1590051542,'','172.18.0.5'),('qg6qibmpmr996kmaii6ee0653n',1590050845,'','172.18.0.5'),('qgblu0hqgeioppduftnraueldr',1607095052,'','172.18.0.5'),('qgu8nhjm44t1u70fadoe21hhdd',1607095395,'','172.18.0.5'),('qgv8b5916j6vfrbrpelgoruhbq',1590051023,'','172.18.0.5'),('qhctj1b3qk0d8qq1f7hilkspko',1590050688,'','172.18.0.5'),('qhtr3gtckg19qe574pmhiq5dnl',1590051520,'','172.18.0.5'),('qi0chh4kabhd651im96m6d2krc',1607094610,'','172.18.0.5'),('qicr6n80340t9npdqr7v0pip8s',1590049886,'','172.18.0.5'),('qiop3ivfrka6vh3r4g8ihidi7n',1590050577,'','172.18.0.5'),('qis56an6fd28mki64ftpe6v343',1590050948,'','172.18.0.5'),('qjj5fk2d95uir8qr085jdremm0',1590049919,'','172.18.0.5'),('qkbp6qnspe95qmgg8bh5mtnq8d',1607094685,'','172.18.0.5'),('qkoacna2lq3fcvpnso89omqul8',1607093516,'','172.18.0.5'),('qktoa0q31nl9as0c0181rqps3s',1607095396,'','172.18.0.5'),('qlfhsqit0uji03m7l8t1jluiq5',1590051023,'','172.18.0.5'),('qlnrutqq9e3b3da32ch6tvbrjp',1590051026,'','172.18.0.5'),('qlt1o8j5c4ogjno7g1bi8k5tut',1607095052,'','172.18.0.5'),('qm65fdoiumqm81e18c90sttmh9',1590050574,'','172.18.0.5'),('qmn3l0u74fav08uspjhlu86h6d',1590051423,'','172.18.0.5'),('qmto7t6j05vu9bebcnccv7glpo',1607094671,'','172.18.0.5'),('qna16732s668fersqlnic60pj4',1590050406,'','172.18.0.5'),('qoong0dt00fgpitjujm3jbpla0',1607095052,'','172.18.0.5'),('qp8eqestc602etkas1p3e2bdvn',1590050948,'','172.18.0.5'),('qpcjd9u9lkcpkmpdusmj7c1k2g',1590051026,'','172.18.0.5'),('qpek5m8bhalqt757ok2sd6e2pu',1590051542,'','172.18.0.5'),('qpgi3hifksr08itsks9kl94esa',1590051478,'','172.18.0.5'),('qphiv1326bllq8ets5melp6b00',1590051475,'','172.18.0.5'),('qq47rmgru78pkc3egmoa4bi37f',1590051545,'','172.18.0.5'),('qq4opu35oskb1ibn3h03na95jj',1590051027,'','172.18.0.5'),('qqcfsel9o3iubc33js7ag7ra57',1590050521,'','172.18.0.5'),('qqct3cv3t9on3rhri5k5qmln2a',1607095396,'','172.18.0.5'),('qqen6ip83jegj7tgtedimri6t7',1590050406,'','172.18.0.5'),('qs079ve0fi01lt659of9s1rlm7',1590050406,'','172.18.0.5'),('qs0u5cq4vm3u73lj5vdtqf92f3',1590051138,'','172.18.0.5'),('qs44fl20a64ausigd3rkc6tvgf',1590051545,'','172.18.0.5'),('qs7s04efl6rhrb9unlgobpa833',1607093517,'','172.18.0.5'),('qs8ig77up49d9tmspt3cabaovv',1590050471,'','172.18.0.5'),('qt6gjpq0lnsthoaoakv431rla3',1590051521,'','172.18.0.5'),('qte7josc0tg0etuukc1j4u9o6j',1590051545,'','172.18.0.5'),('qugck1ruaevmqbtb40ihk40k82',1590050574,'','172.18.0.5'),('qv0t64fs6h716iaun96gd6hivg',1590050849,'','172.18.0.5'),('qv4em8duk9vd7jda71hdb3bc32',1590051138,'','172.18.0.5'),('qvihu8fsgv5dn91gg1la40eh8m',1607094841,'','172.18.0.5'),('qvl8heatp3rbei0matpisa681k',1590051521,'','172.18.0.5'),('r0ibndjg627q7oc895c5cogfsc',1590051423,'','172.18.0.5'),('r11a9p2dmgr98h65ftc478ged8',1590051476,'','172.18.0.5'),('r1gntuuhdn7e31uh11kttarhcs',1590049886,'','172.18.0.5'),('r1ilmuupjb19lbi990veje6as0',1590051475,'','172.18.0.5'),('r1jna6su6bg0lr369um4nn7nc6',1590051521,'','172.18.0.5'),('r1uvcuh9qco8b60en3ehh9kpmv',1590050945,'','172.18.0.5'),('r2044bn1tn7n3518oehbtp056g',1590051027,'','172.18.0.5'),('r2adnlpi7bjts57bcj79fkt94a',1607094822,'','172.18.0.5'),('r2c45tkce5m4gdl5f08ji5h4eh',1607094671,'','172.18.0.5'),('r2ebqvehlpk461iennmbrlnb0q',1590050522,'','172.18.0.5'),('r2kbabfh6ntbd2egqcvhov2gok',1590051026,'','172.18.0.5'),('r3qtm3sffkqebpju2bpmkdaffv',1590050689,'','172.18.0.5'),('r3uvlejujg5og9tl5t7hvsjk4c',1607094939,'','172.18.0.5'),('r43n540vvsekt5ls323do59ktq',1590050525,'','172.18.0.5'),('r48pon3fuapjkbukqamm714hi7',1590050406,'','172.18.0.5'),('r4m17b5456q8nf2qujhd25m98f',1607095001,'','172.18.0.5'),('r5ctekq5kdpktqnasvf5k9r0kn',1590051423,'','172.18.0.5'),('r5d5hvvsvmvmqndnj5jm5au6tc',1590051521,'','172.18.0.5'),('r5khj3elbnpp2nojtg1d741kjd',1607095169,'','172.18.0.5'),('r6oi6ui24g8t344atl2tirachm',1607094880,'','172.18.0.5'),('r6q4gef6tq1pmq4n9jdar4ptgi',1590051524,'','172.18.0.5'),('r6qc2tdbjahg4sllr8rjc55afu',1607094670,'','172.18.0.5'),('r73t272sh939elh3d7nelniq3u',1607094939,'','172.18.0.5'),('r80bsgbemcm0rspmijqmmna98g',1607093331,'','172.18.0.5'),('r88kclt32unlenpeblurgoh21u',1590050692,'','172.18.0.5'),('r92jvj8jalsoaa5cl6oopk5p8o',1590050473,'','172.18.0.5'),('r9n2h6oi649j9dvt7r6k23d3bt',1590051026,'','172.18.0.5'),('r9qc5766oqsksihavf2a8o6joo',1607094151,'','172.18.0.5'),('r9rhmgd6i6krh128cdss63j15s',1590051135,'','172.18.0.5'),('ra0l8tdv4fq10pnanill1d4dgv',1590051024,'','172.18.0.5'),('ra7dj5ltq3t4stddfcce38lds6',1590050577,'','172.18.0.5'),('rapgl3p5rq7ejmo57iv4be33se',1590051475,'','172.18.0.5'),('raqb3nurecev6ssu3ru05n1i07',1590051524,'','172.18.0.5'),('rarjiolvup5ef1215fsha921sm',1607095169,'','172.18.0.5'),('rbk48idu070860go4efpa7jt43',1607094248,'','172.18.0.5'),('rbqbtg4um04oqf9tak5h2f514u',1607095000,'','172.18.0.5'),('rc37tetpf32194ks7pvlg4ihj1',1590051479,'','172.18.0.5'),('rcenvq8p120rml1858q8o6pcrm',1590051138,'','172.18.0.5'),('rdhn5ikmmhbkmanng1s8m2t9ot',1607094417,'','172.18.0.5'),('rdq4vkbe2onqlt6iifknh5h0ar',1607094999,'','172.18.0.5'),('reg2o5bboghj25smifsnrogm9e',1590051545,'','172.18.0.5'),('rfi34m5ddh26sem9jh2dfudmvd',1590050403,'','172.18.0.5'),('rfl4cl94tnjt66homipq23p6ba',1590051023,'','172.18.0.5'),('rfpbl4i4e0l5b7ga7tetom655p',1590051022,'','172.18.0.5'),('rg5hmj44pgjupqsrt5s8a1pab8',1590051475,'','172.18.0.5'),('rgk7j1qu1j14l95acerg8o355g',1590051524,'','172.18.0.5'),('rha0ngie2ilusrtl2492apffa3',1590050845,'','172.18.0.5'),('rhjb2s9ucf2i623sta87ktiiov',1590050471,'','172.18.0.5'),('rics019jpqdv12l5va2lnuqe1b',1607093331,'','172.18.0.5'),('rihk8vqc2jvcq0u6kgmp91iiro',1590050577,'','172.18.0.5'),('rjf7jndobrqfrl8q8nggorsu36',1590050693,'','172.18.0.5'),('rjndk6m9tmqkdo3440nllel1er',1590050525,'','172.18.0.5'),('rk1q55j6rdk5t2rcsn1o7d8bom',1590050471,'','172.18.0.5'),('rk83n0jb5ue5sf57ojs7fmi1hh',1607095052,'','172.18.0.5'),('rkq4dshgf7f7pcmks2nqktgc05',1607094669,'','172.18.0.5'),('rku8ujoqnsn2l8je889qusdoeu',1590050848,'','172.18.0.5'),('rlbt79ld6qt7cbu4goqihilleo',1607094611,'','172.18.0.5'),('rldslkc3l12liup128jituq63k',1590050576,'','172.18.0.5'),('rnac8m05rbv7jjke9i09oncqp1',1607094881,'','172.18.0.5'),('rokff8kipsg3isblhjp4s3a7em',1590050689,'','172.18.0.5'),('rp0pgcjt625iia3u6vmcvbmd2e',1607095169,'','172.18.0.5'),('rp2r4pmvconerbn4d36flcupod',1590051022,'','172.18.0.5'),('rpmk6dei0gh3ou7cu94p4ivh54',1590050405,'','172.18.0.5'),('rpn9r9snmkotede5fvt6kr9f19',1590050403,'','172.18.0.5'),('rpq3afqksmvt00q4p6d46f7j36',1590049886,'','172.18.0.5'),('rptjuceitrsm8loolq6sk7i9qi',1607093330,'','172.18.0.5'),('rq5hifk8a6ku0tqb3a3urls70h',1590051135,'','172.18.0.5'),('rql3sljs9c16hpohgmun2rbp4g',1607094880,'','172.18.0.5'),('rr1nikpi2qog5t2tn2ccdfi70m',1590050946,'','172.18.0.5'),('rr34cisbef8u46e074oaaeouip',1590051424,'','172.18.0.5'),('rrlt0c9kbm4ja96msara08vbhu',1590050405,'','172.18.0.5'),('rs2inbqg6c0ooieuib75imvphl',1590050945,'','172.18.0.5'),('rs3ugsm9arf38k21qmp4e6qquc',1607093516,'','172.18.0.5'),('rsbi44e6pc5ej3afa7s1i6dima',1607093250,'','172.18.0.5'),('rsdeqgir27mimlvr65h4p6sve7',1607094611,'','172.18.0.5'),('rsvflgav4bkde4dhka9ap0nir4',1590050845,'','172.18.0.5'),('rt0dn6s9cp2cj6qn9s9g0nf0uv',1607094873,'','172.18.0.5'),('rt0ggked3d45mq0jjn7ng7bvds',1590050474,'','172.18.0.5'),('rtonugdjshqboo63urmi8o1023',1590051026,'','172.18.0.5'),('rtrvh2q8ds0g0t821ruie7a08s',1590050522,'','172.18.0.5'),('rtv4k3e2126h00rg0g6b6orela',1607093249,'','172.18.0.5'),('ruj8ubem3dkprg2idi1bhd4cql',1607093328,'','172.18.0.5'),('rv1hu17rch6isgg1qv1l6d4oae',1590051424,'','172.18.0.5'),('s041s6oa0mlv158m0s3q37mkll',1607094940,'','172.18.0.5'),('s0gadvupdj060buqgi7lp5kblr',1590051137,'','172.18.0.5'),('s0vhrrnefsc8vj5mjvd82onou8',1607093249,'','172.18.0.5'),('s1797736kbnc8oon9qouc7gkgm',1607095053,'','172.18.0.5'),('s1h4pof9ik7rl1nrbr9fmpd8cb',1607093330,'','172.18.0.5'),('s21ga2rdo1qbf58selp6uc2ak6',1590049886,'','172.18.0.5'),('s2ir56n4monurvpklq5mbvi7j4',1607094821,'','172.18.0.5'),('s2ra1k31ok4d1aljefgjvank8j',1590050948,'','172.18.0.5'),('s33f3clsbkn9is24gaefi3l531',1590050693,'','172.18.0.5'),('s3g474c6l30v50aea7rkoa4uud',1607094940,'','172.18.0.5'),('s3rrvmhcga55dst0rkp7vep8tv',1590050845,'','172.18.0.5'),('s4lj3te1mus7ulhjjoj2stbgdj',1590050403,'','172.18.0.5'),('s4o5t5noo57ve9ajv7jl92cis6',1607094416,'','172.18.0.5'),('s4tg9btjepiqhuq3lr8hunet5a',1590051421,'','172.18.0.5'),('s632430bv3s7a9s28ilp86drvk',1590050946,'','172.18.0.5'),('s66ei35sjooig1f4p0n1lu34ap',1590050522,'','172.18.0.5'),('s71o5kngroc1997g5287o2q16e',1607094879,'','172.18.0.5'),('s77kk89hmb9u5rtqhctavkb1cl',1590049918,'','172.18.0.5'),('s78cd2p52k3d8fdo8muehdrbg9',1607095347,'','172.18.0.5'),('s78ec8qe3huq7l7gu3brd1cpk2',1607094416,'','172.18.0.5'),('s78isphbudusgraa2s1ts9nl5g',1590050692,'','172.18.0.5'),('s7votqdj2cl30k50h32i86jvj7',1590051423,'','172.18.0.5'),('s8b3v74f5eii6t8h6ja14e4qc5',1590051421,'','172.18.0.5'),('s8pofkc3m2am0sc0tn72h60d2c',1607094716,'','172.18.0.5'),('s95u8jmpo60gg3h5kb3s8tra03',1607095001,'','172.18.0.5'),('s9ih6bvqdo6nn7t6cl838atn9m',1607093249,'','172.18.0.5'),('s9odb88brm62lnvfdl9k1rr4sl',1590051478,'','172.18.0.5'),('sa6pn6b76an0i52b3e2ev3fkbg',1607095348,'','172.18.0.5'),('sabgden0m6jcvq33rqpu60lctl',1590051424,'','172.18.0.5'),('sad2rslq9uj2c963vu1isgu2eo',1590050577,'','172.18.0.5'),('sai2aqf4550qtmegeello3t9d6',1590050522,'','172.18.0.5'),('sajhekf39h8b7nefepd372u662',1607094821,'','172.18.0.5'),('sautebhifhicn1qjgtmnb9urv7',1607094671,'','172.18.0.5'),('sb0kc0irg5tfbqmksarloh587p',1590049918,'','172.18.0.5'),('sb1e73q1pmmlkr6qlthdbnlcoc',1590050522,'','172.18.0.5'),('sb9t9u8bpbpv9lmm6jsli2olf6',1607094670,'','172.18.0.5'),('sbfo32lq8u16h1kb36eh6iqsvt',1607094841,'','172.18.0.5'),('sbomj184trb262dgnl14eronpr',1607093251,'','172.18.0.5'),('sbpiorc6le5onggo8vbli02t5k',1607093517,'','172.18.0.5'),('sbsqejedfpm9btftc1fv4d320o',1607094939,'','172.18.0.5'),('sctco9t26arampdkn7v0hpehln',1607094841,'','172.18.0.5'),('sd413lun4ds6f6dunlkq93utnt',1590051478,'','172.18.0.5'),('sd546r52ftir2k5h5cahphbb2i',1590051424,'','172.18.0.5'),('sd76ri3qi0a05pruf9ibpbv9ol',1590049918,'','172.18.0.5'),('sdc23ledv7r2a04p6r1rc0a9fo',1590050846,'','172.18.0.5'),('se218b0pfvf9f7oduhdvbs8ci7',1590051476,'','172.18.0.5'),('seo68pen5467nkqrj1otn10p12',1590050692,'','172.18.0.5'),('seuib9f8fu4n4mnudm8o8c3vig',1607095052,'','172.18.0.5'),('sfumo26n98bgnk2i52kvthr1u3',1607095001,'','172.18.0.5'),('sg8kk30bieeult1ij0ui048mji',1590050405,'','172.18.0.5'),('sga8qq53mvo2t8mlm40qo5gin5',1590049919,'','172.18.0.5'),('sgcep923auk2ecsuvkh0bpbo9n',1590051475,'','172.18.0.5'),('sgqie1h6pnjt107t8469hvj12b',1590050946,'','172.18.0.5'),('sh016aloe84tkthvdmcp22bvsg',1590050471,'','172.18.0.5'),('sh048j4f8ub5uepu1b9ngh1q9u',1607095169,'','172.18.0.5'),('sh6ps9c6ikdiuamemfp70qctkq',1590051524,'','172.18.0.5'),('shfn1oqq8o4cnkojcgaeo6u7su',1590050949,'','172.18.0.5'),('shs9mnj8n2vbijkcfudtfiqr2i',1607095000,'','172.18.0.5'),('siqrp0979mp4vru01a4e6ipmv1',1590050574,'','172.18.0.5'),('sir6joq2v9mbkhh6r8buelf3mu',1590051524,'','172.18.0.5'),('sj1l6ck28fdd897eepka47i3gs',1607095052,'','172.18.0.5'),('sje3gl86fkcrnrqau4ts2hisq0',1590051478,'','172.18.0.5'),('sjleu4stgjdkm4kkd6nkb25hhl',1607093516,'','172.18.0.5'),('sjnkjvg3qb4kd4a5g66lj6mfuj',1590051421,'','172.18.0.5'),('sjo06rt1sjc1v8auf649tl6rl2',1590051476,'','172.18.0.5'),('sjqqinctlssckkgbrdg3kqed83',1590050524,'','172.18.0.5'),('sjtdkh5kcdftm13sc3venec0d9',1607095000,'','172.18.0.5'),('skm3l6idgueu2rphnmqj4s923t',1590051476,'','172.18.0.5'),('sl7fcmk4snif0g9br4ai9uf92n',1590049918,'','172.18.0.5'),('slcaqlnkfhm4vtepotokiov2ir',1590050688,'','172.18.0.5'),('smck9lp01l4v804ucfqkrj8hji',1590051135,'','172.18.0.5'),('sn2obvmssdlc7cv5n6u7l6en2p',1590050574,'','172.18.0.5'),('snhq4fo2cejmv1saitjb33v1v7',1607094873,'','172.18.0.5'),('snsm6cbtlg0nevoj5s5k898p8o',1607095396,'','172.18.0.5'),('spuemue011qqei8be8nblefdqk',1607094880,'','172.18.0.5'),('sqmfkd9gnke74ui7dvon9bmh72',1590050849,'','172.18.0.5'),('sr1e3bc5rrtvilqo1v4av3b24m',1607094685,'','172.18.0.5'),('srgem24h5gbvj47th8d2frbivb',1590051424,'','172.18.0.5'),('ssmho91u4m9neu1f841omnvatu',1590051023,'','172.18.0.5'),('ssq6bq709ftmambm57d2cb0gaq',1590049918,'','172.18.0.5'),('st2f8m7d17qjr9fpsro6re2t2o',1590050471,'','172.18.0.5'),('st4d5hid8rqk0aijfnto9bd3nr',1607093329,'','172.18.0.5'),('st78ul7o8jtq2uq0u4svqkcch7',1590050525,'','172.18.0.5'),('std2icku97jekb3mshagmfvbj6',1607093517,'','172.18.0.5'),('str5vlj3javhspl046bml1f5ru',1607093516,'','172.18.0.5'),('stvgeej8jekji52hqnqp3bjkok',1607095348,'','172.18.0.5'),('su6oo5cbonq650ea1sn09sulig',1590050693,'','172.18.0.5'),('suotfstrcp7l1r362juijr535o',1590050577,'','172.18.0.5'),('sv0i5a80go7gpessn0fto6ppor',1590051424,'','172.18.0.5'),('sva1a2eh45igucnqf2p9h4d62c',1590051521,'','172.18.0.5'),('svs1350cini03vm15v9tli9s2o',1590051023,'','172.18.0.5'),('t041t7tp7he52vq9dkbfip9fe1',1607094821,'','172.18.0.5'),('t07lcmjsju00u27g5l5e0ft2sk',1607094821,'','172.18.0.5'),('t13n2h84g4rnpmoiieil9fng8g',1590051024,'','172.18.0.5'),('t1ckad7j0i616ejp28m06qca89',1607095053,'','172.18.0.5'),('t1kf2aagf4h5ivgfsj2tkf6k9m',1590050848,'','172.18.0.5'),('t1vtgi2i0n3v6irdlhpsfvjo3j',1590051542,'','172.18.0.5'),('t212lm5226vv168r2lben5qd7n',1607095000,'','172.18.0.5'),('t26u3ki1nmcug4pbam49m14vpv',1607093329,'','172.18.0.5'),('t2e1sqkc51j0fft3c1btsni7jq',1590050948,'','172.18.0.5'),('t2i1otf2a8htq36fh9ec7sj30u',1607093249,'','172.18.0.5'),('t2jhbh01ncbta57jgps5me02ej',1607095000,'','172.18.0.5'),('t33l88bdectdnh1m5bncag2hb5',1607094685,'','172.18.0.5'),('t354uja8htuid2tp3orp7esu0u',1607094417,'','172.18.0.5'),('t39ubk69ontp8d2o9115jdr22c',1590051521,'','172.18.0.5'),('t5m6e7dlg4s0rcddth40k22crv',1590050471,'','172.18.0.5'),('t5pen85aumhe4dqjaq46ra7062',1590050525,'','172.18.0.5'),('t6kua3casqeebi4mu6nqakuq4l',1607094671,'','172.18.0.5'),('t6nq6ru552uctf0hqf4ljhf2l4',1590050692,'','172.18.0.5'),('t6pkdb8eco9srfnusorntfq4b0',1590050473,'','172.18.0.5'),('t6qas1ala5thu5rpgklomd577j',1590051545,'','172.18.0.5'),('t70r2ndfga6aq8jfh57oliu1nu',1607094999,'','172.18.0.5'),('t716kfsiqna7svbvjt4j8k4kkd',1607095170,'','172.18.0.5'),('t7kg9e7bm87k5ed5raemoipqpn',1590050524,'','172.18.0.5'),('t8nv5qcvpigav4m0u3jirlps25',1590050525,'','172.18.0.5'),('t972rbpb3vevf0uj3f0elk09r3',1607095347,'','172.18.0.5'),('t9nc9rec0s9821igu2bn9i8deo',1590051476,'','172.18.0.5'),('t9q0hqg5t8r1n5f6gc6omn48fq',1590050403,'','172.18.0.5'),('ta5m5en2k3166r9m309u9u9uo2',1607093517,'','172.18.0.5'),('tachgdv96d65j93993gkv87hou',1590050574,'','172.18.0.5'),('tbbu4u35lnjf16n0m7qtn9lq2b',1607094622,'','172.18.0.5'),('tbhuvouu3nri25dreqg80vduma',1607094999,'','172.18.0.5'),('tbkmsuceafmcgqvn7ruemq9njr',1590050574,'','172.18.0.5'),('tdhdn46c25vs4bbccrj01str8t',1590050405,'','172.18.0.5'),('te606pfju772d5jf7mp7vev35c',1607094823,'','172.18.0.5'),('tfk6ne0p9jccd35avevb0ftvh5',1590049918,'','172.18.0.5'),('tfnnul4edq5npiekla72cd9p8j',1590051023,'','172.18.0.5'),('tfo5eceb7as00k9vqge90b2a1d',1590049918,'','172.18.0.5'),('tg28bhljgh5ood7mj6ea1hptn3',1607093517,'','172.18.0.5'),('tg4sgesgunt1p1kdrg2nhn4vcc',1607094940,'','172.18.0.5'),('tgcgmo28tarq0ef2i8ku1llfp1',1590051138,'','172.18.0.5'),('tgq5sju41ujvfb46gi4go234s9',1590050474,'','172.18.0.5'),('th66elv7bl54bceovotd8g91f9',1590050692,'','172.18.0.5'),('th7vqkin3h5ai959a72ck6ub7q',1590051475,'','172.18.0.5'),('the29conso3nar4c3kpr5cul5h',1590051134,'','172.18.0.5'),('tjckj5h8nvg30q8bfr281j88p0',1590050693,'','172.18.0.5'),('tkmhpcgfg73fek04ql1u1ffr1u',1607094622,'','172.18.0.5'),('tkv28etn9tj8inlncrlvagd1h4',1607094416,'','172.18.0.5'),('tl57u3ap8n63rk7v6cfufg31o0',1590050692,'','172.18.0.5'),('tlepqei4kd13u03g6ovs27gfpg',1607094610,'','172.18.0.5'),('tlfav96ekenfjdsbk3jd9bk8k4',1590051475,'','172.18.0.5'),('tm2n6haaquk8vklqv619rqtbfd',1607093329,'','172.18.0.5'),('tmfdrpa00jubsdaco3nc9cq0vo',1590050471,'','172.18.0.5'),('tnnk8f38f58knonhlc121ui52a',1590050574,'','172.18.0.5'),('tnobedbupilhv041mdarmcfs1l',1590049918,'','172.18.0.5'),('tnqo8q0vlncpqpuab13j5kot8f',1607093251,'','172.18.0.5'),('tof11cja45s7hvpu5h0co05pf9',1607094880,'','172.18.0.5'),('tp5uruup291de5568ku7hhvb4c',1590050522,'','172.18.0.5'),('tpqp4dk9jibs3f27b34mr8306p',1590051523,'','172.18.0.5'),('tqjutlisvdg53vmhabv1idnj6j',1590050576,'','172.18.0.5'),('tqtvtsf9e8v9p4pgsv57a9997f',1590050406,'','172.18.0.5'),('trphj2makucsrk2rio98tk3j3g',1607093516,'','172.18.0.5'),('ts07kl7dt209k4v4kkq07t498h',1590051478,'','172.18.0.5'),('tsccadljamirgveheofqp4l3ah',1607094329,'','172.18.0.5'),('tskccavfvhhaf07lgf3d6lqukq',1607094880,'','172.18.0.5'),('tsr17td2fc67q22lucr730vbj2',1590051027,'','172.18.0.5'),('tsta2hp4jc47j3r48cja7ej3ok',1607095396,'','172.18.0.5'),('tt6b1btaedtq61lagtraadp74e',1607095002,'','172.18.0.5'),('tt9hs8ibs5bqvoefg20b7sj1jm',1590051479,'','172.18.0.5'),('tuc46032vkq9c7ne01enqevvqe',1607095001,'','172.18.0.5'),('tudd512npevom1p03dsd1g6rdm',1590050848,'','172.18.0.5'),('tumpp8bh2uc9evujftuikj4nfd',1590051026,'','172.18.0.5'),('tvumk8s4gu35pd9s0smbijjppm',1607095000,'','172.18.0.5'),('u074k587eg3emqaemq3hgo817c',1607094685,'','172.18.0.5'),('u0fcvtg9pitfldejo98263r9uj',1607094611,'','172.18.0.5'),('u0h2itvh63gtbull2b2svrd66s',1590051478,'','172.18.0.5'),('u16cmh1q2ftfe504uqbf0gk212',1607094940,'','172.18.0.5'),('u1k241e3148lnj9j11jsj34u1a',1590051542,'','172.18.0.5'),('u1pcdrslnjr7j1hqna94uvimvr',1590050692,'','172.18.0.5'),('u3g02ehca9fr3393ebu1gpggq7',1590051478,'','172.18.0.5'),('u3k1borkn7op7shoth97dk1ika',1607095347,'','172.18.0.5'),('u4eth19mc9mr2usp65p1rfd9ug',1590050574,'','172.18.0.5'),('u4fmk4a9c5csd5tu4usql7ptdb',1607095348,'','172.18.0.5'),('u4imt501hmu4ma8sdcsklrdr8s',1590051523,'','172.18.0.5'),('u56jnvc5q4s7r3m1b3its2mtbo',1607093250,'','172.18.0.5'),('u5a9gu7idv43u2b7ccl730et02',1590051542,'','172.18.0.5'),('u5sj12m280tcd0r69fj311jugr',1607095169,'','172.18.0.5'),('u6gm1pkpm6l6pio90jqoa25ikm',1607094940,'','172.18.0.5'),('u6ji0g8ge6uc7bakn11333ruc1',1590050949,'','172.18.0.5'),('u6rgvthuai8sh1gjsuc3j1nurq',1607094610,'','172.18.0.5'),('u78q9qic68q0as139thvc9703g',1607094822,'','172.18.0.5'),('u86sdufabdcitrt8ahosluntmq',1607094670,'','172.18.0.5'),('u8cmp08te86bob0lgrumgo20pk',1607095170,'','172.18.0.5'),('u8ijkrclpukh693na5ftjcv6b3',1590050848,'','172.18.0.5'),('u8vii0frr2ackv6ia41rc08q35',1590051421,'','172.18.0.5'),('uanu8911lj73cc30v66ddgam7u',1590051423,'','172.18.0.5'),('ubacdoe90cqtfkna2hgdebhsu1',1607094823,'','172.18.0.5'),('ubfocb11hjlvl1b90jbr438u7u',1590050403,'','172.18.0.5'),('uc65d0buhkpjc451dcasa3iisg',1607095001,'','172.18.0.5'),('ucla0djebtnrs4gti3f0u7q1ep',1590050692,'','172.18.0.5'),('ucrj5e15p4ljr43ot427ico4d7',1607095396,'','172.18.0.5'),('ud9pg4df3nnnpu3v9lpvhhedk7',1590050525,'','172.18.0.5'),('udbgecutjab807htie8n7mtj68',1607095169,'','172.18.0.5'),('uegfaj59lov5nvj2sclh529ocl',1590050948,'','172.18.0.5'),('uehmh433qnmvqk86sg491sp9q5',1607093330,'','172.18.0.5'),('uei7njmah3d6763703ukmsmcro',1590050403,'','172.18.0.5'),('uepf7ecsfni2h29u876hm9mirr',1590051023,'','172.18.0.5'),('uesmop8mpatm7lqcnc0tmqh73r',1590050845,'','172.18.0.5'),('uf0hvka73sj4tefgiml89rqkl2',1607094248,'','172.18.0.5'),('uf6kbp446rvme0hv6243fq4fvf',1590051521,'','172.18.0.5'),('ufdbo0kodrsmqi4vbshsj7t86r',1607095052,'','172.18.0.5'),('ufhvjao64hjvtk4pfmnhiteaue',1590051542,'','172.18.0.5'),('ufom76pom6evtteepoa61e16o5',1607093330,'','172.18.0.5'),('ufuc2bp8cekngiop9583134er1',1590051134,'','172.18.0.5'),('ughv2vs5556jr51l3gqhsdt48a',1607094822,'','172.18.0.5'),('ugj5jpv5pvkj11sr1u0n406g16',1590051421,'','172.18.0.5'),('ugrp59grkov4ioot1ck21m7vsc',1607094248,'','172.18.0.5'),('uh9pke98u04uo44jausolt2ll4',1590051475,'','172.18.0.5'),('uhqk03e16o78sdmkqprt2f7m9j',1607094879,'','172.18.0.5'),('ui890hkbugulqf1h7icljuqdju',1590051023,'','172.18.0.5'),('uiqrt5cssfriro26dgh01iorea',1590050574,'','172.18.0.5'),('uja4u70hdg9pgtv47c67jc08ta',1607095347,'','172.18.0.5'),('ujhe5a7ne14npu1diumplaujuc',1590051024,'','172.18.0.5'),('ujtt8d6k1hcsj31bcgd24l27qb',1590051542,'','172.18.0.5'),('ukidu1i2m9va8mm29f7heue91c',1590051423,'','172.18.0.5'),('ul61ep1q14p7lq5crbfaife46r',1590050406,'','172.18.0.5'),('ulq7th7sopoua0t2eipnf53uc5',1590050471,'','172.18.0.5'),('um1f91te5hdfr5j631k1135bm6',1590050522,'','172.18.0.5'),('un1kg89o2d0kh6gka5s097ophj',1590050574,'','172.18.0.5'),('un7gvlav2j05kkefpm87moiljn',1607095169,'','172.18.0.5'),('un7m2fc3h7pl32s71hhgln8v88',1607095396,'','172.18.0.5'),('undekap7kau41pmboebi15q354',1607094939,'','172.18.0.5'),('unefku15o28tbvk7ch5j9f1c40',1590049886,'','172.18.0.5'),('uo517a1kmpv28u9sb6blhabict',1607094623,'','172.18.0.5'),('uoo8emsnegdft3omr86r7tda0g',1607095347,'','172.18.0.5'),('uor1j78rgc5vsoj2dimfgldtsv',1590050846,'','172.18.0.5'),('uphdrnggval1m0og186eqth302',1590050471,'','172.18.0.5'),('upisoqugi40cfl7c9fir6jpdj9',1590051543,'','172.18.0.5'),('upls7g4kflh18rn63f1vkmd2ib',1590051421,'','172.18.0.5'),('uqcl6baoct84eljd3jn909hpvr',1590050406,'','172.18.0.5'),('uqf6h45ihgc4vsp4av4ansl8mv',1607094670,'','172.18.0.5'),('uqnm0kk3ddvuhc32hvdea6k9ft',1607093516,'','172.18.0.5'),('ur5l6rno0fa7q1dqpfrqnp4g7m',1590051024,'','172.18.0.5'),('urnpa5v61g2cej8nvavnet86pn',1607094416,'','172.18.0.5'),('us56cm2e1pmdkvv2j85k8jtomt',1590050848,'','172.18.0.5'),('us6q7neb0709t06c6qu1f8buia',1607094822,'','172.18.0.5'),('usn5k6nmen3dkdpjgc87bchac1',1590050689,'','172.18.0.5'),('usutlupemjc9mmoqe6tp5kcoo4',1590049918,'','172.18.0.5'),('utb8otopr5cplbdrpgkkmlsr4h',1590050848,'','172.18.0.5'),('uu0bl9bim51027ic4dii3vvjlb',1590051520,'','172.18.0.5'),('uud9ud1sgm8r76l35a07bjlpib',1590051135,'','172.18.0.5'),('uv1mmotqp13n4tb17tg1mjpoeo',1590050849,'','172.18.0.5'),('v000923pe7q6huithuh8pgteg6',1607093516,'','172.18.0.5'),('v0h6kpu8nk0c2vuqqemlmg7e36',1590050471,'','172.18.0.5'),('v1ms8fss1pt14uba4r354t024e',1590050525,'','172.18.0.5'),('v1pce0fphlks4rbmekev7kqr3m',1607094822,'','172.18.0.5'),('v2glqp176p950bao7u76oukfac',1590050692,'','172.18.0.5'),('v2om42pbgvn3dn0p5b3jimchf9',1607093330,'','172.18.0.5'),('v437duug1mj0rha0t2i56r6n3n',1590050945,'','172.18.0.5'),('v49eufdm62pa1dnthtlcpssvaa',1607095001,'','172.18.0.5'),('v4k7c9b18kqigskpjorli4bc54',1607094841,'','172.18.0.5'),('v4tadnr45552onp3r620e29pua',1590050688,'','172.18.0.5'),('v60ffphatdovc0fbd1ol12s45v',1607094610,'','172.18.0.5'),('v694ab5koddgf3m0g39lpkrqf7',1607093889,'','172.18.0.5'),('v725coe5liegp59hjel1mhrt8n',1590051476,'','172.18.0.5'),('v74a14tgnbntqehhroqtb5bt0e',1590050522,'','172.18.0.5'),('v7ddjqvblqvlsa5fq1hecpglga',1590049918,'','172.18.0.5'),('v7krrqdspgbrpmsnlnnetni64b',1607093331,'','172.18.0.5'),('v7uprt8us4324qu2b61iuj3f7l',1607094622,'','172.18.0.5'),('v80aphrb2d2t52ub2chkrovum1',1607094939,'','172.18.0.5'),('v86ut3kcuvq33550lb87dilkh3',1590051521,'','172.18.0.5'),('v87b0ethsmi0sdqms50102lua8',1590050949,'','172.18.0.5'),('v8fe0keso1i7gkk2t54hkp9biu',1590050403,'','172.18.0.5'),('v981lpk3jra8blbs01j15euou4',1607093517,'','172.18.0.5'),('v9cal41jgtevhk1ueip4cm6j24',1607095348,'','172.18.0.5'),('v9f4agcp0hkf04otpkgaksv36v',1590050846,'','172.18.0.5'),('v9rmebbbiuugqvg5ferof38jkd',1590049918,'','172.18.0.5'),('vafepal337s8o1ubkliliv589d',1590051524,'','172.18.0.5'),('vaj8loo7v1b5smbhiu0hob6sro',1607095052,'','172.18.0.5'),('val1564g7uf81e39tk8fbn8mls',1607095169,'','172.18.0.5'),('vav0m8dm82qvpcc64cc4s3b8uj',1607094623,'','172.18.0.5'),('vbct5thst3h0dkk7e6qevmknnd',1607095170,'','172.18.0.5'),('vc17j2sdbkvfo8j2h1ug34sldh',1590050949,'','172.18.0.5'),('vc21blbcgdt3vategrqga2fuqk',1590050849,'','172.18.0.5'),('vcl0s7gvc4iogrjo7uvraue6el',1590051478,'','172.18.0.5'),('vdtsp4b3orvuonk2292r4v2u97',1607093517,'','172.18.0.5'),('ve9le0juvh8hf6kh3l2ef8gg5f',1590051424,'','172.18.0.5'),('vemq0g8dofsctfb1svs2gu2c5p',1607095052,'','172.18.0.5'),('vffdqbo8s93ukccnc641qnom92',1607093331,'','172.18.0.5'),('vg561u945i595h9bdltnulr7hk',1590051138,'','172.18.0.5'),('vgqvebj0t8stq1380eh9shi010',1590051475,'','172.18.0.5'),('vh5donmin3kd92h65l91ulk8ie',1590051138,'','172.18.0.5'),('vhum2rdr3pmi6gdagjsc8ojum1',1607094622,'','172.18.0.5'),('vibhiokhlu1vtdkqm43elkqavk',1607093922,'','172.18.0.5'),('vienfrjvgcihiubimaccbgi3g5',1590051478,'','172.18.0.5'),('viphobcs0jfdcaiic1j07vtqju',1590050945,'','172.18.0.5'),('vjfllp74atddopq4kqis5i52u9',1590050576,'','172.18.0.5'),('vjir4raj4tkgjqq0snos9cagtm',1607095348,'','172.18.0.5'),('vk8s2futuhlhauubdt7sbsi36m',1590050403,'','172.18.0.5'),('vkhn6aqkclq98dnkgirpfjgk1h',1607093330,'','172.18.0.5'),('vknt0qklqv5i5adnvbg9tlkcu4',1590050691,'','172.18.0.5'),('vldvoqugb9m2193o1sofnmorbh',1590051421,'','172.18.0.5'),('vmkjc7p52ncdjo1hehj5856fns',1607093517,'','172.18.0.5'),('vmpd3t9u5rugfllqdjq7k7jv3u',1590050574,'','172.18.0.5'),('vn0o564s419sunimunh283895v',1607094940,'','172.18.0.5'),('vo1352a376b7do2n40555vvoi3',1590051135,'','172.18.0.5'),('voi4ch3nqjg056gu43thvj44v3',1590051542,'','172.18.0.5'),('vovi981d0t753r8pum5ehqoad7',1590051138,'','172.18.0.5'),('vpdchhu7v46jashfeahqhlnu32',1607094416,'','172.18.0.5'),('vpigsopioh0tegafg9l3v8v0e7',1607094623,'','172.18.0.5'),('vqjobru8ukbo0u5r02ta6lpvhm',1590051027,'','172.18.0.5'),('vrkg07gjsg2ihcihju8ok83489',1590051126,'ipamusername|s:5:\"Admin\";ipamlanguage|s:11:\"en_US.UTF-8\";lastactive|i:1590051126;csrf_cookie_user-menu|s:32:\"fg3mtYxStTXBfs3wrSNhoxs6NDWb3aR0\";csrf_cookie_subnet_add|s:32:\"cRWNrwtHonCMV6h5YaBqI-dRa_ymB-Wu\";csrf_cookie_address_add|s:32:\"Z-w43WIQDld1UK7O1i2yDvrwZYPiWplG\";csrf_cookie_address_24|s:32:\"Ut9pIsab92TD0FXzxsla9UmWblzVfotU\";csrf_cookie_address_22|s:32:\"t-C98w_35yfRAMAlS93vq6q-OzJ1mxm7\";','172.18.0.5'),('vrkq23a4d5s25fov8pktopemok',1590050689,'','172.18.0.5'),('vs6669238gjcbfi3e6jpargklg',1590049918,'','172.18.0.5'),('vt68saod2c890kqmmnctuspul1',1607094822,'','172.18.0.5'),('vtit4jcp24bellokvlgfc2dh1v',1590051545,'','172.18.0.5'),('vtv3ija3659v2jcb65ob8v271l',1607094821,'','172.18.0.5'),('vtvul41utrhjf07jmp1t7tev4o',1590051026,'','172.18.0.5'),('vu85r9e77tkk4mclmooanagbql',1590050848,'','172.18.0.5'),('vv9qdeir3nuepns04fi3v1saku',1590051135,'','172.18.0.5');
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
INSERT INTO `settings` VALUES (1,'phpipam','Sysadmin','admin@domain.local','domain.local','http://localhost',NULL,0,0,0,0,0,'{\"zoneLength\":3,\"ipType\":{\"0\":\"v4\",\"1\":\"v6\"},\"separator\":\"_\",\"indicator\":{\"0\":\"own\",\"1\":\"customer\"},\"zoneGenerator\":\"2\",\"zoneGeneratorType\":{\"0\":\"decimal\",\"1\":\"hex\",\"2\":\"text\"},\"deviceType\":\"3\",\"padding\":\"on\",\"strictMode\":\"on\",\"pattern\":{\"0\":\"patternFQDN\"}}',0,NULL,0,'{\"type\":\"kea\",\"settings\":{\"file\":\"/etc/kea/kea.conf\"}}',0,1,0,1,1,1,0,1,1,NULL,'1.42',25,'1',0,'mac;owner;state;switch;note;firewallAddressObject',NULL,1,4096,'subnet,asc',24,'dark',0,'1800;3600',0,'2020-12-04 14:43:40','2020-12-04 15:43:40','1','/bin/ping','/bin/fping','ping',128,'Yes',NULL,3600,0,1,0,0,1,0,NULL,'Database',0,1,0,1,'{\"minLength\":8,\"maxLength\":0,\"minNumbers\":0,\"minLetters\":0,\"minLowerCase\":0,\"minUpperCase\":0,\"minSymbols\":0,\"maxSymbols\":0,\"allowedSymbols\":\"#,_,-,!,[,],=,~\"}','none','phpipam',16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subnets`
--

LOCK TABLES `subnets` WRITE;
/*!40000 ALTER TABLE `subnets` DISABLE KEYS */;
INSERT INTO `subnets` VALUES (7,'167772160','8',3,'huge subnet',NULL,NULL,0,0,0,0,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(8,'167772160','24',3,NULL,NULL,NULL,0,7,0,3,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(9,'167772416','24',3,NULL,NULL,NULL,0,7,0,4,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(10,'2886729728','12',4,NULL,NULL,NULL,0,0,0,0,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(11,'2886729728','24',4,NULL,NULL,NULL,0,10,0,5,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(12,'2886729984','24',4,NULL,NULL,NULL,0,10,0,6,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL),(13,'167772672','24',3,NULL,NULL,NULL,0,7,0,0,0,0,'[]',0,'0',0,0,0,0,0,NULL,0,0,2,0,0,NULL,NULL,NULL);
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
INSERT INTO `users` VALUES (1,'Admin',1,'$6$rounds=3000$fPjzAjTagh02KXUu$Ei5x75utSIu/gTFzp3wWVz3qDqu2FQQskxIDouGiKSCnTnq4G30K/lZbPTQRy4X0/GMKigpF3JHNu0uSyI6of1','','Administrator','phpIPAM Admin','admin@domain.local','0','statistics;favourite_subnets;changelog;access_logs;error_logs;top10_hosts_v4',9,NULL,'No','No','No','No','2020-12-04 15:17:27','2020-12-04 15:43:23','2020-12-04 16:17:27','default',0,'Dynamic',1,0,NULL,'',NULL,NULL,'{\"vlan\":\"1\",\"vrf\":\"1\",\"pdns\":\"1\",\"circuits\":\"1\",\"racks\":\"1\",\"nat\":\"1\",\"pstn\":\"1\",\"customers\":\"1\",\"locations\":\"1\",\"devices\":\"1\"}',1);
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

-- Dump completed on 2020-12-04 15:24:05
