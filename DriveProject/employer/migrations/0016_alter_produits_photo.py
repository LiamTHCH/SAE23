# Generated by Django 4.0.5 on 2022-06-16 20:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0015_alter_produits_photo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produits',
            name='photo',
            field=models.ImageField(upload_to='produit'),
        ),
    ]
