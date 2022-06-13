from operator import mod
from pyexpat import model
from unicodedata import category
from django.db import models
from django.urls import reverse

# Create your models here.
"""
Product
- Nom
- Prix
- Qty
- Description 
- Image
"""

class Product(models.Model):
    name = models.CharField(max_length=128)
    slug = models.SlugField(max_length=128)
    price = models.FloatField(default=0.0)
    qty = models.IntegerField(default=0)
    description = models.TextField(blank=True)
    thumbnail = models.ImageField(upload_to="media",blank=True,null=True)


    def __str__(self) -> str:
        return f"{self.name} ({self.qty})" 
    def get_absolute_url(self):
        return reverse("product", kwargs={"slug": self.slug})
  
class Order(models.Model):
    user = models.ForeignKey("auth.User", on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    qty = models.IntegerField(default=0)
    ordered = models.BooleanField(default=False)
 
 
 

