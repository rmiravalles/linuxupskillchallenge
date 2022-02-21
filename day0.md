# Day 0: Creating your own server

## Introduction

I'll be using Azure for this entire course, since it's the platform I'm more familiarized with.

For day 0 of the course, we need to create a Linux virtual machine hosted in the cloud.

## Creating a Ubuntu VM using the Azure CLI

I used the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/) running on WSL for this exercise. To install Azure CLI in a Linux environment, there's a very handy command. It's all done in a single line.

`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

Now that we have it installed, we run the `az login` command to login to our Azure account. This command will open a new browser window, where you need to sign in to your Microsoft account associated with Azure.

### Creating a resource group

In Azure, a resource group is a container that holds related resources for an Azure solution. It can include all the resources for the solution or only those resources you want to manage as a group.

All resources must belong to a resource group.

To create a resource group with Azure CLI, we run the following command:

`az group create -n resourcegroupname -l location`

### Creating the virtual machine

To create a virtual machine with the Azure CLI, we use the `az vm create` command with the appropriate parameters. For this lab, I created a Ubuntu VM with the [*B2ms* size](https://docs.microsoft.com/en-us/azure/virtual-machines/sizes) and generated the ssh keys with the `generate-ssh-keys` parameter.

When you run the `az vm create` command, an ssh key pair will be automatically generated and saved in the `.ssh` hidden folder in your home directory.

The output will also give you the VM's public IP address, that you'll use later to connect to it from your local machine.

If by any chance you didn't write down the public IP address, you can see it by running this command:

`az vm list-ip-addresses -g resourcegroupname -n vmname`

### The script

I wrote [this bash script](scripts/ubuntuvm.sh) for this exercise. When you run it,it will create a new resource group and a new Ubuntu virtual machine with a 16 Gb data disk attached. I'm still not sure if this data disk will be useful for future lessons, but I thought I'd include one.

I included the `read` command in the script, that prompts the user for certain parameters that will be used to populate the commands. These are then stored in variables. Like that, this script can be reused. In the end, this script outputs the public IP address to the screen, making it easier for you to take note of it.

## Remote access via SSH

The virtual machine will be running once the command finishes. To access it, we'll use the secure shell connection, also known as SSH, like this:

`ssh admin-username@PublicIpAddress`

When you connect to the virtual machine for the first time, the system will prompt you to validate the connection. Afterwards, you won't need to do it again. The information about the remote machine will be saved in the **known_hosts** file, which stores the ssh public key for the host. Once inside the VM, it's always a good idea to update the system, by running `sudo apt update` and then `sudo apt upgrade`.

