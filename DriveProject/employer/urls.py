
from employer.views import CategoriesDeleteView
from employer.views import CategoriesUpdateView
from employer.views import CategoriesDetailView
from employer.views import CategoriesCreateView
from employer.views import CategoriesListView
from employer.views import ClientsDeleteView
from employer.views import ClientsUpdateView
from employer.views import ClientsDetailView
from employer.views import ClientsCreateView
from employer.views import ClientsListView
from employer.views import CommandesDeleteView
from employer.views import CommandesUpdateView
from employer.views import CommandesDetailView
from employer.views import CommandesCreateView
from employer.views import CommandesListView
from employer.views import ProduitDeleteView
from employer.views import ProduitUpdateView
from employer.views import ProduitDetailView
from employer.views import ProduitCreateView
from employer.views import ProduitListView
from django.urls import path, include
from employer.views import *
from employer.decorators import *

urlpatterns = [
path('', main,name='home'),
path('produit/', index),
path('produit/list/', ProduitListView.as_view(), name='produit_list'),
path('produit/create/', ProduitCreateView.as_view(), name='produit_create'),
path('produit/detail/<int:pk>/', ProduitDetailView.as_view(), name='produit_detail'),
path('produit/update/<int:pk>/', ProduitUpdateView.as_view(), name='produit_update'),
path('produit/delete/<int:pk>/', ProduitDeleteView.as_view(), name='produit_delete'),
path('commandes/list/', CommandesListView.as_view(), name='commandes_list'),
path('commandes/create/', CommandesCreateView.as_view(), name='commandes_create'),
path('commandes/detail/<int:pk>/', CommandesDetailView.as_view(), name='commandes_detail'),
path('commandes/update/<int:pk>/', CommandesUpdateView.as_view(), name='commandes_update'),
path('commandes/delete/<int:pk>/', CommandesDeleteView.as_view(), name='commandes_delete'),
path('clients/list/', ClientsListView.as_view(), name='clients_list'),
path('clients/create/', ClientsCreateView.as_view(), name='clients_create'),
path('clients/detail/<int:pk>/', ClientsDetailView.as_view(), name='clients_detail'),
path('clients/update/<int:pk>/', ClientsUpdateView.as_view(), name='clients_update'),
path('clients/delete/<int:pk>/', ClientsDeleteView.as_view(), name='clients_delete'),
path('categories/list/', CategoriesListView.as_view(), name='categories_list'),
path('categories/create/', CategoriesCreateView.as_view(), name='categories_create'),
path('categories/detail/<int:pk>/', CategoriesDetailView.as_view(), name='categories_detail'),
path('categories/update/<int:pk>/', CategoriesUpdateView.as_view(), name='categories_update'),
path('categories/delete/<int:pk>/', CategoriesDeleteView.as_view(), name='categories_delete'),
path('commandes/add/<int:cmd>/<int:item>/<int:qt>/', add_item),
path('commandes/del/<int:cmd>/<int:item>/', del_item),
path('commandes/sh/<int:cmd>/', sh_commande,name='commandes_show'),
path('signup/', signup,name='signup'),
path('logout/', logout_user,name="logout"),
path('login/', login_user,name="login"),
path('change_passwd/', change_passwd,name="change_passwd"),
path('commandes/search/', search_commande,name='commandes_search'),
]


