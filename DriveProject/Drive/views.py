import re
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from Drive.models import Product

# Create your views here.
def index(request):
    Product.objects.all()
    return render(request,"indexc.html",context={"products":Product.objects.all()}) 

    
def product_detail(request,slug):
    product = get_object_or_404(Product,slug=slug)
    return render(request,"detail.html",context={"product":product})

