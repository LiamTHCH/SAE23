# Generated by Django 4.0.4 on 2022-05-31 21:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0006_alter_commandes_commande'),
    ]

    operations = [
        migrations.RenameField(
            model_name='produits',
            old_name='maraue',
            new_name='marque',
        ),
    ]