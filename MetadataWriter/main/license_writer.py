from argparse import ArgumentParser
import pyexiv2

LICENSE_TYPES = {
    'Attribution': 'https://creativecommons.org/licenses/by/4.0/',
    'Attribution-ShareAlike': 'https://creativecommons.org/licenses/by-sa/4.0/',
    'Attribution-NoDerivatives': 'https://creativecommons.org/licenses/by-nd/4.0/',
    'Attribution-NonCommercial': 'https://creativecommons.org/licenses/by-nc/4.0/',
    'Attribution-NonCommercial-ShareAlike': 'https://creativecommons.org/licenses/by-nc-sa/4.0/',
    'Attribution-NonCommercial-NoDerivatives': 'https://creativecommons.org/licenses/by-nc-nd/4.0/'
}


def license_image(image_path: str, lincense_type: str, author: str) -> bool:
    try:
        metadata = pyexiv2.ImageMetadata(image_path)
        metadata.read()
        copyright_key = 'Exif.Image.Copyright'
        author_key = 'Exif.Image.Artist'
        value = LICENSE_TYPES.get(lincense_type)
        if value:
            metadata[copyright_key] = pyexiv2.ExifTag(copyright_key, value)
            metadata[author_key] = pyexiv2.ExifTag(author_key, author)
            metadata.write()
            return True
    except Exception as ex:
        print(ex.args)
    return False


def run_from_terminal(args):
    if license_image(args.image_path, args.lincense_type, args.author):
        print("Image licensed sucesfully!!")


def main():
    parser = ArgumentParser(description="Lincense images with Creative Commons")
    parser.add_argument("-path", help="Path to the image file", dest="image_path", type=str, required=True)
    parser.add_argument("-license", help="License type string", dest="lincense_type", type=str,
                        choices=LICENSE_TYPES.keys(), default='Attribution-NonCommercial-ShareAlike', required=True)
    parser.add_argument("-author", help="Author of the image", dest="author", type=str, required=True)
    parser.set_defaults(func=run_from_terminal)
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
