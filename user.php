<!DOCTYPE html>
<html>

<head>
    <title>User</title>
    <link rel="stylesheet" href="css/user.css">

    <!-- AOS -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>

<body>
    <?php include "menu.php"; ?>

    <!-- Div untuk menampilkan notifikasi -->
    <div id="notification">
        <?php
        if (isset ($_SESSION["notification"])) {
            echo $_SESSION["notification"];
            unset($_SESSION["notification"]); // Hapus notifikasi setelah ditampilkan
        }
        ?>
    </div>

    <?php
    if ($_SESSION["level"] != "admin") {
        echo "<script>
            alert('Anda tidak dapat mengakses halaman ini');
            window.location.href = 'home.php'; // Redirect ke halaman home.php
          </script>";
        exit;
    }

    require "koneksi.php";

    $sql = "SELECT * FROM user";
    $query = mysqli_query($koneksi, $sql);
    ?>

    <div class="container">
        <h1 data-aos="zoom-in-up">Data User</h1>
        <div class="data-box">
            <!-- Tombol Tambah diletakkan di luar card-container -->
            <form action="new-user.php" method="GET">
                <button type="submit" class="button-tambah">Tambah</button>
            </form>
            <div class="card-container"> <!-- Container untuk kartu -->
                <?php while ($user = mysqli_fetch_array($query)): ?>
                    <div class="card"> <!-- Setiap entri sebagai kartu -->
                        <div class="card-details">
                            <h3>
                                <?= $user["username"] ?>
                            </h3>
                            <?php if (isset ($user['photo']) && !empty ($user['photo'])): ?>
                                <img src="<?= $user['photo'] ?>" alt="" id="profile-img" title="Ganti Profil">
                            <?php else: ?>
                                <img src="images/empty-profil.webp" alt="" id="profile-img">
                            <?php endif; ?>
                            <p>Level:
                                <?= $user["level"] ?>
                            </p>
                            <p>Dibuat pada:
                                <?= $user["created_at"] ?>
                            </p>
                            <p>Diubah pada:
                                <?= $user["updated_at"] ?>
                            </p>
                            <div class="button-container">
                                <form action="read-user.php" method="GET">
                                    <input type="hidden" name="id" value='<?= $user["id"] ?>'>
                                    <button type="submit" class="button-lihat">Lihat</button>
                                </form>
                                <form action="delete-user.php" method="POST" onsubmit="return konfirmasi(this)">
                                    <input type="hidden" name="id" value='<?= $user["id"] ?>'>
                                    <button type="submit" class="button-delete">Hapus</button>
                                </form>
                            </div>
                        </div>
                    </div>
                <?php endwhile ?>
            </div>
        </div>
    </div>
    <script>
        function konfirmasi(form) {
            formData = new FormData(form);
            id = formData.get("id");
            return confirm(`Hapus user '${id}'?`);
        }
    </script>

    <!-- AOS -->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>

</html>