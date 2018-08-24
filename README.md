# MvcCore Extension - Tool - Mimetype & Extension

[![Latest Stable Version](https://img.shields.io/badge/Stable-v4.3.1-brightgreen.svg?style=plastic)](https://github.com/mvccore/ext-tool-mimetype-extension/releases)
[![License](https://img.shields.io/badge/Licence-BSD-brightgreen.svg?style=plastic)](https://mvccore.github.io/docs/mvccore/4.0.0/LICENCE.md)
![PHP Version](https://img.shields.io/badge/PHP->=5.3-brightgreen.svg?style=plastic)

MvcCore extension to get:
- Mimetype(s) strings array from file extension string
- Extension(s) strings array from file mimetype string

This extension doesn't use PHP `mime_content_type()` function to recognize files by magic bytes sequence.
It does form `input:file` validator itself - using PHP `fionfo` extension. This extension has only list of mimetypes
and extensions to properly serve, which file extension(s) could have uploaded file with discovered mimetype by `finfo` 
extension and to properly serve, which file mimetype(s) could have defined accepting file extension in `<input type="file" accept=".ext" />` 
accept attribute.

## Mimetypes And Extensions Sources

Database of all mimetypes and extensions is loaded by Node.JS project [`jshttp/mime-db`](https://github.com/jshttp/mime-db) from 3 sources:
- [IANA](http://www.iana.org/assignments/media-types/media-types.xhtml) (http://www.iana.org/assignments/media-types/media-types.xhtml)
- [APACHE](http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types) (http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types)
- [NGINX](http://hg.nginx.org/nginx/raw-file/default/conf/mime.types) (http://hg.nginx.org/nginx/raw-file/default/conf/mime.types)
- custom definitions in `./custom-mimes.json`

## Usage

```php
use \MvcCore\Ext\Tools;

$mimeTypes = Tools\MimeTypesExtensions::GetMimeTypesByExtension('dmg');
// ['application/x-apple-diskimage', 'application/octet-stream']
var_dump($mimeTypes);

$mimeTypes = Tools\MimeTypesExtensions::GetMimeTypesByExtension('madness');
// NULL - means no data for given extension
var_dump($mimeTypes);

$extensions = Tools\MimeTypesExtensions::GetExtensionsByMimeType('application/msword');
// ['doc','dot'] - means mimetype `application/msword` could have two different extensions
var_dump($extensions);

$extensions = Tools\MimeTypesExtensions::GetExtensionsByMimeType('video/bmpeg');
// [''] - means file type is defined as file always without any extension
var_dump($extensions);

$extensions = Tools\MimeTypesExtensions::GetExtensionsByMimeType('something/crazy');
// NULL - means no data for given mimetype
var_dump($extensions);
```

### Building fresh version

```sh
sh scripts/build.sh
# scripts/build.bat
```

### Tests

```sh
sh scripts/test.sh
# scripts/test.bat
```
