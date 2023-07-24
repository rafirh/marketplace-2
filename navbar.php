<!-- 	<?php

			$id_pelanggan = $_SESSION["pelanggan"]["id_pelanggan"];
			$ambil = $koneksi->query("SELECT * FROM pelanggan WHERE id_pelanggan='$id_pelanggan'");
			$pecah = $ambil->fetch_assoc(); ?>
 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<!-- NAVBAR -->
<style>

</style>
<div class="navbar navbar-fixed-top navbar-expand-lg navbar-dark bg-dark hoverable">
	<nav>
		<div class="container">
			<div class="nav-wrapper">
				<a href="index.php" class="brand-logo center"><img src="assets/img/homepage/jejak.png" width="50" height="50"></a>
				<a href="#" data-target="mobile-nav" class="sidenav-trigger"><i class="material-icons">menu</i></a>
				<ul id="nav-mobile" class="left hide-on-med-and-down">
					<li>
						<a href="index.php" class="text-decoration-none">Home</a>
					</li>
					<li>
						<a href="keranjang.php" class="text-decoration-none">Keranjang</a>
					</li>
					<li>
						<a href="riwayat.php" class="text-decoration-none">Riwayat Belanja</a>
					</li>


				</ul>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
					<li>
						<a href="checkout.php" class="text-decoration-none">Checkout</a>
					</li>
					<!-- Jika sudah login ada session penjual-->
					<?php if (isset($_SESSION['pelanggan'])) : ?>
						<li>
							<a class="text-decoration-none" tabindex="-1" aria-disabled="true" href="penjual/index.php" name="jual">Jual</a>
						</li>

						<!-- Selain itu (belom login || belom ada session penjual) -->
					<?php else : ?>
						<li>
							<a href="daftar.php" class="text-decoration-none" tabindex="-1" aria-disabled="true">Daftar</a>
						</li>
					<?php endif ?>
					<!-- Jika sudah login ada session pelanggan-->
					<?php if (isset($_SESSION['pelanggan'])) : ?>
						<li>
							<a href="logout.php" class="text-decoration-none" tabindex="-1" aria-disabled="true">Logout</a>
						</li>
						<!-- Selain itu (belom login || belom ada session pelanggan) -->
					<?php else : ?>
						<li>
							<a href="login.php" class="text-decoration-none" tabindex="-1" aria-disabled="true">Login</a>
						</li>
					<?php endif ?>
				</ul>
			</div>
		</div>
	</nav>
</div>

<!-- Sidenav -->
<ul class="sidenav" id="mobile-nav">
	<li>
		<a class="nav-link" href="keranjang.php"><i class="material-icons">shopping_cart</i>Keranjang</a>
	</li>
	<li>
		<a class="nav-link" href="riwayat.php"><i class="material-icons">assignment</i>Riwayat Belanja</a>
	</li>
	<li>
		<a class="nav-link" href="checkout.php"><i class="material-icons">payment</i>Checkout</a>
	</li>
	<li>
		<a class="nav-link" href="penjual/index.php"><i class="material-icons">store_mall_directory</i>Jual</a>
	</li>
	<!-- Jika sudah login ada session pelanggan-->
	<?php if (isset($_SESSION['pelanggan'])) : ?>
		<li class="nav-item">
			<a class="nav-link" href="logout.php" tabindex="-1" aria-disabled="true"><i class="material-icons">exit_to_app</i>Logout</a>
		</li>
		<!-- Selain itu (belom login || belom ada session pelanggan) -->
	<?php else : ?>
		<li class="nav-item">
			<a class="nav-link" href="login.php" tabindex="-1" aria-disabled="true"><i class="material-icons">assignment</i>Login</a>
		</li>
	<?php endif ?>
</ul>

<!-- Slider -->