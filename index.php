<?php
/* ob_start(); */
session_start();
if (!empty($_SESSION['username'])){
	header("location:admin.php?menu=home");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="bootstrap-4/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style-index.css">
	<script src="bootstrap-4/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap-4/js/popper.min.js"></script>
    <script src="bootstrap-4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="izitoast/dist/css/iziToast.min.css">
	<script src="izitoast/dist/js/iziToast.min.js" type="text/javascript"></script>

	<title>Apotek Web Catalog</title>
	<link rel="icon" type="image/png" href="img/logo_apotik.png" sizes="16x16"/>
</head>
<body>

<div class="container">
	<img class="logo" src="img/logo_apotik.png" alt="">
	<h4 class="text-center">Selamat Datang!</h4>
	<div class="row">
		<!-- <div class="col-sm-4">&nbsp;</div> -->
		<div class="col-sm">
			<form method="POST">
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" id="username" name="username">
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" class="form-control" id="password" name="password">
				</div>
				<button type="submit" name="login" class="btn-login btn btn-outline-success btn-block">Login</button><br>
				<button type="submit" name="guest" class="guest btn-login btn btn-success btn-block">Login sebagai Pengunjung</button>
			</form>
			
		</div>
		<!-- <div class="col-sm-4">&nbsp;</div> -->
	</div><!-- end row -->
</div> <!-- end container -->

<?php if(isset($_GET['login'])=="gagal"){?>
	<script>
		iziToast.error({
			title: 'Login Gagal!',
			message: 'Username atau Password Salah! Silahkan coba lagi.',
			position: 'topCenter',
			timeout: 5000,
			transitionIn: 'bounceInUp',
    		transitionOut: 'fadeOutUp'
		});
	</script>
<?php } ?>

<?php 
include "koneksi.php";
if(isset($_POST['login'])){ //jika tombol submit di klik
	$username = $_POST['username'];
	$pass     = md5($_POST['password']);
	$login=mysqli_query($koneksi,"SELECT * FROM user WHERE username='$username' AND password='$pass' ");
	//utk mengetahui jumlah baris dari $login
	$ketemu=mysqli_num_rows($login);
	$r=mysqli_fetch_array($login);
	// Apabila username dan password ditemukan
	if ($ketemu > 0){  
	  $_SESSION['username']     = $r['username'];
	  $_SESSION['nama_lengkap']  = $r['nama_lengkap'];
	  $_SESSION['sebagai']  = $r['sebagai'];
	  $_SESSION['login_success_notif'] = false;
	  
	  header("location:admin.php?menu=home");
	}else{
	  header("location:index.php?login=gagal");
	}
}

elseif(isset($_POST['guest'])){
	$username = "guest";
	$pass     = md5("guest");
	$login=mysqli_query($koneksi,"SELECT * FROM user WHERE username='$username' AND password='$pass' ");
	//utk mengetahui jumlah baris dari $login
	$ketemu=mysqli_num_rows($login);
	$r=mysqli_fetch_array($login);
	// Apabila username dan password ditemukan
	if ($ketemu > 0){  
	  $_SESSION['username']     = $r['username'];
	  $_SESSION['nama_lengkap']  = $r['nama_lengkap'];
	  $_SESSION['sebagai']  = $r['sebagai'];
	  $_SESSION['login_success_notif'] = false;
	  
	  header("location:admin.php?menu=home");
	}else{
	  header("location:index.php?login=gagal");
	}
}
	

?>
    
</body>
</html>