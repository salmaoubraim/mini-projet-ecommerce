<?php
session_start();
$conn = new mysqli("localhost", "root", "", "base_produits");
if ($conn->connect_error) {
    die("Échec de la connexion: " . $conn->connect_error);
}
$sql = "SELECT * FROM produits";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Produits</title>
    <link rel="stylesheet" href="style.css">
    </style>
</head>
<body>
    
    <a href="panier.php" style="font-size:70px; padding:10px 15px; background: #5F27CD; color:white; border-radius:5px; text-decoration:none;">     
    🛒       
    (<?php echo isset($_SESSION['panier']) ? count($_SESSION['panier']) : 0; ?>)  </a>

    <a href="create_product.php" style="font-size:70px; padding:10px 15px; display: inline-block; background-color: #5F27CD; color: white; border-radius: 5px; text-decoration: none;">
    Ajouter un produit
    </a>

    <h1 style="font-size:60px; text-align:center;">Liste des Produits</h1>
    <table>
        <tr>
            <th>id</th>
            <th>Nom</th>
            <th>Description</th>
            <th>Prix</th>
            <th>Quantité</th>
            <th>Fournisseur</th>
            <th>Actions</th>
        </tr>
        <?php while($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?= $row['id'] ?></td>
            <td> <a href="productss.php?id=<?= $row['id'] ?>" class="btn" style="background:none;color: #5F27CD;text-decoration:underline;">
            <?= $row['nom'] ?> </a></td>
            <td><?= $row['description'] ?></td>
            <td><?= $row['prix'] ?> DH</td>
            <td><?= $row['quantite'] ?></td>
            <td><?= $row['fournisseur'] ?></td>
            <td>
                <a href="add_to_cart.php?id=<?= $row['id'] ?>" class="btn">Add</a>
                <a href="delete.php?id=<?php echo $row['id']; ?>" class="btn">Delete</a>
            </td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>