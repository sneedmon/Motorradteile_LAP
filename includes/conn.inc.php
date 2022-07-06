<?php
require "config.inc.php";

/**
 * Erstellt eine instanz einer Mysqli klasse
 * Wenn die verbindung nicht erfolgreich wird der error gelogged
 * @return $conn = die erstellte connection
 */
function openConn() {
    $conn = new Mysqli(DB["host"],DB["user"],DB["pwd"],DB["db"]);
    if ($conn->connect_errno > 0) {
        die ("Fehler im Verbindungsaufbau " . error_log($conn->connect_error));
    }
    return $conn;
};

/**
 * Schließt die connection zu DB
 * @param $conn = eine Mysqli instanz
 */
function closeConn($conn) {
    $conn->close();
}

?>