<!DOCTYPE html>
<html>

<head>
    <title>Halaman Login</title>
    <link rel="stylesheet" href="login.css">
</head>

<body>
    <div class="login-container">
        <img src="images/unnamed.jpg" alt="Logo" class="logo">
        <h1>Selamat Datang!</h1>
        <form action="validasi.php" method="POST">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="button-group">
                <button type="submit" class="login-btn">LOGIN</button>
                <button type="reset">CLEAR</button>
            </div>
        </form>
    </div>
</body>

</html>