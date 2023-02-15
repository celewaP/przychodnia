<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Przychodnia medyczna w ZS1</title>
    <link rel="stylesheet" href="przychodnia.css">
    <?php
    session_start();
    if(!isset($_SESSION['login'])){
        echo '<script>';
        echo 'alert("najpierw proszę się zalogować lub założyć konto");
        history.go(-1);';
        echo '</script>';
    }
    ?>
</head>
<body>
    <div class="bg-image">
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
                <a href="onas.php">O nas</a>
            </li>
            <li>
                <a href="kalendarzlekarza.php" id="admin" style="display: block">Kalendarz lekarza</a>
            </li>
            <li>
                <div id="pacjent"><a href="kalendarzpacjenta.php">Kalendarz pacjenta</a></div>
            </li>
            <li><div id="wyloguj" style="display:none; background-color:0;"><form method="post" action="przychodnia.php" style="background-color: darkslategray;"><input type="submit" name="wyloguj" value="Wyloguj" style="color: black; border-radius:0%; background-color:0;"></form>
            <?php 
            if(isset($_POST['wyloguj'])){
                header("location: wyloguj.php");
            }
            $login=$_SESSION['login'];
            $sql= "select * from logowanie where login= '$login';";
            $db=mysqli_connect("localhost","root", "", "przychodnia");
            $query= mysqli_query($db, $sql);
            while($row=mysqli_fetch_array($query)){
                $_SESSION['idlogowania']=$row['idlogowania'];
            }
            $idlekarza=0;
            if(isset($_GET['ginekolog'])){
                $idlekarza=7;
            }
            elseif(isset($_GET['psychiatra'])){
                $idlekarza=8;
            }
            elseif(isset($_GET['kardiolog'])){
                $idlekarza=9;
            }
            elseif(isset($_GET['neurolog'])){
                $idlekarza=4;
            }
            elseif(isset($_GET['dermatolog'])){
                $idlekarza=11;
            }
            
                ?></div></li>
        </ul>
    </div>
    <div class="left">
    <figure>
  <img src="grypa.jpg" alt="grypa">
  <figcaption>Darmowe zapisy na szczepienie przeciw grypie! Tylko do 19.02!!</figcaption>
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
        <h3>Zapisz się do <?php  
                if(isset($_GET['ginekolog'])){
                    echo "ginekolog Dr n. med. Sary Wierzbickiej";
                }
                elseif(isset($_GET['psychiatra'])){
                    echo "psychiatry lek. Grzegorza Pawlika";
                }
                elseif(isset($_GET['kardiolog'])){
                    echo "kardiologa Dr n. med. Alfreda Chmielewskiego";
                }
                elseif(isset($_GET['neurolog'])){
                    echo " neurologa Dr n. med. Szymona Pertaleca";
                }
                elseif(isset($_GET['dermatolog'])){
                    echo "dermatologa lek. Artura Wróblewskiego";
                }
                
            ?>:
        </h3>
        <form method="post" style="color: black;">
            <label>Wybierz datę wizyty: </label><br>
            Dzień : <select name="dzien" id="dzien">
                        <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                    </select>
            <select name="miesiac" id="miesiac">
                <option value="Styczeń">Styczeń</option>
                <option value="Luty">Luty</option>
                <option value="Marzec">Marzec</option>
            </select> 2022 roku</br>
            <label>Wybierz rodzaj wizyty:</label>
            <p><input type="radio" name="rodzaj" value="Wizyta kontrolna" />Wizyta kontrolna</p>
            <p><input type="radio" name="rodzaj" value="Konsultacja" />Konsultacja</p>
            <p><input type="radio" name="rodzaj" value="Pierwsza wizyta" />Pierwsza wizyta</p>
            <label>Imię i nazwisko pacjenta:</label>
            <input type="text" name="imienazwisko">
            <input type="submit" name="submit" value="Zapisz się">
        </form>
        <?php  
        if(isset($_POST['submit'])){
            if(!isset($_POST['rodzaj'])){
                echo '<script>';
                echo 'alert("Proszę wybrać rodzaj wizyty!!");';
                echo'</script>';
            }
            else{
                
                $idpacjenta=$_SESSION['idlogowania'];
                $dzien=$_POST['dzien'];
                $miesiac=$_POST['miesiac'];
                $opis= $_POST['rodzaj'];
                $imienazwisko=$_POST['imienazwisko'];
                switch($_POST['miesiac']){
                    case "Styczeń":
                        $m=01;
                        break;
                    case "Luty":
                        $m=02;
                        break;
                    case "Marzec":
                        $m=03;
                        break;
                }
                if($idlekarza==0){
                    echo '<script>
                    alert("Proszę wybrać lekarza:");
                    window.location.href="przychodnia.php";</script>';
                }
                elseif(empty($imienazwisko)){
                    echo '<script>
                    alert("Proszę wpisać imię oraz nazwisko:")
                    ;</script>';
                }
                else
                {$db=mysqli_connect("localhost","root", "", "przychodnia");
                $sql="insert into kalendarz_pacjenta values(null, null,'$opis', null, '2022-$m-$dzien', '$miesiac', null, $idpacjenta, $idlekarza);";
                $query=mysqli_query($db,$sql);
                $sql2="insert into kalendarz_pracownika values(null,'$opis', null, '$miesiac', 2022, '2022-$m-$dzien', $idlekarza, '$imienazwisko');";
                $query2=mysqli_query($db,$sql2);
                echo '<script>alert("Wizyta została zapisana");
                window.location.href="kalendarzpacjenta.php";</script>';}
            }
            }
            
        
        ?>
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
        
           // header("Location: przychodnia.php");
        
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
            <h5>Witaj,<?php echo $_SESSION['login'];?> </h5>
        </div>
        <div id="konta">
        <h1 style="border-radius: 25px; background-color: rgb(245, 222, 192); color: black;">Konta przychodni</h1>
        <button onclick="logowanie()">Zaloguj się</button>
        <button onclick="rejestracja()">Zarejestruj się</button>
        
        
        <div id="logowanie" style="display:none">
        <form method="post">
            <label>Login:<br><input type="text" name="login"></label><br>
            <label>Hasło:<br><input type="password" name="pass"></label><br>
            <input type="submit" value="zaloguj" name="zaloguj">
        </form>

            
        </div>
        <div id="rejestracja" style="display:none">
        <form method="post">
             <label>Login:<br><input type="text" name="loginR"></label><br>
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
        ?>
</div>
</div>
    <div class="stopka">
        Pracownia wykonana przez zespol BRUH
    </div>
    </div>
</body>
</html>