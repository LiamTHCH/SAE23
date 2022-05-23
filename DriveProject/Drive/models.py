from pyexpat import model
from unicodedata import category
from django.db import models

# Create your models here.
class Categories(models.Model):
    nom = models.CharField(max_length=30,null=False)
    descriptif = models.TextField(max_length=100,null=True)

class Produits(models.Model):
    nom = models.CharField(max_length=30,null=False)
    date_per = models.DateField(null=False)
    photo = models.ImageField()
    maraue = models.CharField(max_length=30)
    categorie = models.ForeignKey(Categories,on_delete=models.SET_NULL)

class Clients(models.Model):
    nom = models.CharField(max_length=30)
    prenom = models.CharField(max_length=30)
    date_insci = models.DateField()
    addr = models.CharField(max_length=50)

class Commandes(models.Model):
    client = models.ForeignKey(Clients)
    date = models.CharField(max_length=400)

