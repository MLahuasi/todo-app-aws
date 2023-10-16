### Obtener en get-login-password en Windows

```
    $base64EncodedPassword = aws ecr get-login-password | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString
    echo $base64EncodedPassword
```

### CREAR UN SECRETO

```
    kubectl create secret docker-registry <nombre-secreto> --docker-server=<user>.dkr.ecr.<region>.amazonaws.com --docker-username=<user-name></user-name> --docker-password="valor en base64EncodedPassword" --dry-run=client -o yaml > secret.yaml



    kubectl create secret docker-registry regcred --docker-server=425536599249.dkr.ecr.us-east-2.amazonaws.com --docker-username=AWS --docker-password=$(aws ecr get-login-password) --dry-run=client -o yaml > secret.yaml
```
