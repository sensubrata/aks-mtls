# Hack hosts file
# Alternatively, use curl and specify the --resolve parameter.
ip='13.83.98.84'
url='finomialapi-test.finomial.com'
curl -v -k --resolve $url:$ip https://$url
# Above should return server certificate CN=*.finomial.com and response as 400 Bad Request No required SSL certificate was sent

# Send request with the Client Certificate and Key
curl -v -k --resolve $url:$ip https://$url \
--cert self-certs/client.crt --key self-certs/client.key
curl -v -k --resolve $url:$ip https://$url/hello-world-two \
--cert self-certs/client.crt --key self-certs/client.key

