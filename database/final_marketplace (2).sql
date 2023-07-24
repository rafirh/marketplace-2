-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 03:34 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `foto_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`, `foto_admin`) VALUES
(1, 'jejakkos', 'jejakkos', 'Bela Sari', 'admin.png');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `price` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `description`, `price`, `image`, `created`, `modified`) VALUES
(12345678, 'iPhone 6s (Space Grey)', '<ul style=\"margin:0px;padding:15px;\">\r\n				<li>32 GB ROM |</li>\r\n				<li>11.94 cm (4.7 inch) Retina HD Display</li>\r\n				<li>12MP Rear Camera | 5MP Front Camera</li>\r\n				<li>Apple A9 64-bit processor and Embedded M9 Motion Co-processor</li>\r\n				<li>Brand Warranty of 1 Year</li>\r\n			</ul>	', 34000, 'apple-iphone-6s.jpeg', '0000-00-00 00:00:00', '2019-01-19 07:13:04'),
(12345679, 'iPhone 6s (Silver)', '<ul style=\"margin:0px;padding:15px;\">\r\n				<li>32 GB ROM |</li>\r\n				<li>11.94 cm (4.7 inch) Retina HD Display</li>\r\n				<li>12MP Rear Camera | 5MP Front Camera</li>\r\n				<li>Apple A9 64-bit processor and Embedded M9 Motion Co-processor</li>\r\n				<li>Brand Warranty of 1 Year</li>\r\n			</ul>	', 30000, 'apple-iphone-6.jpeg', '0000-00-00 00:00:00', '2019-01-19 07:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `item_rating`
--

CREATE TABLE `item_rating` (
  `ratingId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ratingNumber` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Block, 0 = Unblock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item_rating`
--

INSERT INTO `item_rating` (`ratingId`, `itemId`, `userId`, `ratingNumber`, `title`, `comments`, `created`, `modified`, `status`) VALUES
(14, 12345678, 1, 2, 'its awesome', 'It\'s awesome!!!', '2018-08-19 09:13:01', '2018-08-19 09:13:01', 1),
(15, 12345678, 2, 5, 'Nice product', 'Really quality product!', '2018-08-19 09:13:37', '2018-08-19 09:13:37', 1),
(16, 12345678, 3, 1, 'best buy', 'its\'s best but item.', '2018-08-19 09:14:19', '2018-08-19 09:14:19', 1),
(17, 12345678, 4, 1, 'super awesome ', 'i think its supper products', '2018-08-19 09:18:00', '2018-08-19 09:18:00', 1),
(22, 12345679, 5, 1, 'adada', 'daDad', '2019-01-20 17:00:58', '2019-01-20 17:00:58', 1),
(23, 12345678, 5, 5, 'Nice product', 'this is nice!', '2019-01-20 17:01:37', '2019-01-20 17:01:37', 1),
(24, 12345679, 3, 1, 'really nice', 'Good!', '2019-01-20 21:06:48', '2019-01-20 21:06:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_users`
--

CREATE TABLE `item_users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_users`
--

INSERT INTO `item_users` (`userid`, `username`, `password`, `avatar`) VALUES
(1, 'rose', '123', 'user1.jpg'),
(2, 'smith', '123', 'user2.jpg'),
(3, 'adam', '123', 'user3.jpg'),
(4, 'merry', '123', 'user4.jpg'),
(5, 'katrina', '123', 'user5.jpg'),
(6, 'rhodes', '123', 'user6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'pakaian'),
(3, 'perabotan rumah'),
(4, 'aksesoris'),
(5, 'peralatan masak'),
(6, 'lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(50) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `jk_pelanggan` enum('pria','wanita','','') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat_pelanggan` text NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `foto_pelanggan` varchar(100) NOT NULL,
  `status` enum('pelanggan','penjual','','') NOT NULL DEFAULT 'pelanggan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `jk_pelanggan`, `tgl_lahir`, `alamat_pelanggan`, `telepon_pelanggan`, `foto_pelanggan`, `status`) VALUES
(6, 'alif@gmail.com', '25d2d1a12f3022baf3938961d3cf76ea1f8b95ec', 'alif', 'pria', '2000-12-12', 'lampung', '123123', '20230605133926jejak.kos (1).png', 'penjual'),
(9, 'alfa@gmail.com', '25d2d1a12f3022baf3938961d3cf76ea1f8b95ec', 'alfa', 'pria', '2003-05-18', 'ujungbatu', '08538777968', '20230617122853IMG_20200325_172235_449.jpg', 'pelanggan'),
(12, 'fovi@gmail.com', '25d2d1a12f3022baf3938961d3cf76ea1f8b95ec', 'povi anjeli', 'wanita', '2000-01-10', 'Tulang Bawang', '081254657321', '20230722094232popi.jpeg', 'pelanggan'),
(13, 'heni@gmail.com', '25d2d1a12f3022baf3938961d3cf76ea1f8b95ec', 'Heni novita', 'wanita', '1999-01-10', 'kotabumi', '081234537889', '20230722094822heni.jpg', 'pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` enum('mandiri','bca','bri','bni') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL,
  `id_toko` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`, `id_toko`) VALUES
(1, 2, 'bellaaaaa', 'mandiri', 15016000, '2023-06-22', '20210204060357mandiri.jpg', 'cOmpOn2021A301h9530'),
(2, 3, 'ilham ganteng', 'mandiri', 15016000, '2023-06-22', 'asassasas', '5'),
(3, 4, 'alif', 'mandiri', 150000, '2023-06-21', 'm', '8'),
(13, 36, 'alif', 'mandiri', 220012, '2023-06-17', '2023061710454120210204060357mandiri.jpg', '8'),
(14, 37, 'alif', 'bca', 220000, '2023-06-17', '2023061710482420210204191312bca.JPG', '8'),
(15, 38, 'alfa', 'bri', 12028000, '2023-06-17', '20230617123145_MG_0247.JPG', '8'),
(16, 40, 'alif', 'bri', 13015000, '2023-06-19', '2023061906112720210204060357mandiri.jpg', '8'),
(17, 41, 'alif', 'mandiri', 67000, '2023-06-19', '2023061910062420210204060440bni.jpg', '8'),
(18, 42, 'ilham', 'bri', 569000, '2023-07-20', '202307200714221.jpg', '6');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` varchar(30) NOT NULL,
  `id_toko` varchar(30) NOT NULL,
  `id_pengiriman` int(11) NOT NULL,
  `distrik_toko` varchar(50) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'sedang diproses'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_toko`, `id_pengiriman`, `distrik_toko`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`, `status_pembelian`) VALUES
(30, '2', '6', 0, '', '2023-06-07', 83333, 'kalimantan', '', 0, 'Kalimantan Tengah', 'Barito Timur', 'Kabupaten', '73671', 'tiki', 'ECO', 50000, '4', 'pending'),
(31, '2', '1', 0, '', '2023-06-15', 3030000, 'bubu', '', 0, 'Bangka Belitung', 'Bangka Tengah', 'Kabupaten', '33613', 'pos', 'Pos Reguler', 30000, '6 HARI', 'pending'),
(32, '2', '', 0, '', '2021-02-03', 12008000, '', '', 0, '', '', '', '', '', '', 0, '', 'pending'),
(33, '2', '', 0, '', '2021-02-03', 12008000, '', '', 500, '', '', '', '', '', '', 8000, '', 'pending'),
(34, '2', '6', 0, '', '2023-06-15', 100333, 'ban', '', 0, 'Kepulauan Riau', 'Bintan', 'Kabupaten', '29135', 'jne', 'REG', 67000, '3-6', 'pending'),
(35, '2', '1', 0, '', '2023-06-17', 19024, 'ffff', '', 0, 'Lampung', 'Bandar Lampung', 'Kota', '35139', 'tiki', 'REG', 19000, '2', 'pending'),
(36, '6', '8', 2, '', '2023-06-17', 220012, 'jj', 'RESI2023P906b6317', 0, 'Lampung', 'Lampung Timur', 'Kabupaten', '34319', 'tiki', 'ECO', 20000, '5', 'sedang dikirim'),
(37, '6', '8', 2, '', '2023-06-17', 220000, 'DDD', 'RESI2023Q306g3317', 0, 'Lampung', 'Lampung Timur', 'Kabupaten', '34319', 'tiki', 'ECO', 20000, '5', 'sedang dikirim'),
(38, '9', '8', 2, '', '2023-06-17', 12028000, 'ujungbatu', 'RESI2023K1006x8117', 0, 'Lampung', 'Lampung Utara', 'Kabupaten', '34516', 'jne', 'OKE', 28000, '4-7', 'selesai'),
(39, '6', '8', 0, '', '2023-06-18', 63000, 'ujungbatu', '', 0, 'Lampung', 'Tanggamus', 'Kabupaten', '35619', 'jne', 'OKE', 28000, '4-7', 'sedang diproses'),
(40, '6', '8', 2, '', '2023-06-19', 13015000, 'tubaba', 'RESI2023H1006u7219', 0, 'Jawa Barat', 'Cianjur', 'Kabupaten', '43217', 'jne', 'REG', 15000, '2-3', 'sedang diproses'),
(41, '6', '8', 2, '', '2023-06-19', 67000, 'bandarlampung', 'RESI2023M106r1519', 0, 'Lampung', 'Bandar Lampung', 'Kota', '35139', 'jne', 'OKE', 17000, '2-3', 'sedang diproses'),
(42, '8', '6', 2, '', '2023-07-20', 569000, 'kotabumi', 'RESI2023J207a5820', 0, 'Lampung', 'Bandar Lampung', 'Kota', '35139', 'tiki', 'REG', 19000, '2', 'sedang diproses'),
(43, '6', '8', 0, '', '2023-07-21', 405000, 'bengkulu', '', 0, 'Bengkulu', 'Bengkulu Tengah', 'Kabupaten', '38319', 'tiki', 'REG', 55000, '4', 'sedang diproses'),
(44, '8', '6', 0, '', '2023-07-21', 770000, 'bandarlamoung', '', 0, 'Lampung', 'Bandar Lampung', 'Kota', '35139', 'jne', 'REG', 20000, '1-2', 'sedang diproses');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_toko` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `id_toko`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(43, 29, 11, '1', 1, 'laptop', 3000000, 500, 500, 3000000),
(44, 30, 15, '6', 1, 'hhp', 33333, 33, 33, 33333),
(45, 31, 11, '1', 1, 'laptop', 3000000, 500, 500, 3000000),
(46, 34, 15, '6', 1, 'hhp', 33333, 33, 33, 33333),
(47, 35, 12, '1', 2, 'kk', 12, 50, 100, 24),
(48, 36, 12, '1', 1, 'kk', 12, 50, 50, 12),
(49, 36, 16, '8', 1, 'magicom', 200000, 30, 30, 200000),
(50, 37, 16, '8', 1, 'magicom', 200000, 30, 30, 200000),
(51, 38, 18, '8', 1, 'perabotan', 12000000, 20, 20, 12000000),
(52, 39, 20, '8', 1, 'Tas Laptop', 35000, 40, 40, 35000),
(53, 40, 21, '8', 1, 'IPhone 13', 13000000, 50, 50, 13000000),
(54, 41, 19, '8', 1, 'Box Susun', 50000, 30, 30, 50000),
(55, 42, 23, '6', 1, 'Printer', 500000, 150, 150, 500000),
(56, 42, 22, '6', 1, 'Kompor single', 50000, 90, 90, 50000),
(57, 43, 24, '8', 1, 'jam', 350000, 20, 20, 350000),
(58, 44, 25, '6', 2, 'Airpods', 350000, 10, 20, 700000),
(59, 44, 22, '6', 1, 'Kompor single', 50000, 90, 90, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `status_pengiriman` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`id_pengiriman`, `status_pengiriman`) VALUES
(1, 'sedang diproses'),
(2, 'barang dikirim'),
(4, 'belum dibayar');

-- --------------------------------------------------------

--
-- Table structure for table `product_rating`
--

CREATE TABLE `product_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `id_toko` varchar(30) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL,
  `stok_awal` int(11) NOT NULL,
  `phone` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `id_toko`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`, `stok_awal`, `phone`) VALUES
(16, 4, '8', 'Dompet Wanita', 150000, 20, 'dompetcewe.png.png', 'Dompet wanita mulus tidak ada minus', 0, 2, 0),
(17, 5, '8', 'Magicom', 150000, 10, 'magicom.png.png', 'Tidak ada cacat,Kualitas Baik', 5, 5, 0),
(18, 2, '8', 'Sweater', 50000, 20, 'sweater.png', 'Kondisi seperti baru', 1, 2, 0),
(19, 3, '8', 'Box Susun', 50000, 30, '20230617142420boxsusun.png.png', 'Tempat menyimpan barang-barang. Kualitas baik', 2, 3, 0),
(20, 4, '8', 'Tas Laptop', 35000, 40, '20230617142533taslaptop.png.png', 'Tas laptop muat laptop 14 inc. Kualitas barang baik tidak ada cacat', 0, 1, 0),
(21, 1, '8', 'IPhone 13', 13000000, 50, '20230617142901ip13.png.png', 'Hp seperti baru. Original. Tidak ada kerusakan barang bagus', 0, 1, 0),
(22, 5, '6', 'Kompor single', 50000, 90, '20230617143059kompor.png.png', 'Kualitas baik. Menyala dengan baik. Tidak ada kerusakan', 0, 2, 0),
(23, 1, '6', 'Printer', 500000, 150, '20230617143205printer.png.png', 'Printer seperti baru', 0, 1, 0),
(24, 4, '8', 'jam', 350000, 20, '20230716155713jam1.png.png', 'https://wa.link/qtjp3v', 1, 2, 0),
(25, 1, '6', 'Airpods', 350000, 10, '2023072108281320210131001528Apple_AirPods_Pro_-_White_1024x1024.png', 'Masih baru dn original', 0, 2, 0),
(26, 1, '6', 'Macbook', 9000000, 100, '2023072108291120210131001703macbook pro.png', 'Tidak ada kendala kualitas terjamin', 1, 1, 0),
(28, 1, '6', 'Iphone 12', 7000000, 500, '2023072108331020210131002554iphone-12-pro-max-blue-hero.png', 'Kualitas terjamin hp original', 5, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `review_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_rating` int(1) NOT NULL,
  `user_review` text NOT NULL,
  `datetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_table`
--

INSERT INTO `review_table` (`review_id`, `user_name`, `user_rating`, `user_review`, `datetime`) VALUES
(9, 'bela', 3, 'nice', 1689496876),
(10, 'alfa', 3, 'good', 1689507459),
(11, 'heni', 5, 'top', 1689829493);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(30) NOT NULL,
  `nama_toko` varchar(30) CHARACTER SET latin1 NOT NULL,
  `telepon_toko` varchar(15) CHARACTER SET latin1 NOT NULL,
  `email_toko` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nama_bank` enum('bca','bni','bri','mandiri') CHARACTER SET latin1 NOT NULL,
  `rek_bank` varchar(20) CHARACTER SET latin1 NOT NULL,
  `foto_toko` varchar(100) CHARACTER SET latin1 NOT NULL,
  `deskripsi_toko` varchar(255) CHARACTER SET latin1 NOT NULL,
  `provinsi_toko` varchar(50) CHARACTER SET latin1 NOT NULL,
  `distrik_toko` varchar(50) CHARACTER SET latin1 NOT NULL,
  `alamat_toko` varchar(100) CHARACTER SET latin1 NOT NULL,
  `bergabung` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `telepon_toko`, `email_toko`, `nama_bank`, `rek_bank`, `foto_toko`, `deskripsi_toko`, `provinsi_toko`, `distrik_toko`, `alamat_toko`, `bergabung`) VALUES
(1, 'Apple', '021456789012', 'AppleIndonesia@store.com', 'mandiri', '173112700650060', '20210131001059apple-removebg-preview.png', 'bagus', 'lampung', '', 'tubaba', '2023-06-05'),
(6, 'alf', '11111', 'a;if@gmail.com', 'bca', '123123123', '20230605182124pngwing.com (1).png', 'baik', 'Bangka Belitung', 'Bangka Barat', 'tubaba', '2023-06-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_rating`
--
ALTER TABLE `item_rating`
  ADD PRIMARY KEY (`ratingId`);

--
-- Indexes for table `item_users`
--
ALTER TABLE `item_users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12345680;

--
-- AUTO_INCREMENT for table `item_rating`
--
ALTER TABLE `item_rating`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `item_users`
--
ALTER TABLE `item_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `review_table`
--
ALTER TABLE `review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
