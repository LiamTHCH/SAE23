from operator import mod
from tokenize import group
from django.shortcuts import render
from employer.models import *
from django.http import HttpResponseRedirect
import copy
import ast
from django.contrib.auth import login, authenticate,logout
from django.contrib.auth.forms import *
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
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

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            usernam = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            email = form.cleaned_data.get('email')
            user = User.objects.create(username=str(usernam),email="test@gmial.com",password=raw_password,is_staff=True)
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})

def logout_user(req):
    logout(req)
    return redirect('home')

def login_user(request):
    if request.method == 'POST':
        users = request.POST.get('user')
        passwd = request.POST.get('passwd')
        user = authenticate(username=users, password=passwd)
        if user is not None and user.is_active:
            login(request, user)
            return HttpResponseRedirect("/employer/")
        else:
            return render(request,"login.html")
    else:
        return render(request,"login.html")

def change_passwd(request):
    if request.method == 'POST':
        users = request.POST.get('user')
        passwd = request.POST.get('passwd')
        u = User.objects.get(username=users)
        print(u)
        u.set_password(passwd)
        u.save()
        return HttpResponseRedirect("/employer/")
    else:
        return render(request,"change.html")