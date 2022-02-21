#!/bin/bash

# A script to create an Ubuntu VM with a data disk attached

# Create resource group
echo "Creating new resource group"
read -p "Please enter the resource group name: " rgname

az group create --name $rgname --location westeurope

echo $rgname resource group created

# Create an Ubuntu VM with an attached data disk and generate ssh keys
echo "Creating new Ubuntu virtual machine with a 128 GB data disk attached"
read -p "Please enter the VM name: " vmname
read -p "Please enter the admin username: " username

az vm create \
    --resource-group $rgname \
    --name $vmname \
    --image UbuntuLTS \
    --size Standard_B2ms \
    --admin-username $username \
    --generate-ssh-keys \
    --data-disk-sizes-gb 16

publicip=$(az vm list-ip-addresses \
    -g $rgname \
    -n $vmname \
    --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" \
    -o tsv)

echo $vmname created
echo your admin username is $username
echo the public IP address of $vmname is $publicip
echo END