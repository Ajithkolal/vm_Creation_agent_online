 #!/bin/bash
      az login --tenant af5a6fb3-b792-4f0e-aa58-7cf18b9cad30
      az account show --output yaml
      az group create --name mytestrg --location eastasia
      az network vnet create -g mytestrg -n testvnet --address-prefix 10.0.0.0/16 \
                --subnet-name testsubnet --subnet-prefix 10.0.0.0/24
      az network public-ip create -g mytestrg -n testip --allocation-method Dynamic
      az network nsg create -g mytestrg -n testnsg
      az network nic create -g mytestrg --vnet-name testvnet --subnet testsubnet -n testnic
      az network nic ip-config create -g mytestrg -n testipConfig --nic-name testnic --make-primary
      az vm create -n testvm -g mytestrg --image UbuntuLTS --public-ip-address testip --authentication-type password --admin-username demouser --admin-password Ajith@123456789
