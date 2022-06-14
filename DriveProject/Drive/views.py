import re
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from employer.models import *
import copy
import ast
# Create your views here.


def getList(dict):
    ls = []
    try:
        ls =  dict.keys()
    except:
        ls = []
    return ls

def index(request):
    try:
        print(request.session["cart"])
    except:
        request.session["cart"]
    query = Produits.objects.all()
    return render(request,"indexc.html",context={"products":query}) 

    

def add_item(req,item,qt):
    dic = req.session["cart"]
    print(dic)
    if req.method == 'POST':    
        qt = req.POST.get('quantiter')
        if req.POST.get('produit') is not None:
            item = req.POST.get('produit')
        item = Produits.objects.get(id=item)
        item1 = copy.copy(str(item))
        print(item)
        if item1 in getList(dic):
            dic[item1] = {"Amount": qt,"id": item.id,"price":float(item.prix)}
        else:
            dic[item1] = {"Amount": qt,"id": item.id,"price":float(item.prix)}
    else:
        item = Produits.objects.get(id=item)
        item1 = copy.copy(str(item))
        if item1 in getList(dic):
            dic[item1] = {"Amount": qt,"id": item.id,"price":float(item.prix)}
        else:
            dic[item1] = {"Amount": 1,"id": item.id,"price":float(item.prix)}
    req.session["cart"] = dic
    return HttpResponseRedirect("/drive/sh/%s/"% item.id)



def sh_item(req,item):
    query = Produits.objects.get(id=item)
    return render(req,"detail.html",{"product":query})


def del_item(req,item):
    item = Produits.objects.get(id=item)
    dic = req.session["cart"]
    item1 = copy.copy(str(item))
    if item1 in getList(dic):
            del dic[item1]
    req.session["cart"] = dic
    return HttpResponseRedirect("/drive/sh/basket/")

def sh_basket(req):
    if req.method == 'POST':  
        Commandes.objects.create()
    else:
        items = req.session["cart"]
        items = items.items()
        return render(req,"basket_view.html",{"items":items})


def change_item(req,item,qt):
    dic = req.session["cart"]
    print(dic)
    if req.method == 'POST':    
        qt = req.POST.get('quantiter')
        if req.POST.get('produit') is not None:
            item = req.POST.get('produit')
        item = Produits.objects.get(id=item)
        item1 = copy.copy(str(item))
        print(item)
        if item1 in getList(dic):
            dic[item1] = {"Amount": qt,"id": item.id,"price":float(item.prix)}
        else:
            dic[item1] = {"Amount": qt,"id": item.id,"price":float(item.prix)}
    else:
        item = Produits.objects.get(id=item)
        item1 = copy.copy(str(item))
        if item1 in getList(dic):
            dic[item1] = {"Amount": qt,"id": item.id,"price":float(item.prix)}
        else:
            dic[item1] = {"Amount": 1,"id": item.id,"price":float(item.prix)}
    req.session["cart"] = dic
    return HttpResponseRedirect("/drive/sh/basket/")
