<!DOCTYPE html>
<html>

<head>
    <title>New Pelanggan</title>
</head>

<body>
    <?php include "menu.php"; ?>

    <?php
    if ($_SESSION["level"] != "admin" && $_SESSION["level"] != "keuangan") {
        echo "Anda tidak dapat mengakses halaman ini";
        exit;
    }
    ?>

    <div>
        <form action="create-pelanggan.php" method="POST">
            <h1>Tambah Pelanggan</h1>
            <table>
                <tr>
                    <td>Nama</td>
                    <td><input type="text" name="nama"></td>
                </tr>
                <tr>
                    <td>Alamat</td>
                    <td><textarea name="alamat" rows="5" cols="50"></textarea></td>
                </tr>
                <tr>
                    <td>No Telepon</td>
                    <td><input type="text" name="no_telepon"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">SIMPAN</button>
                        <button type="reset">RESET</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>

</html>