# Generated by Django 4.0.4 on 2022-06-08 19:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0010_alter_produits_photo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produits',
            name='photo',
            field=models.ImageField(upload_to='employer/media'),
        ),
    ]
