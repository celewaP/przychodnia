<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Przychodnia medyczna w ZS1</title>
    <link rel="stylesheet" href="przychodnia.css">
    <?php
    session_start();
    ?>
</head>
<body>
    <div class="baner">
        <span>&#9750; Lublin ul. Tybijska 21/37</span>  
        <span>&#9742; 32 424 325</span> 
        <span>&#9993; rejestracja@zs1.lublin.eu</span>
    </div>
    <div class="logo">
        <a href="przychodnia.php" title="Przychodnia">
            <img src="strzykawka.png" alt="logo" style="border-radius: 0px;">
        </a>
        WITAMY NA STRONE PRZYCHODNI
    </div>
    <div class="menu_L">
         <p></p>
    </div>
    <div class="menu">
        <ul>
            <li>
                <a href="kontakt.php">Kontakt</a>
            </li>
            <li>
                <a href="onas.php">O nas...</a>
            </li>
            <li>
                <a href="kalendarzlekarza.php" id="admin" style="display: block">Kalendarz lekarza</a>
            </li>
            <li>
                <div id="pacjent"><a href="kalendarzpacjenta.php">Kalendarz pacjenta</a></div>
            </li>
            <li><div id="wyloguj" style="display:none; background-color:0;"><form method="post" action="przychodnia.php" style="background-color: darkslategray;"><input type="submit" name="wyloguj" value="Wyloguj" style="color: black; border-radius:0%; background-color:0;"></form><?php 
            if(isset($_POST['wyloguj'])){
                header("location: wyloguj.php");
            }
                ?></div></form></div></li>
        </ul>
    </div>
    <div class="left">
    <figure>
  <img src="grypa.jpg" alt="grypa">
  <figcaption>Darmowe zapisy na szczepienie przeciw grype! Tylko do 19.02!!</figcaption>
</figure>
<figure>
  <img src="smog.jpg" alt="smog">
  <figcaption>Znamy przyczynę złego stanu zdrowia większości Polaków. Jest nią spadek jakości powietrza w Polsce!!</figcaption>
</figure>
<figure>
  <img src="leki.jpg" alt="leki">
  <figcaption>Coraz więcej młodych polaków bierze leki aby "poczuć się lepiej psychicznie". Czy warto? A jeśli tak, to w jakich przypadkach?</figcaption>
</figure>
<figure>
  <img src="bol.jpg" alt="ból">
  <figcaption>Witaminy również da się przedawkować! Należy ostrożnie suplementować witaminy-zgodnie z zaleceniami producenta.</figcaption>
</figure>
    </div>
    <div class="mid">
        <h1>KADRA PRACOWNICZA</h1>
        <h2>Lekarze</h2> 
        <b>Ginekolog:</b> Sara Wierzbicka <span>&#9993; s.wierzbicka@onet.pl</span> <br>
        <b>Psychiatra:</b> Grzegorz Pawlik <span>&#9993; pawlik@interia.com</span> <br>
        <b>Kardiolog:</b> Alfred Chmielewski <span>&#9993; alfredchmiel@interia.pl</span> <br>
        <b>Neurolog:</b> Szymon Petralec <span>&#9993; pertal333@onet.pl</span> <br>
        <b>Dermatolog:</b> Artur Wróblewski <span>&#9993; arturekwrobelek@onet.pl</span> <br>
        <h1>Sekretariat</h1>
        <hr>
        Sekretariat pracuje w godzinach 7:30 - 15:00<br>
        <span>&#9742; 32 424 325</span><br>
        Wszelkie próby kontaktu w złej godzinie nie zostaną odebrane.
    </div>
    <div class="right">
    <?php
            if(isset($_POST['zaloguj'])){

            $db=mysqli_connect("localhost","root", "", "przychodnia");
            $pass=$_POST['pass'];
            $hash=password_hash($pass, PASSWORD_DEFAULT);
            $login=mysqli_real_escape_string($db, $_POST['login']);
            $hash=sha1(mysqli_real_escape_string($db,$_POST['pass']));
            $sql= "select * from logowanie where login= '$login' and haslo='$hash'";
            $query= mysqli_query($db, $sql);
            if(mysqli_num_rows($query)>0){
                $_SESSION['login']=$login;
                while($row=mysqli_fetch_array($query)){
                    $_SESSION['idlogowania']=$row['idlogowania'];
                }
                $dbadmin=mysqli_connect("localhost","root", "", "przychodnia");
                $sqladmin="select pracownicy.imie, pracownicy.nazwisko, pracownicy.idpracownika from pracownicy join logowanie on pracownicy.idlogowania=logowanie.idlogowania where logowanie.login='$login';";
                $queryadmin=mysqli_query($dbadmin, $sqladmin);
                if(mysqli_num_rows($queryadmin)>0){
                    $_SESSION['admin']=1;
                    while($row=mysqli_fetch_array($queryadmin)){
                        $_SESSION['idpracownika']=$row['idpracownika'];

                    }
                }
               // header("location: przychodnia.php");
            }
            else{
                echo '<script>';
                echo 'alert("Złe hasło");';
                echo '</script>';
            }
        }
        ?>
    <?php
        if(isset($_POST['utworz'])){
            if($_POST['passR']==$_POST['pass2R']){
            $loginR=$_POST['loginR'];
            $passR=sha1($_POST['passR']);
            $db=mysqli_connect("localhost","root", "", "przychodnia");
            $sqlR= "insert into logowanie values(null,'$loginR', '$passR', null)";
            $query= mysqli_query($db, $sqlR);
            if(mysqli_affected_rows($db)>0){
                $_SESSION['login']=$loginR;
            
            }
            }
            else{
                echo "<script>";
                echo "alert('hasła są różne')";
                echo "</script>";
            }
            }
    ?>
        <div id="powitanie" style="display: none;">
            <h5>Witaj,<?php echo $_SESSION['login'];?></h5>
            <h6 style="color: black;">
                <?php
                    $db=mysqli_connect("localhost","root", "", "przychodnia");
                    $sql="select count(distinct login) as liczba from logowanie";
                    $query=mysqli_query($db,$sql);
                    while($row=mysqli_fetch_array($query)){
                        echo "Jesteś jednym z ". $row['liczba']. " zadowolonych użytkowników!";

                    }
                ?>
            </h6>
        </div>
        <div id="konta">
        <h1 style="border-radius: 25px; background-color: rgb(245, 222, 192); color: black;">Konta przychodni</h1>
        <button onclick="logowanie()">Zaloguj się</button>
        <button onclick="rejestracja()">Zarejestruj się</button>
        
        
        <div id="logowanie" style="display:none">
        <form method="post">
            <label>Login:<br><input type="text" name="login" id="login"></label><br>
            <label>Hasło:<br><input type="password" name="pass"></label><br>
            <input type="submit" value="zaloguj" name="zaloguj">
        </form>

            
        </div>
        <div id="rejestracja" style="display:none">
        <form method="post">
             <label>Login:<br><input type="text" name="loginR" id="loginR"></label><br>
             <label>Hasło:<br><input type="password" name="passR"></label><br>
             <label>powtórz hasło:<br><input type="password" name="pass2R"></label><br>
             <input type="submit" value="utwórz" name="utworz">
        </form>
        
</div>
        <script>
function logowanie() {
  var x = document.getElementById("logowanie");
  var y = document.getElementById("rejestracja");
  if (x.style.display === "none") {
    x.style.display = "block";
    y.style.display = "none";
    document.getElementById("login").focus();
  } else {
    x.style.display = "none";
  }
}
</script>
<script>
function rejestracja() {
  var x = document.getElementById("rejestracja");
  var y = document.getElementById("logowanie");
  if (x.style.display === "none") {
    x.style.display = "block";
    y.style.display = "none";
    document.getElementById("loginR").focus();
  } else {
    x.style.display = "none";
  }
}
</script>
<?php
            if(empty($_SESSION["login"])){
                echo '<script>
                 var x = document.getElementById("konta");
                 x.style.display = "block";
                 </script>';
            }
        ?>
        <?php
            if(!empty($_SESSION["login"])){
                echo '<script>
                 var x = document.getElementById("wyloguj");
                 x.style.display = "block";
                 </script>';
            }else{
                echo '<script>
                var x = document.getElementById("wyloguj")
                x.style.display = "none";
                </script>';
            }
            if(!empty($_SESSION["login"])){
                echo '<script>
                 var x = document.getElementById("powitanie");
                 x.style.display = "block";
                 </script>';}
        if(empty($_SESSION["admin"])){
                echo '<script>
                 var x = document.getElementById("admin");
                 x.style.display = "none";
                 </script>';
            }
            if(!empty($_SESSION["login"])){
                echo '<script>
                 var x = document.getElementById("pacjent");
                 x.style.display = "block";
                 </script>';
            }
            
            if(!empty($_SESSION["admin"])){
                echo '<script>
                 var x = document.getElementById("pacjent");
                 x.style.display = "none";
                 </script>';
            }
        ?>
</div>
</div>
</div>
    <div class="stopka">
        Pracownia wykonana przez zespol BRUH
    </div>
</body>
</html>