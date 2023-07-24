<?php 	
session_start();
include 'koneksi.php';
?>
<!DOCTYPE html>
<html>
<head>
	<?php 	include "header.php" ;?>
	<title>LOGIN | Jejak.Kos</title>
	<body>
		<!--Navbar-->
		<?php include"navbar.php" ?>

		<!--FORM LOGIN-->
		<section class="vh-50">
  			<div class="container py-5 h-100">
    			<div class="row d-flex justify-content-center align-items-center h-100">
      				<div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-4 mt-2">
       					 <div class="card shadow-2-strong" style="border-radius: 1rem;">
						 <br>
        					  <div class="card-body p-3 text-center "
									<span class="card-title"><h3><center>LOGIN</center></h3></span>
										<span class="white-text">
											<form method="post">
												<br>
												<div class="input-field">
													<i class="material-icons prefix">email</i>
													<input id="icon_email" type="email" class="validate" name="email" required autocomplete="off">
													<label for="icon_email">Email</label>
												</div>
												<div class="input-field">
													<i class="material-icons prefix">lock</i>
													<input id="icon_lock" type="password" required class="validate" name="password">
													<label for="icon_lock">Password</label>
												</div>	
												<button class="btn bg-light right" name="login">Login</button>
											</form>
											<br><br><br>
            								<p style="color:black;">Don't have an account? <a href="daftar.php" class="link-info">Register here</a></p>

										</span>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
		<?php 	
// jika ada tombol login (tombol login ditekan)
		if (isset ($_POST["login"]))
		{
			$email = $_POST["email"];
			$password =sha1( $_POST["password"]);
	//lakukan query ngecek akun ditabel pelanggan di db
			$ambil = $koneksi-> query("SELECT * FROM pelanggan 
				WHERE email_pelanggan='$email' 
				AND password_pelanggan='$password' ");

	// ngitung akun yang terambil
			$akunyangcocok = $ambil->num_rows;

	//jika 1 akun yang cocok, maka diloginkan
			if ($akunyangcocok == true)
			{
		//anda sudah login
		//mendapatkan akun dalam array
				$akun = $ambil->fetch_assoc();
		// simpern di session pelanggan
				$_SESSION['pelanggan'] = $akun;
				if ($_SESSION['pelanggan']['status'] == 'penjual') {
					$status = 1;
				} else {
					$status = 0;
				}
				$penjual = 1;
				if ($status == $penjual) {
					$_SESSION['penjual'] = $_SESSION['pelanggan']['id_pelanggan'];
				}
				echo "<script>alert('anda berhasil login');</script>";

				// jika sudah belanja
				if (isset($_SESSION["keranjang"]) OR !empty($_SESSION["keranjang"]) ) 
				{
					echo "<script>location='checkout.php';</script>";
				}
				else{
					echo "<script>location='index.php';</script>";
				}
			}
			else
			{
		//anda gagal login
				echo "<script>alert('anda gagal login, periksa akun anda');</script>";
				echo "<script>location='login.php';</script>";
			}

			// if (isset($_SESSION['pelanggan'])) {
				
			// }

		}

		?>


	</body>
	</html>