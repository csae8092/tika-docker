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