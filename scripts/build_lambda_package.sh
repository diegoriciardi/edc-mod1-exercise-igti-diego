#!/usr/bin/env bash

cd iac

# Declara variavel para reutilizacao nas validacoes do diretorio
PACKAGE="package"

# Cria o diretorio e instala as dependencias da funcao lambda
if [ -d $PACKAGE ]
then
    echo "O diretorio "$PACKAGE" ja existe."
else
    echo "============================================================="
    echo "Criando o diretorio "$PACKAGE"..."
    mkdir $PACKAGE
    echo "O diretorio "$PACKAGE" foi criado."
    echo "============================================================="
fi

# Declara variavel que localiza o requirements com as dependencias do projeto
FILE_REQUIREMENTS=../etl/lambda_requirements.txt

# Verifica se o arquivo lambda_requirements.txt existe
if [ -f $FILE_REQUIREMENTS ]
then
    echo "============================================================="
    echo "Instalando dependencias localizadas no "$FILE_REQUIREMENTS""
    pip install --target ./package -r $FILE_REQUIREMENTS
    echo "Dependencias instaladas com sucesso"
    echo "============================================================="
fi

cd $PACKAGE

LAMBDA_FUNCTION=../../etl/lambda_function.py

# Verifica se o arquivo lambda_function.py existe adicionado

if [ -f $LAMBDA_FUNCTION ]
then
    echo "============================================================="
    echo "Copiando funcao Handler"
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip
    echo "Arquivo compactado com sucesso!"
    echo "============================================================="
fi

cd ..
