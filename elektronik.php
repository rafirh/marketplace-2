<?php 
//koneksi ke database
session_start();
include"koneksi.php";

//jika tidak ada session pelanggan (belom login) maka dilarikan ke login.php
if (!isset($_SESSION['pelanggan'])) 
{
	echo "<script>alert('anda belom login');</script>";
	echo "<script>location='login.php';</script>";
}


?>
<!DOCTYPE html>
<html>
<head>
	<?php include "header.php" ?>
	
</head>
<body>
	<!--Navbar-->
	<?php include"navbar.php" ?>
	<br>	
	<section class="konten">
		<div class="container ">
		<div class="row md3">
			<br><br><br><br><br>
			<h1 class="center-align"><strong>ELEKTRONIK</h1></strong>
			<br><br><br><br><br>
			<?php $ambil=$koneksi->query("SELECT * FROM produk 
			JOIN kategori ON produk.id_kategori=kategori.id_kategori
			JOIN toko ON produk.id_toko=toko.id_toko
			ORDER BY id_produk DESC
			 "); ?>
		<?php while($perproduk = $ambil->fetch_assoc()){ ?>
				<div class="col-md-3">
					<div class=" responisve-card card hoverable">
						<div class="card-image waves-effect waves-block waves-light">
							<center>												
									<p><strong><?php echo $perproduk['nama_produk']; ?></strong></p>
								<img class="responsive-img activator" src="assets/img/produk/<?php echo $perproduk['foto_produk']; ?>" style="height: 100px; width: 100px;" id="gambarr">
								</div>
							</center>
							<div class="card-content md-3">
								<h6><b><a href="toko.php?id=<?php echo $perproduk['id_toko']?>"><?php echo $perproduk['nama_toko']; ?></a></b></h6>	
								<h6>kategori : <?php echo $perproduk['nama_kategori'] ?> </h6>
								<p>stok : <?php if ($perproduk['stok_produk'] < 1 ): ?>
									<?php echo 	'habis'; ?>
									<?php else: ?>	
										<?php echo $perproduk['stok_produk'] ?>
								<?php endif; ?> 
									
								</p>
								<span class="harga">
									<h5>Rp.<?php echo number_format($perproduk['harga_produk']); ?></h5>
								</span> 
								<hr>
								<div class="card-action">
									<?php if ($perproduk['stok_produk'] < 1 ): ?>
									<a href="detail.php?id=<?php echo $perproduk['id_produk']; ?>" 
										class="btn waves-effect waves-light left green disabled">Detail</a>
									<a href="beli.php?id=<?php 	echo $perproduk['id_produk']; ?>" class="btn waves-effect waves-light right disabled">beli</a></span>
									<?php else: ?>	
									<a href="detail.php?id=<?php echo $perproduk['id_produk']; ?>" 
										class="btn waves-effect waves-light left green ">Detail</a>
										<a href="beli.php?id=<?php 	echo $perproduk['id_produk']; ?>" class="btn waves-effect waves-light right">beli</a></span>
									<?php 	endif; ?>		
									</div>
								</div>
							</div>
						</div>
					<?php 	} ?>
				</div>	
				</div>
			</div>
		</section>
