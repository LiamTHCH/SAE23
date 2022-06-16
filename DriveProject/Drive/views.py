import re
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponseRedirect
from employer.models import *
import copy
import ast
from django.contrib.auth import login, authenticate,logout
from django.contrib.auth.forms import *
from django.contrib.auth.models import User
import datetime
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password, check_password

def getList(dict):
    ls = []
    try:
        ls =  dict.keys()
    except:
        ls = []
    return ls
@login_required
def index(request):
    query = Produits.objects.all()
    return render(request,"indexc.html",context={"products":query}) 
    
@login_required
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

@login_required
def sh_item(req,item):
    query = Produits.objects.get(id=item)
    return render(req,"detail.html",{"product":query})

@login_required
def del_item(req,item):
    item = Produits.objects.get(id=item)
    dic = req.session["cart"]
    item1 = copy.copy(str(item))
    if item1 in getList(dic):
            del dic[item1]
    req.session["cart"] = dic
    return HttpResponseRedirect("/drive/sh/basket/")

@login_required
def sh_basket(req):
    if req.method == 'POST':  
        Commandes.objects.create()
    else:
        items = req.session["cart"]
        items = items.items()
        return render(req,"basket_view.html",{"items":items})

@login_required
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

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            nom1 = request.POST.get('nom')
            prenom1 = request.POST.get('prenom')
            addr1 = request.POST.get('addr')
            usernam = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            email1 = request.POST.get('email')
            passwd = make_password(raw_password)
            user = User.objects.create(username=str(usernam),email=email1,password=passwd,is_staff=False)
            usr = Clients.objects.create(nom=nom1,prenom=prenom1,addr=addr1,date_insci=datetime.date.today(),username=usernam)
            request.session["user"] = usr.username
            request.session["cart"] = {}
            login(request, user)
            return HttpResponseRedirect("/drive/")
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {'form': form})

def logout_user(req):
    logout(req)
    return redirect('index')

def login_user(request):
    if request.method == 'POST':
        users = request.POST.get('user')
        passwd = request.POST.get('passwd')
        request.session["user"] = users
        user = authenticate(username=users, password=passwd)
        if user is not None and user.is_active:
            login(request, user)
            request.session["cart"] = {}
            return HttpResponseRedirect("/drive/")
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
        return HttpResponseRedirect("/drive/")
    else:
        return render(request,"change.html")

def create_commande(req):
   dic =  req.session["cart"] 
   id1  =  req.session["user"] 
   clt = Clients.objects.get(username=id1)
   Commandes.objects.create(commande=dic,date=datetime.date.today(),client=clt)
   req.session["cart"] = {}
   return HttpResponseRedirect("/drive/")
