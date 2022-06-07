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
    item = Produits.objects.get(id=item)
    dic = ast.literal_eval(cmd1.commande)
    item1 = copy.copy(str(item))
    print(dic)
    if item1 in getList(dic):
        if qt ==0:
            dic[item1] = {"id": item.id, "Amount": qt}
        else:
            del dic[item1]
    else:
        dic[item1] = {"id": item.id, "Amount": 1}

    Commandes.objects.filter(id=cmd).update(commande= str(dic))
    return HttpResponseRedirect("/employer/commandes/detail/%s/"% cmd)




def sh_commande(req,cmd):
    cmd1 = Commandes.objects.get(id=cmd)
    items = ast.literal_eval(cmd1.commande)
    items = items.items()
    return render(req,"commandes/commande_view.html",{"CMD":cmd1,"items":items})
