#!/usr/bin/bash
# ref https://aws.amazon.com/premiumsupport/knowledge-center/lambda-layer-simulated-docker/

# Instalar las bibliotecas necesarias usando Docker
docker run -v "$PWD":/var/task "lambci/lambda:build-python3.8" /bin/sh -c "
    pip install twython==3.9.1 \
                psycopg2-binary==2.9.1 \
                pandas \
                urllib3==1.26.6 \
                -t python/lib/python3.8/site-packages/; 
    exit
"

# Crear el archivo zip con las bibliotecas instaladas
zip -r twython-psycopg2-pandas.zip python 

# Eliminar los archivos temporales
sudo rm -rf python/ # eliminar los archivos python no necesarios





# /usr/bin/bash
# ref https://aws.amazon.com/premiumsupport/knowledge-center/lambda-layer-simulated-docker/
# docker run -v "$PWD":/var/task "lambci/lambda:build-python3.8" /bin/sh -c "pip install twython==3.9.1 psycopg2-binary==2.9.1 -t python/lib/python3.8/site-packages/; exit"
# zip -r twython-psycopg2.zip python 
# sudo rm -rf python/ # delete not needed python file