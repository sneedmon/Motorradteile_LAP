<?php 
    require "includes/conn.inc.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teile</title>
</head>
<body>
    <h1>Teileliste</h1>
    <ul>
        <?php
            $conn = openConn();
            $sql = "
                SELECT * FROM tbl_teile ORDER BY Bezeichnung ASC
            ";
            $result = $conn->query($sql) or die($conn->error . $sql);
            while ($teil = $result->fetch_object()) {
                echo "<li>";
                    echo  "<a href='teil_modelle.php?IDteil=" . $teil->IDTeil . "&isUniversell=" . $teil->isUniversell . "'>" . $teil->Bezeichnung . "</a>";
                echo "</li>";
            }
        ?> 
    </ul>
</body>
</html>