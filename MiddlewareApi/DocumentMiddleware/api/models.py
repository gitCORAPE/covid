from django.db import models

# Create your models here.
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class XDocumento(models.Model):
    documento_id = models.DecimalField(primary_key=True, max_digits=10, decimal_places=0)
    documento_categoria = models.ForeignKey('XDocumentoCategoria', models.PROTECT)
    documento_nombre = models.CharField(max_length=200, blank=True, null=True)
    documento_alias = models.CharField(max_length=250, blank=True, null=True)
    documento_descripcion = models.TextField(blank=True, null=True)
    documento_habilitado = models.CharField(max_length=5, default='0', blank=True, null=True)
    documento_url = models.CharField(max_length=250, blank=True, null=True)
    documento_lenguaje = models.CharField(max_length=5, blank=True, null=True)
    documento_visitas = models.IntegerField(blank=True, null=True)
    documento_descargas = models.IntegerField(blank=True, null=True)
    documento_nacionalidad = models.CharField(max_length=5, blank=True, null=True)
    documento_autor = models.CharField(max_length=250, blank=True, null=True)
    documento_productor = models.CharField(max_length=250, blank=True, null=True)
    documento_director = models.CharField(max_length=250, blank=True, null=True)
    documento_agrupacion = models.CharField(max_length=250, blank=True, null=True)
    documento_anio = models.IntegerField(blank=True, null=True)
    documento_tags = models.TextField(blank=True, null=True)
    documento_formato = models.CharField(max_length=5, blank=True, null=True)
    documento_tipo = models.CharField(max_length=5, blank=True, null=True)
    documento_licencia = models.CharField(max_length=5, blank=True, null=True)
    documento_grupo_usuario_todos = models.CharField(max_length=5, blank=True, null=True)
    documento_acepto = models.CharField(max_length=5, blank=True, null=True)
    documento_usuario_crea = models.CharField(max_length=20, blank=True, null=True)
    documento_usuario_actualiza = models.CharField(max_length=20, blank=True, null=True)
    documento_fecha_creacion = models.DateTimeField(blank=True, null=True)
    documento_fecha_actualizacion = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'x_documento'

    def save(self, force_insert=False, force_update=False, using=None, update_fields=None):
        from django.db import transaction
        with transaction.atomic():
            last_id = XDocumento.objects.select_for_update(nowait=False).order_by('-documento_id')[0].documento_id
        self.documento_id = last_id + 1
        return super(XDocumento, self).save(force_insert=force_insert, force_update=force_update, using=using, update_fields=update_fields)


class XDocumentoCategoria(models.Model):
    documento_categoria_id = models.DecimalField(primary_key=True, max_digits=10, decimal_places=0)
    documento_categoria_nombre = models.CharField(max_length=150, blank=True, null=True)
    documento_categoria_alias = models.CharField(max_length=250, blank=True, null=True)
    documento_categoria_descripcion = models.TextField(blank=True, null=True)
    documento_categoria_habilitado = models.CharField(max_length=5, blank=True, null=True)
    documento_categoria_lenguaje = models.CharField(max_length=5, blank=True, null=True)
    documento_categoria_padre_id = models.DecimalField(max_digits=10, decimal_places=0, blank=True, null=True)
    documento_categoria_grupo_usuario_todos = models.CharField(max_length=5, blank=True, null=True)
    documento_categoria_usuario_crea = models.CharField(max_length=20, blank=True, null=True)
    documento_categoria_usuario_actualiza = models.CharField(max_length=20, blank=True, null=True)
    documento_categoria_fecha_creacion = models.DateTimeField(blank=True, null=True)
    documento_categoria_fecha_actualizacion = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'x_documento_categoria'


class XDocumentoCategoriaGrupoUsuario(models.Model):
    documento_categoria = models.ForeignKey(XDocumentoCategoria, models.PROTECT)
    grupo_usuario = models.ForeignKey('XGrupoUsuario', models.PROTECT)

    class Meta:
        managed = False
        db_table = 'x_documento_categoria_grupo_usuario'
        unique_together = (('documento_categoria', 'grupo_usuario'),)


class XDocumentoGrupoUsuario(models.Model):
    documento = models.ForeignKey(XDocumento, models.PROTECT)
    grupo_usuario = models.ForeignKey('XGrupoUsuario', models.PROTECT)

    class Meta:
        managed = False
        db_table = 'x_documento_grupo_usuario'
        unique_together = (('documento', 'grupo_usuario'),)


class XGrupoUsuario(models.Model):
    grupo_usuario_id = models.IntegerField(primary_key=True)
    grupo_usuario_descripcion = models.CharField(max_length=50, blank=True, null=True)
    grupo_usuario_observacion = models.CharField(max_length=50, blank=True, null=True)
    grupo_usuario_usuario_crea = models.CharField(max_length=20, blank=True, null=True)
    grupo_usuario_usuario_actualiza = models.CharField(max_length=20, blank=True, null=True)
    grupo_usuario_fecha_creacion = models.DateTimeField(blank=True, null=True)
    grupo_usuario_fecha_actualizacion = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'x_grupo_usuario'


class XUsuario(models.Model):
    usuario_nombre = models.CharField(primary_key=True, max_length=20)
    grupo_usuario = models.ForeignKey(XGrupoUsuario, models.PROTECT, blank=True, null=True)
    usuario_password = models.CharField(max_length=35, blank=True, null=True)
    usuario_nombre_usr = models.CharField(max_length=50, blank=True, null=True)
    usuario_apellido = models.CharField(max_length=50, blank=True, null=True)
    usuario_email = models.CharField(max_length=50, blank=True, null=True)
    usuario_habilitado = models.CharField(max_length=5, blank=True, null=True)
    usuario_rol_admin = models.CharField(max_length=5, blank=True, null=True)
    usuario_rol_web = models.CharField(max_length=5, blank=True, null=True)
    usuario_zip = models.CharField(max_length=20, blank=True, null=True)
    usuario_telefono = models.CharField(max_length=30, blank=True, null=True)
    usuario_movil = models.CharField(max_length=30, blank=True, null=True)
    usuario_pais = models.CharField(max_length=5, blank=True, null=True)
    usuario_localidad = models.CharField(max_length=50, blank=True, null=True)
    usuario_direccion_calle_principal = models.CharField(max_length=250, blank=True, null=True)
    usuario_direccion_calle_secundaria = models.CharField(max_length=250, blank=True, null=True)
    usuario_direccion_numeracion = models.CharField(max_length=50, blank=True, null=True)
    usuario_fecha_ultima_visita = models.DateTimeField(blank=True, null=True)
    usuario_usuario_crea = models.CharField(max_length=20, blank=True, null=True)
    usuario_usuario_actualiza = models.CharField(max_length=20, blank=True, null=True)
    usuario_fecha_creacion = models.DateTimeField(blank=True, null=True)
    usuario_fecha_actualizacion = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'x_usuario'
