# tika-docker

a quick and dirty try out repo to extract OCR from images using apache-tika and convert the resulting hocr files to TEI

## how-to

1. start the tika-server
    ```shell
    ./startserver.sh
    ```
1. copy images you'd like to convert into `input`
1. run
    ```shell
    ./process.sh
    ```

1. after this, run 
   ```shell
   ant
   ```
   to convert hocr to tei

## Licenses

This project is released under the [MIT License](LICENSE)

### xsl/hocr2tei.xsl

[xsl/hocr2tei.xsl](xsl/hocr2tei.xsl), wich is licensed separately under Apache-2.0 license was copied from https://github.com/OCR-D/format-converters/blob/master/hocr2tei.xsl and slightly modified

### SAXON-HE
The projects also includes Saxon-HE, which is licensed separately under the Mozilla Public License, Version 2.0 (MPL 2.0). See the dedicated [LICENSE.txt](saxon/notices/LICENSE.txt)