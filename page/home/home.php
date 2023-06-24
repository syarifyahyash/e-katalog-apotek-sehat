<!--main content start-->
<div class="jumbotron" style="margin-top: 90px;">
  <h1 class="display-4">Selamat Datang!</h1>
  <h1 class="h4"> Halo, <?php echo $_SESSION['nama_lengkap'];?></h1>
  <p class="lead">Halaman ini adalah Halaman Dashboard Website Apotik Sehat</p>
  <hr class="my-4">
  <p>Pada Sesi Ini, anda menggunakan Akun <?php echo $_SESSION['sebagai'];?></p>
  <a class="btn btn-danger btn-md" href="logout.php" role="button"> Ganti Akun </a>
</div>