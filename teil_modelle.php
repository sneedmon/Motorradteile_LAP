<?php
    require "includes/conn.inc.php";
    $id = $_GET["IDteil"];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Alle Modelle zum Teil</title>
</head>
<body>
    <h1>Modelliste</h1>
    <ul>
        <?php
            $where = "";
            if (count($_GET) > 0 && intval($_GET) > 0) {
                if (intval($_GET["isUniversell"]) === 0 ) {
                    $where = " 
                        WHERE tbl_teile_baureihen.FIDTeil=" . $id;
                }
            }
            $conn = openConn();
            $sql = "
                SELECT
                    tbl_marken.Markenname,
                    tbl_modelle.Modell,
                    tbl_baureihen.BaujahrVon,
                    tbl_baureihen.BaujahrBis
                FROM tbl_teile_baureihen
                INNER JOIN tbl_baureihen ON tbl_teile_baureihen.FIDBaureihe=tbl_baureihen.IDBaureihe
                INNER JOIN tbl_modelle ON tbl_baureihen.FIDModell=tbl_modelle.FIDMarke
                INNER JOIN tbl_marken ON tbl_modelle.FIDMarke=IDMarke"
                . $where . "
                ORDER BY Markenname ASC, Modell ASC, BaujahrVon ASC
            ";            
            $result = $conn->query($sql) or die ($conn->error . $sql);
            while ($modell = $result->fetch_object()) {
                echo "<li>";
                    echo $modell->Markenname . "";
                    echo $modell->Modell . " (";
                    echo $modell->BaujahrVon . " bis ";
                    echo $modell->BaujahrBis . ")";
                echo "</li>";
            }
        ?>
    </ul>
</body>
</html>