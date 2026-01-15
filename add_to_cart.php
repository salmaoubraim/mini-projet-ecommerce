<?php
session_start();
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    if (!isset($_SESSION['panier'])) $_SESSION['panier'] = [];
    if (!in_array($code, $_SESSION['panier'])) $_SESSION['panier'][] = $id;
}
header("Location: homee.php");
exit();