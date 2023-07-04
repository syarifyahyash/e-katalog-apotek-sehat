<?php
include 'koneksi.php';

// Bagian Home
if ($menu=='home'){
	include "page/home/home.php";
}

// Bagian data_obat
elseif ($menu=='data_obat'){
  if($_SESSION['sebagai'] == "ADMIN"){
    include "page/data_obat/data_obat.php";
  } else {
    include "page/data_obat/data_obat2.php";
  }
}

// Bagian jadwal
elseif ($menu=='jadwal'){
    include "page/jadwal/jadwal.php";   
}

// Apabila modul tidak ditemukan
else{
  echo "<h4 class='text-center' style='margin-top:60px;'><b>PAGE BELUM ADA ATAU BELUM LENGKAP ATAU ANDA TIDAK BERHAK 
  MENGAKSES HALAMAN INI</b></h4>";
}
?>
