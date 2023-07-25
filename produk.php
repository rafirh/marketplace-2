<?php
function cleanPhoneNumber($phone)
{
	$phone = str_replace('+', '', $phone);
	$phone = str_replace(' ', '', $phone);
	$phone = str_replace('-', '', $phone);
	$phone = str_replace('(', '', $phone);
	$phone = str_replace(')', '', $phone);
	if (!(substr($phone, 0, 2) == '62')) {
		$phone = '62' . substr($phone, 1);
	}
	return $phone;
}
?>

<style>
	section .section-title h1 {
		text-align: center;
		color: #007b5e;
		margin-bottom: 40px;
		font-size: 70px;
		text-transform: uppercase;
	}
</style>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<section id="highlights" class="highlights scrollspy">
	<div class="container">
		<h5 class="section-title h1" data-aos="fade-down" data-aos-duration="1000">PRODUK</h5>
		<hr class="garis">
		<div class="row md3">
			<?php $ambil = $koneksi->query("SELECT * FROM produk 
			JOIN kategori ON produk.id_kategori=kategori.id_kategori
			JOIN toko ON produk.id_toko=toko.id_toko
			ORDER BY id_produk DESC
			LIMIT 8 "); ?>
			<?php while ($perproduk = $ambil->fetch_assoc()) { ?>
				<div class="col-md-6">
					<div class=" responisve-card card hoverable p-3" data-aos="zoom-in" data-aos-duration="500">
						<div class="card-image waves-effect waves-block waves-light">
							<center>
								<p><strong><?php echo $perproduk['nama_produk']; ?></strong></p>
								<img class="responsive-img activator" src="assets/img/produk/<?php echo $perproduk['foto_produk']; ?>" style="height: 150px; width: 150px;" id="gambarr">
							</center>
						</div>
						<div class="card-content md-3">
							<h6><b><a href="toko.php?id=<?php echo $perproduk['id_toko'] ?>"><?php echo $perproduk['nama_toko']; ?></a></b></h6>
							<h6 class="mb-0">Kategori: <?php echo $perproduk['nama_kategori'] ?> </h6>
							<span class="text-muted">Stok: <?php if ($perproduk['stok_produk'] < 1) : ?>
									<?php echo 	'Habis'; ?>
								<?php else : ?>
									<?php echo $perproduk['stok_produk'] ?>
								<?php endif; ?>
							</span>
							<span class="harga">
								<h5 class="mt-2">Rp.<?php echo number_format($perproduk['harga_produk']); ?></h5>
							</span>
							<hr>
							<div class="d-flex justify-content-between mt-4">
								<?php if ($perproduk['stok_produk'] < 1) : ?>
									<a href="detail.php?id=<?php echo $perproduk['id_produk']; ?>" class="btn waves-effect waves-light left green disabled">Detail</a>
									<a href="beli.php?id=<?php echo $perproduk['id_produk']; ?>" class="btn waves-effect waves-light right disabled">Beli</a>
								<?php else : ?>
									<a href="detail.php?id=<?php echo $perproduk['id_produk']; ?>" class="btn waves-effect waves-light left green ">Detail</a>
									<a href="beli.php?id=<?php echo $perproduk['id_produk']; ?>" class="btn waves-effect waves-light right">Beli</a></span>
								<?php endif; ?>
								<a href="review.php?product_id=<?= $perproduk['id_produk'] ?>" class="btn waves-effect waves-light right">Review</a>
								<a href="http://wa.me/<?= cleanPhoneNumber($perproduk['telepon_toko']) ?>" target="_blank" rel="noopener noreferrer">
									<img src="./assets/img/whatsapp.svg" style="width: 30px; height: 30px;" title="Hubungi Penjual">
								</a>
							</div>
						</div>
					</div>
				</div>
			<?php 	} ?>
		</div>
	</div>
</section>

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
	AOS.init();
</script>
<br><br><br>