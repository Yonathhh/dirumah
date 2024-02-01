    home.php
    <script>
        function showWelcomeMessage() {
            alert("Selamat datang, <?= $_SESSION['username'] ?>!");
        }
    </script>