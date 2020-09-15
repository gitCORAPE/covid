from rest_framework.serializers import ModelSerializer, DecimalField, EmailField, IntegerField, CharField
from .models import XDocumento, XUsuario, XGrupoUsuario, XDocumentoCategoria


class UserGroupSerializer(ModelSerializer):

    group_id = IntegerField(source='grupo_usuario_id')

    class Meta:
        model = XGrupoUsuario
        fields = ('group_id', )


class DocumentCategorySerializer(ModelSerializer):

    category_id = DecimalField(max_digits=10, decimal_places=0, source='documento_categoria_id')
    name = CharField(max_length=150, source='documento_categoria_nombre')

    class Meta:
        model = XDocumentoCategoria
        fields = ('category_id', 'name')


class UserSerializer(ModelSerializer):

    name = CharField(max_length=20, source='usuario_nombre')
    group_id = IntegerField(source='grupo_usuario_id')
    last_name = CharField(max_length=50, source='usuario_apellido')
    user_name = CharField(max_length=50, source='usuario_nombre_usr')
    email = EmailField(max_length=50, source='usuario_email')
    country = CharField(max_length=5, source='usuario_pais')
    locality = CharField(max_length=50, source='usuario_localidad', default=None)

    class Meta:
        model = XUsuario
        fields = (
            'name',
            'last_name',
            'user_name',
            'email',
            'country',
            'locality',
            'group_id'
        )


class DocumentSerializer(ModelSerializer):

    document_id = DecimalField(source='documento_id', max_digits=10, decimal_places=0, read_only=True)
    category_id = DecimalField(source='documento_categoria_id', max_digits=10, decimal_places=0, write_only=True)
    category = DocumentCategorySerializer(source='documento_categoria', read_only=True)
    name = CharField(max_length=200, source='documento_nombre')
    alias = CharField(max_length=250, source='documento_alias')
    downloads = IntegerField(source='documento_descargas', read_only=True)
    description = CharField(source='documento_descripcion')
    url = CharField(max_length=250, source='documento_url')
    lang = CharField(max_length=5, source='documento_lenguaje')
    nacionality = CharField(max_length=5, source='documento_nacionalidad')
    author = CharField(max_length=250, source='documento_autor')
    producer = CharField(max_length=250, source='documento_productor')
    director = CharField(max_length=250, source='documento_director')
    group = CharField(max_length=250, source='documento_agrupacion')
    year = IntegerField(source='documento_anio')
    tags = CharField(source='documento_tags')
    license_doc = CharField(max_length=5, source='documento_licencia')
    doc_type = CharField(max_length=5, source='documento_tipo')
    enabled = CharField(max_length=5, source='documento_habilitado')

    class Meta:
        model = XDocumento
        fields = (
            'document_id',
            'category_id',
            'category',
            'name',
            'alias',
            'downloads',
            'description',
            'url',
            'lang',
            'nacionality',
            'author',
            'producer',
            'director',
            'group',
            'year',
            'tags',
            'license_doc',
            'doc_type',
            'enabled'
        )
        depth = 1
