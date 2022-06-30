<?php
require "config.inc.php";

function openConn() {
    $conn = new Mysqli(DB["host"],DB["user"],DB["pwd"],DB["db"]);

    if ($conn->connect_errno > 0) {
        die ("Fehler im Verbindungsaufbau " . $conn->connect_error);
    }
    return $conn;
};


?>