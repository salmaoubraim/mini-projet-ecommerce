<?php
$conn = new mysqli("localhost", "root", "", "base_produits");
if ($conn->connect_error) die("Erreur: " . $conn->connect_error);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $nom = $_POST['nom'];
    $desc = $_POST['description'];
    $prix = $_POST['prix'];
    $qte = $_POST['quantite'];
    $f = $_POST['fournisseur'];

    $sql = "INSERT INTO produits (id, nom, description, prix, quantite, fournisseur) VALUES ('$id', '$nom', '$desc', $prix, $qte, '$f')";
    if ($conn->query($sql)){
        echo "Produit ajouté avec succès.";
        header("location:homee.php");
    }
    
    else   {echo "Erreur: " . $conn->error;}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire</title>
    <style>
        fieldset{ 
            width: 50%;
            max-width: 500px;
            margin: 0 auto;
            padding: 15px;
        }
        body{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form{
            max-width: 500px;
            margin: 0 auto;
            padding: 1px;

        }
       form label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #000000;
        font-size: 40px;
        }

       form input, form select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: larger;
      }
      form button {
        width: 100%;
        padding: 18px;
        color: white;
        border: none;
        font-size: px;
        border-radius: 6px;
        cursor: pointer;
        background: #5F27CD;
        transition: background-color 0.3s ease;
    }
</style>
</head>
<body>
<fieldset style="border: 2px solid black">
  <legend style="text-align:center;   font-size: 20px;"><h1>Créer un Produit</h1> </legend>
<form style="font-size: 30px" method="POST">
    <label for="id">id:</label>
    <input type="number" name="id" placeholder="id" required><br><br>
    <label for="nom">Nom:</label>
    <input type="text" name="nom" placeholder="Nom" required><br><br>
    <label for="Description">Description:</label>
    <input type="text" name="description" placeholder="Description" required><br><br>
    <label for="Prix">Prix:</label>
    <input type="number" name="prix" placeholder="Prix" required><br><br>
    <label for="Quantité">Quantité:</label>
    <input type="number" name="quantite" placeholder="Quantite" required><br><br>
    <label for="Fournisseur">Fournisseur:</label>
    <input type="text" name="fournisseur" placeholder="Fournisseur" required><br><br>
    <button style="font-size:35px" type="submit">Créer</button>

</form>
    <a style="font-size:40px" href="homee.php">Retour</a>
</fieldset>
</body>
    </html>
