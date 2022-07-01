<?php
    require "includes/conn.inc.php"
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modelle</title>
</head>
<body>
    <h1>Modelle</h1>
    <form>
        <label for="marke">
            Marke
            <input type="text">
        </label>
        <label for="modell">
            Modell
            <input type="text">
        </label>
        <label for="baujahr">
            Baujahr
            <input type="text">
        </label>
        <button type="submit">Suchen</button>
    </form>
    <ul>
        <?php
            $conn = openConn();
            $markenSql = "
                SELECT * FROM tbl_marken ORDER BY Markenname ASC
            ";
            $marken = $conn->query($markenSql) or die($conn->error);
            while ($marke = $marken->fetch_object()) {
                echo "<li>";
                    echo $marke->Markenname;
                echo "</li>";
                echo "<ul>";
                    $modellSql = "SELECT * FROM tbl_modelle WHERE FIDMarke=" . $marke->IDMarke;
                    $modelle = $conn->query($modellSql) or die($conn->error);
                    while ($modell = $modelle->fetch_object()) {
                        echo "<li>";
                            echo $modell->Modell;
                        echo "</li>";   
                        echo "<ul>";
                            $bauSql = "SELECT * FROM tbl_baureihen WHERE FIDModell=" . $modell->IDModell;
                            $baureihen = $conn->query($bauSql) or die($conn->error);
                            while ($baureihe = $baureihen->fetch_object()) {                               
                                echo "<li><a href='modell_teile.php?IDBaureihe=" . $baureihe->IDBaureihe . "'>" . $baureihe->BaujahrVon . " - " . $baureihe->BaujahrBis . " </a></li>";
                            }
                        echo "</ul>";
                    }
                echo "</ul>";
            }
        ?>
    </ul>
</body>
</html>