<?php
session_start();
if (empty($_SESSION['username'])){
  header("location:index.php");
} 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	  <link rel="stylesheet" href="bootstrap-4/css/bootstrap.min.css">
	  <link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
    <link rel="stylesheet" href="css/style-obat.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <script src="bootstrap-4/js/popper.min.js"></script>
    <script src="bootstrap-4/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

  <link rel="stylesheet" href="izitoast/dist/css/iziToast.min.css">
	<script src="izitoast/dist/js/iziToast.min.js" type="text/javascript"></script>

    <script>
    $(document).ready( function () {
      $('#myTable').DataTable({
        lengthMenu: [3, 5, 7, 8,], // Menampilkan opsi entri: 10, 25, 50, 100
        pageLength: 7, // Jumlah entri yang ditampilkan secara default
        
      });
    } );
    $(document).ready( function () {
      $('#myTableJadwal').DataTable({
        lengthMenu: [7], // Menampilkan opsi entri: 10, 25, 50, 100
        pageLength: 7, // Jumlah entri yang ditampilkan secara default
        dom : rt
        
      });
    });
    </script>  

    <title>E-KAS | Home</title>
    <link rel="icon" type="image/png" href="img/logo_apotik.png" sizes="16x16"/>
  
</head>
<body class="mt-5">
  <?php
  if ($_SESSION['login_success_notif'] == false)  {
  // Tampilkan notifikasi
  ?>
  <script>
      iziToast.success({
          title: 'Login Berhasil!',
          message: 'Selamat Datang <?php echo $_SESSION['username']; ?> ',
          position: 'topCenter',
          timeout: 5000,
          transitionIn: 'bounceInUp',
          transitionOut: 'fadeOutUp'
      });
  </script>
  <?php
  // Tandai notifikasi sudah ditampilkan
  $_SESSION['login_success_notif'] = true;
  }
  ?>

<?php 
include "menu.php";
?>

<div class="container">
  <?php 
  include "tengah.php";
  ?>
</div> <!-- container -->

<div class="mt-5"></div>

<!-- Footer -->
<footer>
  <!-- Copyright -->
  <div class="footer fixed-bottom text-center p-2" style="background-color: #dddddd;">
    © <?php echo date("Y"); ?> Copyright:
    <!-- <a class="text-reset fw-bold" href="https://unira.ac.id/">INFORMATIKA UNIRA</a> -->
    <a class="text-reset fw-bold" href="https://github.com/syarifyahyash">Muh. Syarif Yahya</a> &
    <a class="text-reset fw-bold" href="https://github.com/pecandu-oksigen">Abdul Adim Mubarok</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->

</body>
</html>
