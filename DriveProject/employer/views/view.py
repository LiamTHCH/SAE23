from operator import mod
from django.shortcuts import render
from employer.models import *
from django.http import HttpResponseRedirect
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
    item = Produits.objects.get(id=item)
    dic = cmd1.commande
    item = str(item)
    print(item)
    print(dic)
    if item in getList(dic):
        dic[item] = dic[item] + 1
    else:
        dic[str(item)] = 1
    return HttpResponseRedirect("commandes/detail/%s/"% cmd)
