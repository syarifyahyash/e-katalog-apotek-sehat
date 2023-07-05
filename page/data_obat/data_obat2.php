<?php
include "koneksi.php";
$action=isset($_GET['submenu'])? $_GET['submenu'] :'';
?>
<head>
	<link rel="stylesheet" href="css/style-obat.css">
</head>
<h1 class="judul text-center" style="margin-top:60px;">Katalog Obat</h1>
<hr/>
<div class="row">
	<div class="col-sm">
	<h4 class="sub-judul">Data Obat</h4>
	<!-- <form method="POST" action="">
		<div class="input-group mb-3">
		<input type="text" name="kata" class="form-control" placeholder="Cari Nama Obat" autocomplete="off">
		<div class="input-group-append">
			<button class="btn btn-success btn-sm" id="cari" type="submit" name="cari">Cari</button>
		</div>
		</div>
	</form> -->
	<div class="table-responsive">
	<table id="myTable" class="table table-hover">
	<thead class="label-table">
		<tr>
			<th>No</th>
			<th class="col-sm-2">Nama Obat</th>
			<th>Kategori</th>
			<th>Indikasi</th>
			<th>Harga</th>
			<th>Stok</th>
			<th>Tgl Expired</th>
		</tr>
	  </thead>
	  <tbody>
	<?php 
	if(isset($_POST['cari'])){
		$kata = $_POST['kata'];
		$query=mysqli_query($koneksi, "SELECT * FROM obat WHERE nama_obat LIKE '%$kata%' ORDER BY nama_obat asc");
	}else{
		$query=mysqli_query($koneksi, "SELECT * FROM obat ORDER BY id_obat asc");
	}
	
	// Mengambil data jenis obat dari tabel jenis_obat
	$query_jenis_obat = mysqli_query($koneksi, "SELECT * FROM kategori");
	$jenis_obat_array = array();

	// Memasukkan data jenis obat ke dalam array
	while ($jenis_obat = mysqli_fetch_assoc($query_jenis_obat)) {
		$jenis_obat_array[$jenis_obat['id_kategori']] = $jenis_obat['nama_kategori'];
	}

	$no=1;
	while($d=mysqli_fetch_assoc($query)){ 
	//ini menghasilkan array associative
	?>
		<tr>
			<td><?= $no; ?></td>
			<td><?= $d['nama_obat']; ?></td>
			<td><?= $jenis_obat_array[$d['kategori_obat']]; ?></td>
			<td><?= $d['indikasi']; ?></td>
			<td><?= $d['harga']; ?></td>
			<td><?= $d['stok_obat']; ?></td>
			<td><?= $d['tanggal_expired']; ?></td>
		</tr>
	<?php 
	$no++;
	} 
	?>
	</tbody>
	</table>
	</div> <!-- end div responsive -->
	</div>
</div> <!-- end row -->
