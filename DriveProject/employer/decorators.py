from django.contrib.auth import REDIRECT_FIELD_NAME
from django.shortcuts import render, resolve_url
from urllib.parse import urlparse
import uuid
from django.http import HttpResponseRedirect
def staff_is_required(
    function=None, login_url=None, redirect_field_name=REDIRECT_FIELD_NAME
):
    """
    Decorator to extend login required to also check if a notebook auth is
    desired first (but you could customize this to be another check!)
    """

    def wrap(request, *args, **kwargs):
        if request.user.is_authenticated:
            if request.user.is_staff:
                return function(request, *args, **kwargs)
            else:
                return HttpResponseRedirect("/employer/login/")
        else:
            return HttpResponseRedirect("/employer/login/")
    return wrap



