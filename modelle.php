<?php
    require "includes/conn.inc.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modelle</title>
</head>
<body>
    <h1>Modelle</h1>
    <form method="post">
        <label for="marke">
            Marke
            <input name="marke" type="text">
        </label>
        <label for="modell">
            Modell
            <input name="modell" type="text">
        </label>
        <label for="baujahr">
            Baujahr
            <input name="baujahr" type="text">
        </label>
        <button type="submit">Suchen</button>
    </form>
    <ul>
        <?php
            // Loop through tbl_marken and create WHERE clause
            $where_marke = "";
            if (count($_POST) > 0) {
                if (array_key_exists("marke", $_POST)) {
                    if (strlen($_POST["marke"] > 0)) {
                        $where_marke = "WHERE Markenname LIKE '%" . $_POST["marke"] . "%'";
                    }
                }
            }
            $conn = openConn();
            $markenSql = "
                SELECT 
                    * 
                FROM tbl_marken "
                . $where_marke . "
                ORDER BY Markenname ASC
            ";

            $marken = $conn->query($markenSql) or die($conn->error);
            while ($marke = $marken->fetch_object()) {
                echo "<li>";
                    echo $marke->Markenname;
                echo "</li>";
                echo "<ul>";

                    // Loop through tbl_modell and create WHERE clause
                    $where_modell = "";
                    if (array_key_exists("modell", $_POST)) {
                        if (strlen($_POST["modell"] > 0)) {
                            $where_modell = " AND Modell LIKE '%" . $_POST["modell"] . "%'";
                        }
                    }
                    $modellSql = "
                        SELECT 
                            * 
                        FROM tbl_modelle 
                        WHERE FIDMarke=" . $marke->IDMarke . $where_modell . "
                    ";
                    $modelle = $conn->query($modellSql) or die($conn->error);
                    while ($modell = $modelle->fetch_object()) {
                        echo "<li>";
                            echo $modell->Modell;
                        echo "</li>";   
                        echo "<ul>";

                            // Loop through baureihen and create WHERE clause
                            $where_bau = ["FIDModell=" . $modell->IDModell];
                            if (array_key_exists("baujahr", $_POST)) {
                                if(intval($_POST["baujahr"])>0) {
                                    $where_bau[] = "BaujahrVon<=" . $_POST["baujahr"];
                                    $where_bau[] = "BaujahrBis>=" . $_POST["baujahr"];
                                }
                            }
                            $bauSql = "SELECT * FROM tbl_baureihen WHERE " . implode(" AND ", $where_bau);
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