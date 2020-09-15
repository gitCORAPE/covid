
from django.conf import settings
from jwt import decode
from rest_framework.response import Response
from .constants import ALLOWED_BADGE


def tokenize_function(api_view_function):
    def wrapper(self, request):
        token = request.META.get('HTTP_AUTHORIZATION')
        try:
            decoded_token = decode(token, settings.SECRET_KEY, algorithms=['HS256'])
            if decoded_token.get('badge') == ALLOWED_BADGE:
                return api_view_function(self, request)
            else:
                return Response(status=401)
        except Exception as e:
            print(e.args)
            return Response(status=500)

    return wrapper
