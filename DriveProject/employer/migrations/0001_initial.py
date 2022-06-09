# Generated by Django 4.0.4 on 2022-05-29 15:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categories',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=30)),
                ('descriptif', models.TextField(max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Clients',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=30)),
                ('prenom', models.CharField(max_length=30)),
                ('date_insci', models.DateField()),
                ('addr', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Produits',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(max_length=30)),
                ('date_per', models.DateField()),
                ('photo', models.ImageField(upload_to='')),
                ('maraue', models.CharField(max_length=30)),
                ('stock', models.PositiveIntegerField()),
                ('prix', models.DecimalField(decimal_places=2, max_digits=10)),
                ('categorie', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='employer.categories')),
            ],
        ),
        migrations.CreateModel(
            name='Commandes',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.CharField(max_length=400)),
                ('client', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employer.clients')),
            ],
        ),
    ]