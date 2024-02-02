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
            <li>MASTER
                <ul>
                    <?php if ($_SESSION["level"] == "admin") : ?>
                        <li><a href="user.php">User</a></li>
                    <?php endif ?>
                    <li><a href="barang.php">Barang</a></li>
                    <?php if ($_SESSION["level"] == "admin" || $_SESSION["level"] == "keuangan") : ?>
                        <li><a href="pelanggan.php">Pelanggan</a></li>
                    <?php endif ?>
                </ul>
            </li>
            <li>TRANSAKSI
                <ul>
                    <li><a href="penjualan.php">Penjualan</a></li>
                    <li><a href="pembelian.php">Pembelian</a></li>
                </ul>
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