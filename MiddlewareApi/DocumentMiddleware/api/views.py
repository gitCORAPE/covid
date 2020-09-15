from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import DocumentSerializer, UserSerializer, DocumentCategorySerializer
from .models import XDocumento, XUsuario, XDocumentoCategoria
from .functions import tokenize_function


class DocumentView(APIView):

    @tokenize_function
    def get(self, request):
        name = request.GET.get('name')
        document_id = request.GET.get('id')
        if name:
            return Response(data=DocumentSerializer(XDocumento.objects.filter(documento_nombre=name),
                                                    many=True).data, status=200)
        elif document_id:
            return Response(data=DocumentSerializer(XDocumento.objects.get(documento_id=document_id)).data, status=200)
        else:
            return Response(data=DocumentSerializer(XDocumento.objects.all(), many=True).data, status=200)

    @tokenize_function
    def post(self, request):
        try:
            serialized_doc = DocumentSerializer(data=request.data, partial=True)
            if serialized_doc.is_valid():
                new_doc = serialized_doc.save()
                return Response(data=DocumentSerializer(new_doc).data, status=201)
            else:
                return Response(serialized_doc.errors, status=400)
        except Exception as e:
            return Response(data={'errors': e.args}, status=500)

    @tokenize_function
    def put(self, request):
        try:
            document_id = request.data.get('document_id')
            enabled = request.data.get('enabled')
            XDocumento.objects.filter(documento_id=document_id).update(documento_habilitado=enabled)
            return Response(data={'message': 'Document Aprooved!'}, status=200)

        except Exception as e:
            return Response(data={'errors': e.args}, status=500)


class DocumentCategoryView(APIView):

    @tokenize_function
    def get(self, request):
        _id = request.GET.get('id')
        try:
            if _id:
                return Response(data=DocumentCategorySerializer(XDocumentoCategoria.objects.get(documento_categoria_id=_id)).data,
                                status=200)
            else:
                return Response(data=DocumentCategorySerializer(XDocumentoCategoria.objects.all(), many=True).data, status=200)
        except Exception as e:
            Response(data={'errors': e.args}, status=500)


class UserView(APIView):

    @tokenize_function
    def get(self, request):
        usuarios = XUsuario.objects.all()
        return Response(data=UserSerializer(usuarios, many=True).data, status=200)

    @tokenize_function
    def post(self, request):
        try:
            serialized_user = UserSerializer(data=request.data, partial=True)
            if serialized_user.is_valid():
                serialized_user.save()
                return Response(status=201)
            else:
                return Response(serialized_user.errors, status=400)
        except Exception as e:
            return Response(data={'errors': e.args}, status=500)
