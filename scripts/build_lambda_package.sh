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

SUBNET_FILE_NAME="subnetidfile"
AZ="us-east-1a"
aws ec2 describe-subnets --filters "Name=availability-zone,Values=$AZ" --query "Subnets[*].SubnetId" --output text > $SUBNET_FILE_NAME

aws emr create-default-roles

LAMBDA_FUNCTION=../../etl/lambda_function.py

# Verifica se o arquivo lambda_function.py existe adicionado ainda mais texto outra vez a s do brasil

if [ -f $LAMBDA_FUNCTION ]
then
    echo "============================================================="
    echo "Copiando funcao Handler"
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip .
    echo "Arquivo compactado com sucesso!"
    echo "============================================================="
fi

cd ..
