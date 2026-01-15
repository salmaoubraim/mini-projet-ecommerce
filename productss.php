<?php
$conn = new mysqli("localhost", "root", "", "base_produits");
if ($conn->connect_error) die("Erreur: " . $conn->connect_error);
$id = $_GET['id'];
$res = $conn->query("SELECT * FROM produits WHERE id = $id");
$produit = $res->fetch_assoc();
?>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Détails</title></head>
<body style="font-size:50px">
    <h2>Détails du produit</h2>
    <p><strong>Nom:</strong> <?= $produit['nom'] ?></p>
    <p><strong>Description:</strong> <?= $produit['description'] ?></p>
    <p><strong>Prix:</strong> <?= $produit['prix'] ?> DH</p>
    <p><strong>Quantite:</strong> <?= $produit['quantite'] ?></p>
    <p><strong>Fournisseur:</strong> <?= $produit['fournisseur'] ?></p>
    <a href="homee.php">Retour</a>
</body>
</html>