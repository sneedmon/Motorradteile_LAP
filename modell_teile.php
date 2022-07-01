<?php
    require "includes/conn.inc.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teile Für Modell</title>
</head>
<body>
    <h1>Teile Für Modell</h1>
    <ul>
        <?php
            if (count($_GET) > 0 && array_key_exists("IDBaureihe", $_GET)) {
                if (intval($_GET["IDBaureihe"]) > 0) {
                    $IDBaureihe = $_GET["IDBaureihe"];
                    $conn = openConn();
                    $sql = "
                        SELECT 
                            tbl_teile.Bezeichnung
                        FROM tbl_teile
                        LEFT JOIN tbl_teile_baureihen ON tbl_teile_baureihen.FIDTeil=tbl_teile.IDTeil
                        WHERE tbl_teile_baureihen.FIDBaureihe=" . $IDBaureihe . " OR tbl_teile.isUniversell=1
                    ";
                    $result = $conn->query($sql) or die ($conn->error);
                    while ($row = $result->fetch_object()) {
                        echo "<li>";
                            echo $row->Bezeichnung;
                        echo "</li>";
                    }
                }
                else {
                    echo "<p class='error'>Ooops etwas ist schief gelaufen.</p>";
                }
            }
            else {
                echo "<p class='error'>Keine Baureihe ausgewählt.</p>";
            }
        ?>
    </ul>
</body>
</html>