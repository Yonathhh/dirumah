<?php
session_start();

if (!array_key_exists("username", $_SESSION)) {
    header("location:logout.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <link rel="stylesheet" href="menu.css">
</head>

<body onload="showWelcomeMessage()">
    <nav>
        <ul>
            <li><a href="home.php">HOME</a></li>
            <li class="dropdown"> <!-- Tambahkan class "dropdown" pada li -->
                <a href="#" class="dropbtn">MASTER</a>
                <div class="dropdown-content">
                    <?php if ($_SESSION["level"] == "admin") : ?>
                        <a href="user.php">User</a>
                    <?php endif ?>
                    <a href="barang.php">Barang</a>
                    <?php if ($_SESSION["level"] == "admin" || $_SESSION["level"] == "keuangan") : ?>
                        <a href="pelanggan.php">Pelanggan</a>
                    <?php endif ?>
                </div>
            </li>
            <li class="dropdown"> <!-- Tambahkan class "dropdown" pada li -->
                <a href="#" class="dropbtn">TRANSAKSI</a>
                <div class="dropdown-content">
                    <a href="penjualan.php">Penjualan</a>
                    <a href="pembelian.php">Pembelian</a>
                </div>
            </li>
            <li class="user-profile">
                Selamat datang, <?= $_SESSION["username"] ?>!
                <ul>
                    <li><a href="profil.php">Profil</a></li>
                    <li><a href="logout.php">Log out</a></li>
                </ul>
            </li>
        </ul>
    </nav>

</body>

</html>