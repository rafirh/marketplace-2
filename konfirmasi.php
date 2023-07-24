<?php 
//koneksi ke database
 session_start();
 include'koneksi.php';
 ?>
 <!DOCTYPE html>
 <html>
 <head>
 		<?php include "header.php" ?>
 	<title>Konfirmasi | Jejak.Kos</title>
 </head>
<section>
 <!-- navbar -->
 <?php 	include"navbar.php" ?>
 
<h3 align="center"><br><br><br>TERIMAKASIH SUDAH BERBELANJA <?php echo 	$_SESSION["pelanggan"]["nama_pelanggan"] ?></h3>
<div style="margin-top: 100px;"></div>
</section>
<a class="waves-effect waves-light teal btn right"href="index.php">Selesai</a><br><br><br>


<br><br><br><br><br><br>
<!-- footer -->
<?php include"footer.php" ;?>
