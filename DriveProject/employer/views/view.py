from operator import mod
from django.shortcuts import render
from employer.models import *
from django.http import HttpResponseRedirect
import copy
import ast
def getList(dict):
    ls = []
    try:
        ls =  dict.keys()
    except:
        ls = []
    return ls


def index(req):
    return render(req,"index.html")

def main(req):
    return render(req,"main.html")

def add_item(req,item,qt,cmd):
    cmd1 = Commandes.objects.get(id=cmd)
    dic = ast.literal_eval(cmd1.commande)
    #print(dic)
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

    Commandes.objects.filter(id=cmd).update(commande= str(dic))
    return HttpResponseRedirect("/employer/commandes/sh/%s/"% cmd)

def del_item(req,item,cmd):
    cmd1 = Commandes.objects.get(id=cmd)
    item = Produits.objects.get(id=item)
    dic = ast.literal_eval(cmd1.commande)
    item1 = copy.copy(str(item))
    if item1 in getList(dic):
            del dic[item1]
    Commandes.objects.filter(id=cmd).update(commande= str(dic))
    return HttpResponseRedirect("/employer/commandes/sh/%s/"% cmd)


def sh_commande(req,cmd):
    cmd1 = Commandes.objects.get(id=cmd)
    items = ast.literal_eval(cmd1.commande)
    shop_items = Produits.objects.all()
    items = items.items()
    return render(req,"commandes/commande_view.html",{"CMD":cmd1,"items":items,"shop_items":shop_items})
