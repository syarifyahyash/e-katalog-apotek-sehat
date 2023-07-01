<?php
include "koneksi.php";
$action=isset($_GET['submenu'])? $_GET['submenu'] :'';
switch($action){
default:
?>
<head>
	<link rel="stylesheet" href="css/style-obat.css">
</head>
<h1 class="text-center" style="margin-top:60px;">Katalog Obat</h1>
<hr/>
<div class="row">
	<div class="col-sm">
	  <h4 class="float-left">Data Obat</h4> 
	  	<a href="?menu=data_obat&submenu=tambah" class="btn-add btn btn-success float-right"  style="border-radius: 5px;" id="addData">Tambah Data Obat</a>
	  </form>
	 <div class="table-responsive">
	 <table id="myTable" class="table table-hover">
	  <thead class="label-table">
		<tr>
			<th >No</th>
			<th class="col-sm-2">Nama Obat</th>
			<th >Kategori</th>
			<th >Indikasi</th>
			<th >Stok</th>
			<th >Tgl Expired</th>
			<th >Harga</th>
			<th class="text-center">Edit</th>
			<th class="text-center">Delete</th>
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
			<td><?= $d['stok_obat']; ?></td>
			<td><?= $d['tanggal_expired']; ?></td>
			<td><?= $d['harga']; ?></td>
			<td>
				<a class="btn-edit btn btn-outline-success btn-sm text-center" style="border-radius: 5px;" id="edit" href="?menu=data_obat&submenu=edit&id=<?= $d['id_obat'];?>">Edit</a>
			</td>
			<td>
				<a class="btn-del btn btn-outline-danger btn-sm text-center"  style="border-radius: 5px;" id="hapus" href="?menu=data_obat&submenu=hapus&id=<?= $d['id_obat'];?>" 
				onClick="return confirm('Hapus Obat ?');">Delete</a>
			</td>
		</tr>
	<?php 
	$no++;
	} 
	?>
	  </tbody>
	 </table>
	 </div> <!-- end div responsive -->
	</div>
	<div>
	<?php $status=isset($_GET['status'])?$_GET['status']:"";?>
	<?php if($status=="sukses"){ ?>
		<script>
			iziToast.success({
				title: 'Tambah Obat',
				message: 'Berhasil!',
				position: 'topCenter',
				timeout: 5000,
				transitionIn: 'bounceInUp',
				transitionOut: 'fadeOutUp'
			});
		</script>
	<?php } else if($status=="gagal"){ ?>
		<script>
			iziToast.error({
				title: 'Tambah Obat',
				message: 'Gagal!',
				position: 'topCenter',
				timeout: 5000,
				transitionIn: 'bounceInUp',
				transitionOut: 'fadeOutUp'
			});
		</script>
	<?php } elseif($status=="sukses_update"){ ?>
		<script>
			iziToast.success({
				title: 'Update Obat',
				message: 'Berhasil!',
				position: 'topCenter',
				timeout: 5000,
				transitionIn: 'bounceInUp',
				transitionOut: 'fadeOutUp'
			});
		</script>
	<?php } elseif($status=="gagal_update"){ ?>
		<script>
			iziToast.error({
				title: 'Update Obat',
				message: 'Gagal!',
				position: 'topCenter',
				timeout: 5000,
				transitionIn: 'bounceInUp',
				transitionOut: 'fadeOutUp'
			});
		</script>
	<?php } elseif($status=="sukses_hapus"){ ?>
		<script>
			iziToast.success({
				title: 'Hapus Obat',
				message: 'Berhasil!',
				position: 'topCenter',
				timeout: 5000,
				transitionIn: 'bounceInUp',
				transitionOut: 'fadeOutUp'
			});
		</script>
	<?php } elseif($status=="gagal_hapus"){ ?>
		<script>
			iziToast.error({
				title: 'Hapus Obat',
				message: 'Gagal!',
				position: 'topCenter',
				timeout: 5000,
				transitionIn: 'bounceInUp',
				transitionOut: 'fadeOutUp'
			});
		</script>
	<?php }
	else if(empty($status)){ ?>
	
	<?php }?>
		
	</div>
</div> <!-- end row -->
<?php 
break;

case "tambah":
?>
<h2 class="text-center" style="margin-top:60px;"> Tambah Data Obat</h2>
<hr>
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form method="POST">
			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<div class="input-group-text" style="width: 130px;">Nama Obat</div>
				</div>
				<input type="text" class="form-control" name="nama_obat" id="nama_obat" required placeholder="Tulis nama obat" autocomplete="off" />
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<div class="input-group-text" style="width: 130px;">Kategori</div>
					</div>
					<select name="kategori" class="custom-select" id="inputGroupSelect01">
					<?php
						$query = mysqli_query($koneksi, "SELECT * FROM kategori");
		
						// Looping untuk menampilkan opsi
						while ($kategori = mysqli_fetch_assoc($query)) {
							echo '<option value="' . $kategori['id_kategori'] . '">' . $kategori['nama_kategori'] . '</option>';
						}
					?>
				</select>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<div class="input-group-text" style="width: 130px;">Indikasi</div>
					</div>
				<input type="text" class="form-control"  name="indikasi" id="indikasi"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<div class="input-group-text" style="width: 130px;">Stok</div>
					</div>
				<input type="number" class="form-control"  name="stok" id="stok"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<div class="input-group-text" style="width: 130px;">Tanggal Expired</div>
					</div>
				<input type="date" class="form-control"  name="tglExp" id="tglExp"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<div class="input-group-text" style="width: 130px;">Harga</div>
					</div>
				<input type="number" class="form-control" name="harga" id="harga" value="1000" required autocomplete="off"/>
				</div>
			</div>
			<button type="submit" name="submit" class="btn btn-success float-left">Tambah Data</button>
			<a href="?menu=data_obat" class="btn btn-danger float-right">Kembali</a>
		</form>
	</div>
	<div class="col-sm-3"></div>
</div> <!-- end row -->
<?php 
if(isset($_POST['submit'])){ //jika tombol submit di klik
	//ambil data dari form input
	//mengabaikan tanda petik
	//$nama=mysqli_real_escape_string($koneksi, $_POST['nama']); 
	$nama_obat=$_POST['nama_obat']; 
	$kate=$_POST['kategori']; 
	$indikasi=$_POST['indikasi']; //mengabaikan tag html; 
	$stok=$_POST['stok'];
	$tgl=$_POST['tglExp'];
	$harga=$_POST['harga'];
	$query=mysqli_query($koneksi, "INSERT INTO obat VALUES (NULL,'$nama_obat','$kate','$indikasi','$stok','$tgl','$harga') ");
	$sukses=mysqli_affected_rows($koneksi);
	if($sukses > 0){
		echo "<script>
			window.location.href='?menu=data_obat&status=sukses';
		</script>";
	}else{
		echo "<script>
			window.location.href='?menu=data_obat&status=gagal';
		</script>"; 
	}
}
?>
<?php 
break;
case "edit":
	$id=$_GET['id'];
    $edit=mysqli_query($koneksi,"SELECT * FROM obat WHERE id_obat='$id'");
    $d=mysqli_fetch_array($edit);
?>
<h2 class="text-center" style="margin-top:60px;"> Edit Data Obat</h2>
<hr/>
<div class="row">
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form method="POST">
			<input type="hidden" name="id_obat" value="<?=$d['id_obat'];?>" />
			<div class="form-group">
				<div class="input-group mb-4">
				<div class="input-group-prepend">
					<div class="input-group-text" style="width: 130px;">Nama Obat</div>
				</div>
				<input type="text" class="form-control" name="nama_obat" id="nama_obat" value="<?=$d['nama_obat'];?>" required placeholder="tulis nama obat" autocomplete="off" />
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<div class="input-group-text" style="width: 130px;">Kategori</div>
					</div>
					<select name="kategori" class="custom-select" id="inputGroupSelect01">
					<?php
						$query = mysqli_query($koneksi, "SELECT * FROM kategori");
						while ($kategori = mysqli_fetch_assoc($query)) {
							$selected = ($kategori['id_kategori'] == $d['kategori_obat']) ? 'selected' : '';
							echo '<option value="' . $kategori['id_kategori'] . '" ' . $selected . '>' . $kategori['nama_kategori'] . '</option>';
						}
					?>
				</select>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
				<div class="input-group-prepend">
					<div class="input-group-text" style="width: 130px;">Indikasi</div>
				</div>
				<input type="text" class="form-control"  name="indikasi" id="indikasi" value="<?=$d['indikasi'];?>"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
				<div class="input-group-prepend">
					<div class="input-group-text" style="width: 130px;">Stok</div>
				</div>
				<input type="number" class="form-control"  name="stok" id="stok" value="<?=$d['stok_obat'];?>"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
				<div class="input-group-prepend">
					<div class="input-group-text" style="width: 130px;">Tanggal Expired</div>
				</div>
				<input type="date" class="form-control" name="tglExp" id="tglExp" value="<?=$d['tanggal_expired'];?>" required autocomplete="off"/>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group mb-4">
				<div class="input-group-prepend">
					<div class="input-group-text" style="width: 130px;">Harga</div>
				</div>
				<input type="number" class="form-control" name="harga" id="harga" value="<?=$d['harga'];?>" required autocomplete="off"/>
				</div>
			</div>
			<button type="submit" name="submit" class="btn btn-success float-left">Update Obat</button>
			<a href="?menu=data_obat" class="btn btn-danger float-right">Kembali</a>
		</form>
	</div>
	<div class="col-sm-3"></div>
</div> <!-- end row -->
<?php 
if(isset($_POST['submit'])){ //jika tombol submit di klik
	//ambil data dari form input
	$id=$_POST['id_obat'];
	$nama_obat=mysqli_real_escape_string($koneksi, $_POST['nama_obat']); //mengabaikan tanda petik
	$kate=$_POST['kategori']; 
	$indikasi=$_POST['indikasi']; //mengabaikan tag html;
	$stok=$_POST['stok'];
	$tgl=$_POST['tglExp'];
	$harga=$_POST['harga'];
	$query=mysqli_query($koneksi, "UPDATE obat SET 
	nama_obat='$nama_obat',kategori_obat='$kate', indikasi='$indikasi', stok_obat='$stok', tanggal_expired='$tgl', harga='$harga'
	WHERE id_obat='$id' ");
	$sukses=mysqli_affected_rows($koneksi);
	if($sukses > 0){
		echo "<script>
				window.location.href='?menu=data_obat&status=sukses_update';
			</script>";
	}else{
		echo "<script>
				window.location.href='?menu=data_obat&status=gagal_update';
			</script>"; 
	}
}
break;
case "hapus":
  $query=mysqli_query($koneksi,"select id_obat from obat where id_obat='$_GET[id]'");
  $cek=mysqli_num_rows($query);
  if($cek == 0){
	echo "<script>alert('Hapus Data Gagal, Data Tidak Ditemukan');
      window.location=('?menu=data_obat')</script>";
  }else{
	$hapus=mysqli_query($koneksi,"DELETE FROM obat WHERE id_obat='$_GET[id]'");
	if($hapus){
		echo "<script>
				window.location.href='?menu=data_obat&status=sukses_hapus';
			</script>";
    }else{
		echo "<script>
				window.location.href='?menu=data_obat&status=gagal_hapus';
		</script>";
    }
  } 
break;
}