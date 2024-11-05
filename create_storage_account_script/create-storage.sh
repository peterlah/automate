#!/bin/bash

set +ex

## Variables
# REGION=<리전명>
# STORAGEACCOUNTNAME=<스토리지계정명>
# CONTAINERNAME=<컨테이너명>
# TFSTATE_RG=<리소스그룹명>
LOCATION="koreacentral"
STORAGE_ACCOUNT_NAME="lswterraformstate0621"
CONTAINER_NAME="tfstate"
RESOURCE_GROUP_NAME="peterlah-rg"

## 스크립트 실행위치를 변수로 설정
WORKING_DIR=$(pwd)

# create resource group
echo "##### Create Resource Group #####" >> $WORKING_DIR/script.log
az group create --name $TFSTATE_RG --location $REGION >> $WORKING_DIR/script.log

# create storage account
echo "##### Create Storage Account #####" >> $WORKING_DIR/script.log
az storage account create -n $STORAGEACCOUNTNAME -g $TFSTATE_RG -l $REGION --sku Standard_LRS >> $WORKING_DIR/script.log

# create container
echo "##### Create Blob Container #####" >> $WORKING_DIR/script.log
az storage container-rm create --resource-group $TFSTATE_RG --storage-account $STORAGEACCOUNTNAME --name $CONTAINERNAME >> $WORKING_DIR/script.log

# check account key
echo "##### Check Account Key #####" >> $WORKING_DIR/script.log
ACCOUNT_KEY=$(az storage account keys list --resource-group $TFSTATE_RG --account-name $STORAGEACCOUNTNAME --query '[0].value' -o tsv)
echo $ACCOUNT_KEY  >> $WORKING_DIR/script.log