<!DOCTYPE html>
<html>
<head>
    <title>HOME</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php include "menu.php"; ?>

    <script>
        function showWelcomeMessage() {
            alert("Selamat datang, <?= $_SESSION['username'] ?>!");
        }
    </script>
    
</body>
</html>