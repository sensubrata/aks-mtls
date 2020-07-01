# POC of SSL and MTLS in AKS

## Function Description
- Extracts public and private keys from SSL .pfx cert to be used with NginX for HTTPS request.
- Creates self-signed certs to be used with NginX for mTLS.
- Creates a tainted `NoSchedule` nodepool attached to a different dedicated subnet (NSG can be attached to the subnet). 
- Creates a Azure PIP in the management resource group of the cluster.
- Creates an Ingress controller with the PIP.
- Creates demo apps and services with tolerations for the tainted noodpool.
- Create an Ingress object as HTTPS reverse proxy with SSL certs and which reuires mTLS auth using self-certs.
- Test and verify connection and mTLS auth.

### Prerequisites
* Azure Subcription
* Azure CLI
* Existing AKS cluster in a VNet
* Existing additional subnet on that VNet

### Instructions
Execute [script.azcli](script.azcli) following comments to deploy infra and demo apps.
After that test connection with [test.sh](test.sh).

## Authors
- **Subrata Sen**

## License
_For my personal and company (Finomial Corp.) use only._

## References
- https://docs.microsoft.com/en-us/azure/aks/ingress-static-ip
- https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools
- https://docs.microsoft.com/en-us/azure/aks/ingress-own-tls
- https://medium.com/@awkwardferny/configuring-certificate-based-mutual-authentication-with-kubernetes-ingress-nginx-20e7e38fdfca