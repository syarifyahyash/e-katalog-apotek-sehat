<?php 
//untuk ngecek, apakah ada atau tidak tipe get menu di URL browser, agar tidak muncul error 
//jika menu tidak di tulis
$menu=isset($_GET['menu'])?$_GET['menu']:"home";
?>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <a class="navbar-brand" href="?menu=home">Dashboard</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    <li class="nav-item <?=($menu=="jadwal")?"active":""?>">
        <a class="nav-link" href="?menu=jadwal">Jadwal</a>
    </li>
	  <li class="nav-item <?=($menu=="data_obat")?"active":""?>">
        <a class="nav-link" href="?menu=data_obat">Data Obat</a>
    </li>
    </ul>
    <ul class="navbar-nav mr-0">
      <li class="nav-item">
        <a class="nav-link" href="logout.php">
          <img src="img/logout-512.png" width="20px" alt="">
        </a>
      </li>
    </ul>
  </div>
</nav>

<!-- CSS -->
<style>
.navbar {
    background-color: #609966;
}
</style>