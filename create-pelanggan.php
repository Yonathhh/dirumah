<?php

require "koneksi.php";

$nama = $_POST["nama"];
$no_telepon = $_POST["no_telepon"];
$alamat = $_POST["alamat"];

$sql = "INSERT INTO pelanggan (nama, no_telepon, alamat) VALUES ('$nama', '$no_telepon', '$alamat')";
mysqli_query($koneksi, $sql);

if (mysqli_error($koneksi)) {
    echo mysqli_error($koneksi);
} else {
    header("location: pelanggan.php");
}
