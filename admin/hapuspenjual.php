<?php 
	$ambil = $koneksi->query("SELECT * FROM toko WHERE id_toko='$_GET[id]' ");
	$pecah= $ambil->fetch_assoc();
	$fotopenjual = $pecah['foto_toko'];
	if(file_exists("../toko/$fototoko"))
	{
		unlink("../toko/$fototoko");
	}

	$koneksi->query("DELETE FROM toko WHERE id_toko='$_GET[id]' ");

	echo "<script>alert('toko terhapus');</script>";
	echo "<script>location='index.php?halaman=penjual';</script>";
 ?>

