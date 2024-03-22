-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 03:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(152, 12, '::1', 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'CPU'),
(2, 'GPU'),
(3, 'Motherboard'),
(4, 'RAM'),
(5, 'SSD'),
(6, 'Case'),
(7, 'PSU'),
(8, 'Cooler');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'tankrashak38816@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Tanush', 'tankrashak38816@gmail.com', 'Kandivali East', 'Mumbai', 'Maharashtra', 400102, 'Mine', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'Seeddharth Dungar', 'seed@gmail.com', 'Kandivali', 'Mumbai', 'dhfhfh', 400067, 'ytrrgh', '111111111', '11/22', 1, 5000, 111);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 1, 1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Intel i7-5700EQ', 5000, 'Total Cores\r\n4\r\nTotal Threads\r\n8\r\n\r\nMax Turbo Frequency\r\n3.40 GHz\r\n\r\nIntel® Turbo Boost Technology 2.0 Frequency‡\r\n3.40 GHz\r\n\r\nProcessor Base Frequency\r\n2.60 GHz\r\n\r\nCache\r\n6 MB Intel® Smart Cache\r\n\r\nBus Speed\r\n5 GT/s\r\n\r\nTDP\r\n47 W\r\n', 'cpu1.png', 'CPU Intel i7-5700EQ'),
(2, 1, 3, 'Intel i7-10870H', 15000, 'Total Cores\r\n8\r\n\r\nTotal Threads\r\n16\r\n\r\nMax Turbo Frequency\r\n5.00 GHz\r\n\r\nIntel® Thermal Velocity Boost Frequency\r\n5.00 GHz\r\n\r\nIntel® Turbo Boost Max Technology 3.0 Frequency ‡\r\n4.80 GHz\r\n\r\nProcessor Base Frequency\r\n2.20 GHz\r\n\r\nCache\r\n16 MB Intel® Smart Cache\r\n\r\nBus Speed\r\n8 GT/s\r\n\r\nTDP\r\n45 W\r\n', 'cpu2.png', 'pc CPU Intel'),
(3, 1, 3, 'Intel i7-14700K', 40000, 'Total Cores\r\n20\r\n\r\n# of Performance-cores\r\n8\r\n\r\n# of Efficient-cores\r\n12\r\n\r\nTotal Threads\r\n28\r\n\r\nMax Turbo Frequency\r\n5.6 GHz\r\n\r\nIntel® Turbo Boost Max Technology 3.0 Frequency ‡\r\n5.6 GHz\r\n\r\nPerformance-core Max Turbo Frequency\r\n5.5 GHz\r\n\r\nEfficient-core Max Turbo Frequency\r\n4.3 GHz\r\n\r\nPerformance-core Base Frequency\r\n3.4 GHz\r\n\r\nEfficient-core Base Frequency\r\n2.5 GHz\r\n\r\nCache\r\n33 MB Intel® Smart Cache\r\n\r\nTotal L2 Cache\r\n28 MB\r\n\r\nProcessor Base Power\r\n125 W\r\n\r\nMaximum Turbo Power\r\n253 W\r\n', 'cpu3.png', 'Intel CPU i7-14700K'),
(4, 2, 3, 'GTX 1650', 5000, 'Video Memory\r\n4GB GDDR6\r\n\r\nEngine Clock\r\nOC mode : 1620 MHz (Boost Clock)\r\n\r\nGaming mode : 1590 MHz (Boost Clock)\r\n\r\nCUDA Core\r\n896\r\n\r\nMemory Speed\r\n12 Gbps\r\n\r\nMemory Interface\r\n128-bit\r\n\r\nResolution\r\nDigital Max Resolution 7680 x 4320\r\n', 'gpu1.png', 'GPU GTX 1650'),
(5, 2, 2, 'RTX 3070', 20000, 'Video Memory\r\n8GB GDDR6\r\n\r\nEngine Clock\r\nOC Mode - 1755 MHz (Boost Clock)\r\n\r\nGaming Mode - 1725 MHz (Boost Clock)\r\n\r\nCUDA Core\r\n5888\r\n\r\nMemory Speed\r\n14 Gbps\r\n\r\nMemory Interface\r\n256-bit\r\n\r\nResolution\r\nDigital Max Resolution 7680 x 4320\r\n', 'gpu2.png', 'GPU RTX 3070'),
(6, 2, 1, 'RTX 4090', 150000, 'Video Memory\r\n24GB GDDR6X\r\nEngine Clock\r\nOC mode: 2595 MHz\r\nDefault mode: 2565 MHz (Boost Clock)\r\nCUDA Core\r\n16384\r\nMemory Speed\r\n21 Gbps\r\nMemory Interface\r\n384-bit\r\nResolution\r\nDigital Max Resolution 7680 x 4320\r\n', 'gpu3.png', 'GPU RTX 4090'),
(7, 3, 1, 'Zeb-H61, Socket 1155', 3800, 'Processor support Supports Intel® i7/i5/i3/Pentium/Celeron processors in LGA1155\r\nChipset	Intel® H61Chipset\r\nMemory support	2 DDR3 dual-channel slots, Support DDR3 1066/1333/1600MHz memory\r\nLAN	Supports Realtek 8106E 10/100 Mbps\r\nAudio	Realtek 662 3xAudio Jacks for 6 channel High definition audio\r\nBack panel	1 PS/2 mouse/keyboard port, 1 VGA port, 1HDMI port, 4 USB 2.0 ports, 1 LAN port, 3 audio jacks\r\n', 'mobo1.png', 'Motherboard Zeb-H61, Socket 1155 PC'),
(8, 3, 4, 'Asus ROG Strix X670E-F Gaming WiFi Motherboard', 40000, 'PLATFORM\r\nAMD\r\n\r\nSOCKET\r\nAM5\r\n\r\nChipset\r\nX670\r\n\r\nSUPPORTED MEMORY \r\nTYPE\r\nDDR5\r\n\r\nMAX MEMORY SUPPORT\r\n128 GB\r\n\r\nFORM FACTOR\r\nATX\r\n', 'mobo2.png', 'Motherboard Asus ROG Strix X670E-F Gaming WiFi Motherboard PC'),
(9, 5, 3, 'Crucial P3 1TB PCIe M.2 NVMe Gen 3 SSD CT1000P3SSD8', 5380, 'Form Factor	\r\nM.2 2280\r\nCapacity	\r\n1TB\r\nMemory Components\r\n3D NAND\r\nInterface	\r\nPCI-Express 3.0 x4 NVMe\r\nMax Sequential Read\r\nUp to 3500 MBps\r\n', 'ssd1.png', 'SSD Storage Crucial P3 1TB PCIe M.2 NVMe Gen 3 SSD CT1000P3SSD8'),
(10, 4, 6, 'G.Skill Trident Z5 RGB 32GB (2 * 16GB) DDR5 6000 MHz CL36-36-36-96 1.35V', 22000, 'Memory Type\r\nDDR5 \r\nCapacity\r\n32GB (2x16GB)\r\nTested Speed\r\n6000 MHz \r\nTested Latency\r\n36-36-36-96\r\nTested Voltage\r\n1.35V\r\nSPD Speed\r\n4800MHz\r\nSPD Voltage\r\n1.10V\r\n', 'ram1.png', 'RAM G.Skill Trident Z5 RGB 32GB (2 * 16GB) DDR5 6000 MHz CL36-36-36-96 1.35V '),
(11, 4, 6, 'Patriot Memory Viper Steel DDR4 4400MHz CL19 Desktop Memory 16GB (2x8GB) Kit 1.45V', 15000, 'Memory Type\r\nDDR4\r\nCapacity\r\n16GB (2x8GB)\r\nTested Speed\r\n4400 MHz \r\nTested Timings\r\n19-21-21-41\r\nVoltage: 1.35V\r\n', 'ram2.png', 'RAM Patriot Memory Viper Steel DDR4 4400MHz CL19 Desktop Memory 16GB (2x8GB) Kit 1.45V'),
(12, 6, 6, 'Corsair Carbide Series CC-9011050-WW Mid-Tower Steel Gaming Case with Red LED (Black)', 5500, 'Brand	\r\nCorsair\r\nMotherboard\r\nCompatibility\r\nATX\r\nCase Type\r\nMidi Tower\r\nColour	\r\nBlack\r\nMaterial\r\nAlloy Steel\r\n', 'case1.png', 'CASE Corsair Carbide Series CC-9011050-WW Mid-Tower Steel Gaming Case with Red LED (Black)'),
(13, 6, 6, 'Antec GX202 Mid-Tower ATX Computer Cabinet/Gaming Case', 4000, 'Brand	\r\nAntec\r\nMotherboard Compatibility\r\nATX\r\nCase Type\r\nMid Tower\r\nColor\r\nBlue,White,Transparent,Black\r\nMaterial\r\nPlastic\r\n', 'case2.png', 'CASE Antec GX202 Mid-Tower ATX Computer Cabinet/Gaming Case'),
(14, 7, 6, 'Deepcool PM750D', 12000, 'Brand	\r\nDeepCool\r\nCompatible Devices\r\nGaming PC\r\nConnector Type	\r\nATX\r\nOutput Wattage\r\n750 Watts\r\n', 'psu1.png', 'PSU Deepcool PM750D'),
(15, 7, 6, 'Deepcool PQ1000M', 21000, 'Brand\r\nDeepCool\r\nCompatible Devices\r\nGaming PC, PC\r\nConnector Type	\r\nATX, EPS, SATA\r\nOutput Wattage\r\n1000\r\nForm Factor\r\nATX\r\n', 'psu2.png', 'PSU Deepcool PQ1000M'),
(16, 8, 6, 'Deepcool LE500 240mm LED Liquid CPU Cooler', 8000, 'Product Dimensions	\r\n35L x 13.6W x 25H Centimeters\r\nBrand	\r\nDeepCool\r\nPower Connector Type	\r\n3-Pin\r\nVoltage	\r\n12 Volts\r\nWattage\r\n1.32 Watts\r\n', 'cooler1.png', 'Cooler Deepcool LE500 240mm LED Liquid CPU Cooler'),
(17, 8, 6, 'Deepcool AG400 LED Single Tower 120 mm CPU Air Cooler', 2600, 'Product Dimensions\r\n12L x 2.5W x 12H\r\nCentimeters\r\nBrand\r\nDeepCool\r\nPower Connector Type\r\n4-Pin\r\nVoltage\r\n12 Volts\r\nWattage\r\n3.36 Watts\r\n', 'cooler2.png', 'Cooler Deepcool AG400 LED Single Tower 120 mm CPU Air Cooler');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Tanush', 'Krashak', 'tankrashak38816@gmail.com', 'tanush', '9999999999', 'mumbai', 'sdcjns,djc'),
(26, 'Seeddharth', 'Dungar', 'seed@gmail.com', 'nmims@1234', '9392654738', 'Kandivali', 'Mumbai'),
(27, 'malhar', 'gotad', 'abc@gmail.com', 'abc123ABC', '9392654738', 'Kandivali', 'Mumbai');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Tanush', 'Krashak', 'tankrashak38816@gmail.com', 'tanush', '9999999999', 'mumbai', 'sdcjns,djc'),
(26, 'Seeddharth', 'Dungar', 'seed@gmail.com', 'nmims@1234', '9392654738', 'Kandivali', 'Mumbai'),
(27, 'malhar', 'gotad', 'abc@gmail.com', 'abc123ABC', '9392654738', 'Kandivali', 'Mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
