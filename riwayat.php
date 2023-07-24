<?php
//koneksi ke database
session_start();
include 'koneksi.php';
if (!isset($_SESSION['pelanggan']) or empty($_SESSION['pelanggan'])) {
	echo "<script>alert('silahkan login');</script>";
	echo "<script>location='login.php';</script>";
	exit();
}

if (isset($_POST["diterima"])) {
	$id_pembelian = $_POST["id_pembelian"];
	$koneksi->query("UPDATE pembelian SET id_pengiriman=6 WHERE id_pembelian='$id_pembelian'");

	echo "<script>alert('barang sudah diterima');</script>";
	echo "<script>location='riwayat.php';</script>";
}


?>
<!DOCTYPE html>
<html>

<head>
	<?php include "header.php" ?>
	<title>Riwayat Belanja | Jejak.Kos</title>
</head>

<!-- navbar -->
<?php include "navbar.php" ?>
<!-- <pre><?php print_r($_SESSION) ?></pre> -->
<section class="riwayat">
	<div class="container">
		<h3 align="center">Riwayat Belanja <?php echo 	$_SESSION["pelanggan"]["nama_pelanggan"] ?></h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>NO</th>
					<th>TANGGAL</th>
					<th>STATUS</th>
					<th>TOTAL</th>
					<th>OPSI</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$nomor = 1;
				//mendapatkan id_pelanggan yang login dari session
				$id_pelanggan = $_SESSION["pelanggan"]['id_pelanggan'];
				$ambil = $koneksi->query("SELECT pb.*, pr.status_pengiriman as status 
				FROM pembelian pb JOIN pengiriman pr ON pr.id_pengiriman = pb.id_pengiriman
 				WHERE id_pelanggan='$id_pelanggan'");
				while ($pecah = $ambil->fetch_assoc()) {
				?>
					<tr>
						<td><?php echo 	$nomor; ?></td>
						<td><?php echo 	$pecah['tanggal_pembelian']; ?></td>
						<td><?php echo 	$pecah['status']; ?>
							<br>
						</td>
						<td>Rp.<?php echo 	number_format($pecah['total_pembelian']); ?></td>
						<td>
							<a href="nota.php?id=<?php echo $pecah['id_pembelian']; ?>" class="waves-effect text-light waves-light blue btn">NOTA</a>
							<?php if ($pecah["id_pengiriman"] == 5) : ?>
								<a href="pembayaran.php?id=<?php echo $pecah['id_pembelian']; ?>" class="text-light waves-effect  waves-light red btn">Input Pembayaran</a>
							<?php else : ?>
								<a href="lihat_pembayaran.php?id=<?php echo $pecah["id_pembelian"]; ?>" class="btn text-white btn-warning">
									lihat pembayaran
								</a>
							<?php endif ?>
							<?php if ($pecah["id_pengiriman"] == 2) : ?>
								<form method="post" style="display: inline-block;">
									<button class="btn btn-success" name="diterima" onclick="return confirm('apakah anda yakin barang sudah diterima?')">
										DITERIMA
									</button>
									<input type="hidden" name="id_pembelian" value="<?= $pecah["id_pembelian"] ?>">
								</form>
							<?php endif ?>
						</td>
					</tr>
					<?php $nomor++; ?>
				<?php 	} ?>
			</tbody>
		</table>
		<hr>
		<br><br><br>
		<a class="waves-effect waves-light teal btn right text-white" href="index.php">Home</a> <br> <br> <br>
	</div>
</section>
<div style="margin-top: 100px;"></div>
<!-- footer -->
<?php include "footer.php"; ?>