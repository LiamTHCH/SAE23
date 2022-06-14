from django.urls import path
from django.contrib import admin
from . import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
path('', views.index, name='index'), #racine
path('sh/<int:item>/', views.sh_item, name='show'),
path('add/<int:item>/<int:qt>/', views.add_item, name='add_item'),
path('sh/basket/', views.sh_basket, name='add_item'),
path('ch/<int:item>/<int:qt>/', views.change_item, name='add_item'),
path('del/<int:item>/', views.del_item, name='add_item'),
path('signup/', views.signup,name='signup'),
path('logout/', views.logout_user,name="logout"),
path('login/', views.login_user,name="login"),
path('change_passwd/', views.change_passwd,name="change_passwd"),
path('sh/basket/pub/', views.create_commande,name="create_commande"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
