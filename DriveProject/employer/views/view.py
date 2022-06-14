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
from django.contrib.admin.views.decorators import staff_member_required
from fpdf import FPDF
from barcode import EAN13
from barcode.writer import ImageWriter
from employer.decorators import *
import os


def getList(dict):


    ls = []
    try:
        ls =  dict.keys()
    except:
        ls = []
    return ls



@staff_is_required
def index(req):
    return render(req,"index.html")

@staff_is_required
def main(req):
    return render(req,"main.html")


@staff_is_required
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


@staff_is_required
def del_item(req,item,cmd):
    cmd1 = Commandes.objects.get(id=cmd)
    item = Produits.objects.get(id=item)
    dic = ast.literal_eval(cmd1.commande)
    item1 = copy.copy(str(item))
    if item1 in getList(dic):
            del dic[item1]
    Commandes.objects.filter(id=cmd).update(commande= str(dic))
    return HttpResponseRedirect("/employer/commandes/sh/%s/"% cmd)


@staff_is_required
def sh_commande(req,cmd):
    cmd1 = Commandes.objects.get(id=cmd)
    items = ast.literal_eval(cmd1.commande)
    shop_items = Produits.objects.all()
    items = items.items()
    return render(req,"commandes/commande_view.html",{"CMD":cmd1,"items":items,"shop_items":shop_items})

@staff_is_required
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

@staff_is_required
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

def search_commande(req):
    if req.method == 'POST':
        print(req.POST.get('commande'))
        if (req.POST.get('commande') is not None) and (req.POST.get('commande') != ""):
            return HttpResponseRedirect("/employer/commandes/sh/%s/"% req.POST.get('commande'))
        else:
            return HttpResponseRedirect("/employer/commandes/search/")
        
    else:
        query = Commandes.objects.all()
        ls = []
        for item in query:
            date = item.date.strftime("%Y%m%d")
            id = item.id
            number = str(date)+str(id)
            while len(number) != 12:
                number = str(number)+"0"
            ls = ls + [(str(item),item.id,number)]
        return render(req,"commandes/search.html",{'commande': ls})


def create_pdf(request,id):
    print(os.getcwd())
    os.chdir("media/")
    print("START")
    cmd = Commandes.objects.get(id=id)
    dico =  ast.literal_eval(cmd.commande)
    user = cmd.client


    date = cmd.date.strftime("%Y%m%d")
    number = str(date)+str(id)
    while len(number) != 12:
        print("loop")
        number = str(number)+"0"

    my_code = EAN13(number, writer=ImageWriter())
    my_code.save("TEMP/codebar")
    Total = 0
    print("PDF START")
    pdf = FPDF()
    pdf.add_page()
    pdf.set_font("Arial", size=18)
    pdf.image('../employer/static/img/logo.png', 10, 8, 50)
    pdf.cell(190, 20, txt="LER Drive", ln=1, align='C')
    pdf.cell(190, 10, txt="We got what you need!", ln=2, align='C')
    pdf.cell(20, 10, txt=user.nom, ln=2, align='C')
    pdf.cell(20, 10, txt=user.prenom, ln=2, align='C')
    pdf.cell(100, 10, txt=user.addr, ln=2, align='C')
    line_height = pdf.font_size * 2.5
    epw = pdf.w - 2*pdf.l_margin
    col_width = epw / 4
    th = pdf.font_size
    pdf.ln(10)
    pdf.add_font('Times', '', 'arial.ttf', uni=True)
    pdf.set_font('Times', '', 12)
    pdf.cell(col_width, th, str("Article"), border=1)
    pdf.cell(col_width, th, str("Quantité"), border=1)
    pdf.cell(col_width, th, str("Prix-unitaire"), border=1)
    pdf.cell(col_width, th, str("Prix-total"), border=1)
    pdf.ln(6.35)
    for row in getList(dico):
        Total = Total + (float(dico[row]["Amount"]) * float(dico[row]["price"]))
        pdf.cell(col_width, th, str(row), border=1)
        pdf.cell(col_width, th, str(dico[row]["Amount"]), border=1)
        pdf.cell(col_width, th, str(str(dico[row]["price"])+"€"), border=1)
        pdf.cell(col_width, th, str(str(float(dico[row]["Amount"]) * float(dico[row]["price"]))+"€"), border=1)
        pdf.ln(th)

    pdf.cell(col_width*4, th, str(str("Prix-total: ")+('%s €'%Total)), border=1)
    pdf.image("TEMP/codebar.png", 130, 45, 60)
    pdf.output("PDF/%s.pdf" % number)
    pdf_path = str("%s.pdf" % number)
    return HttpResponseRedirect("/media/PDF/%s"% pdf_path)