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
INSERT INTO `api` VALUES (1,'development','developcode',1,NULL,'ssl_code',0,0,0,0,'2020-12-05 16:54:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES (1,'subnet',1,1,'delete','success','2020-03-07 11:23:23','[details]: \r\n[id]. 1\r\n[subnet]. fd13.6d20.29dc.cf27..\r\n[mask]. 64\r\n[sectionId]. IPv6 (id 2)\r\n[description]. Private subnet 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. Root\r\n[allowRequests]. False\r\n[vlanId]. IPv6 private 1 [2001]\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(2,'section',2,1,'delete','success','2020-03-07 11:23:23','[details]: \r\n[id]. 2\r\n[name]. IPv6\r\n[description]. Section for IPv6 addresses\r\n[masterSection]. Root\r\n[permissions]. / \r\n[strictMode]. False\r\n[subnetOrdering]. / \r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 0\r\n[DNS]. / \r\n\r\n'),(3,'subnet',6,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 6\r\n[subnet]. 10.65.22.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. DHCP range\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 0.0.0.0/ [My folder] (id 5)\r\n[allowRequests]. True\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(4,'subnet',5,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 5\r\n[sectionId]. Customers (id 1)\r\n[description]. My folder\r\n[masterSubnetId]. Root\r\n[resolveDNS]. 0\r\n[customer_id]. / \r\n[isFolder]. 1\r\n[location]. None\r\n\r\n'),(5,'subnet',3,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 3\r\n[subnet]. 10.10.1.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(6,'subnet',4,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 4\r\n[subnet]. 10.10.2.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 2\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(7,'subnet',2,1,'delete','success','2020-03-07 11:23:30','[details]: \r\n[id]. 2\r\n[subnet]. 10.10.0.0\r\n[mask]. 16\r\n[sectionId]. Customers (id 1)\r\n[description]. Business customers\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. Root\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(8,'subnet',3,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 3\r\n[subnet]. 10.10.1.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 1\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(9,'subnet',4,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 4\r\n[subnet]. 10.10.2.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. Customer 2\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 10.10.0.0/16 [Business customers] (id 2)\r\n[allowRequests]. False\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(10,'subnet',6,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 6\r\n[subnet]. 10.65.22.0\r\n[mask]. 24\r\n[sectionId]. Customers (id 1)\r\n[description]. DHCP range\r\n[linked_subnet]. / \r\n[firewallAddressObject]. / \r\n[vrfId]. None\r\n[masterSubnetId]. 0.0.0.0/ [My folder] (id 5)\r\n[allowRequests]. True\r\n[vlanId]. None\r\n[showName]. False\r\n[device]. / \r\n[pingSubnet]. True\r\n[discoverSubnet]. True\r\n[resolveDNS]. 0\r\n[DNSrecursive]. True\r\n[DNSrecords]. True\r\n[nameserverId]. None\r\n[scanAgent]. / \r\n[customer_id]. / \r\n[isFolder]. 0\r\n[isFull]. True\r\n[threshold]. 0\r\n[location]. None\r\n[lastScan]. / \r\n[lastDiscovery]. / \r\n\r\n'),(11,'section',1,1,'delete','success','2020-03-07 11:23:31','[details]: \r\n[id]. 1\r\n[name]. Customers\r\n[description]. Section for customers\r\n[masterSection]. Root\r\n[permissions]. / \r\n[strictMode]. False\r\n[subnetOrdering]. / \r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 0\r\n[DNS]. / \r\n\r\n'),(12,'section',3,1,'add','success','2020-03-07 11:24:25','[details]: \r\n[name]. section1\r\n[description]. / \r\n[strictMode]. True\r\n[subnetOrdering]. default\r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 1\r\n[masterSection]. Root\r\n[permissions]. / \r\n[id]. 3\r\n\r\n'),(13,'section',4,1,'add','success','2020-03-07 11:24:36','[details]: \r\n[name]. section2\r\n[description]. / \r\n[strictMode]. True\r\n[subnetOrdering]. default\r\n[showVLAN]. True\r\n[showVRF]. True\r\n[showSupernetOnly]. 1\r\n[masterSection]. Root\r\n[permissions]. / \r\n[id]. 4\r\n\r\n'),(14,'subnet',7,1,'add','success','2020-03-07 11:26:02','[details]: \r\n[id]. 7\r\n[isFolder]. 0\r\n[masterSubnetId]. Root\r\n[subnet]. 10.0.0.0\r\n[mask]. 8\r\n[description]. huge subnet\r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(15,'subnet',8,1,'add','success','2020-03-07 11:26:46','[details]: \r\n[id]. 8\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.0.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 10_FIRST [10]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(16,'ip_addr',11,1,'add','success','2020-03-07 11:26:59','[details]: \r\n[ip_addr]. 10.0.0.1\r\n[id]. 11\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host1\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(17,'ip_addr',12,1,'add','success','2020-03-07 11:27:11','[details]: \r\n[ip_addr]. 10.0.0.2\r\n[id]. 12\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host2\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(18,'subnet',9,1,'add','success','2020-03-07 11:27:40','[details]: \r\n[id]. 9\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.1.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 11_SCND [11]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(19,'ip_addr',13,1,'add','success','2020-03-07 11:27:50','[details]: \r\n[ip_addr]. 10.0.1.1\r\n[id]. 13\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host3\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(20,'ip_addr',14,1,'add','success','2020-03-07 11:28:03','[details]: \r\n[ip_addr]. 10.0.1.2\r\n[id]. 14\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. host4\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(21,'subnet',10,1,'add','success','2020-03-07 11:28:56','[details]: \r\n[id]. 10\r\n[isFolder]. 0\r\n[masterSubnetId]. Root\r\n[subnet]. 172.16.0.0\r\n[mask]. 12\r\n[description]. / \r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(22,'subnet',11,1,'add','success','2020-03-07 11:29:26','[details]: \r\n[id]. 11\r\n[isFolder]. 0\r\n[masterSubnetId]. 172.16.0.0/12 (id 10)\r\n[subnet]. 172.16.0.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 12_THRD [12]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(23,'subnet',12,1,'add','success','2020-03-07 11:30:01','[details]: \r\n[id]. 12\r\n[isFolder]. 0\r\n[masterSubnetId]. 172.16.0.0/12 (id 10)\r\n[subnet]. 172.16.1.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. 13_4TH [13]\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section2 (id 4)\r\n[vrfId]. None\r\n\r\n'),(24,'ip_addr',15,1,'add','success','2020-03-07 11:30:20','[details]: \r\n[ip_addr]. 172.16.0.1\r\n[id]. 15\r\n[subnetId]. 172.16.0.0/24 (id 11)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host5\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(25,'ip_addr',16,1,'add','success','2020-03-07 11:30:29','[details]: \r\n[ip_addr]. 172.16.0.2\r\n[id]. 16\r\n[subnetId]. 172.16.0.0/24 (id 11)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host6\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(26,'ip_addr',17,1,'add','success','2020-03-07 11:30:50','[details]: \r\n[ip_addr]. 172.16.1.1\r\n[id]. 17\r\n[subnetId]. 172.16.1.0/24 (id 12)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host7\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(27,'ip_addr',18,1,'add','success','2020-03-07 11:31:01','[details]: \r\n[ip_addr]. 172.16.1.2\r\n[id]. 18\r\n[subnetId]. 172.16.1.0/24 (id 12)\r\n[section]. section2 (id 4)\r\n[PTR]. / \r\n[hostname]. host8\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(28,'ip_addr',11,1,'edit','success','2020-03-07 12:39:03','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => dmz, group1\r\n'),(29,'ip_addr',12,1,'edit','success','2020-03-07 12:39:20','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => group2\r\n'),(30,'ip_addr',13,1,'edit','success','2020-03-07 12:39:37','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(31,'ip_addr',14,1,'edit','success','2020-03-07 12:39:45','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(32,'ip_addr',15,1,'edit','success','2020-03-07 12:40:11','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => dmz, group2\r\n'),(33,'ip_addr',16,1,'edit','success','2020-03-07 12:40:20','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: NULL => web1\r\n'),(34,'ip_addr',16,1,'edit','success','2020-03-07 12:40:31','[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n[custom_ansible_groups]: web1 => NULL\r\n'),(35,'ip_addr',11,1,'edit','success','2020-03-11 11:27:18','[hostname]: host1 => host1.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(36,'ip_addr',12,1,'edit','success','2020-03-11 11:27:28','[hostname]: host2 => host2.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(37,'ip_addr',19,1,'add','success','2020-03-11 11:27:40','[details]: \r\n[ip_addr]. 10.0.0.3\r\n[id]. 19\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(38,'ip_addr',20,1,'add','success','2020-03-11 11:27:52','[details]: \r\n[ip_addr]. 10.0.0.4\r\n[id]. 20\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid.hostname\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(39,'ip_addr',21,1,'add','success','2020-03-11 11:28:10','[details]: \r\n[ip_addr]. 10.0.0.5\r\n[id]. 21\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. moreinvalid.hostname.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(40,'ip_addr',21,1,'edit','success','2020-03-11 11:28:38','[hostname]: moreinvalid.hostname.local => moreinvalid..hostname.l\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(41,'ip_addr',13,1,'edit','success','2020-03-11 11:29:05','[hostname]: host3 => host3.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(42,'ip_addr',14,1,'edit','success','2020-03-11 11:29:10','[hostname]: host4 => host4.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(43,'ip_addr',15,1,'edit','success','2020-03-11 11:29:22','[hostname]: host5 => host5.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(44,'ip_addr',16,1,'edit','success','2020-03-11 11:29:28','[hostname]: host6 => host6.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(45,'ip_addr',17,1,'edit','success','2020-03-11 11:29:42','[hostname]: host7 => host7.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(46,'ip_addr',18,1,'edit','success','2020-03-11 11:29:52','[hostname]: host8 => host8.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(47,'ip_addr',22,1,'add','success','2020-05-08 15:53:13','[details]: \r\n[ip_addr]. 10.0.1.3\r\n[id]. 22\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. WINDOWS.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(48,'ip_addr',23,1,'add','success','2020-05-21 10:30:21','[details]: \r\n[ip_addr]. 10.0.0.6\r\n[id]. 23\r\n[subnetId]. 10.0.0.0/24 (id 8)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. gateway.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[is_gateway]. True\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(49,'ip_addr',24,1,'add','success','2020-05-21 10:44:24','[details]: \r\n[ip_addr]. 10.0.1.4\r\n[id]. 24\r\n[subnetId]. 10.0.1.0/24 (id 9)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. invalid.i\r\n[description]. invalid gateway hostname but valid gateway ip\r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. / \r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(50,'ip_addr',24,1,'edit','success','2020-05-21 10:44:37','[is_gateway]: False => True\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(51,'ip_addr',22,1,'edit','success','2020-05-21 10:48:43','[is_gateway]: False => True\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(52,'ip_addr',24,1,'edit','success','2020-05-21 10:48:51','[is_gateway]: False => True\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(53,'subnet',13,1,'add','success','2020-05-21 10:51:41','[details]: \r\n[id]. 13\r\n[isFolder]. 0\r\n[masterSubnetId]. 10.0.0.0/8 [huge subnet] (id 7)\r\n[subnet]. 10.0.2.0\r\n[mask]. 24\r\n[description]. / \r\n[vlanId]. None\r\n[allowRequests]. False\r\n[showName]. False\r\n[discoverSubnet]. False\r\n[pingSubnet]. False\r\n[resolveDNS]. 0\r\n[scanAgent]. 0\r\n[DNSrecursive]. False\r\n[DNSrecords]. False\r\n[nameserverId]. None\r\n[device]. / \r\n[isFull]. False\r\n[location]. None\r\n[customer_id]. / \r\n[threshold]. 0\r\n[sectionId]. section1 (id 3)\r\n[vrfId]. None\r\n\r\n'),(54,'ip_addr',25,1,'add','success','2020-05-21 10:52:05','[details]: \r\n[ip_addr]. 10.0.2.1\r\n[id]. 25\r\n[subnetId]. 10.0.2.0/24 (id 13)\r\n[section]. section1 (id 3)\r\n[PTR]. / \r\n[hostname]. lonely.localdomain.local\r\n[description]. / \r\n[mac]. / \r\n[state]. Used\r\n[customer_id]. 0\r\n[owner]. / \r\n[switch]. / \r\n[location_item]. None\r\n[note]. / \r\n[custom_ansible_groups]. lonely_group\r\n[PTRignore]. False\r\n[excludePing]. False\r\n\r\n'),(55,'ip_addr',11,1,'edit','success','2020-12-04 15:44:19','[description]: NULL => this is host host1.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(56,'ip_addr',12,1,'edit','success','2020-12-04 15:44:43','[description]: NULL => this is host host2.localdomain.local\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(57,'ip_addr',22,1,'edit','success','2020-12-04 15:45:14','[description]: NULL => a host based on windows os\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(58,'ip_addr',14,1,'edit','success','2020-12-04 16:17:25','[description]: NULL => characters \"not allowed\"\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(59,'ip_addr',25,1,'edit','success','2020-12-05 13:09:35','[description]: NULL => a bad charecter at the end \\\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n'),(60,'ip_addr',25,1,'edit','success','2020-12-05 13:09:48','[description]: a bad charecter at the end \\ => a bad character at the end \\\r\n[customer_id]: NULL => 0\r\n[switch]: None => \r\n[location_item]: None => None\r\n');
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
INSERT INTO `ipaddresses` VALUES (11,8,'167772161',NULL,'this is host host1.localdomain.local','host1.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 14:44:19',NULL,'dmz, group1'),(12,8,'167772162',NULL,'this is host host2.localdomain.local','host2.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 14:44:43',NULL,'group2'),(13,9,'167772417',0,NULL,'host3.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:44:37',NULL,'web1'),(14,9,'167772418',NULL,'characters \"not allowed\"','host4.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 15:17:25',NULL,'web1'),(15,11,'2886729729',NULL,NULL,'host5.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:22',NULL,'dmz, group2'),(16,11,'2886729730',NULL,NULL,'host6.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:28',NULL,NULL),(17,12,'2886729985',NULL,NULL,'host7.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:42',NULL,NULL),(18,12,'2886729986',NULL,NULL,'host8.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-03-11 10:29:52',NULL,NULL),(19,8,'167772163',0,NULL,'invalid',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:30:21',NULL,NULL),(20,8,'167772164',0,NULL,'invalid.hostname',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:30:21',NULL,NULL),(21,8,'167772165',0,NULL,'moreinvalid..hostname.l',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:30:21',NULL,NULL),(22,9,'167772419',NULL,'a host based on windows os','WINDOWS.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-04 14:45:14',NULL,NULL),(23,8,'167772166',1,NULL,'gateway.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,NULL,NULL,NULL),(24,9,'167772420',1,'invalid gateway hostname but valid gateway ip','invalid.i',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-05-21 08:48:51',NULL,NULL),(25,13,'167772673',NULL,'a bad character at the end \\','lonely.localdomain.local',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'0','0',0,NULL,'2020-12-05 12:09:48',NULL,'lonely_group');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,'2020-03-07 11:20:18',NULL,'172.20.0.1','Database installation','Database installed successfully. Version 1.4.026 installed'),(2,2,'2020-03-07 11:20:57','admin','172.20.0.1','User login','Invalid username or password'),(3,0,'2020-03-07 11:21:02','admin','172.20.0.1','User login','User phpIPAM Admin logged in'),(4,0,'2020-03-07 11:22:15','Admin','172.20.0.1','settings object 1 edit','Object id=1 in settings edited id: 1 siteTitle: phpipam siteDomain: domain.local siteURL: http.//localhost siteLoginText: NULL prettyLinks: No defaultLang: 0 inactivityTimeout: 3600 siteAdminName: Sysadmin siteAdminMail: admin@domain.local api: 1 enableIPrequests: 0 enableMulticast: 0 enableRACK: 1 enableCircuits: 1 enableLocations: 1 enableSNMP: 0 enablePSTN: 0 enableCustomers: 1 enableThreshold: 1 enableVRF: 0 enableDNSresolving: 0 vlanDuplicate: 1 decodeMAC: 1 vlanMax: 4096 enableChangelog: 1 tempShare: 0 enableNAT: 1 enablePowerDNS: 0 updateTags: 0 enforceUnique: 1 enableRouting: 0 enableFirewallZones: 0 maintaneanceMode: 0 permissionPropagate: 1 link_field: NULL log: Database donate: 0 visualLimit: 24 theme: dark subnetOrdering: subnet,asc subnetView: 0 scanPingType: ping pingStatus: 1800;3600 scanPingPath: /bin/ping scanFPingPath: /bin/fping scanMaxThreads: 128'),(5,0,'2020-03-07 11:22:57','Admin','172.20.0.1','api object creation','New api database object created id: NULL app_id: development app_code: developcode app_permissions: 0 app_security: ssl_code app_lock: 0 app_lock_wait: 0 app_nest_custom_fields: 0 app_show_links: 0 app_comment: NULL'),(6,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Subnet truncate','Subnet Private subnet 1 id 1 truncated'),(7,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Subnet Private subnet 1 delete','Subnet Private subnet 1 deleted id: 1 subnet: 336395549904799703390415618052362076160 mask: 64 sectionId: 2 description: Private subnet 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 1 vlanId: 1 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: fd13.6d20.29dc.cf27..'),(8,0,'2020-03-07 11:23:23','Admin','172.20.0.1','Section IPv6 delete','Section IPv6 deleted id: 2 name: IPv6 description: Section for IPv6 addresses masterSection: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} strictMode: 1 subnetOrdering: / order: / editDate: / showVLAN: 0 showVRF: 0 showSupernetOnly: 0 DNS: /'),(9,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet My folder id 5 truncated'),(10,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet DHCP range id 6 truncated'),(11,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet DHCP range delete','Subnet DHCP range deleted id: 6 subnet: 172037632 mask: 24 sectionId: 1 description: DHCP range linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 5 allowRequests: 0 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.65.22.0'),(12,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet My folder id 5 truncated'),(13,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet My folder delete','Subnet My folder deleted id: 5 subnet: 0 mask: / sectionId: 1 description: My folder linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 0 vlanId: 0 showName: 0 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 1 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 0.0.0.0'),(14,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(15,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 1 id 3 truncated'),(16,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Customer 1 delete','Subnet Customer 1 deleted id: 3 subnet: 168427776 mask: 24 sectionId: 1 description: Customer 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.1.0'),(17,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(18,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 2 id 4 truncated'),(19,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Customer 2 delete','Subnet Customer 2 deleted id: 4 subnet: 168428032 mask: 24 sectionId: 1 description: Customer 2 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.2.0'),(20,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Business customers id 2 truncated'),(21,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet Business customers delete','Subnet Business customers deleted id: 2 subnet: 168427520 mask: 16 sectionId: 1 description: Business customers linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 0 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.0.0'),(22,0,'2020-03-07 11:23:30','Admin','172.20.0.1','Subnet truncate','Subnet Customer 1 id 3 truncated'),(23,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet Customer 1 delete','Subnet Customer 1 deleted id: 3 subnet: 168427776 mask: 24 sectionId: 1 description: Customer 1 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.1.0'),(24,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet truncate','Subnet Customer 2 id 4 truncated'),(25,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet Customer 2 delete','Subnet Customer 2 deleted id: 4 subnet: 168428032 mask: 24 sectionId: 1 description: Customer 2 linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 2 allowRequests: 1 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.10.2.0'),(26,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet truncate','Subnet DHCP range id 6 truncated'),(27,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Subnet DHCP range delete','Subnet DHCP range deleted id: 6 subnet: 172037632 mask: 24 sectionId: 1 description: DHCP range linked_subnet: / firewallAddressObject: / vrfId: 0 masterSubnetId: 5 allowRequests: 0 vlanId: 0 showName: 1 device: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} pingSubnet: 0 discoverSubnet: 0 resolveDNS: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 scanAgent: / customer_id: / isFolder: 0 isFull: 0 state: 2 threshold: 0 location: / editDate: / lastScan: / lastDiscovery: / ip: 10.65.22.0'),(28,0,'2020-03-07 11:23:31','Admin','172.20.0.1','Section Customers delete','Section Customers deleted id: 1 name: Customers description: Section for customers masterSection: 0 permissions: {\"3\".\"1\",\"2\".\"2\"} strictMode: 1 subnetOrdering: / order: / editDate: / showVLAN: 0 showVRF: 0 showSupernetOnly: 0 DNS: /'),(29,0,'2020-03-07 11:24:25','Admin','172.20.0.1','Section created','New section created name: section1 description: NULL strictMode: 1 subnetOrdering: default showVLAN: 1 showVRF: 1 showSupernetOnly: 1 masterSection: 0 permissions: [] id: 3'),(30,0,'2020-03-07 11:24:36','Admin','172.20.0.1','Section created','New section created name: section2 description: NULL strictMode: 1 subnetOrdering: default showVLAN: 1 showVRF: 1 showSupernetOnly: 1 masterSection: 0 permissions: [] id: 4'),(31,0,'2020-03-07 11:24:55','Admin','172.20.0.1','api object 1 edit','Object id=1 in api edited id: 1 app_id: development app_code: developcode app_permissions: 1 app_security: ssl_code app_lock: 0 app_lock_wait: 0 app_nest_custom_fields: 0 app_show_links: 0 app_comment: NULL'),(32,2,'2020-03-07 11:25:51','Admin','172.20.0.1','Subnet creation','Failed to add new subnetSQLSTATE[22007]: Invalid datetime format: 1366 Incorrect integer value: \'Add\' for column `phpipam`.`subnets`.`vlanId` at row 1'),(33,0,'2020-03-07 11:26:02','Admin','172.20.0.1','Subnet created','New subnet created id: 7 isFolder: 0 masterSubnetId: 0 subnet: 167772160 mask: 8 description: huge subnet vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(34,0,'2020-03-07 11:26:37','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 10 name: 10_FIRST description: NULL domainId: 1 customer_id: NULL'),(35,0,'2020-03-07 11:26:46','Admin','172.20.0.1','Subnet created','New subnet created id: 8 isFolder: 0 masterSubnetId: 7 subnet: 167772160 mask: 24 description: NULL vlanId: 3 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(36,0,'2020-03-07 11:26:59','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.0.1 action: add id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: zSo7Yfy7ggwVtMUAXkyGBJZWWwL8oNkx hostname: host1 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(37,0,'2020-03-07 11:27:11','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.0.2 action: add id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: KUFQt8CaAc-nR2mEOBCfNF0tL5r3lwdH hostname: host2 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(38,0,'2020-03-07 11:27:37','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 11 name: 11_SCND description: NULL domainId: 1 customer_id: NULL'),(39,0,'2020-03-07 11:27:40','Admin','172.20.0.1','Subnet created','New subnet created id: 9 isFolder: 0 masterSubnetId: 7 subnet: 167772416 mask: 24 description: NULL vlanId: 4 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(40,0,'2020-03-07 11:27:50','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.1.1 action: add id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: m6OlwrYlW0r-jyzisBf7_8p6vKH960f3 hostname: host3 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(41,0,'2020-03-07 11:28:03','Admin','172.20.0.1','Address created','New address created ip_addr: 10.0.1.2 action: add id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: im0pQgsa2cVigLp6o41583j6z8Wxy-HZ hostname: host4 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(42,0,'2020-03-07 11:28:56','Admin','172.20.0.1','Subnet created','New subnet created id: 10 isFolder: 0 masterSubnetId: 0 subnet: 2886729728 mask: 12 description: NULL vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(43,0,'2020-03-07 11:29:21','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 12 name: 12_THRD description: NULL domainId: 1 customer_id: NULL'),(44,0,'2020-03-07 11:29:26','Admin','172.20.0.1','Subnet created','New subnet created id: 11 isFolder: 0 masterSubnetId: 10 subnet: 2886729728 mask: 24 description: NULL vlanId: 5 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(45,0,'2020-03-07 11:29:57','Admin','172.20.0.1','vlans object creation','New vlans database object created vlanId: NULL number: 13 name: 13_4TH description: NULL domainId: 1 customer_id: NULL'),(46,0,'2020-03-07 11:30:01','Admin','172.20.0.1','Subnet created','New subnet created id: 12 isFolder: 0 masterSubnetId: 10 subnet: 2886729984 mask: 24 description: NULL vlanId: 6 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 4 vrfId: 0'),(47,0,'2020-03-07 11:30:20','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.0.1 action: add id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 172.16.0.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: qquRP0lOWvltnCdfsr0AQBsqeOWF-QTh hostname: host5 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(48,0,'2020-03-07 11:30:29','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.0.2 action: add id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 172.16.0.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: F5VZqR6FpHykKIjLrIesv0va6aD-Ekxj hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(49,0,'2020-03-07 11:30:50','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.1.1 action: add id: 17 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 172.16.1.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: HiscF1SBKjl1sI73w8WVDl7Lc40fAcs7 hostname: host7 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(50,0,'2020-03-07 11:31:01','Admin','172.20.0.1','Address created','New address created ip_addr: 172.16.1.2 action: add id: 18 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 172.16.1.2 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 4OGwZO6DRsZ8w_-0Zh7whmRWlTFp1c_s hostname: host8 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL PTRignore: 0 excludePing: 0 type: single'),(51,0,'2020-03-07 12:37:14','Admin','172.22.0.1','User logged out','User Admin has logged out'),(52,0,'2020-03-07 12:37:21','admin','172.22.0.1','User login','User phpIPAM Admin logged in'),(53,0,'2020-03-07 12:38:36','Admin','172.22.0.1','Custom field add','Custom Field add success (custom_ansible_groups) name: custom_ansible_groups oldname:  action: add table: ipaddresses csrf_cookie: Qa1WanrrZR6HBHBUgP1qnW80JHE0iuMt Comment: field add the host to a ansible group fieldType: text fieldSize:  fieldDefault:  ftype: text'),(54,0,'2020-03-07 12:39:03','Admin','172.22.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: vMCK38RTFw051AhucvL7Rl3rjsqeAKIS nostrict: yes hostname: host1 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(55,0,'2020-03-07 12:39:20','Admin','172.22.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: Buh1RYx4aTMjZKa8ucWJo4tI7WKgDrdT nostrict: yes hostname: host2 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(56,0,'2020-03-07 12:39:37','Admin','172.22.0.1','Address updated','Address 10.0.1.1 updated ip_addr: 10.0.1.1 action: edit id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772417 mac_old: NULL PTR: 0 addressId: 13 csrf_cookie: 02FLnUYNc37phrWkyl0m1cdlqQyP48jT nostrict: yes hostname: host3 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(57,0,'2020-03-07 12:39:45','Admin','172.22.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: tMLuzkicihuBqgtKVvvQOM8ID71H9uZw nostrict: yes hostname: host4 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(58,0,'2020-03-07 12:40:11','Admin','172.22.0.1','Address updated','Address 172.16.0.1 updated ip_addr: 172.16.0.1 action: edit id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729729 mac_old: NULL PTR: 0 addressId: 15 csrf_cookie: D5GnFXwZ6jN9F-6F535BwKUxL0vOgILT nostrict: yes hostname: host5 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(59,0,'2020-03-07 12:40:20','Admin','172.22.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: Nv_P-qb9PiJU5mhhyygLJQv5dN3fA9h3 nostrict: yes hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(60,0,'2020-03-07 12:40:31','Admin','172.22.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: uOhx68wZvJTJ7C81hg0dZnJTuaw4gYJo nostrict: yes hostname: host6 description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(61,0,'2020-03-07 13:08:41','Admin','172.22.0.1','settings object 1 edit','Object id=1 in settings edited id: 1 siteTitle: phpipam siteDomain: domain.local siteURL: http.//localhost siteLoginText: NULL prettyLinks: Yes defaultLang: 0 inactivityTimeout: 3600 siteAdminName: Sysadmin siteAdminMail: admin@domain.local api: 1 enableIPrequests: 0 enableMulticast: 0 enableRACK: 1 enableCircuits: 1 enableLocations: 1 enableSNMP: 0 enablePSTN: 0 enableCustomers: 1 enableThreshold: 1 enableVRF: 0 enableDNSresolving: 0 vlanDuplicate: 1 decodeMAC: 1 vlanMax: 4096 enableChangelog: 1 tempShare: 0 enableNAT: 1 enablePowerDNS: 0 updateTags: 0 enforceUnique: 1 enableRouting: 0 enableFirewallZones: 0 maintaneanceMode: 0 permissionPropagate: 1 link_field: NULL log: Database donate: 0 visualLimit: 24 theme: dark subnetOrdering: subnet,asc subnetView: 0 scanPingType: ping pingStatus: 1800;3600 scanPingPath: /bin/ping scanFPingPath: /bin/fping scanMaxThreads: 128'),(62,2,'2020-03-11 11:26:50','root','172.18.0.1','User login','Invalid username'),(63,2,'2020-03-11 11:26:53','root','172.18.0.1','User login','Invalid username'),(64,0,'2020-03-11 11:26:58','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(65,0,'2020-03-11 11:27:18','Admin','172.18.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: Izd4r3L4KsCcy3kkQhHgIPll-GTvkoi_ nostrict: yes hostname: host1.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(66,0,'2020-03-11 11:27:28','Admin','172.18.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: a-V9nQ-YjXanlu5Q9zlL1GKUXHU6HfM2 nostrict: yes hostname: host2.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(67,0,'2020-03-11 11:27:40','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.3 action: add id: 19 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.3 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 7QcJkJCM3AubgVq2e6XKPD_0iiKagMVF hostname: invalid description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(68,0,'2020-03-11 11:27:52','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.4 action: add id: 20 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.4 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 8uXMH80PUCCgpgT0pJzrRWY9hflV9m_O hostname: invalid.hostname description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(69,0,'2020-03-11 11:28:10','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.5 action: add id: 21 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.5 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: Dj1JKJaRSo4eWVPDjTgP8MWGbSIrjfxq hostname: moreinvalid.hostname.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(70,0,'2020-03-11 11:28:38','Admin','172.18.0.1','Address updated','Address 10.0.0.5 updated ip_addr: 10.0.0.5 action: edit id: 21 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772165 mac_old: NULL PTR: 0 addressId: 21 csrf_cookie: wFQDKpcC_PDFBq2Aj4SflykvJIWUMUe6 nostrict: yes hostname: moreinvalid..hostname.l description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(71,0,'2020-03-11 11:29:05','Admin','172.18.0.1','Address updated','Address 10.0.1.1 updated ip_addr: 10.0.1.1 action: edit id: 13 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772417 mac_old: NULL PTR: 0 addressId: 13 csrf_cookie: iRk_cvFPRLNtvqrJ0jsj0_1ZLlK6bDF5 nostrict: yes hostname: host3.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(72,0,'2020-03-11 11:29:10','Admin','172.18.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: 25w7ZWgutYxPGflfTH0zb0hEXIdqteuo nostrict: yes hostname: host4.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(73,0,'2020-03-11 11:29:22','Admin','172.18.0.1','Address updated','Address 172.16.0.1 updated ip_addr: 172.16.0.1 action: edit id: 15 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729729 mac_old: NULL PTR: 0 addressId: 15 csrf_cookie: CDN-eLZgybAG37Abjxieu3zxj17mFkuP nostrict: yes hostname: host5.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(74,0,'2020-03-11 11:29:28','Admin','172.18.0.1','Address updated','Address 172.16.0.2 updated ip_addr: 172.16.0.2 action: edit id: 16 subnet: 172.16.0.0/24 subnetId: 11 section: 4 subnetvlan: 5 ip_addr_old: 2886729730 mac_old: NULL PTR: 0 addressId: 16 csrf_cookie: qA-GFeZEGa_vuDZVm6fpXRIT4Fu2difo nostrict: yes hostname: host6.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(75,0,'2020-03-11 11:29:42','Admin','172.18.0.1','Address updated','Address 172.16.1.1 updated ip_addr: 172.16.1.1 action: edit id: 17 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 2886729985 mac_old: NULL PTR: 0 addressId: 17 csrf_cookie: mtTkxpWzK2TZeAAAlwgHY7E2P_1mimaw nostrict: yes hostname: host7.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(76,0,'2020-03-11 11:29:52','Admin','172.18.0.1','Address updated','Address 172.16.1.2 updated ip_addr: 172.16.1.2 action: edit id: 18 subnet: 172.16.1.0/24 subnetId: 12 section: 4 subnetvlan: 6 ip_addr_old: 2886729986 mac_old: NULL PTR: 0 addressId: 18 csrf_cookie: QqvBDxBIYnUt6sK1AZ4hdU-tQ7RiImVc nostrict: yes hostname: host8.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(77,2,'2020-05-08 15:52:03','root','172.18.0.1','User login','Invalid username'),(78,0,'2020-05-08 15:52:13','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(79,0,'2020-05-08 15:53:13','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.1.3 action: add id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.3 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: 1uXnKB99ml-37_E3Z5VJvtYXZfB8PNLU hostname: WINDOWS.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(80,2,'2020-05-21 10:29:26','root','172.18.0.1','User login','Invalid username'),(81,0,'2020-05-21 10:29:32','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(82,0,'2020-05-21 10:30:21','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.0.6 action: add id: 23 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 10.0.0.6 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: FR91Hnm12VeJ6GEZ94_nkthCrFLvsCUt hostname: gateway.localdomain.local description: NULL mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(83,0,'2020-05-21 10:44:24','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.1.4 action: add id: 24 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 10.0.1.4 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: x2tNfl9gDQpRxuThSzyHXpU1yGKvp6e3 hostname: invalid.i description: invalid gateway hostname but valid gateway ip mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single'),(84,0,'2020-05-21 10:44:37','Admin','172.18.0.1','Address updated','Address 10.0.1.4 updated ip_addr: 10.0.1.4 action: edit id: 24 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772420 mac_old: NULL PTR: 0 addressId: 24 csrf_cookie: NYEAsSuVsYxbibhET_ctjfOuFeTTYLRZ nostrict: yes hostname: invalid.i description: invalid gateway hostname but valid gateway ip mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(85,0,'2020-05-21 10:48:43','Admin','172.18.0.1','Address updated','Address 10.0.1.3 updated ip_addr: 10.0.1.3 action: edit id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772419 mac_old: NULL PTR: 0 addressId: 22 csrf_cookie: t-C98w_35yfRAMAlS93vq6q-OzJ1mxm7 nostrict: yes hostname: WINDOWS.localdomain.local description: NULL mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(86,0,'2020-05-21 10:48:51','Admin','172.18.0.1','Address updated','Address 10.0.1.4 updated ip_addr: 10.0.1.4 action: edit id: 24 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772420 mac_old: NULL PTR: 0 addressId: 24 csrf_cookie: Ut9pIsab92TD0FXzxsla9UmWblzVfotU nostrict: yes hostname: invalid.i description: invalid gateway hostname but valid gateway ip mac: NULL state: 2 is_gateway: 1 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(87,0,'2020-05-21 10:51:41','Admin','172.18.0.1','Subnet created','New subnet created id: 13 isFolder: 0 masterSubnetId: 7 subnet: 167772672 mask: 24 description: NULL vlanId: 0 allowRequests: 0 showName: 0 discoverSubnet: 0 pingSubnet: 0 resolveDNS: 0 scanAgent: 0 DNSrecursive: 0 DNSrecords: 0 nameserverId: 0 device: 0 isFull: 0 location: 0 customer_id: NULL threshold: 0 permissions: [] sectionId: 3 vrfId: 0'),(88,0,'2020-05-21 10:52:05','Admin','172.18.0.1','Address created','New address created ip_addr: 10.0.2.1 action: add id: 25 subnet: 10.0.2.0/24 subnetId: 13 section: 3 subnetvlan: 0 ip_addr_old: 10.0.2.1 mac_old: NULL PTR: NULL addressId: 0 csrf_cookie: Z-w43WIQDld1UK7O1i2yDvrwZYPiWplG hostname: lonely.localdomain.local description: NULL mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: lonely_group PTRignore: 0 excludePing: 0 type: single'),(89,2,'2020-12-04 15:43:11','root','172.18.0.1','User login','Invalid username'),(90,2,'2020-12-04 15:43:20','admin','172.18.0.1','User login','Invalid username or password'),(91,0,'2020-12-04 15:43:23','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(92,1,'2020-12-04 15:43:35','Admin','172.18.0.1','Database upgrade','Database upgraded from version 1.4.r25 to version 1.42.r25'),(93,0,'2020-12-04 15:44:19','Admin','172.18.0.1','Address updated','Address 10.0.0.1 updated ip_addr: 10.0.0.1 action: edit id: 11 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772161 mac_old: NULL PTR: 0 addressId: 11 csrf_cookie: iU0jE1AgCoYFyznhgSGFYpRtqAJOpVp8 nostrict: yes hostname: host1.localdomain.local description: this is host host1.localdomain.local mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: dmz, group1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(94,0,'2020-12-04 15:44:43','Admin','172.18.0.1','Address updated','Address 10.0.0.2 updated ip_addr: 10.0.0.2 action: edit id: 12 subnet: 10.0.0.0/24 subnetId: 8 section: 3 subnetvlan: 3 ip_addr_old: 167772162 mac_old: NULL PTR: 0 addressId: 12 csrf_cookie: IBEj9B-lFxKnDOn_ERT8hX9kL2wDzk4S nostrict: yes hostname: host2.localdomain.local description: this is host host2.localdomain.local mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: group2 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(95,0,'2020-12-04 15:45:14','Admin','172.18.0.1','Address updated','Address 10.0.1.3 updated ip_addr: 10.0.1.3 action: edit id: 22 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772419 mac_old: NULL PTR: 0 addressId: 22 csrf_cookie: ZnN2XAmofrRYTtO4VGD8o_TOD9dWe3z5 nostrict: yes hostname: WINDOWS.localdomain.local description: a host based on windows os mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: NULL PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(96,0,'2020-12-04 16:17:25','Admin','172.18.0.1','Address updated','Address 10.0.1.2 updated ip_addr: 10.0.1.2 action: edit id: 14 subnet: 10.0.1.0/24 subnetId: 9 section: 3 subnetvlan: 4 ip_addr_old: 167772418 mac_old: NULL PTR: 0 addressId: 14 csrf_cookie: iFri0SdeTkxUKEx4jMlpXTVwEmM7HlV5 nostrict: yes hostname: host4.localdomain.local description: characters \"not allowed\" mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: web1 PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(97,0,'2020-12-05 13:09:07','Admin','172.18.0.1','User logged out','User Admin has logged out'),(98,0,'2020-12-05 13:09:13','admin','172.18.0.1','User login','User phpIPAM Admin logged in'),(99,0,'2020-12-05 13:09:35','Admin','172.18.0.1','Address updated','Address 10.0.2.1 updated ip_addr: 10.0.2.1 action: edit id: 25 subnet: 10.0.2.0/24 subnetId: 13 section: 3 subnetvlan: 0 ip_addr_old: 167772673 mac_old: NULL PTR: 0 addressId: 25 csrf_cookie: p-98WlkdQOy4u54aUliey89JWVgb9_TS nostrict: yes hostname: lonely.localdomain.local description: a bad charecter at the end \\ mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: lonely_group PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(100,0,'2020-12-05 13:09:48','Admin','172.18.0.1','Address updated','Address 10.0.2.1 updated ip_addr: 10.0.2.1 action: edit id: 25 subnet: 10.0.2.0/24 subnetId: 13 section: 3 subnetvlan: 0 ip_addr_old: 167772673 mac_old: NULL PTR: 0 addressId: 25 csrf_cookie: -YfTH0C-xjt32gEcllFqpj35MDFrsx1S nostrict: yes hostname: lonely.localdomain.local description: a bad character at the end \\ mac: NULL state: 2 customer_id: 0 owner: NULL switch: 0 location_item: 0 note: NULL custom_ansible_groups: lonely_group PTRignore: 0 excludePing: 0 type: single firewallAddressObject: NULL'),(101,0,'2020-12-05 16:37:01','Admin','172.18.0.1','User logged out','User Admin has logged out');
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
INSERT INTO `php_sessions` VALUES ('00iqbqgugki1j7m1i13koa7o0d',1607094939,'','172.18.0.5'),('016u58vuvbnu9v3gf6859rh7ro',1607173088,'','172.18.0.2'),('0185254jfdnr1s8d1csrq9l8ok',1607175076,'','172.18.0.2'),('028gfrgj2r8lqkc95jdoj3mkqm',1607094879,'','172.18.0.5'),('04q84f80hsabcndop4d8m1r7ht',1607094821,'','172.18.0.5'),('062895hff5i7bdkkjc7d1ci1a4',1607170984,'','172.18.0.2'),('06488dkcvt2cfqotstdp038d86',1607095001,'','172.18.0.5'),('06kr1373nkh7q7qr49c8k5f1u9',1607174402,'','172.18.0.2'),('075503h9v20t7ab8bu54ek3nh7',1607174871,'','172.18.0.2'),('08b3d8ea58bo8ut6qj0emaggsf',1607093517,'','172.18.0.5'),('08bacd29cb8u1tvsfrueca29vg',1607170755,'','172.18.0.2'),('08cu0jvjelbk881b1hf68qj7mn',1607176683,'','172.18.0.2'),('0aincu585ktm9ma3u71l9pcp3l',1607095170,'','172.18.0.5'),('0argcibcqn7sn9d93ev9ttp4s3',1607093250,'','172.18.0.5'),('0auq1vqr5rlc5v4mvo9dp973kq',1607174402,'','172.18.0.2'),('0bp155cd4evpshgmtog4fnot6a',1607175161,'','172.18.0.2'),('0c3dhistg9ue9jlmffplorr8se',1607176682,'','172.18.0.2'),('0c7jlkbnihs728putrq34v4roh',1607173152,'','172.18.0.2'),('0cutfrcrhmhh05f8dqiruke2j2',1607095396,'','172.18.0.5'),('0dnsraqrpp0dduaao7jto211r9',1607173599,'','172.18.0.2'),('0e836c98cgmq6rpaj7a0prbtt6',1607095000,'','172.18.0.5'),('0f8kohgjs12verrr6926ung87f',1607094716,'','172.18.0.5'),('0f9o1ucbqcib87oq3ljf9oepqa',1607093517,'','172.18.0.5'),('0fmadotpiue3gg5f6pfpgtd9nk',1607168801,'','172.18.0.2'),('0gr3vnsbco8jrmsl71omocq571',1607095348,'','172.18.0.5'),('0gup38bvnd55sib1qfvhklbve7',1607174757,'','172.18.0.2'),('0ha5o3siqp192c1jikoga3fqr4',1607173088,'','172.18.0.2'),('0j54gce9p0gvt7u3ktle3m17pn',1607176682,'','172.18.0.2'),('0jglf03gtjfucatmkk3lsiaqjq',1607173275,'','172.18.0.2'),('0jr7ao6vljf7e8ce7u2kuag8uf',1607183364,'','172.18.0.2'),('0k0a4h07fff04m77in42romcgq',1607093250,'','172.18.0.5'),('0k4ssq562tkhd3id8cdh79qqlk',1607183365,'','172.18.0.2'),('0kflre7ims72ug4psnca32q6fh',1607095396,'','172.18.0.5'),('0la42mu4s4de2igl6pvchic1au',1607095052,'','172.18.0.5'),('0la6fbcc4baeba3ui21gns4brv',1607093517,'','172.18.0.5'),('0mdr09mv74ihi3h2kvk81fcsn6',1607093250,'','172.18.0.5'),('0mibofm2demvhdhhutl00nonc3',1607175076,'','172.18.0.2'),('0ndgt7s8tn033bvrtkqjm6d765',1607094822,'','172.18.0.5'),('0oastb6jdurtutrkvqlrcgidt7',1607174402,'','172.18.0.2'),('0ossf2hccaqn74s2f5gmfjdvpf',1607094879,'','172.18.0.5'),('0p1a3r4bqlpf41ffesjjp858h6',1607095169,'','172.18.0.5'),('0prrqimli9ispk1ij60n3671aj',1607176683,'','172.18.0.2'),('0q22vhsrfhtjgsc2jp1mmq6uhc',1607176688,'','172.18.0.2'),('0qnb9cdb4etcv20hh49qocrnj5',1607094821,'','172.18.0.5'),('0rcfcvhco2sg2ros8gu4e11rqc',1607175076,'','172.18.0.2'),('0rd4vm83bgvam8788pjgimb2o6',1607175076,'','172.18.0.2'),('0rphcudo0jpdlmn652altrsmdt',1607095347,'','172.18.0.5'),('0tp9pf0aeqho7pkcldn2ns3u40',1607095052,'','172.18.0.5'),('0unl575unbperfadgisar27hgk',1607094622,'','172.18.0.5'),('0vol3ra3rajacmpdrk6mhg8hub',1607095348,'','172.18.0.5'),('10i9ojo0kh5bmq8krsfph207hj',1607168801,'','172.18.0.2'),('116o79dcpmhfbvrincc2m27857',1607170951,'','172.18.0.2'),('1176ml39m18v4t11i26dhs1bn0',1607170924,'','172.18.0.2'),('11oits0eovkn8h6f1fsonqvdm0',1607176683,'','172.18.0.2'),('11tj32qs0gs9lik8hhl8i2c760',1607093250,'','172.18.0.5'),('12bbrgriirqics5r3l3701hj25',1607094671,'','172.18.0.5'),('13178i08bcpoml1d83ou470v5q',1607094821,'','172.18.0.5'),('14cmc9rcv3kuaegb3b19s42l7g',1607094879,'','172.18.0.5'),('14qatupelsic7gfneqljgd0vmn',1607093250,'','172.18.0.5'),('157n8mdcs14kf064tcq9d9g925',1607093329,'','172.18.0.5'),('15m0ia597hr2b43hdkdnf1f74s',1607176682,'','172.18.0.2'),('166j3p60d7oejthrbleo956954',1607168801,'','172.18.0.2'),('169nc19oormr8tp79ttr38klbq',1607183360,'','172.18.0.2'),('1705mh6mouf4p9g7uripdl5b84',1607175042,'','172.18.0.2'),('1771nb455sls5s4fin64fo03o4',1607093250,'','172.18.0.5'),('17mfmiu050qsppgj747qn7hbb0',1607094940,'','172.18.0.5'),('17rlv27fpo9pef18fobk41kbpe',1607095169,'','172.18.0.5'),('196u36k7pbotflqk0sv1k2t2tv',1607094822,'','172.18.0.5'),('19ab12f646v44p0u0vl6numqre',1607170951,'','172.18.0.2'),('1a4pje9kgqmfpelc0alroec7l3',1607175076,'','172.18.0.2'),('1a6fk491s9p3n7r021flpj3ov5',1607094622,'','172.18.0.5'),('1b2db5li5n6qtvte5i3ijb1im3',1607093866,'','172.18.0.5'),('1bc7471dolbd0tsepbgenqnnvd',1607094939,'','172.18.0.5'),('1bsgbelh4q8ctv6ufg981pooos',1607176682,'','172.18.0.2'),('1dmkotqtuvhru1gulmvr9kj5gq',1607094939,'','172.18.0.5'),('1e4osinpgv85deetodnfivsr5f',1607095347,'','172.18.0.5'),('1fjgivr2k5llhnt8l8igmdgl43',1607094822,'','172.18.0.5'),('1fso6c1epij76u8ouo0fpl3ips',1607183661,'','172.18.0.2'),('1ggaeqvdc42keib9st8lhj4gq9',1607170756,'','172.18.0.2'),('1gsiqrikog5jk9clfoeljapaaa',1607170121,'','172.18.0.2'),('1i177ksrb4gu7vi6dk7lad0ahc',1607176683,'','172.18.0.2'),('1i6ibhos79pr7ej94oha55f8pc',1607170951,'','172.18.0.2'),('1itn69k8dcslg2jbomba9v5du2',1607095348,'','172.18.0.5'),('1j16vje1lsqipgfhjh4bk0rf4b',1607168801,'','172.18.0.2'),('1l5gqphgncjb8hp8q441er8le6',1607170121,'','172.18.0.2'),('1le22i4rovce3276gs874qgnsf',1607168944,'','172.18.0.2'),('1lidmd9mjc6t91cem3ju4njbks',1607174844,'','172.18.0.2'),('1lt5k15k42nop8gv464v91dino',1607168944,'','172.18.0.2'),('1m3o0of977o74gne1cs2ho2mn5',1607175061,'','172.18.0.2'),('1mfu7fbepe1nunh2j3pbrrsrom',1607094939,'','172.18.0.5'),('1mrgv3ku8jhfquc0193qajt4mj',1607093329,'','172.18.0.5'),('1n61vbhersmcoqsmugo2lhouag',1607183364,'','172.18.0.2'),('1nlkidbfboahqr9site1gj956b',1607183366,'','172.18.0.2'),('1pqathes77p69dsqim83tp90va',1607174844,'','172.18.0.2'),('1q0bfkas8u6j2tn7f4hhkko4r9',1607094940,'','172.18.0.5'),('1q75sn99vklv6lrkgf6825o89v',1607094670,'','172.18.0.5'),('1qbjob8phq1o3bjudg296dcutk',1607094880,'','172.18.0.5'),('1qten4n4kamg1hnleb7ghnf8t0',1607095052,'','172.18.0.5'),('1s0bb2p6eigqbrkhvtvqkbld4v',1607174402,'','172.18.0.2'),('1s6v2c085pahitu1vra8gnv4gj',1607171162,'','172.18.0.2'),('1t86cnonaa707nlsiiqjl4j7il',1607171785,'','172.18.0.2'),('1u0s5uuhv8ou8smv2j1q1i0clv',1607170121,'','172.18.0.2'),('1uoqhcc3gk9ep981jmpl5f1d2j',1607095396,'','172.18.0.5'),('226l0gsrh9ve1rci86p8s52vjq',1607095348,'','172.18.0.5'),('22bcjsv41898563gu19tist8rj',1607093250,'','172.18.0.5'),('231ejtuhptme4mcb2s76jvctve',1607094015,'','172.18.0.5'),('23p0d4lh36klllv6hmvmjebl4c',1607094841,'','172.18.0.5'),('24oi2l799n4egdm17h1pjboepe',1607093250,'','172.18.0.5'),('24tvtitl84pu9h370arnm17o7g',1607183359,'','172.18.0.2'),('25746g8kct3tarbo6e19i44dhr',1607095000,'','172.18.0.5'),('25phdthrrh6c7gte9un0j1hiav',1607093250,'','172.18.0.5'),('277qc1a7ft7eq38sbmmq0vthge',1607176682,'','172.18.0.2'),('289hb85jm76v9suhl2qd9j1a1p',1607094611,'','172.18.0.5'),('292lb2dgmjuk7sem7jjnhdu3eb',1607094879,'','172.18.0.5'),('2b1fbg19anmjce5pti44mgm85p',1607093330,'','172.18.0.5'),('2b2hgq5v6mrm78ovba37q7cki3',1607095348,'','172.18.0.5'),('2b74qq3ba1v8p3g7duu2gmf12r',1607093517,'','172.18.0.5'),('2bmu7d4b5toddi42a1gr6j5g4n',1607174773,'','172.18.0.2'),('2d98fhnev0hu01j34fvdf2lkts',1607095348,'','172.18.0.5'),('2dqj556j6h23f3qmpaq1rf463v',1607175161,'','172.18.0.2'),('2e0ubfotgqu0nvf6no41li8jpm',1607183365,'','172.18.0.2'),('2edrq7av0fd1atmvtl22013inc',1607170924,'','172.18.0.2'),('2epd47579psbhin43prnaipaln',1607170088,'','172.18.0.2'),('2fogmstrl056iq4v6udfbgmmh3',1607095396,'','172.18.0.5'),('2g5njv8253tqmii1taq673ng9s',1607170951,'','172.18.0.2'),('2gkal0ln0e2dns50di3uqusbcc',1607174844,'','172.18.0.2'),('2h76q3c9rg0ftdcjscterebj44',1607171785,'','172.18.0.2'),('2hoom6rffd4g87q15u3shc3kf9',1607183359,'','172.18.0.2'),('2i3olkeio83l6lt2bo8vhgenla',1607093250,'','172.18.0.5'),('2ira5vukt78rl4gd0fgqre6l2t',1607095052,'','172.18.0.5'),('2jf3hk3nc7t8cvidviksaonu3c',1607094939,'','172.18.0.5'),('2k50q0emkbm27n2vldopsosefj',1607183360,'','172.18.0.2'),('2ka2o3s5r2gkbn3qa699kf1bjd',1607170951,'','172.18.0.2'),('2ld40b33v8ol2e5733kjfbrgqc',1607093517,'','172.18.0.5'),('2man53dm04tmad4lbiqk28l7ss',1607093516,'','172.18.0.5'),('2maoetqhfj6q6i2ju1nevkopu6',1607094670,'','172.18.0.5'),('2mt4k4iq603tick76mivsbappt',1607094822,'','172.18.0.5'),('2nh04udgb1847ts92oi392l0db',1607183359,'','172.18.0.2'),('2p7t5mfjk1jsarhpnn17kdt983',1607174945,'','172.18.0.2'),('2pdq5oahih4sl900sp0u2jtc79',1607095000,'','172.18.0.5'),('2qsh3cp9dvkhg583b04lrtcp4j',1607171162,'','172.18.0.2'),('2r9v3br0b7mrlf07hsijs1j3ct',1607093331,'','172.18.0.5'),('2tfpr18a25lila4gnaivq03keu',1607094880,'','172.18.0.5'),('2uur1r0oblmgm4f0fkj1bcb3av',1607095052,'','172.18.0.5'),('2vr6ubhseginfqg1at229sj97e',1607170088,'','172.18.0.2'),('30nnafrkjbtj3jmr9clvkcdhgv',1607176682,'','172.18.0.2'),('31qtms55akbva93b7lknn8p16d',1607093250,'','172.18.0.5'),('320hol1t6fd7ihpufqvh01lprh',1607095396,'','172.18.0.5'),('3252p717t975lls6fr4qnq5ahd',1607170206,'','172.18.0.2'),('3360gfnj411vbs36g812a73inh',1607094610,'','172.18.0.5'),('33dopo9i4sslpaqmsfmlcu02tm',1607168944,'','172.18.0.2'),('33q1g6rpnkriup6f5aivuqjem1',1607176682,'','172.18.0.2'),('3531d0iol9bcmd71va5bqv49vh',1607169807,'','172.18.0.2'),('35m7di5v1mnnigk5124tfv13ei',1607094622,'','172.18.0.5'),('35n2s5afeh2sd27f91ffgfp920',1607170206,'','172.18.0.2'),('36i5l073o356dkuvqvd0c9689q',1607093961,'','172.18.0.5'),('36kv43derk52e2gljpdtqhr14s',1607095348,'','172.18.0.5'),('36lsa0rjcd78ov3dgtq312e6ou',1607095348,'','172.18.0.5'),('370ga1rrfhtdoebhd8le6mlcl5',1607094823,'','172.18.0.5'),('37apmp0ppncjg931i6puqu9djo',1607095052,'','172.18.0.5'),('37ffrsimc3dgn7do0l3q7no53o',1607174402,'','172.18.0.2'),('382i3r9qaebcc2suh7q49c0tmv',1607094939,'','172.18.0.5'),('38hdkok1u7u6bijoja3mnflia8',1607095053,'','172.18.0.5'),('38q0ll7ovvlbtnjo9s79ffs3b4',1607093516,'','172.18.0.5'),('3bntepomphtf38ao07plmga8id',1607175042,'','172.18.0.2'),('3cbj300frlris8r7a5jd5pcfps',1607176688,'','172.18.0.2'),('3cgu348pn3tcoki2uoku5i254r',1607094622,'','172.18.0.5'),('3coma6p2h6u2amupe3moro5dko',1607094417,'','172.18.0.5'),('3dlrq85fd3eoq1koq62msm3426',1607093330,'','172.18.0.5'),('3e69d87h5auuv30ei9t2is98kn',1607093517,'','172.18.0.5'),('3fttevpj9sobujhgfupkkfg5gg',1607093331,'','172.18.0.5'),('3gclvr3iff0jpms21dkg8u5c90',1607170121,'','172.18.0.2'),('3gf0cgpqvrdv5a0sl5489pmvau',1607176682,'','172.18.0.2'),('3gnpgdq55c07017dlnti3ttk14',1607171162,'','172.18.0.2'),('3h4ds420afcnbq977reea14ldl',1607095347,'','172.18.0.5'),('3iend6tc38tddo5nu4jd8eiijh',1607183365,'','172.18.0.2'),('3ilsf6vria2fhn7s4oampr7l0j',1607094670,'','172.18.0.5'),('3j5f9dhtlqrqcbkiq99kmksu23',1607095052,'','172.18.0.5'),('3js21eetp28g44c956scmjnfus',1607094611,'','172.18.0.5'),('3k8pub45ndtdljd3kg3fbchs0s',1607095001,'','172.18.0.5'),('3kt75s787v8c6qi5cbcrkkt0fr',1607176682,'','172.18.0.2'),('3njqmdgephj3cjphn0ru0imll5',1607094669,'','172.18.0.5'),('3nl7fg3p83a46omq5v7io4atk2',1607095169,'','172.18.0.5'),('3o3552qkq99pcl85cp76ljv7e1',1607093250,'','172.18.0.5'),('3or2r619toc15ufv29hpduh1ob',1607094671,'','172.18.0.5'),('3q01mbo56c296ohts909od83ie',1607173895,'','172.18.0.2'),('3q8hildkm4allb02uh9cqvs9gh',1607173276,'','172.18.0.2'),('3qaid97ijj824ldrff20g5nr8t',1607183360,'','172.18.0.2'),('3qf1jld7o72afb7g1r8bhvgrrl',1607094873,'','172.18.0.5'),('3rp657qr8k0h6m2igh5na0so0b',1607094881,'','172.18.0.5'),('3rr1m0q7siqilpibaoffmknvjq',1607093329,'','172.18.0.5'),('3sb2igd17hr9nr1g88nq8q825p',1607095347,'','172.18.0.5'),('3t6ku08ekolucj1imq8nps0jrg',1607094417,'','172.18.0.5'),('3teqoh23agf6207fo0ndmv9uqb',1607094670,'','172.18.0.5'),('3tr7sb9d71q754plak8psmh0vr',1607094879,'','172.18.0.5'),('3u1f04q50967oip38ecfgrn92m',1607095001,'','172.18.0.5'),('3v2jb3d4v3545htdc1cqsh1qnf',1607095396,'','172.18.0.5'),('3vjljp7dau4kdhui7djf9nna4n',1607174758,'','172.18.0.2'),('3vm75o4fmem00atfl4i3m8qboh',1607171162,'','172.18.0.2'),('4035gtaf8qceelio7td3348qtb',1607093251,'','172.18.0.5'),('440ks61ucp08ik8a18rn31bigl',1607093330,'','172.18.0.5'),('45asgvipkrhrgtue5sck7c2i1g',1607094822,'','172.18.0.5'),('45ohqn874inheo2u3vf07a32d1',1607174944,'','172.18.0.2'),('46k8dql6n3b8fn1ui136ntlhcb',1607095348,'','172.18.0.5'),('46qaeona2k5u9qhk05eg70r63c',1607095001,'','172.18.0.5'),('46ss45pctv9fd6sldk33fn6oi7',1607176688,'','172.18.0.2'),('4770hsfqna71v8tgdb0n1kf4kv',1607094416,'','172.18.0.5'),('47e4bdllee4r4ssquv628lv1cu',1607094329,'','172.18.0.5'),('48rrpvaj2os43liigfl2ftfe6e',1607171103,'','172.18.0.2'),('48t0vtg2r36p0msvt9enefhp7n',1607094020,'','172.18.0.5'),('49e4vlmip3poefqj4n4r2d2hra',1607183360,'','172.18.0.2'),('49nbgemun2bsqbfpqs805t5ech',1607093250,'','172.18.0.5'),('4a44bq51f4am3mfhavnm4idlq1',1607175161,'','172.18.0.2'),('4bhuip0nuta93eo5r61rvkg9tl',1607094671,'','172.18.0.5'),('4chv6epoh2ebb9kf4db69ghfk7',1607094822,'','172.18.0.5'),('4cn3ndvra6o898joht6e2ovjn9',1607174844,'','172.18.0.2'),('4f1ighgel027l3fefl9v8j6ubp',1607094417,'','172.18.0.5'),('4f2ggdhe7tdhc7q709t8nm0r57',1607170088,'','172.18.0.2'),('4fdq9d1ij75ukfk19imaogpcmm',1607170984,'','172.18.0.2'),('4hql1s7um6fnl42n1k6rin7q5n',1607175161,'','172.18.0.2'),('4j6h0d86nuc9gefh003lri9eoh',1607183365,'','172.18.0.2'),('4kim6j4kr4blas8to53ksv58a9',1607094671,'','172.18.0.5'),('4knlhef9m1u2510cnn1b94u64r',1607175076,'','172.18.0.2'),('4lhp3qmaco9uimi38nova5bi2f',1607095001,'','172.18.0.5'),('4n1nifbtssul880rgh62uceihs',1607171162,'','172.18.0.2'),('4oekjcvbo7cdm6v17h5k9n6e61',1607094610,'','172.18.0.5'),('4pkrg78ahlmema1d5jqonbraee',1607094670,'','172.18.0.5'),('4prs4c58ru7h67ntt10r787d0f',1607093330,'','172.18.0.5'),('4qb12lkcpb8p1gmfo00pifdc1j',1607176688,'','172.18.0.2'),('4qc6nh32aq4nld0k36go5552e9',1607094053,'','172.18.0.5'),('4qgln3e5uf22ootn08v30fr1mq',1607094716,'','172.18.0.5'),('4tlbn3igaljldbqn8ln55rg0q7',1607183365,'','172.18.0.2'),('4u56lhi3t465s65m5hokoe03dc',1607095396,'','172.18.0.5'),('4vc3pbudrnhjoojj169adk5uef',1607093250,'','172.18.0.5'),('4vg304f2duv6875s2a7r8tt5ac',1607170951,'','172.18.0.2'),('4vjj12p1r3vda6h4bq4j139f6k',1607094879,'','172.18.0.5'),('4vjthpplf3h5dug1lt9ade2bdq',1607095169,'','172.18.0.5'),('5062dl0eos5hcuoi5s7nom6r0u',1607095348,'','172.18.0.5'),('50qg0p3h3v62ig9t7tu4duobjl',1607094880,'','172.18.0.5'),('50s2gccftkgl5o2gss5vpfaf5o',1607173152,'','172.18.0.2'),('52d85ilm4aiqlof57b58tti16f',1607170984,'','172.18.0.2'),('52ssnn6k0p9i62fboknpo45hsd',1607095348,'','172.18.0.5'),('5306oprfapqvjl4vfe03ti1b3u',1607095395,'','172.18.0.5'),('53gqr81264mh8jjhjnnci5jhpg',1607183365,'','172.18.0.2'),('53nludj3do5kb04o7vpej1503e',1607183360,'','172.18.0.2'),('541p37kbjatlm92j3rc75aks0f',1607183661,'','172.18.0.2'),('54knlfcu4v37tin0n7pduhnm75',1607095169,'','172.18.0.5'),('55apmthhhlo11gp2i1eo1rtpk5',1607183365,'','172.18.0.2'),('55ikmt171jks7qbjfbh2ahpgi2',1607176682,'','172.18.0.2'),('56118qvkl4hjmed6qhr1dlfnra',1607095052,'','172.18.0.5'),('565j0p2lm19ij2rfins561nc3s',1607094822,'','172.18.0.5'),('567mecuh96ojsvmv4pfdk18v9b',1607183365,'','172.18.0.2'),('56trfg3sm7a09c0co6fuj0q4qr',1607093330,'','172.18.0.5'),('570md01h7aphrdubvkgsrlmdfc',1607173057,'','172.18.0.2'),('57efbnkrrbn2pc7ffneqkstlih',1607183360,'','172.18.0.2'),('57o2d5t9nbus3db6sepb0pkpqd',1607095170,'','172.18.0.5'),('580o62iuqpf6vkef3itu27eq70',1607173895,'','172.18.0.2'),('58861gc0fs8cc1k8lnurhai578',1607094611,'','172.18.0.5'),('59s7j9r24fhhb5bh480943dudd',1607093329,'','172.18.0.5'),('5a8pqbb495uckn1nkc17mohr4g',1607093250,'','172.18.0.5'),('5abbcvd7iv88loc8aauuq8803r',1607095348,'','172.18.0.5'),('5aducjqtrm9j9gep66bnljvf03',1607094939,'','172.18.0.5'),('5apbgbhlg87vccpf52re9mde5f',1607094610,'','172.18.0.5'),('5b1n4ljgnms9vmpluihcrj9m28',1607095000,'','172.18.0.5'),('5ckjq5mqq15e1l7b9c5as1lbho',1607174536,'','172.18.0.2'),('5csd9r1rguum2aukj10d578iqi',1607094622,'','172.18.0.5'),('5dk2svatv77a00vbpmr7usjkg1',1607095348,'','172.18.0.5'),('5dl1em47idble7t6t8lu0o76co',1607094671,'','172.18.0.5'),('5dt8ea5fv1i2ophkuj735vl1s3',1607173599,'','172.18.0.2'),('5dtici6t3bugoncctclneb8jvd',1607095169,'','172.18.0.5'),('5ec90aas6cdcj0n06b5qfdpcfl',1607183365,'','172.18.0.2'),('5enkrp4kiprpnqgreos1ja4lmc',1607095001,'','172.18.0.5'),('5eub3rod4ckl5q41a7r08a8mqf',1607093981,'','172.18.0.5'),('5f645ph8r5135g5to8f230ck6o',1607176687,'','172.18.0.2'),('5fupu8240rvdjvah6er943u4b5',1607183360,'','172.18.0.2'),('5gtlfo9gmlavti7kd3k26060af',1607095347,'','172.18.0.5'),('5hhcsg00pfrfuo9lm63sfm5f5v',1607176688,'','172.18.0.2'),('5hifmut7uduu37s4rdr7uit37j',1607176682,'','172.18.0.2'),('5ho01skanjv4qcmjicfumu5nvn',1607093864,'','172.18.0.5'),('5i68k0n9mqlss9bmia9ndnfg67',1607170984,'','172.18.0.2'),('5i932c3kgeblvsau9suoqeq2r5',1607176683,'','172.18.0.2'),('5igijjjcv2q24t7cld09bj84r6',1607094610,'','172.18.0.5'),('5jkbc600j34av8mgtdrjr6po4f',1607095348,'','172.18.0.5'),('5kobkuqjumeuvnrqcg5c58ki3q',1607094880,'','172.18.0.5'),('5l7h9q3lc0ee2ps167peae22sc',1607176682,'','172.18.0.2'),('5lag9v0a3cnkf7uf33p6omb28b',1607093516,'','172.18.0.5'),('5ltlma91nabgmvjqsiautghood',1607183359,'','172.18.0.2'),('5m9i071sekftqqrbt2cpi87qi3',1607094671,'','172.18.0.5'),('5n6eu58770fh4nu5irddp1ib8r',1607095348,'','172.18.0.5'),('5ncrgtumc1d868phigl395r8p8',1607094671,'','172.18.0.5'),('5nten3agl1atqd7cri4efqueqg',1607173152,'','172.18.0.2'),('5rcobmtamn39ao54o5j996hfj1',1607094622,'','172.18.0.5'),('5s5jk9n3603kv5cug3qddb84tg',1607095001,'','172.18.0.5'),('5sb0ik62ji4f7m9aedibdd6p52',1607171190,'','172.18.0.2'),('5t0q9e165apg7hbl4coln1fcgn',1607183364,'','172.18.0.2'),('5t5nd0eqejt8invtalb1ek804b',1607176682,'','172.18.0.2'),('5t8d907g2sl4ol95mk17otpqk7',1607094611,'','172.18.0.5'),('5tqtefi0dt5f8tsefvhb8rgt4r',1607095000,'','172.18.0.5'),('5u6v0dslf85tm9ej4raeabrp8r',1607174773,'','172.18.0.2'),('61ccn4vf0nc28f0gd016t3a36v',1607094821,'','172.18.0.5'),('62fmp05nnpi4p263ojicjrhjh7',1607095169,'','172.18.0.5'),('63gakvpkq9gtgpqmcth18d0ja1',1607095052,'','172.18.0.5'),('64ef9cr0fi56f43rlmla18lsss',1607094610,'','172.18.0.5'),('65d5oevav1hafu84gqfjdkscjb',1607093517,'','172.18.0.5'),('65df98piub7cuer88c3t5em2fl',1607095001,'','172.18.0.5'),('67eiqniisq9hjdh82gb14arni7',1607174844,'','172.18.0.2'),('67mbiq62ovoce5j2oq1s86c60l',1607171190,'','172.18.0.2'),('686kgroeh40obkrmlcci502ouj',1607093329,'','172.18.0.5'),('68mrrdkrpnqu590qkmkomd8l6g',1607093517,'','172.18.0.5'),('69826p4051i083s1opn3apv7tm',1607170205,'','172.18.0.2'),('6994127ushdpcte4bg1u5scdnb',1607173088,'','172.18.0.2'),('69snm1givtbi6rckfq548q9jnu',1607094416,'','172.18.0.5'),('6a1tpt04pcd4av9dalemv2obek',1607095001,'','172.18.0.5'),('6ae8rejgs3udskalmno5stviao',1607183365,'','172.18.0.2'),('6amtbebrl57rben3ihegah2kev',1607095396,'','172.18.0.5'),('6an5li8e0sllkhm98htp1t1agc',1607094821,'','172.18.0.5'),('6b3ke8stj48ufhkhribuas7mtq',1607093517,'','172.18.0.5'),('6ci18le64qplq028orat2f01bm',1607093517,'','172.18.0.5'),('6cs75p6kfp651l4suq81t90ul3',1607169807,'','172.18.0.2'),('6e2dvm95cf2dhm3nhioqdib9fr',1607095347,'','172.18.0.5'),('6f025v5eq23s478s6a3661rch1',1607171103,'','172.18.0.2'),('6ffo0vjcon0m7ir4ra1eapcrtc',1607095396,'','172.18.0.5'),('6fhoku0rg5c7vsr4q2r1u5vjth',1607094880,'','172.18.0.5'),('6fv6gtv9no5qqg0ih5ba5m6t5m',1607176688,'','172.18.0.2'),('6ghrdkdnt7l0cpkloovvog4o66',1607176688,'','172.18.0.2'),('6gm1dtg3h4q38pia08n234i68q',1607094670,'','172.18.0.5'),('6hbebdlgd75k7paulvsbo8t082',1607095348,'','172.18.0.5'),('6hgm6hij48rp8fgbnv191g48gq',1607183359,'','172.18.0.2'),('6hj6aupu6pdl2hgvdd0jchti06',1607175161,'','172.18.0.2'),('6hrnbidfde61b212snpl6s7k70',1607095396,'','172.18.0.5'),('6iba3hm87o5h7929r36lsg9ovf',1607174944,'','172.18.0.2'),('6j8f9aasko04de9v9kpss2l0c9',1607173088,'','172.18.0.2'),('6jbb15vjr0n5pol4m4csriak03',1607171102,'','172.18.0.2'),('6jgtm06tm8j8e3kialh5ie1n8m',1607176688,'','172.18.0.2'),('6ju0avcsp19ggum17ebl11toh3',1607173276,'','172.18.0.2'),('6kd5f8or5uqjupon5gc6r32j0k',1607168801,'','172.18.0.2'),('6ko4l42te36smblnctoj6fkhga',1607095396,'','172.18.0.5'),('6l3vtme2h29semko21l8rgi2og',1607183364,'','172.18.0.2'),('6l8b4jkbeonmq1km628npsbrtp',1607094622,'','172.18.0.5'),('6lof7n8baubu4il4ak9n6ifqnk',1607093250,'','172.18.0.5'),('6n1qnh7bpqd047jn1mhpnvapo3',1607170121,'','172.18.0.2'),('6n7jid27mo0fr9q04tpfdkbgs1',1607175042,'','172.18.0.2'),('6o18t3db1o1po4ds5cmu4brciq',1607173895,'','172.18.0.2'),('6po7t3hdtgeb8rbl21jn2soa7u',1607170756,'','172.18.0.2'),('6q49741eiah2od8a5sif7313bg',1607094417,'','172.18.0.5'),('6qakdciejomjpoki47gd6c9nfr',1607095169,'','172.18.0.5'),('6qf5fhs00r5i0bpj81i9o1a09b',1607093330,'','172.18.0.5'),('6qglfiauhvi74990rrateefg79',1607093516,'','172.18.0.5'),('6rfajka6b04j72fbod1co3o3th',1607095347,'','172.18.0.5'),('6rk9jl0n1rpl1d7g1e8tfs6nsv',1607093330,'','172.18.0.5'),('6rsff52loq32g65cv9va82fomc',1607094610,'','172.18.0.5'),('6shk4bqcjmjggoqdgcisqsvcuq',1607174403,'','172.18.0.2'),('6te54jhuqsr9kh3ic25lort6bq',1607095395,'','172.18.0.5'),('6unvnr2maa626830esjl0sotvh',1607183360,'','172.18.0.2'),('6uo8d5ingc1ohvfn89au8bh61r',1607094416,'','172.18.0.5'),('6v5p9emjedus9145l3r17lgv8j',1607094416,'','172.18.0.5'),('6v5sp7pmu7bbqqp91e51fsme6a',1607173895,'','172.18.0.2'),('6v957s1mjtv7euen1o595nq46p',1607173895,'','172.18.0.2'),('6vhmr49id69d6tqol2jv0m8068',1607171102,'','172.18.0.2'),('70f1k290ar3q2hlqt7cmodedep',1607095052,'','172.18.0.5'),('70vtkg0locjpa0gilvvk1jtbi3',1607094671,'','172.18.0.5'),('71f1nahfmdsq5jred9ercnipk3',1607094329,'','172.18.0.5'),('71jtuqb7ghfd1ls1q24dl51md1',1607094417,'','172.18.0.5'),('71qll06mhkse7rmu00qriqskha',1607094881,'','172.18.0.5'),('72pjl7lqjnfiib6dquvoc6elpv',1607094841,'','172.18.0.5'),('73ie5g1ffoducmg1ambnadc7ib',1607094416,'','172.18.0.5'),('7567mnbnimo8duhvug3jp2c3jn',1607094416,'','172.18.0.5'),('7627tdut2g8apke2eni1olh4ak',1607176682,'','172.18.0.2'),('7652hs83btkhp3jk86i8hjc92d',1607176683,'','172.18.0.2'),('76cr2inst85mgu6asrpjvlhbrn',1607094416,'','172.18.0.5'),('7729parstujr4f4jq4u8aubpfl',1607095348,'','172.18.0.5'),('77g2cr39oq8edm6fqpqgvutb02',1607094822,'','172.18.0.5'),('78i6itqjbt48f6a3nb7n9trrmb',1607171102,'','172.18.0.2'),('78l2rdr624n3g421j337mthg3t',1607093516,'','172.18.0.5'),('796vfg5tibqo69od1catb4q4d9',1607174402,'','172.18.0.2'),('7bn8rkpmft6s3pcp0f7100hnff',1607176682,'','172.18.0.2'),('7d440ght4bcn7t321okm5889a9',1607183366,'','172.18.0.2'),('7db3lekf439h63h2cuc80ofkqq',1607170756,'','172.18.0.2'),('7dgbs1nf8kq15jj2i8kebu640f',1607176688,'','172.18.0.2'),('7e435k7cfdv7kau5dlbl5r11tj',1607095169,'','172.18.0.5'),('7er1icloaag7jgs07fumaadvan',1607176683,'','172.18.0.2'),('7es52lo3m35hdgnvf1e9vkmjf9',1607094670,'','172.18.0.5'),('7etmopqoc2aesb6kujbqd8nchu',1607174871,'','172.18.0.2'),('7incjgf9k5kok1fgmeqk5k7sl0',1607093330,'','172.18.0.5'),('7kf5iir5setvrg6n292kqq97t0',1607094881,'','172.18.0.5'),('7lqbvuld5g3v308sv61iosioj6',1607176688,'','172.18.0.2'),('7mb9rkbi5mnks6k3pnd4t3784p',1607183365,'','172.18.0.2'),('7md1v57fseue0pkver2r1rs7rk',1607170951,'','172.18.0.2'),('7nsgr7o6qlap81p6ppuaeik1o8',1607170924,'','172.18.0.2'),('7nuj2scabpdt1mj39hii3mpr1m',1607093330,'','172.18.0.5'),('7o5gqk5k15i4osbf2itpbe5um6',1607093331,'','172.18.0.5'),('7oav0guk8ko77omdbsu8avovm5',1607170121,'','172.18.0.2'),('7ocitk056mrkfip00d5sged6ol',1607175161,'','172.18.0.2'),('7oill39ofqh056kdn5ooiules3',1607094940,'','172.18.0.5'),('7oje938iq8j3v3p7sk160jsaoh',1607094671,'','172.18.0.5'),('7ork8f3u67snqd9nl5d16dks5q',1607094873,'','172.18.0.5'),('7ovekoki8t6da7a3182ts8hqmv',1607183364,'','172.18.0.2'),('7p0e8rrhcikr9es6emdfrdmv6q',1607094670,'','172.18.0.5'),('7p6mpcgp02vuua1o3n1e9nvi75',1607095052,'','172.18.0.5'),('7pqf8jh47v32u3675b1a1htor9',1607183365,'','172.18.0.2'),('7rg3al6v88hgvg760qflh3lloa',1607094671,'','172.18.0.5'),('7ri600lhumnmmbnrvkge95fr4i',1607174773,'','172.18.0.2'),('7snv591s7nbjl7000l4ibisns8',1607095348,'','172.18.0.5'),('7t95opclc2einkspv29cnkl3bq',1607095396,'','172.18.0.5'),('7urfk7m9mg9s5uotmbtime2jis',1607094248,'','172.18.0.5'),('7v4ovkojmonvug28ehpq21g6sr',1607176688,'','172.18.0.2'),('80fjf12p1gfmh5qer7i9avru0q',1607093516,'','172.18.0.5'),('80uboutk1k1raea5f38v8ei0kq',1607176688,'','172.18.0.2'),('81ji7g1c81heptvslv030rqod0',1607170088,'','172.18.0.2'),('82h5pad0492pura2nkint89l79',1607094941,'','172.18.0.5'),('82pgo1ol932kf4r1sbhaualh9k',1607095169,'','172.18.0.5'),('84bd9n0n455v6np2d255btqlgn',1607095348,'','172.18.0.5'),('85k97ku24rmqes86qpo74skfer',1607094416,'','172.18.0.5'),('86tq9p37drbc412m9uj7cjjc7n',1607095348,'','172.18.0.5'),('88ot5gk3od2ems4bo3le62ie05',1607170206,'','172.18.0.2'),('88rq2i2q089hprvjkje5fuq6h7',1607094416,'','172.18.0.5'),('8a5k49rfhpe6i03bh0tls0da7g',1607094622,'','172.18.0.5'),('8a6n8vosdbn1a99t494am5vsng',1607094622,'','172.18.0.5'),('8agb7eir27v8cpjb4pfb2hik4v',1607170206,'','172.18.0.2'),('8b05tneiufns8g2u8q35temlm3',1607176682,'','172.18.0.2'),('8dt7s7jcs4o7kp8esjvu4r2qg1',1607094416,'','172.18.0.5'),('8e6cha8guddeqfvoqn71kk18b8',1607095396,'','172.18.0.5'),('8em7uh5gto49cvolo8avtpkpho',1607170121,'','172.18.0.2'),('8evp7b9nsigi88f4hdv94nlgk0',1607095396,'','172.18.0.5'),('8g45k5q2u0s80asmg0bs753f74',1607176688,'','172.18.0.2'),('8gl3bo1j49pi6ds2lnpq1gaavj',1607174944,'','172.18.0.2'),('8hspgg783fl69jcl6esjvcsrbr',1607176687,'','172.18.0.2'),('8k34d5kvaf9kq8ph7sh9b82vfi',1607094941,'','172.18.0.5'),('8k6ij8qipe1ql6h8ngq11488cm',1607173088,'','172.18.0.2'),('8klkcvgq2k40eaja8h7b69dail',1607174944,'','172.18.0.2'),('8mkbuu7s8hmqq89utb80nc7lp9',1607094610,'','172.18.0.5'),('8mlo8mon8ssblnknutbh3mnon8',1607094822,'','172.18.0.5'),('8nrkug8splqt6vca1bnhb2vaug',1607094671,'','172.18.0.5'),('8ovhern83f3njkqild1jg7re58',1607094417,'','172.18.0.5'),('8qbnqlir5roc4h86psddksn4f3',1607170206,'','172.18.0.2'),('8r7ko2gqtufaiobsf2neeei1op',1607170121,'','172.18.0.2'),('8rvs1l5hp864lgfr8u0mq0ovlt',1607095168,'','172.18.0.5'),('8s47vtnnbuu2c9b2i4q687smv2',1607173088,'','172.18.0.2'),('8ttv59l6sktv9kaeo3uir8brav',1607092989,'','172.18.0.5'),('8tuq141reu4uf6hcmu1n0ht5kq',1607095053,'','172.18.0.5'),('8uc5v0brps19slneucgfvr3igm',1607176688,'','172.18.0.2'),('8uhuq75eva27n291ogb1sp41nb',1607095052,'','172.18.0.5'),('8uj6bqek49ushrjtpgudpm3fm4',1607173152,'','172.18.0.2'),('8vt04pvh5jkigdpc174363l9an',1607175060,'','172.18.0.2'),('8vuc2a3a2ojfkc8gph569fdc3h',1607183360,'','172.18.0.2'),('90cl8dnlq6046j7olh3dr228dk',1607094416,'','172.18.0.5'),('90j7v47tmtv1m6efa8bamnt975',1607094670,'','172.18.0.5'),('90os6pa6353k7nnl2j43li3j58',1607094716,'','172.18.0.5'),('92g16usf6qnuk5ta1r6k57a5ip',1607095001,'','172.18.0.5'),('93iv73s48vjb504keshsatkv3r',1607173276,'','172.18.0.2'),('93qdhm2hi9n8g8soj3sg9f55ap',1607094416,'','172.18.0.5'),('94ltt2eu76a9ard1b9kasfdtov',1607095170,'','172.18.0.5'),('94s6hiplnuurks57l2t11t79hv',1607095052,'','172.18.0.5'),('95a5vfu9qvnnbpvridm6ig1r3p',1607095396,'','172.18.0.5'),('969i2qa8ilh1rre2jo7b2ifit7',1607095052,'','172.18.0.5'),('96j4u9f5g0co6qi5termfb87a9',1607094067,'','172.18.0.5'),('97gn4j5iv26tkqleqnc9jmtdl6',1607094841,'','172.18.0.5'),('97kb2kecmvrev7ip49ld3ojh4r',1607093330,'','172.18.0.5'),('9822imme7p18f6av9vo2raajne',1607095169,'','172.18.0.5'),('987h7pcijmprvd9dmkbeif79pb',1607093330,'','172.18.0.5'),('98etvjgv5ku3pevlace6oe4r0l',1607094670,'','172.18.0.5'),('9at76qcc9t24mjrhqhdidrjf1i',1607093329,'','172.18.0.5'),('9b03s4bl10dbmgn1pi8r9ve011',1607093516,'','172.18.0.5'),('9cc8g8jd69l34hrvfc5ujb60pd',1607093517,'','172.18.0.5'),('9cfi8gengqi3j2cig9ksighf6h',1607093330,'','172.18.0.5'),('9ekt20mhfvh5h21r4eft3091mv',1607094880,'','172.18.0.5'),('9fb9clmubssntqr4mkpmh6185n',1607094941,'','172.18.0.5'),('9g0dd5l3oijkhvs1teok6jhrjq',1607094940,'','172.18.0.5'),('9i5mggmpfhc1e2g72pjebctdu6',1607171162,'','172.18.0.2'),('9id69v7kfgpo32o9lkl6fbna0u',1607183359,'','172.18.0.2'),('9k1ev2leckr4enorr553225q1n',1607173276,'','172.18.0.2'),('9k1tegpvto0tl0buj6hb1tb9k8',1607093331,'','172.18.0.5'),('9k999toq5dfrutns6bkctqojd2',1607171190,'','172.18.0.2'),('9m7hqtvi2b9ochhohoeqd3apqu',1607173599,'','172.18.0.2'),('9nidkphk1tiv79jgpepv8thsgc',1607094416,'','172.18.0.5'),('9pu3a4vb7ak7nr7jt10uj01kgi',1607094669,'','172.18.0.5'),('9q0gf5ahafd3pfvk25nnt6e9qq',1607174844,'','172.18.0.2'),('9qed09v6n865gd36h94d03raj9',1607095396,'','172.18.0.5'),('9qpjtjqabcrdec5ajvibnuf00r',1607174844,'','172.18.0.2'),('9s4tpkd33h6airbreeiskm84mc',1607095052,'','172.18.0.5'),('9skc5rukf84r3ht2degp0nphtq',1607183360,'','172.18.0.2'),('9sup7outbl31cr15eki30du99p',1607094716,'','172.18.0.5'),('9tilla6rn9b9501o1h621kfqie',1607170121,'','172.18.0.2'),('9uv72v0ub7rajnc9sq2nhv331p',1607093516,'','172.18.0.5'),('a0gvpo4rvd7d43mcmte666uq47',1607183360,'','172.18.0.2'),('a0jhpm5j01nk6hb3injfqf39b7',1607095169,'','172.18.0.5'),('a0publj417r66k0duq9pp5ehd8',1607094823,'','172.18.0.5'),('a2s49m5antbqepmj980n2elpbh',1607093251,'','172.18.0.5'),('a2t4l269skbiaa3dc0mb9o5ekk',1607170756,'','172.18.0.2'),('a481dgi80pp17764vgdfrinif7',1607094417,'','172.18.0.5'),('a59ih7njc6n9te8a26fq7jlk33',1607171162,'','172.18.0.2'),('a6hilqkjtk3qk17ev3hq7kaijf',1607095396,'','172.18.0.5'),('a6joq167o4ehrvpat9d364e6tp',1607094416,'','172.18.0.5'),('a8c647i0amelltcn68jd4s4qq1',1607175076,'','172.18.0.2'),('a8hk318j9o3ei6ul23sn4msps9',1607176683,'','172.18.0.2'),('a8kdcmbno55ts60s61ndr3ab2e',1607095052,'','172.18.0.5'),('a9m22ps706lu4v8tc7mp3qgfbs',1607169807,'','172.18.0.2'),('aa15fakdkongercp2k11li5ke5',1607183365,'','172.18.0.2'),('ab4dvvcrngvef0g5k7trdrflc9',1607095052,'','172.18.0.5'),('abmmdap1l8shp7618uuc816gf6',1607093517,'','172.18.0.5'),('ackqbmacji7lan2pos9dgtg3uj',1607174944,'','172.18.0.2'),('acsrleitkvmbjre2tc2bo4p7o6',1607171162,'','172.18.0.2'),('aet65rf0mqirp2050gv6vucnek',1607171162,'','172.18.0.2'),('af15a0hjdb75953gc57jqumghg',1607094670,'','172.18.0.5'),('afn7f0pkdmfcifft44aun0gom1',1607173152,'','172.18.0.2'),('afq9q8b55mg2a3u3q114mltjl3',1607095348,'','172.18.0.5'),('ahotbkurte4p2j1d7v8smtd3s5',1607173152,'','172.18.0.2'),('ai0qb7ko26j8t8n0cih9cnj0bb',1607170088,'','172.18.0.2'),('ai8i1ri4g3nombguf62g1hthbc',1607094623,'','172.18.0.5'),('aiildan899rp2g363k2fboljlm',1607093330,'','172.18.0.5'),('al9g18vmj9mncn52nl65hc2ihj',1607183365,'','172.18.0.2'),('an4om5p4db97e7i8n5m7sucov0',1607095396,'','172.18.0.5'),('ana5fmrsp7b3ngi4pp7agihvr6',1607095000,'','172.18.0.5'),('anhdmgmde1dlo0hbe8b62sukos',1607174758,'','172.18.0.2'),('anm7sjfg3hb9o5fferj6urotkg',1607094822,'','172.18.0.5'),('anovs0mf0t6n9i64kn9mjblogi',1607094118,'','172.18.0.5'),('anpdc9j0ubm1vsmp4cistj5c6b',1607095052,'','172.18.0.5'),('ao99apbf4r701u1t4nmcqidfqd',1607093516,'','172.18.0.5'),('ao9vq6rmbivo7cmi08bsf715lq',1607093330,'','172.18.0.5'),('ap536gq69a9vjs9uifqbucj5jd',1607183364,'','172.18.0.2'),('apbc39b0c79kgi87rej74919dd',1607176682,'','172.18.0.2'),('aq531llnhhglngfddrmqfc08p5',1607094685,'','172.18.0.5'),('aqsjfjh3132j3icir4qkpgmm70',1607183661,'','172.18.0.2'),('arhc2bopeu3gvosk0noj7gathe',1607093250,'','172.18.0.5'),('arq24vb37rfrvgfvvo05s1f55i',1607095169,'','172.18.0.5'),('aum3st3ni1b4q5t6h4bmvjg7qm',1607174402,'','172.18.0.2'),('b01q0u06gufndc6ien2k7rgj91',1607095170,'','172.18.0.5'),('b1j7l825tkssrokqpfdndb5ob5',1607176682,'','172.18.0.2'),('b1l1j2cophgrk7gb8i2stcmqql',1607175042,'','172.18.0.2'),('b2pvlic6853lkrn2ar11i0e3cn',1607094939,'','172.18.0.5'),('b348qmujaq6lrj8m4748ata29j',1607095000,'','172.18.0.5'),('b5bdu15k6gk0du0mq5mklrphh4',1607094940,'','172.18.0.5'),('b5k7bdnv05c9mup0c0q9rd4ibn',1607094416,'','172.18.0.5'),('b6eqt3ltuv1668j9ns8mbke2mu',1607176683,'','172.18.0.2'),('b6nhhlbin9vbcl3eoh6uh15lf7',1607176688,'','172.18.0.2'),('b7madciavp1s95bbls7ss3ef66',1607176688,'','172.18.0.2'),('b8h9mrislhg37mfqjptvrl3e8t',1607171785,'','172.18.0.2'),('b9hsrj1tt83csevtuugf77lehj',1607095396,'','172.18.0.5'),('bbdjplng2a158gq2oj1s6h2gb7',1607094417,'','172.18.0.5'),('bbl3ted3imlimv5oqfp35geee7',1607093330,'','172.18.0.5'),('bc9533e0fttr9vmdledru5qe0u',1607095169,'','172.18.0.5'),('bd623afomahp8bckero2e4nuid',1607183360,'','172.18.0.2'),('bd6ocf7uo70q2d6djkotcv81la',1607183365,'','172.18.0.2'),('bdk8bi2lupr18jces9vbhfvplb',1607094880,'','172.18.0.5'),('beem38obes4nr9g9r6pkt28f9d',1607095348,'','172.18.0.5'),('bevrucn9o5dap61aqaoqqpffhl',1607175161,'','172.18.0.2'),('bg3crr9tbaqb5jm1hjniec79te',1607094822,'','172.18.0.5'),('bgkcecprbjll2feu71q7kq6nrp',1607095169,'','172.18.0.5'),('bhhh5tp0cjidurq27hdet2vpeo',1607095000,'','172.18.0.5'),('bi2i1ajsbeh3fp7ro500l1eqpq',1607183359,'','172.18.0.2'),('bjh52p0qop9qud42qideqr83rf',1607095347,'','172.18.0.5'),('bjl2phi1nc4vggns9kpsg6f543',1607174403,'','172.18.0.2'),('bjul9112mpqsm65uuf5kl0l2uc',1607093516,'','172.18.0.5'),('bkt79mf7v960up1e84s12qrtmr',1607095053,'','172.18.0.5'),('blabaotl62ckpcnqg0bbhk7drm',1607174757,'','172.18.0.2'),('blkaace8gap3re0jncamq5gj4f',1607095348,'','172.18.0.5'),('bna7jjp873096b4lrlepitino9',1607095396,'','172.18.0.5'),('bo1r9lad7581jef0pdao0srf7s',1607170756,'','172.18.0.2'),('boaki4pmf5bj5fntavt7g6ksso',1607094880,'','172.18.0.5'),('bojr2eprf0ankhu14r0lsp4l4c',1607170984,'','172.18.0.2'),('boque7m8mgvf6m0knjgfr0ljap',1607174758,'','172.18.0.2'),('bovs17tvbmhdpn331cjn4bmil4',1607176683,'','172.18.0.2'),('bp3mct7guehpq645cfp405i3do',1607095347,'','172.18.0.5'),('bp493peb09jb4kkrniefh9l9nf',1607095169,'','172.18.0.5'),('bpt2tieeedvjnat0t1k2avh04r',1607171786,'','172.18.0.2'),('bpu70pu6tli5sj3sntn9122gnm',1607170121,'','172.18.0.2'),('bpvtdkajtuchnlt3mop035d4lq',1607094939,'','172.18.0.5'),('bqfoejapl0h0t20o4qn7df293l',1607171102,'','172.18.0.2'),('bqi5js53h9sv86c1d9nai95ce0',1607095170,'','172.18.0.5'),('bqjuenf9ckfea3jt3bbo1qhorh',1607095395,'','172.18.0.5'),('bqpbqmu6nhlqvjpjpm1frcqil2',1607094623,'','172.18.0.5'),('brk6cdv13933kftq22saik77l7',1607094823,'','172.18.0.5'),('bsiace7kta630rbbakiq6ott1q',1607094822,'','172.18.0.5'),('bsls12g5c89ri87d84id2o3hjj',1607171786,'','172.18.0.2'),('bsmpj2gsqb3g6271lan24rsfdf',1607170924,'','172.18.0.2'),('bt6iafd26qcnj1gc85n38ccto7',1607094416,'','172.18.0.5'),('btvi1ed6r8ana8ob1sn8kf5lop',1607093516,'','172.18.0.5'),('bufno8cgl5pt20l77r0ubf6tlc',1607094671,'','172.18.0.5'),('bv2grqj5i35v31kr0ja8v3kfee',1607183365,'','172.18.0.2'),('bvaq09hn20mtuo91dtql9hsf2m',1607176688,'','172.18.0.2'),('bvlr9m5ajsa8d1m2i1nmaeq7s6',1607183360,'','172.18.0.2'),('c106ta44ooj9pnhhhj1prgvqfe',1607183360,'','172.18.0.2'),('c1e6obc3nb0alah4ddi9bfmem7',1607094880,'','172.18.0.5'),('c1o16f1acd03u5tojm356neris',1607176683,'','172.18.0.2'),('c2j0vkt6ve358ghcp9dj0s6fkk',1607095170,'','172.18.0.5'),('c2nnvf9cjcqpa13ig17urj304k',1607094622,'','172.18.0.5'),('c2otc8mh01on0uid2nh5grg212',1607173599,'','172.18.0.2'),('c5fk17irrjc2l6tr3q7lregb6o',1607093249,'','172.18.0.5'),('c6h3n96v6b0vc4qfb9hsjaltl6',1607171103,'','172.18.0.2'),('c710gqe1kaleaicq3qr4pe5ao4',1607094880,'','172.18.0.5'),('c7hgncfj8etqd24a1ui5671uuf',1607093251,'','172.18.0.5'),('c83vao693doau53tubmjcs6d5g',1607094670,'','172.18.0.5'),('c8sec2a4b801u6rv38tnn3d7co',1607095395,'','172.18.0.5'),('c98c5g76kpkjtmmklgaui77btt',1607094329,'','172.18.0.5'),('c9eq897oa7jvlcusuf1mr89jo1',1607094416,'','172.18.0.5'),('can91si62olv2bc4tufjrv8lfb',1607095395,'','172.18.0.5'),('cao7jjeh0q8gbb707pavvr27hd',1607094822,'','172.18.0.5'),('cckh87j57cvpn5ili429clrrs4',1607095396,'','172.18.0.5'),('cedvk72dld199cljqgvekbig0o',1607170755,'','172.18.0.2'),('ces91nch4kv0n2i5l2t1a6m28k',1607094670,'','172.18.0.5'),('cflj6jr7mou860n5ds56g0ah7f',1607175161,'','172.18.0.2'),('cg242fguc65euatggvlonpnr6n',1607170924,'','172.18.0.2'),('cg5j1obij959uv52vjib83ploi',1607175161,'','172.18.0.2'),('cghedgnor09v6mb15t1s6ro4vf',1607093329,'','172.18.0.5'),('ch0ke1a4ghujsjrntk0arvnrf2',1607176687,'','172.18.0.2'),('ch62b52ju974476qqfcfiltggj',1607175042,'','172.18.0.2'),('chcklconpht923h7fkoddl985m',1607094671,'','172.18.0.5'),('ciobbiovgqnqrhjsdlst0v4o70',1607094671,'','172.18.0.5'),('cj8rvn4engef4smugeu77bclq5',1607176682,'','172.18.0.2'),('cjd5s8f0sb8dtr91odvc5mmold',1607094821,'','172.18.0.5'),('ckmf414ut1tfl2vc48ksv2v3bn',1607095396,'','172.18.0.5'),('cm70e8lnnch5bjsa399ji505q7',1607094622,'','172.18.0.5'),('cn0vplstns9uj6ppgkpo19t5ek',1607094879,'','172.18.0.5'),('co4c5om1gq0qgj4qguqk9vuqva',1607175042,'','172.18.0.2'),('co62mvc1qektbs00vr6gmuc4f5',1607183364,'','172.18.0.2'),('cp1oabkme9jtmirtg6fh68n2ts',1607094671,'','172.18.0.5'),('cqincik4frfh1p2kn7tirf9ifo',1607094841,'','172.18.0.5'),('crk8eoqiqvf9m8n6sth4rihvu6',1607094417,'','172.18.0.5'),('csva803p1lb3nioubbr7qqd96l',1607094939,'','172.18.0.5'),('culscbbl35hvltdclh3nlqfhqp',1607094873,'','172.18.0.5'),('cv6rrfaiu2rkou77lu7eg5l0ku',1607094880,'','172.18.0.5'),('cvupg8l3or6hvn37r1mms7qg6c',1607094716,'','172.18.0.5'),('d0hngmb6m0a08s0hpnv38g3v28',1607173057,'','172.18.0.2'),('d0jqv1v0qpn2na301rjjh2ngh5',1607095000,'','172.18.0.5'),('d0la0a31m555g42nivod79prbt',1607174944,'','172.18.0.2'),('d1co250oggeaupmgn9cvsmf772',1607173895,'','172.18.0.2'),('d2plhpgp367qa5odggjhk3edmj',1607094821,'','172.18.0.5'),('d3gld4fhh4sg91u624qohumsad',1607094416,'','172.18.0.5'),('d45cc4dkujui3pg4g1nq3764v4',1607171162,'','172.18.0.2'),('d4c4o14ara2bkbcjm7amllfgo5',1607095052,'','172.18.0.5'),('d4e0uuetns2f5tc075clbl4144',1607095052,'','172.18.0.5'),('d753romqvehgi9842vlfi3eb3c',1607094841,'','172.18.0.5'),('d7cvmm7d6sk73t8t9e18ogscos',1607094669,'','172.18.0.5'),('d7pa25cnbbmbgruqaua8d6cdfg',1607183365,'','172.18.0.2'),('d8d10ilbqlumgrepq98m4871vi',1607173152,'','172.18.0.2'),('d8dt3c6i3d2t9urt7rj0u1de3u',1607170088,'','172.18.0.2'),('d8rj2hvaaqhd7c80e5abc1f30u',1607183360,'','172.18.0.2'),('d98sbc7kkkoj8h0sk9tbce2qg2',1607094822,'','172.18.0.5'),('d9dpo10dg0fijppuog979c3sl4',1607095169,'','172.18.0.5'),('dan2n5cq4efrsm7d4apd1i4uol',1607095169,'','172.18.0.5'),('daunnmr6pbt3d4a8pdkepo7eds',1607176688,'','172.18.0.2'),('dbaq02mvf3n6okkvdfcjmbgt5r',1607094329,'','172.18.0.5'),('dbnhqavtq01vltouualh1da7k7',1607093250,'','172.18.0.5'),('dcqpbibcrlccpr3die41f06trt',1607093516,'','172.18.0.5'),('dfb0l8tpdim3j518avf624o23m',1607176682,'','172.18.0.2'),('dfgt745205bcjj8hkcd1rc6soh',1607094940,'','172.18.0.5'),('dflk7qsl3prqmda3nnlfca85m9',1607170924,'','172.18.0.2'),('dga6kmig7v608qui7snit6c3h7',1607173599,'','172.18.0.2'),('dglpm1f61s4820phfsd5m8vttl',1607093250,'','172.18.0.5'),('dh8ja8gd3cqlde7jcg8bl1uqpn',1607095348,'','172.18.0.5'),('di39pirohurjrh9dek8aco2oc4',1607095396,'','172.18.0.5'),('di3l2ugd03hkmcsetp4i8qdtog',1607093517,'','172.18.0.5'),('di839br99ltretscf80qh4tc3c',1607095348,'','172.18.0.5'),('dip3d57tvn6ecedupf3f8obppg',1607174871,'','172.18.0.2'),('dip6q7ijp5ih0sbk26nb1ltd17',1607095053,'','172.18.0.5'),('djl5fv6433p8jq2ph9p6uhle96',1607094880,'','172.18.0.5'),('djlgnrg82s2t472tcdaia4nked',1607095001,'','172.18.0.5'),('dkbe89ter87nuhgnsqpm8stjee',1607183364,'','172.18.0.2'),('dl1u78g6qokiu5ccoucsi31obo',1607174871,'','172.18.0.2'),('dlflnrbt2a4vivpub0l1vaaapq',1607168944,'','172.18.0.2'),('dlon6pughd3l8o02a6rbo3hg5h',1607183365,'','172.18.0.2'),('dm6krpip09n28gvr9ep1141me9',1607173276,'','172.18.0.2'),('dmd45ippscdhc3lars1c7e5ev5',1607095396,'','172.18.0.5'),('dmveada3cg11h9u5kad1ll4tie',1607094622,'','172.18.0.5'),('dn1h88pbg9mn2r03mhemhk2ebk',1607183360,'','172.18.0.2'),('dna4lobktriqv106ljti8p0n7o',1607094416,'','172.18.0.5'),('dopijvi219bbvqmrtlqqmhbrml',1607095000,'','172.18.0.5'),('dq6qk5i89p8jek1ivh5k8hladl',1607174844,'','172.18.0.2'),('dqh9p9c45t33ndg1prg2f4dl0k',1607093249,'','172.18.0.5'),('dqj7r0t90jks37ltncnt89s0kl',1607176688,'','172.18.0.2'),('dqkkifus9uda520775bkoj0je8',1607094417,'','172.18.0.5'),('dr17s6bttrpd0s11rdj4dtvkbv',1607095348,'','172.18.0.5'),('dr3vm2eebt5f0urk2bgccmkt75',1607094822,'','172.18.0.5'),('ds7o8o33e6hms4aomdaqv9sp9o',1607183365,'','172.18.0.2'),('dsl0lp1dnk94vbs5hhn357mkdt',1607095052,'','172.18.0.5'),('dthkff6v196gi7jd8bb60g05jm',1607094417,'','172.18.0.5'),('duell6bv545m51ar23g4u39q33',1607171190,'','172.18.0.2'),('e0jt71f05k8eua5335qt2ap8m0',1607094671,'','172.18.0.5'),('e1app4vn2as6aul7cvvgogs5cb',1607174871,'','172.18.0.2'),('e1d71akritf3q9gnemk8inkf7k',1607170924,'','172.18.0.2'),('e1n32uip48isqqckhp8eq5jknv',1607094329,'','172.18.0.5'),('e2ckjjvf2ig3epsug2urltc7ce',1607094873,'','172.18.0.5'),('e2gul5fiakc444evhuop67ktr7',1607094879,'','172.18.0.5'),('e378ij2evgimmrp14k88qidjko',1607170984,'','172.18.0.2'),('e38gt7tjgtf56hb3u17m3idanh',1607174536,'','172.18.0.2'),('e4749p751qbut3vj2l164rtr05',1607095395,'','172.18.0.5'),('e4991kuldqudjj963k63n4h0mn',1607094821,'','172.18.0.5'),('e5fesnudhe7d1pgl3r4jshtpl2',1607183359,'','172.18.0.2'),('e5kagm5s8udf0itdihcuie4or5',1607183365,'','172.18.0.2'),('e7oh0fb0q9atbuic7b9blqpucu',1607095396,'','172.18.0.5'),('eaffqa1lntvh8q7nc42942fk2s',1607094821,'','172.18.0.5'),('eah4j2mu2oj312ohv5m5d85sqr',1607093516,'','172.18.0.5'),('eatvfec290810uj05s99foaqlc',1607183365,'','172.18.0.2'),('ebjjr0i4kk49enf9egbr4h1cqp',1607094610,'','172.18.0.5'),('ebkvrgoehhhp9f2oh4qcgte8uc',1607094841,'','172.18.0.5'),('edgk2ak4psm5pe31hfrf80eesh',1607168801,'','172.18.0.2'),('ee0fnl9b7rn11n9fo1tbqoa5sn',1607094610,'','172.18.0.5'),('ee2u8u0goqvo3dbcm50sa04tab',1607094879,'','172.18.0.5'),('eg2r38vl96p1i7na0o51t277cc',1607174536,'','172.18.0.2'),('ehc1gpfcja9kq29eahgtke6ta3',1607176688,'','172.18.0.2'),('ehgf94cdu09trailciggr89ug5',1607095001,'','172.18.0.5'),('ehklsbq18iebf8nqqtu0t4k91t',1607170088,'','172.18.0.2'),('eidr8u7e1pnpgk5udst21dkbb0',1607094671,'','172.18.0.5'),('eifeojjh45i7bt2g94jnlt20o5',1607093251,'','172.18.0.5'),('eiluem2p0sl26vki3c87d5mmo3',1607094415,'','172.18.0.5'),('ejvtndbf0rh5lgq3tgvq363is8',1607183365,'','172.18.0.2'),('ekcghqtjueldd7d13e773tqr34',1607175060,'','172.18.0.2'),('el020fr3kag6s9n4obcpt0h0ja',1607183360,'','172.18.0.2'),('elo06j4oa62i8pt0pj6fdn6ppa',1607094622,'','172.18.0.5'),('elroqb8vrdl1cgd9ck0v01bvbv',1607093331,'','172.18.0.5'),('eo730n1uolp9a49otkg20l9kmg',1607094940,'','172.18.0.5'),('eo9rftbek6q30fa5bbughoc4eg',1607174758,'','172.18.0.2'),('eosrakjs1fb7e0ruf140sqr0i2',1607094716,'','172.18.0.5'),('eqlhjesgp8s9g83ag5sr8orjue',1607093517,'','172.18.0.5'),('eqmub1micirs1mqs4nbvtdu60v',1607173895,'','172.18.0.2'),('eres4npmhdui777uf94ts1mtjc',1607095000,'','172.18.0.5'),('es2cjrrujn17k7dsi9542laq55',1607173599,'','172.18.0.2'),('es9ldogcrtvmq74h4urf8s21v0',1607093250,'','172.18.0.5'),('esp1rlriq0eq3d79apvqkamc2l',1607170206,'','172.18.0.2'),('eu4nfrqqrs4ft8lphp1b5b16k9',1607095053,'','172.18.0.5'),('eu7fet3ucqd6v1kmglo9aj3egb',1607094610,'','172.18.0.5'),('evc0akhb60b1jf80cj600gec0j',1607093250,'','172.18.0.5'),('evr621vbap8e4sdbqq07no85ce',1607094100,'','172.18.0.5'),('f1b3ttf0hkupurcgt2koe9rqec',1607094416,'','172.18.0.5'),('f1cahsh669d1qrgvonn4m3tuu3',1607175076,'','172.18.0.2'),('f1eb8a6o72tgigog784digpoic',1607175042,'','172.18.0.2'),('f1m0svpkqlivcjdms5v25ifobb',1607095001,'','172.18.0.5'),('f3bg906mi3fp4s0lc3r502a9gt',1607173895,'','172.18.0.2'),('f4qnmgl78tf7e63n8adqhlsb2e',1607174944,'','172.18.0.2'),('f5ltld799t1rvt1jdri53k0ba1',1607095052,'','172.18.0.5'),('f6052a1cfdj6c53gnnlfm6m5p9',1607094416,'','172.18.0.5'),('f6301evsjhh449o4tide9h5pq8',1607174536,'','172.18.0.2'),('f6oapd56dipi01ml763r1quhfk',1607094822,'','172.18.0.5'),('f7f2k8fnot5o25hn20cggtq2js',1607174773,'','172.18.0.2'),('f7jppj4ia467a12aaagkb1l5ab',1607094939,'','172.18.0.5'),('f7kvmgvbuk58th13tmps3cev95',1607094822,'','172.18.0.5'),('f824vhi79r40jnaodhcf6j0tce',1607176688,'','172.18.0.2'),('f8536uf7mh59ri8vs4qmb6pj2q',1607095000,'','172.18.0.5'),('f8e5aqpo98t7o9jv16v1it25cp',1607093249,'','172.18.0.5'),('f8g67pr9shnas2vm3j93fs9imv',1607094610,'','172.18.0.5'),('f8hnflbkc87mlj3qnsrag236nf',1607094940,'','172.18.0.5'),('f9k1pj7o61jlogbme7jtcoup7t',1607175161,'','172.18.0.2'),('fa2klhn30l7p023kdmf3lm4or6',1607094132,'','172.18.0.5'),('fai135cnk6issvu0re8a11sf71',1607173057,'','172.18.0.2'),('falsjjil8vtd4evrvn8n7l1m2n',1607176688,'','172.18.0.2'),('fc08d735v88mkp6reebge6l44g',1607174844,'','172.18.0.2'),('fcgli1j54ssjlp14eu3mubskqi',1607095396,'','172.18.0.5'),('fdi91v2lqm8n65dmh61qpf384f',1607173276,'','172.18.0.2'),('ffrj0mhtg8jmt3mfi1445scatt',1607094941,'','172.18.0.5'),('fh6s8smv18vnau3r1r3h9q26j6',1607174871,'','172.18.0.2'),('fhgupmbui04bm3rdppjh467v6e',1607094416,'','172.18.0.5'),('fhjocfcdbt41j5nhrbaqopaejo',1607183366,'','172.18.0.2'),('fi02sbjig6dj55jnfmq9bmefo7',1607174871,'','172.18.0.2'),('fl6caehfd41d4nsgsqgbtuith2',1607169807,'','172.18.0.2'),('flqlgukj6blatj3so4apr5qvp5',1607183661,'','172.18.0.2'),('fnk3k1o3hk8l66l5vl1vm8d2ou',1607171162,'','172.18.0.2'),('fnkrnebvbr92rq4elgrm4cvnqt',1607095169,'','172.18.0.5'),('fnq3itsoi5npgcvt40v2bb5t4n',1607094941,'','172.18.0.5'),('fo62vrvcn0dpgc54he8dnugvlq',1607093329,'','172.18.0.5'),('fqjbbj6vgtjn0v6hbgtk8c2gf5',1607093250,'','172.18.0.5'),('fqq03039mmod5f42k2gvgnbtdv',1607183661,'','172.18.0.2'),('frdofs48vag2v2hbb6qf7v947b',1607176688,'','172.18.0.2'),('frj6rokrljdv9kjcs5703eqq9l',1607183360,'','172.18.0.2'),('fsgeeabfi755m85dphfsmqlv9k',1607094881,'','172.18.0.5'),('ftavfoir6fspv5d0rkglbsha12',1607174757,'','172.18.0.2'),('fu6e7vcag669nf3urqg7d43h9p',1607174536,'','172.18.0.2'),('fvgevicgc4ei7ddnhji6s0ujni',1607176688,'','172.18.0.2'),('g08brtrpsa4jkni8p9fhv5kl19',1607176682,'','172.18.0.2'),('g0lnq2nda7ad8jtj7el4u08adl',1607095053,'','172.18.0.5'),('g16aujbfg3feqf4588cr5h9i02',1607094622,'','172.18.0.5'),('g1ao91ifq07ud35rhh8l9pcp09',1607183661,'','172.18.0.2'),('g1iao32pn5e70qpdcg6j3csabl',1607170951,'','172.18.0.2'),('g2ipqhm0nqt7kn30rvl0nkenvl',1607173057,'','172.18.0.2'),('g36nf61uvsnlsd1bn4h0ohv2ls',1607176688,'','172.18.0.2'),('g45raak3cqhj38pg205jg358su',1607173599,'','172.18.0.2'),('g4i14k3kalgasbfs0vfbq6l3kl',1607095052,'','172.18.0.5'),('g56639s0l7es4ajclftln29mlf',1607174871,'','172.18.0.2'),('g5duopkdq9vm4spg640te9ufs8',1607094822,'','172.18.0.5'),('g5vii7c6451a51vor70skc5von',1607095000,'','172.18.0.5'),('g6ui1b6arvrgettrskepvm6kud',1607094939,'','172.18.0.5'),('g7k4jd57qfbcdm1nlfnep7pe0t',1607095396,'','172.18.0.5'),('g89lvjt0ottbdthn2v9bjgl7ta',1607094671,'','172.18.0.5'),('g8asm0bin9setq2114anvf722n',1607174758,'','172.18.0.2'),('g8oa48h6asqhudcpbk1ha7cnp3',1607183364,'','172.18.0.2'),('g9uuivo8j71cbc59pobqvaj32r',1607173599,'','172.18.0.2'),('ga13f1su7001uvtd552kl6feon',1607176682,'','172.18.0.2'),('ga1odc9326im0s5rd0uuqnde4m',1607095396,'','172.18.0.5'),('ga66u6e2enqk8j0chi9bak6pbu',1607173057,'','172.18.0.2'),('gamjvg05h3oqbpd6a865u95uir',1607095396,'','172.18.0.5'),('gbu6d9m1nt937cgrknahvi1vqg',1607095000,'','172.18.0.5'),('gbvd05c0v02rgkucu29o81fkjo',1607094610,'','172.18.0.5'),('gcb4vvk7sujdori3fr41bl4j71',1607095169,'','172.18.0.5'),('gcg1hh4clsapne8kk6dk6hola4',1607174773,'','172.18.0.2'),('gd59osr46gtfohk3s8vh40u3e7',1607095348,'','172.18.0.5'),('ge3anbt5shqqtu56ni8ucr06ln',1607170206,'','172.18.0.2'),('geramgorjctbtcc84cvb48b5nf',1607175060,'','172.18.0.2'),('gfd4ru5hkea0i4jbp8ggdnhr46',1607094873,'','172.18.0.5'),('gg7tv3512jcllotinaafn3ev66',1607094329,'','172.18.0.5'),('gh5nauaia5umrqa1omt95jdo61',1607176682,'','172.18.0.2'),('ghe2vmrb7bd5ra5hjm98bfhdug',1607094939,'','172.18.0.5'),('ghh879srdmdipl26sf13325ggi',1607095001,'','172.18.0.5'),('gjodg4gudu52s2j23k3o86jftk',1607170206,'','172.18.0.2'),('gk8189932ro99okbrpeu4b38s4',1607094416,'','172.18.0.5'),('glsrc099m13fok05grhgo0u71g',1607094873,'','172.18.0.5'),('go8741nh41t5065ingnqapfmae',1607094670,'','172.18.0.5'),('gp5qk1tlm71lci612g3odacs22',1607093517,'','172.18.0.5'),('gp7sq9qj6b60pud722skq55cnt',1607175061,'','172.18.0.2'),('gqr99aq80f6fc6te0vcgluiem3',1607093330,'','172.18.0.5'),('gr56tmdldqkimlj02f2cvjlojl',1607095396,'','172.18.0.5'),('grifuvlpfs8213nfm06eltnsib',1607095052,'','172.18.0.5'),('grm3bsamvhfuumj0hodg570bdq',1607095001,'','172.18.0.5'),('gsupqht32i2k86riasl1b2cs8t',1607094080,'','172.18.0.5'),('gtl8142pflg2k8t1b0pjlshe54',1607173088,'','172.18.0.2'),('guj28po5cp7qi4si0v5a3nfmvp',1607094940,'','172.18.0.5'),('gva1sc0l5mllbtfu5k5j3g9kqn',1607183661,'','172.18.0.2'),('h00iu5qacgklj9i93mdoggpcqf',1607175042,'','172.18.0.2'),('h060575qvq7amcoso5i3m12ilu',1607176683,'','172.18.0.2'),('h0v9bgiinq452cv517iu9sk87g',1607093249,'','172.18.0.5'),('h2jcntmupvqoam63er7slpsdgf',1607176688,'','172.18.0.2'),('h2pufmk3c79e5mmigtqriu2amo',1607171786,'','172.18.0.2'),('h3c9hhme7gp8n9td2o5fkmm0tn',1607171785,'','172.18.0.2'),('h49c44svoj55m6oig4jpae2vcm',1607095396,'','172.18.0.5'),('h54ejfeb15s3ihv72jl2g9dore',1607183360,'','172.18.0.2'),('h7dpp3ec1jqtg99b4tnm39gsro',1607174758,'','172.18.0.2'),('h7e8ptmrokp9t6avf7k54p3p4s',1607094611,'','172.18.0.5'),('h8iua8psp1k63467kd1nn09nft',1607171785,'','172.18.0.2'),('h8p01hn9e4g9d2ol88v2868611',1607094821,'','172.18.0.5'),('hae8j08sgqnnlhftp3eetslgtq',1607094670,'','172.18.0.5'),('hbrqvnaaue9bsksfr9j3su3q06',1607095053,'','172.18.0.5'),('hehdhuap6ov7egdlib1ih0guns',1607183365,'','172.18.0.2'),('hel9mmps9sf5itov2mnj5p2gec',1607170951,'','172.18.0.2'),('hfifg854s01l9ofoh1vfmagj49',1607168944,'','172.18.0.2'),('hfjecvko6l3o0mtju9anp0f4gn',1607094417,'','172.18.0.5'),('hfojboedhsjrcvlaq1m2ns9clh',1607173276,'','172.18.0.2'),('hguqutal57skm20q560l7g6l3c',1607176683,'','172.18.0.2'),('hh44na7is88vnuv2a86ceg8aeb',1607093250,'','172.18.0.5'),('hjh9geokj8633pqc110m86i1ji',1607174773,'','172.18.0.2'),('hjl6agrjiufdnamfug09seh0l5',1607094939,'','172.18.0.5'),('hjrojb9l768h24ug8gbh3kpsfb',1607093330,'','172.18.0.5'),('hlnb7s70mngnldn6ha6mr3iifh',1607183359,'','172.18.0.2'),('hmbhoijrs61snoaifnvaiogh1t',1607095052,'','172.18.0.5'),('hmnil2n23b52ke4miv3atq0o10',1607169807,'','172.18.0.2'),('hn19b91tj20k7b4sjdfeuur110',1607171190,'','172.18.0.2'),('hn2sntde20annqrl0lt4qdrt2q',1607094417,'','172.18.0.5'),('hn64fsr8tce4q55kimbcm8h6k5',1607094823,'','172.18.0.5'),('hnqc14079rapp8v108289n3sh1',1607095052,'','172.18.0.5'),('hou209rdsl2smsds5ha6c6g1te',1607095001,'','172.18.0.5'),('hpc0mjb6g45frf1mqtt79vrh9r',1607173599,'','172.18.0.2'),('hq4gvmorarkc3fnbk6pjh9k7ee',1607094247,'','172.18.0.5'),('hq7h8ckjaav9kt4gmdhcgpa82q',1607095052,'','172.18.0.5'),('hqi6pb9sqc3e7qgu47teb50j9a',1607183359,'','172.18.0.2'),('hr10pba9451rkgggiil0v31pn9',1607174758,'','172.18.0.2'),('hr1uaks4035581m98pootb54o7',1607170951,'','172.18.0.2'),('hrpvecqol2gn5knrn1nbnjo4me',1607176688,'','172.18.0.2'),('hsrqag1as6r4115hai8ncrc2j6',1607094822,'','172.18.0.5'),('htk937vakfiqhmf6f4957rkmib',1607093516,'','172.18.0.5'),('htvam2h6i4gf70d6an85t8dl6s',1607183359,'','172.18.0.2'),('hutvgavofpp1dj74elp30m01k2',1607183365,'','172.18.0.2'),('hvmbo9tgpat7n3g3sc9if9q0un',1607175042,'','172.18.0.2'),('hvpvpu24guvu1a8ehm3hfi43rs',1607170924,'','172.18.0.2'),('i0gjbst7ku910mbeqobs13f08q',1607169807,'','172.18.0.2'),('i10hk5ja7a8h1uf1gic22ed3f3',1607095396,'','172.18.0.5'),('i18g3b7mbo7ignbai94ale778k',1607095348,'','172.18.0.5'),('i1b0j2nhihim8rs35836jao9g8',1607093251,'','172.18.0.5'),('i3068ibnvv1v1o5c7j0dparaq8',1607094940,'','172.18.0.5'),('i31n449ub58aml72a50rsli0p7',1607094670,'','172.18.0.5'),('i37ep8odl9c7apvaa2vkpm7ju2',1607094822,'','172.18.0.5'),('i4e5h6hm9tspp3pujpdtd1ur2f',1607094821,'','172.18.0.5'),('i4l1ubeitckj141m7486aa0o50',1607093251,'','172.18.0.5'),('i4ov5d0jpcgk9csegig3ajttr6',1607094940,'','172.18.0.5'),('i6kuppn4jt13237j3dep3mcoh9',1607176687,'','172.18.0.2'),('i86js6jovlaglp4rkfm0g7tpq3',1607173057,'','172.18.0.2'),('i8grkr4ud1ajqn3o9kf5iib0to',1607094841,'','172.18.0.5'),('iargdl7j3ifuitm1sadj2svvvq',1607174845,'','172.18.0.2'),('ib49e9m8bc5oqiqjqsr9l4gtt9',1607094822,'','172.18.0.5'),('ic00rt0pj2i3rtkj638llhsds7',1607095053,'','172.18.0.5'),('icg7s3l8edv1kg17s9u6c2fj1u',1607170755,'','172.18.0.2'),('id6jmota5q98i5jm19frfu0lkk',1607094873,'','172.18.0.5'),('idr054hgmuvriv3t047vamfhp3',1607093331,'','172.18.0.5'),('ief27364523uvq4rbb8jk6u1tb',1607175060,'','172.18.0.2'),('iekagqepqiv5falopqjpvfodau',1607183359,'','172.18.0.2'),('ig9kjhnp38q17pqm6ga9rb12bu',1607171190,'','172.18.0.2'),('ihkp7djldai3cs3rek061dj285',1607095001,'','172.18.0.5'),('iib2c9sj2aa6vur98438iuggf2',1607173057,'','172.18.0.2'),('iirm7hmito7qau8b8mpkgm1gtg',1607176683,'','172.18.0.2'),('ij9301dgchkb0ucvq1snqb3cvq',1607183661,'','172.18.0.2'),('ijstvldn5l0o50lgo0krimdc8j',1607095000,'','172.18.0.5'),('ik8rv7c585594i44hr5ngg4tbh',1607169807,'','172.18.0.2'),('ilsdri78fts6bebo9i950t6u6n',1607095396,'','172.18.0.5'),('im2magsefm58f81l460p2as7q7',1607094822,'','172.18.0.5'),('im7ei0e6a065bf168adfmkfs8l',1607093517,'','172.18.0.5'),('imo5jt032h6j0laebn7v1d1gp8',1607093331,'','172.18.0.5'),('in7as47bi93ug1oj0ssbm777m4',1607093249,'','172.18.0.5'),('iofrpepon7sbpdu49aemgtleqk',1607174758,'','172.18.0.2'),('ip5uaf8ubm9u6qeijqoc97lsq4',1607170756,'','172.18.0.2'),('ip638a4dr18vhc0ojckrtakq2h',1607173057,'','172.18.0.2'),('ip6hbttde94dg9ob3hc9fcq4ak',1607174536,'','172.18.0.2'),('ipaec3dt9ot1tfj6p6546nfaq5',1607175161,'','172.18.0.2'),('iqi9dh9cvf3iqrsbpotft3k655',1607173599,'','172.18.0.2'),('irljq9ch2nltjqq9urptuklbfa',1607176683,'','172.18.0.2'),('irt4n05ttc1i1lc8920tm747v6',1607173088,'','172.18.0.2'),('is127iojl6f0jmldh5982attbj',1607174871,'','172.18.0.2'),('is5gkqnuf6q3prd4sur7gnk1c0',1607176688,'','172.18.0.2'),('isi86mclffbm5lon5el2gcmfh6',1607095348,'','172.18.0.5'),('isuhkvl2mar83hpqpr7nr2fsb9',1607095169,'','172.18.0.5'),('it7tguibfrd43pl9fq5fu5534e',1607095396,'','172.18.0.5'),('itfutgjo30u6sl31jnnc69ppan',1607176688,'','172.18.0.2'),('iui6c247dd4puj9539oj3v7304',1607095053,'','172.18.0.5'),('iui8qa0d95fhbfbl3kb178q9ic',1607174944,'','172.18.0.2'),('j066v0tt0jd6vujsr14taib16q',1607093516,'','172.18.0.5'),('j0pbpdn0ae1uk1f7i2grbqppju',1607095000,'','172.18.0.5'),('j33qb2mc4f0s8o9hjlovevfnq0',1607174944,'','172.18.0.2'),('j4080f6tvjc2ctk5emv59cv7qj',1607094685,'','172.18.0.5'),('j48atsqjdf0mr92b55sbku8emq',1607175060,'','172.18.0.2'),('j496thfvt8943ec8rps1n4e1fn',1607094416,'','172.18.0.5'),('j4p0f3niiaj5ljthlq24qg2e4j',1607175060,'','172.18.0.2'),('j4pcge1qtgkarsl6q93kkmbpv0',1607093331,'','172.18.0.5'),('j4su7po3ge9j4n26f8rbecusdt',1607094940,'','172.18.0.5'),('j6f63h1u4vihemv5brfqns38bk',1607093328,'','172.18.0.5'),('j6fnbii914ktcukp9rlkk9j1lk',1607095347,'','172.18.0.5'),('j6ot629v1jjqkcapfvc4f6732e',1607174944,'','172.18.0.2'),('j6tf6joca59cpor4ob7qjr2lgc',1607173895,'','172.18.0.2'),('j7mo45kctbuiacoiajev3i7sd6',1607183365,'','172.18.0.2'),('j83kop73sq5e8jkq1lvp5rsgn0',1607168944,'','172.18.0.2'),('jcfivj5sircu7i0vi8flf6444h',1607095348,'','172.18.0.5'),('jcjonh1nv7f66on8fkb2r3r11k',1607169807,'','172.18.0.2'),('jcntq5vl3udn1qhpe81lahsiri',1607173152,'','172.18.0.2'),('jcuv6k66nqvr3ot2kru40linkt',1607174536,'','172.18.0.2'),('jd29iaktd08cv5p2mmksje0lpd',1607093517,'','172.18.0.5'),('jd9m5sl7jucptu7ut0t0sebn9s',1607093330,'','172.18.0.5'),('jeosnjv04h55s897d18cg53kia',1607093517,'','172.18.0.5'),('jf2sp1auishbk4rhb0el3kjk0s',1607095169,'','172.18.0.5'),('jf81vieug5s5keogd8o7aj596m',1607095395,'','172.18.0.5'),('jfngrslnanjc4s409djndege2p',1607095170,'','172.18.0.5'),('jfok75iadmg9h079lp9tp4u03d',1607170984,'','172.18.0.2'),('jftri2jnl0o66q8kqcd0iu7oib',1607095052,'','172.18.0.5'),('jgrq392eimbs34es66gi8orrus',1607175076,'','172.18.0.2'),('jhkmiou82hcf1ti1cs8j7o60rr',1607093517,'','172.18.0.5'),('ji7857d2qmggbl328nfp5rdd8v',1607093516,'','172.18.0.5'),('jipfhqmgitsqejhbnha35b2ama',1607174402,'','172.18.0.2'),('jiq0lapvkmf33ipajhpmm65eju',1607094623,'','172.18.0.5'),('jkh6u73erj3vsc5ocki2fibkkm',1607095053,'','172.18.0.5'),('jlgrocoopatvfotq183p95k2bu',1607095396,'','172.18.0.5'),('jlkb9jutcocfe2coc7ibjcn9mp',1607173276,'','172.18.0.2'),('jllujjstr0gcfp57t319febvqk',1607093516,'','172.18.0.5'),('jlniv75fn5r0t9leh19s3igvh1',1607094416,'','172.18.0.5'),('jm8dee8hjk8bls65paovkb2ppm',1607183359,'','172.18.0.2'),('jmo18vmhlpt43mnjsu6l0m7a0q',1607094670,'','172.18.0.5'),('jmooiuaae94e5q16u4nj3j81aj',1607170756,'','172.18.0.2'),('jpjf88gb4fnhvpq30rrpdfcq7a',1607094417,'','172.18.0.5'),('jpneis1ji41otb3lbutkik7qb6',1607183360,'','172.18.0.2'),('jq2hjii0mi67ei9vq28613lljo',1607095052,'','172.18.0.5'),('jr72e55cog6n5d167hjameo4qp',1607176683,'','172.18.0.2'),('jt20su35r9nrjq1ul876tgr4oc',1607176688,'','172.18.0.2'),('jtsm9sh8arie6rkuphk91nt2vp',1607094841,'','172.18.0.5'),('jufrg3jnv107ntts321apn49vq',1607095396,'','172.18.0.5'),('jv6of5ghdspr9lmue7u7if93af',1607095348,'','172.18.0.5'),('k0189aba1hkn8ab7ubaqm8n6tl',1607174773,'','172.18.0.2'),('k12jigh5thpeefupoh18ssscqp',1607183366,'','172.18.0.2'),('k1n0la270a8pi6ur0ifsg14u58',1607175076,'','172.18.0.2'),('k23qhhjsct27kaeeuqj6n5rjvl',1607173152,'','172.18.0.2'),('k3n1o0gmgtfoadr8be0tgl1umj',1607094841,'','172.18.0.5'),('k4i767357ln1toiapv0louu93g',1607168801,'','172.18.0.2'),('k52itiaifpln1dmrj4k9fcnpio',1607183359,'','172.18.0.2'),('k67t64qpka9m456b9a30nnnb07',1607093516,'','172.18.0.5'),('k73ecm0buagbk44batimdjqigv',1607176688,'','172.18.0.2'),('k8ltnjhh0gpfm3a2fb4ah8he79',1607094417,'','172.18.0.5'),('kadefjt719r00fgtar8jde8jo6',1607095348,'','172.18.0.5'),('kahlk790kevc4a287tlb6gu2oc',1607095348,'','172.18.0.5'),('kbou05eqdc29lpuuap6qu4rq3h',1607094622,'','172.18.0.5'),('kbtcggurj5mg4u9g7ljlltfc96',1607173088,'','172.18.0.2'),('kd396q8mdntcc7gq4f51qcbh7q',1607168944,'','172.18.0.2'),('kd8gqjcvs7090hq6vtunvmjosr',1607094415,'','172.18.0.5'),('kdscugtujov22javhoqlsp5t6v',1607093251,'','172.18.0.5'),('keoej2u24kjvlejal95kcrefq1',1607094822,'','172.18.0.5'),('kert6358pveo52mc57df524i81',1607094941,'','172.18.0.5'),('kev5nehjmm1ear9snavd36rmgo',1607094416,'','172.18.0.5'),('kf80g98e707b6t9k3kshpo0qgt',1607094822,'','172.18.0.5'),('kfmsvumu0arssmcuon9tpc3q5r',1607095053,'','172.18.0.5'),('kfouut54q83soc08rf08ij8qpn',1607170088,'','172.18.0.2'),('kglfp51nbbm9hlgnqs122adfno',1607094939,'','172.18.0.5'),('kgnae1i5joae7fu2shva88uh14',1607183360,'','172.18.0.2'),('khrq3571lrgbdcnrmj1153t10v',1607095169,'','172.18.0.5'),('kilqnrudip0qa1ncu5iebd4fl2',1607171190,'','172.18.0.2'),('kkrsea1ql5a2tbjldfate291is',1607093516,'','172.18.0.5'),('kksn1a1lt8hd1bi3md98bjur5g',1607094880,'','172.18.0.5'),('klknm76pavvf4csel7ij08drk6',1607095053,'','172.18.0.5'),('kls857dk48hbaau1ce5b8pnh33',1607095395,'','172.18.0.5'),('kmdfufnbt94cb54cs9uv53h1a9',1607171102,'','172.18.0.2'),('kme92tcvm59a0fuj2ma88ltqqg',1607171190,'','172.18.0.2'),('kmg1sd70dlsjl1330lkicmdtpv',1607095168,'','172.18.0.5'),('kn50odk1pghjjrcqm5psm4svnh',1607094940,'','172.18.0.5'),('knfpitorprgg3vr0oqo8762nvq',1607168944,'','172.18.0.2'),('knnhi2mm4q89qqnp8ld9on7g32',1607169807,'','172.18.0.2'),('ko0cf6ddsamvquj8qf8c2mk281',1607174536,'','172.18.0.2'),('kpgc9mphkuoajqip9tas319rrk',1607176688,'','172.18.0.2'),('kple8v4kga90vjbrkn02848uvp',1607175061,'','172.18.0.2'),('kqjjncm5nde01dck5819kr6e0o',1607176688,'','172.18.0.2'),('krffpvp4o3h5nhku0bmhsl2qeb',1607093330,'','172.18.0.5'),('krqrtr8j7ukeashqvs4oefm2vv',1607094841,'','172.18.0.5'),('kt20tri0tuusq51mauu47rek41',1607094416,'','172.18.0.5'),('ktbc26nkb86qmuga18otonodhr',1607171190,'','172.18.0.2'),('kthk41l5dr3h92kdrl9tjm6brj',1607094417,'','172.18.0.5'),('ktig6q7rc9vsbfcsu4gmc026cj',1607094670,'','172.18.0.5'),('ktoq9i5po2q7taahhqd5okrn5m',1607171786,'','172.18.0.2'),('ktos3kfb5da9fqcc8s8b3kgn0f',1607175076,'','172.18.0.2'),('ku9dbj2q6hib9772avfvmnj8al',1607093250,'','172.18.0.5'),('kut8j87mv57tl8hiokn9ru7eqo',1607174773,'','172.18.0.2'),('l0cda0ccrhs5u7u0h5p22a7i12',1607094940,'','172.18.0.5'),('l0hi4g063it4cblt02pjiipnur',1607095001,'','172.18.0.5'),('l2g73g941fq762qirj06oits6e',1607174536,'','172.18.0.2'),('l42legc18g8ne2jqmpo46um3ge',1607094670,'','172.18.0.5'),('l5256s144guunmc28bcjkn3l8k',1607094670,'','172.18.0.5'),('l695virl5u0u7oe1bru34thre5',1607094248,'','172.18.0.5'),('l6kjhoso47mfc9kbbcat55m0ck',1607094670,'','172.18.0.5'),('l6lnhuh66tvlqq8d8lbi6fofrk',1607183661,'','172.18.0.2'),('l78lt26mvkah2655qlevvcnpbv',1607094841,'','172.18.0.5'),('l82jn639v6advvstl2i7crsau7',1607094716,'','172.18.0.5'),('l836q328kj86c0pq62d3vu6tkb',1607093250,'','172.18.0.5'),('l8c06j9nv3r71qh1b68gf1trcp',1607093330,'','172.18.0.5'),('l8tpce378pkmshcbbrs34pg69d',1607093329,'','172.18.0.5'),('l9chak6i307s5j97lbcbhemun0',1607093330,'','172.18.0.5'),('laha6e0pusb6j9hec460lt358s',1607183360,'','172.18.0.2'),('lb01rna0n1df8s7353f7tlc48i',1607094939,'','172.18.0.5'),('lb4b8h92d0euppq659ub9q826a',1607176688,'','172.18.0.2'),('ld3s4l24rofshv6tosktqljsk8',1607095000,'','172.18.0.5'),('ldftf1gtn41d0rme8uvpdd6ts5',1607094940,'','172.18.0.5'),('le5dc6bvv8mfi407lakcpn00uo',1607093250,'','172.18.0.5'),('lg80o3ucihs4ub2hi647tidktq',1607168801,'','172.18.0.2'),('lgeaao238tfpmr6iq779da42qa',1607093250,'','172.18.0.5'),('lghpbl1e3q5n3elhrjudf7hc4l',1607173088,'','172.18.0.2'),('lgnd18rq3s0fo4q6mr9l99t3p6',1607168944,'','172.18.0.2'),('lhaqgelml1tguu6t4rfhdsbkj0',1607095001,'','172.18.0.5'),('li38hjvoopn3rve0qaq81kgse7',1607173088,'','172.18.0.2'),('li4s6dr1lklmqvdsuhhpnsj09h',1607093250,'','172.18.0.5'),('li8hf2i4mjjapcdgtra5et1tgh',1607095396,'','172.18.0.5'),('ll2q4pgq8r1jeov6du2f64rsf6',1607174536,'','172.18.0.2'),('ll5gpr6skcv7s64l6oqum1fu1r',1607095169,'','172.18.0.5'),('ll8f6sb8ogqjpgukh8ol1aj1c2',1607170924,'','172.18.0.2'),('llt0aoh4r35ggg3qp402i6nlbr',1607093995,'','172.18.0.5'),('lm0nvhi0m80ip2qkm0dal0s466',1607093329,'','172.18.0.5'),('lmlvd2gusf4h8i92v0c8rs8l5r',1607094873,'','172.18.0.5'),('lmme69pv7tnmpt13bneedgt106',1607176688,'','172.18.0.2'),('ln54rpttskk2bja8mhd7gc3se8',1607094880,'','172.18.0.5'),('lnn6hck68rer3v07c2gms0ac57',1607173895,'','172.18.0.2'),('lno90ssdvgb6hi5i9r3caodv9l',1607183365,'','172.18.0.2'),('lo34fs7eq02e6g783p4bchqv8g',1607093250,'','172.18.0.5'),('lpl1ahpi7u36s63h6d72ldu1bq',1607183365,'','172.18.0.2'),('lpni1jrli3k47e9531a2mel1ki',1607093250,'','172.18.0.5'),('lqco7j0vu2m5qaer9fgrn4vak4',1607094940,'','172.18.0.5'),('lqr6vec1sini868notsq3nodtr',1607095169,'','172.18.0.5'),('lrpa8r53s1ciq26aeqluc2g4gb',1607094671,'','172.18.0.5'),('lsm05ivitcdcbb4t4l0bphdvbq',1607095169,'','172.18.0.5'),('lst5o8cev44s3gb7pqq2qvr31l',1607173895,'','172.18.0.2'),('ltnrvm2mm4mse1eao49c5jbghb',1607174844,'','172.18.0.2'),('luj1tg18lp8uumcdfcu5f2n8ar',1607095347,'','172.18.0.5'),('m03v1siln8r9kshlhje0i3n7f5',1607176688,'','172.18.0.2'),('m17j8hdivoaer2v9m9cha6ql8p',1607171162,'','172.18.0.2'),('m1bfa742bu55vtc10g6js31o1b',1607094415,'','172.18.0.5'),('m1g8i6v9mimbb6rkpqvrfjc9tt',1607094873,'','172.18.0.5'),('m1snmbs4dadgmit3k05fe4qb3r',1607170984,'','172.18.0.2'),('m224ohhgqs52mqloc5jsvleq5o',1607094622,'','172.18.0.5'),('m2b8okbrma5acsga558qtjshho',1607183365,'','172.18.0.2'),('m2ullc2qnk482jgc54e65esj6l',1607094716,'','172.18.0.5'),('m3274s91tf57g0ud24pmka1pgo',1607095395,'','172.18.0.5'),('m48ppt9uuv9tudl8svlnjbnicj',1607095001,'','172.18.0.5'),('m4fjigdcsag75e9qc9hs4ps74p',1607170121,'','172.18.0.2'),('m4vfhb2ugkvd09r2kno6s982me',1607170206,'','172.18.0.2'),('m5mnuqs8ih4hf87j08rqquhecd',1607176682,'','172.18.0.2'),('m697vq2leiftlfeh6jptecgic2',1607176683,'','172.18.0.2'),('m6c9g0bmqf4ol0uulgjnauq699',1607168944,'','172.18.0.2'),('m6k2jk6cc7uhoo7aqk9ueg08kt',1607094416,'','172.18.0.5'),('m87sp9grguluiql1a1b2nt5ev3',1607095170,'','172.18.0.5'),('m8bmlt979064mjijp7r5aqbtcm',1607171190,'','172.18.0.2'),('m8gmvea8mpu8tpua8cc2gcm05b',1607094610,'','172.18.0.5'),('m8pvk7oo9tfdergr354d4gv88h',1607095348,'','172.18.0.5'),('m8q2rrr9sr791icdj2j64pgf3a',1607174773,'','172.18.0.2'),('m8r1if9u10o2jahn3r8vuho8k3',1607094873,'','172.18.0.5'),('m9gvi1pig0apcl3mfoccnk17uf',1607095053,'','172.18.0.5'),('m9po05d7cvje5aee7c816otdcs',1607175060,'','172.18.0.2'),('mbjartd337noom1s46nm2mobhr',1607094823,'','172.18.0.5'),('mbrnhhecf00fckgdj59uu26o2t',1607095396,'','172.18.0.5'),('mde87gm7j296usjubqqp3m7coc',1607176682,'','172.18.0.2'),('mdhi2tc6m0lf631m4ampkdf875',1607093250,'','172.18.0.5'),('mdrndb46insjjd8dmhiof02nq0',1607095000,'','172.18.0.5'),('metg9j9b9470dn9jdpnccndlbr',1607174773,'','172.18.0.2'),('mfr2la203uv1pjrg2op1vmv356',1607171102,'','172.18.0.2'),('mg9c5b6a9p3itdvb4fgari80g7',1607176683,'','172.18.0.2'),('mgniid0aamf6sct04osaqod310',1607094417,'','172.18.0.5'),('mgsutbdjct01evivaiktt8vmb3',1607176688,'','172.18.0.2'),('mh1nc70uem5vplhio554a1v8ka',1607173895,'','172.18.0.2'),('mhnl6qmdsfb12g7v35hqhnlkq3',1607094822,'','172.18.0.5'),('mi64pr8j4tfnoqt701mt0c5hlu',1607093330,'','172.18.0.5'),('min9gar9952oef2v1cnm22ltgs',1607094822,'','172.18.0.5'),('miqrpcic53add7gcdlfs7nmu7n',1607094940,'','172.18.0.5'),('mj40gis0sqc2v4237v54oqkiaq',1607183360,'','172.18.0.2'),('mj9bhnvuptfm5t2htk1govn15v',1607095396,'','172.18.0.5'),('mjht3c9i6on2nl2bv8k64ce353',1607095348,'','172.18.0.5'),('mkfuk6aeen5c3osd86j357rv87',1607093516,'','172.18.0.5'),('mkuh9sr9esr8buqvu7a3566og7',1607183661,'','172.18.0.2'),('ml6ejgkg07bo1lg03an2nk4a0l',1607174402,'','172.18.0.2'),('mmang6fl22d2kim36bav1u6p5o',1607183365,'','172.18.0.2'),('mmq395uahfd7ageh7d655u0ncf',1607095168,'','172.18.0.5'),('mmtojavs9ho68bhvhdb3tmlhil',1607094822,'','172.18.0.5'),('mmtp3ucvqtoqudh0s031a9vg1r',1607093517,'','172.18.0.5'),('mnngeji0eg6kppretjh12qkul6',1607094670,'','172.18.0.5'),('mo9k00cf4dmbl9f37uqkbqas14',1607094941,'','172.18.0.5'),('moddf5i8chi6kgmlpkn3l4ki3h',1607174773,'','172.18.0.2'),('mogjdmpkamf8umfi9acp5jvbe2',1607094941,'','172.18.0.5'),('mosj0gr50n7a32ich39g89nh25',1607094841,'','172.18.0.5'),('mp8jrpv0fusjr4n9lrlau3nj41',1607176682,'','172.18.0.2'),('msrgepdpc65npkrl7c0of5udln',1607171162,'','172.18.0.2'),('mt0ujna7ea4metb5uva4c08nf3',1607094940,'','172.18.0.5'),('mtslp2og1sb7dbbncujrcscr2u',1607095168,'','172.18.0.5'),('mvph9hg97gshnh4v62ebkef5sk',1607094939,'','172.18.0.5'),('n0kvc716sudc6880m6be02n6ao',1607094873,'','172.18.0.5'),('n0pk2hi3io7m3usirdjfujha1p',1607093330,'','172.18.0.5'),('n20b1njo0asg9cisj6vd7p9b7e',1607183365,'','172.18.0.2'),('n25d9m6pbne9o9oiel6ivolqq9',1607183360,'','172.18.0.2'),('n327lcbl1l8jmbs6ivnjcv8spn',1607095000,'','172.18.0.5'),('n3tes4t8qkc9cidjqshtlpndh0',1607176682,'','172.18.0.2'),('n460sbcgepmg70neuo7k2vuinl',1607094048,'','172.18.0.5'),('n5v5m8d9h0ivlsg4i5gnkmmib6',1607094094,'','172.18.0.5'),('n67qmskd8dng461orjgl7it1kt',1607095001,'','172.18.0.5'),('n6fra54hg007tviupamgfmol2n',1607094416,'','172.18.0.5'),('n6ts0ho9p3vr8d946d595knj5o',1607183360,'','172.18.0.2'),('n7v368cp35l8657dikp06vr0u9',1607094685,'','172.18.0.5'),('n89air960i3ianb836mgefs8to',1607095052,'','172.18.0.5'),('n93gpvo9gmpftlrvbos9ks0arb',1607094671,'','172.18.0.5'),('n966bnvjnss743nommop6rdlnr',1607095396,'','172.18.0.5'),('na433l8icf6cmen4umn40219d8',1607095396,'','172.18.0.5'),('nb6e1bigh0vn3ebbg89grdfn84',1607094610,'','172.18.0.5'),('nba35ta1pjqv7kkegafgqrafob',1607095052,'','172.18.0.5'),('ncpq5bgjldg4s8lt6384vtno9h',1607094879,'','172.18.0.5'),('nd7eg4d2falqidosfuftqop0c1',1607095169,'','172.18.0.5'),('neac1d26jepb6e377jkfpji077',1607170205,'','172.18.0.2'),('netbhfscjv15ppbbgkpcot61pr',1607095170,'','172.18.0.5'),('nfambqf1snb3kim3758qdralro',1607170121,'','172.18.0.2'),('nflbd97k8lk21v44ktvvbprf3j',1607176682,'','172.18.0.2'),('nh6bgfe8ngl3oh0ov84ggm8e7e',1607094415,'','172.18.0.5'),('nhammfp29l8692c8r3cp391afm',1607094841,'','172.18.0.5'),('nhg8ne97qk0sp50u8j0jtp3i6h',1607183360,'','172.18.0.2'),('nhier2lul5hquko04n6d74q9pu',1607094939,'','172.18.0.5'),('nijf0ih7mk7nakevt6i5fudsju',1607175042,'','172.18.0.2'),('nj507v6hp7atrsa8795jh5thk1',1607094669,'','172.18.0.5'),('nk5nmlvlvgf5g991h2p9tqorpo',1607095169,'','172.18.0.5'),('nkpn2mrdgk58iend1rtlspurmj',1607094939,'','172.18.0.5'),('nkvlhjknl51uofs03es8b3cemc',1607095348,'','172.18.0.5'),('nlto0lkq7hl40ede44bgs622ue',1607183359,'','172.18.0.2'),('nm52ss5stgk63e0ie2b3dhkaor',1607170756,'','172.18.0.2'),('nm5tt9jugcme78i28miocsaq2a',1607176688,'','172.18.0.2'),('nn5p0nq6vh0mgqdk23v27j13ag',1607175161,'','172.18.0.2'),('nnsubflk3dh1r9muomh785e5uh',1607093250,'','172.18.0.5'),('nnubpgej8gp4ksbe31oqa4rdic',1607093250,'','172.18.0.5'),('nos04qgc6qduotut1ovli0enp2',1607169807,'','172.18.0.2'),('np5l93tchgdv4593kpi5p5v1to',1607093250,'','172.18.0.5'),('nqas22bcnoo6shgio7dl4apakr',1607175042,'','172.18.0.2'),('nr9j4ano0hkh2bnc33rgptmvcq',1607183365,'','172.18.0.2'),('nriio0243cq5scjjjt7jicpbnv',1607094879,'','172.18.0.5'),('nsokhe6meuvho6cref192fvjmf',1607176688,'','172.18.0.2'),('nu5h5fpie3g7t122nb7rpkk8vq',1607094939,'','172.18.0.5'),('nu79ficofdftscomb2d2ma1avg',1607094416,'','172.18.0.5'),('nu8dikoqfhl9lr3v2v0b38pl67',1607170206,'','172.18.0.2'),('nub0u16gcmb87n6n69sqstkboq',1607095348,'','172.18.0.5'),('nuuuqod1818m2v2tg7q4tpgibs',1607095169,'','172.18.0.5'),('nv12e0srag5m8qc2bligh9nn7i',1607176683,'','172.18.0.2'),('nv6ksff17d0c1vc4pps4f7k3ef',1607174403,'','172.18.0.2'),('nvmcipbkoqd042qrr4g32dm9ui',1607095169,'','172.18.0.5'),('o12bhdmci9i3m96b6mbmupklh2',1607183365,'','172.18.0.2'),('o19ggnu4e400h672rs4f9lqv99',1607094670,'','172.18.0.5'),('o1gbc8ba93dts5jd4rm3vgaimv',1607094611,'','172.18.0.5'),('o1p06472l53gda0evt7of901rh',1607168801,'','172.18.0.2'),('o2v14d0i5s04n2ehma9t24plnj',1607176682,'','172.18.0.2'),('o36c3f29ijicg11n013nl9v2bq',1607094873,'','172.18.0.5'),('o3l2f74ntc9mvmcbiamdike412',1607094622,'','172.18.0.5'),('o3toin08d6eftmphm9svne97l3',1607183366,'','172.18.0.2'),('o43t2voatk712dffdhmjqovnu2',1607094821,'','172.18.0.5'),('o441l4m5e2d8lden89om8bu80f',1607095052,'','172.18.0.5'),('o4kbeodiih25ud8euo4n03rm17',1607094880,'','172.18.0.5'),('o4lp10sdngse1vdco8540nvs64',1607174871,'','172.18.0.2'),('o6av8lmi71pjs96b1vah906c6m',1607175076,'','172.18.0.2'),('o6ntgtsu6ienlkoi199t8v33kk',1607095170,'','172.18.0.5'),('o7niftgga8kk56fbfurmjqlq49',1607176683,'','172.18.0.2'),('o88gfub0hhc4kto0rv6ild5r7o',1607173057,'','172.18.0.2'),('o8t27h7fq7222plur4rjaqjs1i',1607095169,'','172.18.0.5'),('o95crjcf169l732cv2rj2g3mfc',1607170088,'','172.18.0.2'),('o964smq77nh5qg7ogj6o2ckiub',1607170088,'','172.18.0.2'),('o96djbckq00n21tvkfvefqred6',1607093250,'','172.18.0.5'),('o9jppraqm4o44bnaaehhlg43fm',1607094610,'','172.18.0.5'),('oa6d5ecbvdfu27mon88p545f6k',1607095052,'','172.18.0.5'),('oa8ah2n2kj974v3hpv2a25u37i',1607176688,'','172.18.0.2'),('oa9fno7b759i4thopepbfll5sk',1607094881,'','172.18.0.5'),('obkh7hnbmh446n014fuie237on',1607093331,'','172.18.0.5'),('obnnk5kmfkf0vjvckn8q7rndur',1607094880,'','172.18.0.5'),('obo047t4nd266262n56o8d8125',1607176688,'','172.18.0.2'),('ocksnpais6i2h7vmtrgiemv3i4',1607168801,'','172.18.0.2'),('ocm7boi7soti9rirv8bq3cghia',1607093250,'','172.18.0.5'),('of53mehf922it0l68jt2en9mc7',1607173088,'','172.18.0.2'),('of67g1n0vem909fjp7f55ok7gc',1607170984,'','172.18.0.2'),('ofmqk29bv6ri8h92dopvla7gsh',1607095348,'','172.18.0.5'),('ofth17gho2gn7ib83o30ce0b46',1607175060,'','172.18.0.2'),('ogauj4ap4p2hhsuffnhs48fvqs',1607174871,'','172.18.0.2'),('oje3ok2locaq5jm2bspsubiq8h',1607095052,'','172.18.0.5'),('ojgtomc1fpqmj663lbarqptj7h',1607093331,'','172.18.0.5'),('ojmfjdquo2ob363p5022kdgp1e',1607171190,'','172.18.0.2'),('okfp8ib1h7ru3537u2qhjmq9ft',1607093517,'','172.18.0.5'),('okocl6p61cb4rcie2mpemq313s',1607173057,'','172.18.0.2'),('ompi658ef84t4vj6s2bne7hqn9',1607094873,'','172.18.0.5'),('on2ndhdf032715kkv121kgdiq0',1607095396,'','172.18.0.5'),('onvn09aqhqm5terqklrt07i38r',1607170088,'','172.18.0.2'),('oodhuhpj0hsebldnpg8hlc1rgo',1607093331,'','172.18.0.5'),('op5u6msugsdtks0d9isgkto7e4',1607094999,'','172.18.0.5'),('opls7vonrg1qrppt7m1kqr9ki4',1607094822,'','172.18.0.5'),('opv2vvuq7vq7f5el7eoou1jq63',1607094873,'','172.18.0.5'),('ordorqkls4oc1bgmoiqtsskpp1',1607168944,'','172.18.0.2'),('orok5nsk8bp9csl0l5aj9cfgdu',1607094670,'','172.18.0.5'),('osbh8o0vd7suof47ala3khlbf2',1607176688,'','172.18.0.2'),('osipgvuh1sstvblknof8eb1f59',1607175061,'','172.18.0.2'),('ouvbq89qgop5oa1kji3e766onl',1607175060,'','172.18.0.2'),('ovq6pueu7cvqohka97mb2936ln',1607094610,'','172.18.0.5'),('p0dbagbde2rhgv4hk3bt3hrbcs',1607093517,'','172.18.0.5'),('p2a126u5ugkski7to734u15kjp',1607095000,'','172.18.0.5'),('p2ntqni9plf34ulc5sqeeoj5te',1607170924,'','172.18.0.2'),('p2u8moddrcmm8hfb8lg8mmmlio',1607183661,'','172.18.0.2'),('p2uubd0t6pr0sq6vpfu7sm182d',1607094248,'','172.18.0.5'),('p337o76rchifou8l26t1iusufk',1607094881,'','172.18.0.5'),('p49k2evprv13u1erlsvku9pn1v',1607095169,'','172.18.0.5'),('p4tp3q2soqe2avor21s68lc61m',1607176688,'','172.18.0.2'),('p6be38dcut0t35jo9pmov2eclj',1607168801,'','172.18.0.2'),('p8jhficju7bg1bpvr2prcv5skn',1607094940,'','172.18.0.5'),('p8o38o7rdfftglhnun987uckj5',1607170206,'','172.18.0.2'),('p8r6lpmfqsnd3s7ek57lkkes1a',1607095000,'','172.18.0.5'),('p91eual4bal2bpbtatm18ng79b',1607176688,'','172.18.0.2'),('p9ag6jnpe2sbuhj0ij4siis316',1607170951,'','172.18.0.2'),('p9phhqeang6uo9bo3m1r29opgd',1607169807,'','172.18.0.2'),('pbai9jg9vn5g4mjttut4r183m3',1607171190,'','172.18.0.2'),('pbkjtrab1u3a8n8d9oa2djras6',1607170088,'','172.18.0.2'),('pc2pp9l60e1fht65po9nd2icfo',1607174536,'','172.18.0.2'),('pcd2e0041pv18jt5r3o0qku4gi',1607094822,'','172.18.0.5'),('pcjcs2c4i9mvbl3mph786qebe7',1607094610,'','172.18.0.5'),('pdt7uan96iu7aa9lgelag38v0l',1607183360,'','172.18.0.2'),('peo1onjf2ok232ht4mt0eif6po',1607094941,'','172.18.0.5'),('pevboohlatq2dnk68n4q1258j8',1607093250,'','172.18.0.5'),('pgaiu4n6etupmlgpmo3ojeoiui',1607095053,'','172.18.0.5'),('pglra6agr0ah8a6p587svh4lcj',1607095396,'','172.18.0.5'),('pgrd4j64umfop76jn8nmvrjh9e',1607094669,'','172.18.0.5'),('pgshrlhqlebsehddc76rvlt0rb',1607094669,'','172.18.0.5'),('ph529qvib9fj16qioir0rm4nhu',1607183365,'','172.18.0.2'),('pkspk2ikri0q2rnvge2s7d0dq5',1607095169,'','172.18.0.5'),('pl8vcovf35t9u66baiuhhg7sig',1607094622,'','172.18.0.5'),('pldqtddogo2s2ljk328p9f6ohl',1607170984,'','172.18.0.2'),('pm1qo4cqe8e808vt2o0v35ql63',1607174758,'','172.18.0.2'),('pmaubt2lnu2dsnsosr9jmkudsv',1607094416,'','172.18.0.5'),('pmcj8q0s9co8r0ncj5lm5j6crp',1607183359,'','172.18.0.2'),('pp286td1vd9up6j2kb2g3pijas',1607170755,'','172.18.0.2'),('ppe3r9mvhabi782jgashem6rg4',1607183365,'','172.18.0.2'),('pppcpce14ukea7j302fcnoup9g',1607094716,'','172.18.0.5'),('prto330f80t8q33el3g1ism1mb',1607095169,'','172.18.0.5'),('ps4vbrl68nnt8kmcrm4nu562ra',1607093250,'','172.18.0.5'),('pscudbn9la8q13svk8risbkcc6',1607094881,'','172.18.0.5'),('pttkajkt99tl8rol0k247lap71',1607173152,'','172.18.0.2'),('pv0seci42vlmnl4pobqk61ehsv',1607093517,'','172.18.0.5'),('pvc6bs8qc4b0khtk27kerf1c3d',1607183365,'','172.18.0.2'),('pvc7t2g8tium7h6gvho7nrutr3',1607170924,'','172.18.0.2'),('pvj3ul10qqaedgpdhmlth74j8m',1607093516,'','172.18.0.5'),('pvknc2km35unp71cc7lchroeba',1607094611,'','172.18.0.5'),('q25keso29vp31k49ui5h9bee8e',1607168944,'','172.18.0.2'),('q52rc4fj1ff4au5t1bfetaos4k',1607174773,'','172.18.0.2'),('q5fjvcttuhcc7apb6384rmkspo',1607174402,'','172.18.0.2'),('q65l4epkr743cefl89q2jorqfv',1607093250,'','172.18.0.5'),('q896urbhmbtgd1pknv6b1k8nc7',1607173088,'','172.18.0.2'),('qb8l4hqpar17909qci9h59fpl4',1607171102,'','172.18.0.2'),('qbvptlcbd9512e4duej7dgso6d',1607176688,'','172.18.0.2'),('qcc97l80bsat7bgf0457bhq340',1607183359,'','172.18.0.2'),('qct9i3fulagjtsdpdf7dm29p8t',1607176688,'','172.18.0.2'),('qdj3i23nbihmcni5p48qkpkhd9',1607183360,'','172.18.0.2'),('qdmon21eu24hk8fnvog6vsldos',1607174944,'','172.18.0.2'),('qf089cpe19gne5278hs4t6j9vr',1607176688,'','172.18.0.2'),('qfr3bk8dqhqiauuqmc93sluq5s',1607094873,'','172.18.0.5'),('qg4e5slt6ees6hcrlo5qae1dn1',1607174844,'','172.18.0.2'),('qgapohb3ihlbgrl8qp3uritssp',1607171785,'','172.18.0.2'),('qgblu0hqgeioppduftnraueldr',1607095052,'','172.18.0.5'),('qgu8nhjm44t1u70fadoe21hhdd',1607095395,'','172.18.0.5'),('qh231k54cgdkqvl4lfmtnk1och',1607183360,'','172.18.0.2'),('qi0chh4kabhd651im96m6d2krc',1607094610,'','172.18.0.5'),('qkblhcst4mp9tmhi5v419oqm0h',1607183360,'','172.18.0.2'),('qkbp6qnspe95qmgg8bh5mtnq8d',1607094685,'','172.18.0.5'),('qkoacna2lq3fcvpnso89omqul8',1607093516,'','172.18.0.5'),('qktoa0q31nl9as0c0181rqps3s',1607095396,'','172.18.0.5'),('qlt1o8j5c4ogjno7g1bi8k5tut',1607095052,'','172.18.0.5'),('qmj94d3stg5bv51oorgnttvc50',1607170756,'','172.18.0.2'),('qmto7t6j05vu9bebcnccv7glpo',1607094671,'','172.18.0.5'),('qnce5k14gop5g85b10p3q8i91q',1607170951,'','172.18.0.2'),('qoong0dt00fgpitjujm3jbpla0',1607095052,'','172.18.0.5'),('qqct3cv3t9on3rhri5k5qmln2a',1607095396,'','172.18.0.5'),('qs7s04efl6rhrb9unlgobpa833',1607093517,'','172.18.0.5'),('qsgdmp6a5d571ufs1iq205mpmn',1607183365,'','172.18.0.2'),('qvihu8fsgv5dn91gg1la40eh8m',1607094841,'','172.18.0.5'),('r17um37gntp3or3r27qq0ecoe2',1607170121,'','172.18.0.2'),('r2adnlpi7bjts57bcj79fkt94a',1607094822,'','172.18.0.5'),('r2c45tkce5m4gdl5f08ji5h4eh',1607094671,'','172.18.0.5'),('r3uvlejujg5og9tl5t7hvsjk4c',1607094939,'','172.18.0.5'),('r4cgpm2st0d9d3u4deo0hpk51k',1607173057,'','172.18.0.2'),('r4eas9np0eo0bckh4bobrc9ukp',1607170984,'','172.18.0.2'),('r4m17b5456q8nf2qujhd25m98f',1607095001,'','172.18.0.5'),('r5b0908tj4mv8bscolr582b8nu',1607176682,'','172.18.0.2'),('r5k8o5ajh9d4cuknistf7uhgk1',1607176682,'','172.18.0.2'),('r5khj3elbnpp2nojtg1d741kjd',1607095169,'','172.18.0.5'),('r6oi6ui24g8t344atl2tirachm',1607094880,'','172.18.0.5'),('r6qc2tdbjahg4sllr8rjc55afu',1607094670,'','172.18.0.5'),('r73t272sh939elh3d7nelniq3u',1607094939,'','172.18.0.5'),('r778vc0196dhgq6p8nbogfhc0d',1607169807,'','172.18.0.2'),('r77p17ssjdof5fk1nh2fjndn2v',1607173088,'','172.18.0.2'),('r80bsgbemcm0rspmijqmmna98g',1607093331,'','172.18.0.5'),('r9qc5766oqsksihavf2a8o6joo',1607094151,'','172.18.0.5'),('r9uvb66j9bkn8pctl7he325r4p',1607170951,'','172.18.0.2'),('rarjiolvup5ef1215fsha921sm',1607095169,'','172.18.0.5'),('rasohr3cemuht3ul7manb00fue',1607168801,'','172.18.0.2'),('rb6a8f7kqmu8q3t1cpq1mhgjp4',1607175076,'','172.18.0.2'),('rbk48idu070860go4efpa7jt43',1607094248,'','172.18.0.5'),('rbqbtg4um04oqf9tak5h2f514u',1607095000,'','172.18.0.5'),('rdhn5ikmmhbkmanng1s8m2t9ot',1607094417,'','172.18.0.5'),('rdq4vkbe2onqlt6iifknh5h0ar',1607094999,'','172.18.0.5'),('rfbdjaogctt6975un0kglh40mk',1607173599,'','172.18.0.2'),('rg3ni1bqe26bg4kh6slnk69b6a',1607174536,'','172.18.0.2'),('rg3rehqk1qpdf9trhpouo74d6r',1607183364,'','172.18.0.2'),('rics019jpqdv12l5va2lnuqe1b',1607093331,'','172.18.0.5'),('rie96nerq6uk7tr5ncgahpe0nc',1607173276,'','172.18.0.2'),('rikj1uc4m6v9o08fmr6tno4dfd',1607183360,'','172.18.0.2'),('ris65gefjoh91nkm4r75bsu8ru',1607183366,'','172.18.0.2'),('rjf0679qp1l8oj1poac1r24ud0',1607168801,'','172.18.0.2'),('rk83n0jb5ue5sf57ojs7fmi1hh',1607095052,'','172.18.0.5'),('rkq4dshgf7f7pcmks2nqktgc05',1607094669,'','172.18.0.5'),('rlbt79ld6qt7cbu4goqihilleo',1607094611,'','172.18.0.5'),('rluvsarsgaa4nk7isqiq11i1l2',1607175076,'','172.18.0.2'),('rmkfs7lcrpooutvsvmv05thf91',1607170121,'','172.18.0.2'),('rnac8m05rbv7jjke9i09oncqp1',1607094881,'','172.18.0.5'),('roige45l5adacdpgc5lvqjonjo',1607183359,'','172.18.0.2'),('rp0pgcjt625iia3u6vmcvbmd2e',1607095169,'','172.18.0.5'),('rptjuceitrsm8loolq6sk7i9qi',1607093330,'','172.18.0.5'),('rql3sljs9c16hpohgmun2rbp4g',1607094880,'','172.18.0.5'),('rqmkjk87ts7bpqqkapfn7aev7i',1607183365,'','172.18.0.2'),('rqsa9rg4vi5l19rhpsjjfshlm1',1607176687,'','172.18.0.2'),('rs3ugsm9arf38k21qmp4e6qquc',1607093516,'','172.18.0.5'),('rsbi44e6pc5ej3afa7s1i6dima',1607093250,'','172.18.0.5'),('rsdeqgir27mimlvr65h4p6sve7',1607094611,'','172.18.0.5'),('rt0dn6s9cp2cj6qn9s9g0nf0uv',1607094873,'','172.18.0.5'),('rtv4k3e2126h00rg0g6b6orela',1607093249,'','172.18.0.5'),('ru3m46105apmmtjpbbci8okln1',1607174773,'','172.18.0.2'),('ruj8ubem3dkprg2idi1bhd4cql',1607093328,'','172.18.0.5'),('rv7kq1cdcn30r9ls3j77fpiqnu',1607171190,'','172.18.0.2'),('s041s6oa0mlv158m0s3q37mkll',1607094940,'','172.18.0.5'),('s0otcf5dukk98sipsh9bg0i0s5',1607175042,'','172.18.0.2'),('s0vhrrnefsc8vj5mjvd82onou8',1607093249,'','172.18.0.5'),('s1797736kbnc8oon9qouc7gkgm',1607095053,'','172.18.0.5'),('s1h4pof9ik7rl1nrbr9fmpd8cb',1607093330,'','172.18.0.5'),('s27nk1b75db8nig248flnmipoj',1607173895,'','172.18.0.2'),('s2ir56n4monurvpklq5mbvi7j4',1607094821,'','172.18.0.5'),('s3cn59gcchbdc6g8pesksj39e7',1607175161,'','172.18.0.2'),('s3g474c6l30v50aea7rkoa4uud',1607094940,'','172.18.0.5'),('s3ko1rmmgs8vchvlgotofov0an',1607171103,'','172.18.0.2'),('s3pm9a46v7dgdvis4pdb38gpne',1607171190,'','172.18.0.2'),('s4o5t5noo57ve9ajv7jl92cis6',1607094416,'','172.18.0.5'),('s71o5kngroc1997g5287o2q16e',1607094879,'','172.18.0.5'),('s78cd2p52k3d8fdo8muehdrbg9',1607095347,'','172.18.0.5'),('s78ec8qe3huq7l7gu3brd1cpk2',1607094416,'','172.18.0.5'),('s82sgog42r6pt6l1a2vq7a4kmp',1607175042,'','172.18.0.2'),('s8pofkc3m2am0sc0tn72h60d2c',1607094716,'','172.18.0.5'),('s95u8jmpo60gg3h5kb3s8tra03',1607095001,'','172.18.0.5'),('s9bquult3hneb1lu002s2utou3',1607176688,'','172.18.0.2'),('s9ih6bvqdo6nn7t6cl838atn9m',1607093249,'','172.18.0.5'),('sa6pn6b76an0i52b3e2ev3fkbg',1607095348,'','172.18.0.5'),('sajhekf39h8b7nefepd372u662',1607094821,'','172.18.0.5'),('sautebhifhicn1qjgtmnb9urv7',1607094671,'','172.18.0.5'),('sb9t9u8bpbpv9lmm6jsli2olf6',1607094670,'','172.18.0.5'),('sbfo32lq8u16h1kb36eh6iqsvt',1607094841,'','172.18.0.5'),('sbomj184trb262dgnl14eronpr',1607093251,'','172.18.0.5'),('sbpiorc6le5onggo8vbli02t5k',1607093517,'','172.18.0.5'),('sbsqejedfpm9btftc1fv4d320o',1607094939,'','172.18.0.5'),('sc97lbef33qo494ddlpoh17lha',1607174536,'','172.18.0.2'),('sctco9t26arampdkn7v0hpehln',1607094841,'','172.18.0.5'),('sdeu3cnrhnpf180ub28n0b9rrq',1607183661,'','172.18.0.2'),('seuib9f8fu4n4mnudm8o8c3vig',1607095052,'','172.18.0.5'),('sfumo26n98bgnk2i52kvthr1u3',1607095001,'','172.18.0.5'),('sg7uu60baif6g0amel3j8gdi74',1607183360,'','172.18.0.2'),('sh048j4f8ub5uepu1b9ngh1q9u',1607095169,'','172.18.0.5'),('sh3e2glp50lspr6motqhabvr4k',1607176687,'','172.18.0.2'),('shs9mnj8n2vbijkcfudtfiqr2i',1607095000,'','172.18.0.5'),('si3he7n43rfo0u5btshn3bpigk',1607174844,'','172.18.0.2'),('sj1l6ck28fdd897eepka47i3gs',1607095052,'','172.18.0.5'),('sjgf8qjj6nv06ptimnnghah5ce',1607183661,'','172.18.0.2'),('sjleu4stgjdkm4kkd6nkb25hhl',1607093516,'','172.18.0.5'),('sjtdkh5kcdftm13sc3venec0d9',1607095000,'','172.18.0.5'),('sko9f80o084bmhdv56ugrmf6nk',1607173057,'','172.18.0.2'),('skqpbtg0lu76a9mrq3lpgk4gd3',1607176683,'','172.18.0.2'),('smrldudkjfeeja37fbp9hvvjid',1607173599,'','172.18.0.2'),('snhq4fo2cejmv1saitjb33v1v7',1607094873,'','172.18.0.5'),('snptbp0njfaghi15uper5qkf57',1607174871,'','172.18.0.2'),('snsm6cbtlg0nevoj5s5k898p8o',1607095396,'','172.18.0.5'),('spuemue011qqei8be8nblefdqk',1607094880,'','172.18.0.5'),('sq8785tltevum5kl9qgfbib5aj',1607176682,'','172.18.0.2'),('sr1e3bc5rrtvilqo1v4av3b24m',1607094685,'','172.18.0.5'),('ssnj20pvbu1tg7lm9ciscj6dcj',1607174871,'','172.18.0.2'),('ssukqeu0ie4qdb69o8b485tn9p',1607171785,'','172.18.0.2'),('st4d5hid8rqk0aijfnto9bd3nr',1607093329,'','172.18.0.5'),('std2icku97jekb3mshagmfvbj6',1607093517,'','172.18.0.5'),('str5vlj3javhspl046bml1f5ru',1607093516,'','172.18.0.5'),('stvdjrcinkj9hhqa7bauri8rdr',1607176688,'','172.18.0.2'),('stvgeej8jekji52hqnqp3bjkok',1607095348,'','172.18.0.5'),('t041t7tp7he52vq9dkbfip9fe1',1607094821,'','172.18.0.5'),('t07lcmjsju00u27g5l5e0ft2sk',1607094821,'','172.18.0.5'),('t0h7narkt29f20r8pek98h07e2',1607176683,'','172.18.0.2'),('t0nh9c9uija8vfqa7vppkcprij',1607173057,'','172.18.0.2'),('t13qbq2vqaolmrdfnqevdik485',1607170756,'','172.18.0.2'),('t1ckad7j0i616ejp28m06qca89',1607095053,'','172.18.0.5'),('t1e18lrouv4ljm7q2loijnb1i1',1607174758,'','172.18.0.2'),('t1t04ik45ko27dpbc7r6lip3pj',1607170951,'','172.18.0.2'),('t212lm5226vv168r2lben5qd7n',1607095000,'','172.18.0.5'),('t26u3ki1nmcug4pbam49m14vpv',1607093329,'','172.18.0.5'),('t28btp7j6rfk02aujdi168ud6n',1607175060,'','172.18.0.2'),('t2i1otf2a8htq36fh9ec7sj30u',1607093249,'','172.18.0.5'),('t2jhbh01ncbta57jgps5me02ej',1607095000,'','172.18.0.5'),('t2p9ocfqk7ded1jdrojvvb3bgg',1607173152,'','172.18.0.2'),('t33l88bdectdnh1m5bncag2hb5',1607094685,'','172.18.0.5'),('t354uja8htuid2tp3orp7esu0u',1607094417,'','172.18.0.5'),('t5kab9dterua6j4ff17lh4mnp1',1607183360,'','172.18.0.2'),('t6kua3casqeebi4mu6nqakuq4l',1607094671,'','172.18.0.5'),('t70r2ndfga6aq8jfh57oliu1nu',1607094999,'','172.18.0.5'),('t716kfsiqna7svbvjt4j8k4kkd',1607095170,'','172.18.0.5'),('t7erduj4134h9qj1hngjh7l3aq',1607175161,'','172.18.0.2'),('t7g2r1l9nj5qcrn5gk4e6jmnki',1607170924,'','172.18.0.2'),('t8uclkbqd7p1s0l23bq9ku09uj',1607171785,'','172.18.0.2'),('t972rbpb3vevf0uj3f0elk09r3',1607095347,'','172.18.0.5'),('ta5m5en2k3166r9m309u9u9uo2',1607093517,'','172.18.0.5'),('tbbu4u35lnjf16n0m7qtn9lq2b',1607094622,'','172.18.0.5'),('tbh2j8ioilliuehjs6nn3ump6q',1607168944,'','172.18.0.2'),('tbhuvouu3nri25dreqg80vduma',1607094999,'','172.18.0.5'),('tc3j3tnlpk0l9g59pqh01a3pns',1607176683,'','172.18.0.2'),('te606pfju772d5jf7mp7vev35c',1607094823,'','172.18.0.5'),('tg28bhljgh5ood7mj6ea1hptn3',1607093517,'','172.18.0.5'),('tg4sgesgunt1p1kdrg2nhn4vcc',1607094940,'','172.18.0.5'),('tgjq0ma9h8cf6a3kfp4inqepo9',1607174944,'','172.18.0.2'),('tgldn8vut3hkj9630sbqc6rdmq',1607176688,'','172.18.0.2'),('tgtsk1bll92afi84qlu60r5teo',1607174944,'','172.18.0.2'),('th86in5m17f47a44u27o8nr2t3',1607183360,'','172.18.0.2'),('tia4op7ql5h6qkqpt4djc91l9k',1607171103,'','172.18.0.2'),('ticjdt7jkl520jvlhkg76n674b',1607173599,'','172.18.0.2'),('tjn9pnjlj356qknthttq1o0am9',1607175042,'','172.18.0.2'),('tjoe1j5a7ehifsrsksu4qmv077',1607171162,'','172.18.0.2'),('tket60bo9lc594bui1mpup6lpc',1607170924,'','172.18.0.2'),('tkmhpcgfg73fek04ql1u1ffr1u',1607094622,'','172.18.0.5'),('tkv28etn9tj8inlncrlvagd1h4',1607094416,'','172.18.0.5'),('tlepqei4kd13u03g6ovs27gfpg',1607094610,'','172.18.0.5'),('tm2n6haaquk8vklqv619rqtbfd',1607093329,'','172.18.0.5'),('tmuglno9e77odn7d4e253rn42g',1607171785,'','172.18.0.2'),('tnqo8q0vlncpqpuab13j5kot8f',1607093251,'','172.18.0.5'),('to8eto6jaetglr85pd1ftl7guh',1607176688,'','172.18.0.2'),('tocibh3akskfpltt79o2qqieqn',1607183359,'','172.18.0.2'),('tof11cja45s7hvpu5h0co05pf9',1607094880,'','172.18.0.5'),('trphj2makucsrk2rio98tk3j3g',1607093516,'','172.18.0.5'),('tsccadljamirgveheofqp4l3ah',1607094329,'','172.18.0.5'),('tskccavfvhhaf07lgf3d6lqukq',1607094880,'','172.18.0.5'),('tssfff8r54oblhmfeai6tj5fsf',1607174845,'','172.18.0.2'),('tsta2hp4jc47j3r48cja7ej3ok',1607095396,'','172.18.0.5'),('tt6b1btaedtq61lagtraadp74e',1607095002,'','172.18.0.5'),('tuc46032vkq9c7ne01enqevvqe',1607095001,'','172.18.0.5'),('tvimadst050q3khfo8pd9k72lo',1607183364,'','172.18.0.2'),('tvumk8s4gu35pd9s0smbijjppm',1607095000,'','172.18.0.5'),('u074k587eg3emqaemq3hgo817c',1607094685,'','172.18.0.5'),('u0fcvtg9pitfldejo98263r9uj',1607094611,'','172.18.0.5'),('u16cmh1q2ftfe504uqbf0gk212',1607094940,'','172.18.0.5'),('u2lh5lgldp8ba369l590vrbghf',1607183359,'','172.18.0.2'),('u3k1borkn7op7shoth97dk1ika',1607095347,'','172.18.0.5'),('u4fmk4a9c5csd5tu4usql7ptdb',1607095348,'','172.18.0.5'),('u56jnvc5q4s7r3m1b3its2mtbo',1607093250,'','172.18.0.5'),('u5sj12m280tcd0r69fj311jugr',1607095169,'','172.18.0.5'),('u68gvs0lo721mvdc7v3tg46oh5',1607176683,'','172.18.0.2'),('u6gm1pkpm6l6pio90jqoa25ikm',1607094940,'','172.18.0.5'),('u6rgvthuai8sh1gjsuc3j1nurq',1607094610,'','172.18.0.5'),('u78q9qic68q0as139thvc9703g',1607094822,'','172.18.0.5'),('u86sdufabdcitrt8ahosluntmq',1607094670,'','172.18.0.5'),('u8cmp08te86bob0lgrumgo20pk',1607095170,'','172.18.0.5'),('uaqkf977lpf00fg71nigk3s2ff',1607173152,'','172.18.0.2'),('ubacdoe90cqtfkna2hgdebhsu1',1607094823,'','172.18.0.5'),('ubgv52qqd4mrl24hcrhh0vgaht',1607169807,'','172.18.0.2'),('uc4dkps2n82aq415vcthgfvgh7',1607183360,'','172.18.0.2'),('uc65d0buhkpjc451dcasa3iisg',1607095001,'','172.18.0.5'),('ucejhekr7c2lgonqlkouot0r36',1607170984,'','172.18.0.2'),('ucrj5e15p4ljr43ot427ico4d7',1607095396,'','172.18.0.5'),('udbgecutjab807htie8n7mtj68',1607095169,'','172.18.0.5'),('udlpa675766ilie6nohgi8pivi',1607168944,'','172.18.0.2'),('uehmh433qnmvqk86sg491sp9q5',1607093330,'','172.18.0.5'),('uemiipa0tbslped5264ad76l6o',1607183661,'','172.18.0.2'),('ueoueng1rpv3e54a7l1rv480na',1607183360,'','172.18.0.2'),('uf0hvka73sj4tefgiml89rqkl2',1607094248,'','172.18.0.5'),('uf5jnrrf6tf524f7iia641o1td',1607183364,'','172.18.0.2'),('ufdbo0kodrsmqi4vbshsj7t86r',1607095052,'','172.18.0.5'),('ufom76pom6evtteepoa61e16o5',1607093330,'','172.18.0.5'),('ughv2vs5556jr51l3gqhsdt48a',1607094822,'','172.18.0.5'),('ugrp59grkov4ioot1ck21m7vsc',1607094248,'','172.18.0.5'),('uhghcb1ktqnb3j6iqd4ldk9k7b',1607176687,'','172.18.0.2'),('uhqk03e16o78sdmkqprt2f7m9j',1607094879,'','172.18.0.5'),('uim9vcn5prt913lbp6ivhs9jjj',1607174758,'','172.18.0.2'),('uj6j6istvvome328g6qdobnjmp',1607174402,'','172.18.0.2'),('uja4u70hdg9pgtv47c67jc08ta',1607095347,'','172.18.0.5'),('ujpn94aavut3ncvgq282jaj5ls',1607183365,'','172.18.0.2'),('uk1pa3cnae77ajd9dkcc5h85a8',1607171786,'','172.18.0.2'),('ukmhtktrmp9m2ido0bm2s32i77',1607170924,'','172.18.0.2'),('ukqntavl6frf1tl8qhlknmno3r',1607183360,'','172.18.0.2'),('ul0l470pmv5kjmvmbhednavhqg',1607173599,'','172.18.0.2'),('ulfu7dfegot9tc9pmfdhtgcsko',1607170984,'','172.18.0.2'),('un7gvlav2j05kkefpm87moiljn',1607095169,'','172.18.0.5'),('un7m2fc3h7pl32s71hhgln8v88',1607095396,'','172.18.0.5'),('undekap7kau41pmboebi15q354',1607094939,'','172.18.0.5'),('unf3sir2vgohrc19nfg640cj5t',1607176688,'','172.18.0.2'),('uo517a1kmpv28u9sb6blhabict',1607094623,'','172.18.0.5'),('uoo8emsnegdft3omr86r7tda0g',1607095347,'','172.18.0.5'),('uq7q7raa92aghj2uf3gakfj3oh',1607171103,'','172.18.0.2'),('uqf6h45ihgc4vsp4av4ansl8mv',1607094670,'','172.18.0.5'),('uqnm0kk3ddvuhc32hvdea6k9ft',1607093516,'','172.18.0.5'),('urnpa5v61g2cej8nvavnet86pn',1607094416,'','172.18.0.5'),('us6c6vmu579da5j5iag8lahgs5',1607168801,'','172.18.0.2'),('us6q7neb0709t06c6qu1f8buia',1607094822,'','172.18.0.5'),('usamjj0f9ji2jd0pnmog10sa6h',1607173895,'','172.18.0.2'),('utn5e26mejnfq9iiukn8d7s2u8',1607174871,'','172.18.0.2'),('uubb1s6t8vp6vvh9lpn5qieq2s',1607173152,'','172.18.0.2'),('v000923pe7q6huithuh8pgteg6',1607093516,'','172.18.0.5'),('v1pce0fphlks4rbmekev7kqr3m',1607094822,'','172.18.0.5'),('v29u348nejf88koor0oh4qa1ui',1607173276,'','172.18.0.2'),('v2om42pbgvn3dn0p5b3jimchf9',1607093330,'','172.18.0.5'),('v38281hmhdeskpfudhfp9s89ru',1607169807,'','172.18.0.2'),('v49eufdm62pa1dnthtlcpssvaa',1607095001,'','172.18.0.5'),('v4a2qheec7vuuuclpbguult3rd',1607183360,'','172.18.0.2'),('v4fjpb05235r77m9brdc84sbum',1607183365,'','172.18.0.2'),('v4i3or1phk8skncouuv96irv49',1607173276,'','172.18.0.2'),('v4k7c9b18kqigskpjorli4bc54',1607094841,'','172.18.0.5'),('v60ffphatdovc0fbd1ol12s45v',1607094610,'','172.18.0.5'),('v694ab5koddgf3m0g39lpkrqf7',1607093889,'','172.18.0.5'),('v7c2tbml15v25a27294gd3v776',1607173276,'','172.18.0.2'),('v7krrqdspgbrpmsnlnnetni64b',1607093331,'','172.18.0.5'),('v7uprt8us4324qu2b61iuj3f7l',1607094622,'','172.18.0.5'),('v80aphrb2d2t52ub2chkrovum1',1607094939,'','172.18.0.5'),('v981lpk3jra8blbs01j15euou4',1607093517,'','172.18.0.5'),('v9cal41jgtevhk1ueip4cm6j24',1607095348,'','172.18.0.5'),('vaj8loo7v1b5smbhiu0hob6sro',1607095052,'','172.18.0.5'),('val1564g7uf81e39tk8fbn8mls',1607095169,'','172.18.0.5'),('vav0m8dm82qvpcc64cc4s3b8uj',1607094623,'','172.18.0.5'),('vbct5thst3h0dkk7e6qevmknnd',1607095170,'','172.18.0.5'),('vbdi8nf7b5ue7b1k7h98jkgvv3',1607176683,'','172.18.0.2'),('vbtflsotrgknlmabim47ouq24l',1607183366,'','172.18.0.2'),('vdtsp4b3orvuonk2292r4v2u97',1607093517,'','172.18.0.5'),('vemq0g8dofsctfb1svs2gu2c5p',1607095052,'','172.18.0.5'),('vffdqbo8s93ukccnc641qnom92',1607093331,'','172.18.0.5'),('vfokl1719ad7jff7qqd250k8se',1607176683,'','172.18.0.2'),('vh45hu6jd7ibr8qkq5v4djuegl',1607173152,'','172.18.0.2'),('vhum2rdr3pmi6gdagjsc8ojum1',1607094622,'','172.18.0.5'),('vi9eu1uf20bjdbmt654u6k8de1',1607174536,'','172.18.0.2'),('vibhiokhlu1vtdkqm43elkqavk',1607093922,'','172.18.0.5'),('vjir4raj4tkgjqq0snos9cagtm',1607095348,'','172.18.0.5'),('vjv046nvgene83ivhj9kgo2e0c',1607173057,'','172.18.0.2'),('vkhn6aqkclq98dnkgirpfjgk1h',1607093330,'','172.18.0.5'),('vkuf5lq047k5l19mqiudehul7n',1607183365,'','172.18.0.2'),('vmbqnqqh3n3roqe6gl2t8vmig6',1607170088,'','172.18.0.2'),('vmkjc7p52ncdjo1hehj5856fns',1607093517,'','172.18.0.5'),('vml3lmn9hnpp73g7c2jo61r30d',1607170206,'','172.18.0.2'),('vn0o564s419sunimunh283895v',1607094940,'','172.18.0.5'),('vpdchhu7v46jashfeahqhlnu32',1607094416,'','172.18.0.5'),('vpigsopioh0tegafg9l3v8v0e7',1607094623,'','172.18.0.5'),('vpqlgl2l9cp0rhc0t95n95n9kc',1607174773,'','172.18.0.2'),('vqfnq96i9vvo9k09gdp5mqm8dq',1607173276,'','172.18.0.2'),('vslul0g0c6fkd4tb98tgf4hnm0',1607170088,'','172.18.0.2'),('vt68saod2c890kqmmnctuspul1',1607094822,'','172.18.0.5'),('vtedmn80pt4rgdsl5d6g1rsnop',1607183359,'','172.18.0.2'),('vtv3ija3659v2jcb65ob8v271l',1607094821,'','172.18.0.5'),('vuki5cvdtbk3ej3ubsfrcsl3bm',1607171103,'','172.18.0.2'),('vutgla4ce818eve158jiookddb',1607176682,'','172.18.0.2'),('vvo6qae2mak8r0ul8p99gkblir',1607170984,'','172.18.0.2');
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
INSERT INTO `users` VALUES (1,'Admin',1,'$6$rounds=3000$fPjzAjTagh02KXUu$Ei5x75utSIu/gTFzp3wWVz3qDqu2FQQskxIDouGiKSCnTnq4G30K/lZbPTQRy4X0/GMKigpF3JHNu0uSyI6of1','','Administrator','phpIPAM Admin','admin@domain.local','0','statistics;favourite_subnets;changelog;access_logs;error_logs;top10_hosts_v4',9,NULL,'No','No','No','No','2020-12-05 15:37:01','2020-12-05 13:09:13','2020-12-05 16:37:01','default',0,'Dynamic',1,0,NULL,'',NULL,NULL,'{\"vlan\":\"1\",\"vrf\":\"1\",\"pdns\":\"1\",\"circuits\":\"1\",\"racks\":\"1\",\"nat\":\"1\",\"pstn\":\"1\",\"customers\":\"1\",\"locations\":\"1\",\"devices\":\"1\"}',1);
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

-- Dump completed on 2020-12-05 15:55:07
