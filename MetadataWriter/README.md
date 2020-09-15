# Herramienta para licenciar imágenes

Para mayor facilidad al momento de insertar licencias como metadatos, se ha desarrollado la siguiente herramienta. Esta mantiene un uso muy simple que se detalla a continuación

## Como usar

Es necesario usar esta herramienta dentro de un entorno de unix, ya que la libreria principal es complicada de instalar en windows

### Construir desde la fuente

Si se desean hacer cambios al codigo, o añadir mas tipos de licencias se puede reconstruir el ejecutable con el siguiente comando:

```bash
python3 setup.py sdist bdist_wheel
```

con este comando se generara un directorio llamado __/dist__ y dentro del mismo estara el nuevo archivo ejecutable __dist/Image_Copyright_Writer-0.0.1-py3-none-any.whl__

### Instalar el archivo whl

Para instalar este archivo es necesario tener python 3.6 o superior ademas de instalar los siguientes paquetes:

```bash
    sudo apt-get install python-all-dev
    sudo apt-get install python3-pip
    sudo apt-get install libexiv2-dev
    sudo apt-get install libboost-python-dev
    sudo apt-get install g++
```

despues se puede instalar el paquete utilizando pip3

```bash
    pip3 install Image_Copyright_Writer-0.0.1-py3-none-any.whl
```

Una vez instalado correctamente se puede correr la herramienta mediante el siguiente comando

```bash
license-image -path *image_path* -license *license_type* -author *the name of the author*
```
