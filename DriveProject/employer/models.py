from django.db import models


# Create your models here.
class Categories(models.Model):
    nom = models.CharField(max_length=30,null=False)
    descriptif = models.TextField(max_length=100,null=True)

    def __str__(self) -> str:
        return self.nom

class Produits(models.Model):
    nom = models.CharField(max_length=30,null=False)
    date_per = models.DateField(null=False)
    photo = models.FileField(blank=False,upload_to="produit")
    marque = models.CharField(max_length=30)
    categorie = models.ForeignKey(Categories,on_delete=models.SET_NULL,null=True)
    stock = models.PositiveIntegerField()
    prix = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self) -> str:
        return self.nom + " " + self.marque

class Clients(models.Model):
    nom = models.CharField(max_length=30)
    prenom = models.CharField(max_length=30)
    date_insci = models.DateField()
    addr = models.CharField(max_length=50)
    username = models.TextField(null=False)

    def __str__(self) -> str:
        return str(str(self.prenom).upper()+" " +str(self.nom))

class Commandes(models.Model):
    client = models.ForeignKey(Clients,on_delete=models.CASCADE,null=False)
    date = models.DateTimeField(null=False)
    commande = models.TextField(null=False,default="{}")

    def __str__(self) -> str:
        return str(date)

