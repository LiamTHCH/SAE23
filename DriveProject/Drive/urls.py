from django.urls import path
from django.contrib import admin
from . import views
from Drive.views import index,product_detail,add_to_cart
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
path('', views.index, name='index'), #racine
path('admin/', admin.site.urls),
path('product/<str:slug>', product_detail, name='product'),
path('product/<str:slug>/add-to-cart/', add_to_cart, name='add-to-cart'),




] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
