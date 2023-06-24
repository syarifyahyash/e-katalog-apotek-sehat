<?php
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
				<button type="submit" name="login" class="btn-login btn btn-outline-success btn-block">Login</button>
			</form>
			
		</div>
		<!-- <div class="col-sm-4">&nbsp;</div> -->
	</div><!-- end row -->
</div> <!-- end container -->

<?php if(isset($_GET['login'])=="gagal"){?>
	<div class="">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
		<strong>Username atau Password Salah!</strong> <br> Silahkan coba lagi.
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		</div>
	</div>
	<style>
		.alert{
			position: absolute;
			top: 10px;
			left: 0;
			right: 0;
			margin: auto;
			width: 400px;
		}

	</style>
	<script>
    // Mengambil elemen alert
    const alertElement = document.querySelector('.alert');

    // Mengatur timeout untuk menghapus alert
    setTimeout(() => {
        alertElement.remove(); // Menghapus elemen alert dari DOM
    }, 3000); // Mengatur waktu delay dalam milidetik (dalam contoh ini 3000 ms = 3 detik)
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
	  
	  header("location:admin.php?menu=home");
	}else{
	  header("location:index.php?login=gagal");
	}
	
}
?>
    <script src="bootstrap-4/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap-4/js/popper.min.js"></script>
    <script src="bootstrap-4/js/bootstrap.min.js"></script>
</body>
</html>