<?php
try {
    $opciones = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);
    $bd = new PDO('mysql:host=localhost;dbname=hackblog;charset=utf8', 'dwes', 'abc123', $opciones);
} catch (PDOException $e) {
    exit($e->getMessage());
}