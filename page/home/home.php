<!--main content start-->
<div class="jumbotron" style="margin-top: 90px;">
  <h1 class="display-4">Selamat Datang!</h1>
  <h1 class="h4"> Halo, <?php echo $_SESSION['nama_lengkap'];?></h1>
  <p class="lead">Halaman ini adalah Halaman Dashboard Website E-Katalog Apotik Sehat</p>
  <hr class="my-4">

<?php
  if($_SESSION['sebagai'] == "GUEST" && $_SESSION['username'] == "guest"){
    echo "<p>Pada Sesi Ini, anda menggunakan Akun " . $_SESSION['sebagai'] . "</p>";
  } else {
    echo "<p>Pada Sesi Ini, anda menggunakan Akun " . $_SESSION['sebagai'] . "</p>";
  ?>
    <a class="btn btn-danger btn-md" href="logout.php" role="button"> Ganti Akun </a>
  <?php
  }
  ?>
  
</div>

