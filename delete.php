<?php
header("location:homee.php");
$conn = new mysqli("localhost", "root", "", "base_produits");
if ($conn->connect_error) {
    die("Erreur de connexion: " . $conn->connect_error);
}
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "DELETE FROM produits WHERE id = $id";

    if ($conn->query($sql)) {
        echo "Produit supprimé avec succès.";
    } else {
        echo "Erreur lors de la suppression: " . $conn->error;
    }
} else {
    echo "ID du produit non fourni.";
}
?>