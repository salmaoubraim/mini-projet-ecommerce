<?php
session_start();
$conn = new mysqli("localhost", "root", "", "base_produits");
if ($conn->connect_error) {
    die("Erreur de connexion: " . $conn->connect_error);
}

if (isset($_POST['vider'])) {
    unset($_SESSION['panier']);
    header("Location: panier.php");
    exit();
}

$panier = isset($_SESSION['panier']) ? $_SESSION['panier'] : [];
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>Panier</title>
</head>
<body>

<h1>Mon Panier</h1>

<?php if (!empty($panier)): ?>
    <?php
    $ids = implode(',', array_map('intval', array_keys($panier)));
    $result = $conn->query("SELECT * FROM produits WHERE id IN ($ids)");
    ?>
    <?php if ($result && $result->num_rows > 0): ?>
        <form method="POST">
            <table border="1" cellpadding="10">
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Description</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                    <th>Total Prix</th>
                    <th>Fournisseur</th>
                </tr>
                <?php while ($row = $result->fetch_assoc()): 
                    $qte = $panier[$row['id']];
                ?>
                    <tr>
                        <td><?= $row['id'] ?></td>
                        <td><?= htmlspecialchars($row['nom']) ?></td>
                        <td><?= htmlspecialchars($row['description']) ?></td>
                        <td><?= $row['prix'] ?> MAD</td>
                        <td><?= $qte ?></td>
                        <td><?= $row['prix'] * $qte ?> MAD</td>
                        <td><?= htmlspecialchars($row['fournisseur']) ?></td>
                    </tr>
                <?php endwhile; ?>
            </table>
            <button type="submit" name="vider">Vider le panier</button>
        </form>
    <?php else: ?>
        <p>Erreur lors de la récupération des produits.</p>
    <?php endif; ?>
<?php else: ?>
    <p>Le panier est vide.</p>
<?php endif; ?>

<br>
<a href="home.php">Retour à l'accueil</a>
</body>
</html>
