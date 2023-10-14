# To-Do App

## Customizable Kanban board like Task Manager

## Demo

[![To-do-App](<https://img.shields.io/badge/Tryit-(here)-blue.svg>)](https://to-do-app-gold.vercel.app/)
![demo](./src/assets/demo.gif)

## Features

- Drag-n-Drop cards and list
- Material UI
- Delete and Add Cards and Lists
- Update/Edit List and Cards

## 🛠 Technologies Used

- React Js - `Javascript library to create UI`
- react-beautiful-dnd - `npm Package`
- Node Js - `JavaScript runtime built`
- Visual Studio Code - `Code Editor`

## Installation

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.\
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `yarn eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

## DOCKER IMAGE - KUBERNET - KUBECTL

### DOCKER IMAGE (SOLO PRUEBA)

1. Crear archivo [Dockerfile](./Dockerfile). **NOTA**: Esto es Obligatorio.
2. Ejecutar

```
    docker build -t to-do .
```

#### **SOLO POR VALIDACION**

1. Crear Contenedor

```
    docker container run -dp 85:80 --name to-do-gitactions to-do
```

2. Subir a Docker Hub (Solo si se creo un repositorio)

```
    docker push jmlq-ima/to-do
```

3. Crear un tag en imagen Docker Hub (Solo si se creo un repositorio)

```
    docker image tag jmlq-ima/to-do:latest jmlq-ima/to-do:1.0.0
    docker push jmlq-ima/to-do:1.0.0
```

4. Descargar Imagen Docker Hub

```
    docker pull jmlq-ima/to-do
```

5. **KUBERNET - KUBECTL**

- Ejecutar [Kubernete con imagen de AWS](https://skryvets.com/blog/2021/03/15/kubernetes-pull-image-from-private-ecr-registry/)

```
        <!-- Login a la imagen ECR-->
        <!-- aws ecr get-login-password --region region-name | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region-name.amazonaws.com -->
        aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 425536599249.dkr.ecr.us-east-2.amazonaws.com


        <!-- Obtener credenciales Usuario AWS -->
        aws ecr get-login-password
        docker login
        <!-- kubectl apply -f todo-app.yml -->
        kubectl create -f todo-app.yml

        kubectl get pods --watch
        minikube service todo-app-service
```

- Eliminar

```
        kubectl get deployments
        kubectl delete deployment todo-app-deployment
        kubectl get services
        kubectl delete service todo-app-service
        kubectl get secrets
        kubectl delete secret regcred
```

## PUBLICAR EN AWS

### **Configurar AWS CLI**

1.  Descargar e Instalar [AWS CLI](https://docs.aws.amazon.com/es_es/cli/latest/userguide/getting-started-install.html)

2.  Validar Version

```
        aws --version
```

3.  Confogurar Login AWS

```
        aws configure
```

### CONFIGURAR ECR

#### **CREAR POLITICA PARA USO DE ECR**

Esta [política](./assets/politica-ecr.json) se debe asignar al usuaio con el que se va a acceder desde AWS CLI

### **CONFIGURAR CREDENCIALES AWS**

1. Ejecutar

```
        aws configure
```

2. Ingresar Key del Usuario y la region (ECR-Public us-east-2 | ECR us-east-1)

```
        AWS Access Key ID [****************NHDW]: ****************NHDW
        AWS Secret Access Key [****************Agmu]: ****************Agmu
        Default region name [us-east-2]: us-east-2
        Default output format [json]: json
```

### **CREAR REPOSITORIO PRIVADO**

1. Ingresar a la [ECR](https://us-east-2.console.aws.amazon.com/ecr/home?region=us-east-2) Amazon Elastic Container Registry.

![](./assets/1-ECR-Comenzar.png)

2. Crear Repositorio **PRIVADO**

![](./assets/1-ECR-Repositorio.png)

3. Ingresar al Repositorio

![](./assets/1-ECR-Ingresar-Repositorio.png)

4. Ver comandos de Envío

![](./assets/1-ECR-Comandos-Envio.png)

5. Seguir las siguientes instrucciones

![](./assets/1-ECR-Seguir-Instrucciones.png)

### **PUBLICAR IMAGEN DOCKER EN ECR PRIVADO**

1. Autentificación

```
        aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 425536599249.dkr.ecr.us-east-2.amazonaws.com
```

2. Crear imagen en Docker

```
        docker build -t jmlq/todo-app .
```

3. Crear un tag en la imagen

```
        docker tag jmlq/todo-app:latest 425536599249.dkr.ecr.us-east-2.amazonaws.com/jmlq/todo-app:latest
```

4. Enviar imagen al repositorio ECR AWS

```
        docker push 425536599249.dkr.ecr.us-east-2.amazonaws.com/jmlq/todo-app:latest
```

### [CI/CD - AWS - EKS + Github Actions](https://github.com/eksctl-io/eksctl/blob/main/README.md#installation)

#### [**PERMISOS USUARIO**](https://eksctl.io/installation/)

| AWS Service      | Access Level                                       |
| ---------------- | -------------------------------------------------- |
| CloudFormation   | Full Access                                        |
| EC2              | Full: Tagging Limited: List, Read, Write           |
| EC2 Auto Scaling | Limited: List, Write                               |
| EKS              | Full Access                                        |
| IAM              | Limited: List, Read, Write, Permissions Management |
| Systems Manager  | Limited: List, Read                                |

> > Ver [Politica](./assets/politica-eks.json)

#### **CREAR VPC**

1. Crear VPC

![](./assets/2-EKS-VPC-Crear.png)

2. Configurar VPC: Numero de zonas 2, Cantidad de Subredes publicas 2, Cantidad de Subredes privadas 2

![](./assets/2-EKS-VPC-Configurar.png)

- Vista Previa

![](./assets/2-EKS-VPC-Configurar-VistaPrevia.png)

3. Flujo de trabajo

![](./assets/2-EKS-VPC-FlijoTrabajo.png)

4. Ver VPC

![](./assets/2-EKS-VPC.png)

5. Editar Subnet

![](./assets/2-EKS-VPC-Subnet-Editar.png)

6. Habilitar IPv4 Publica

![](./assets/2-EKS-VPC-Subnet-HabilitarIPv4Publica.png)

#### [**CREAR CLUSTER USANDO EKSCTL**](https://github.com/davejfranco/youtube-tutorial-src/blob/master/tutoriales/kubernetes/eksctl/TUTORIAL.md)

1.  Descargar [eksctl](https://github.com/eksctl-io/eksctl/blob/main/README.md#installation) es una herramienta de línea de comandos para crear y administrar clústeres de Kubernetes en Amazon EKS.

```
        eksctl version

        NOTA: tambien se puede ejecutar: choco install eksctl
```

2. Crear Archivo [Cluster](./cluster.yml)

3. Crear un Cluster EKS usando este comando:

```
        eksctl create cluster -f cluster.yml


        eksctl create iamidentitymapping --cluster jmlq-eks-test --region=us-east-2 --arn arn:aws:iam::425536599249:role/jmlq-github-action-role --group system:masters --username admin

        <!-- eksctl get iamidentitymapping --cluster <clusterName> --region=us-east-2 -->

        eksctl get iamidentitymapping --cluster jmlq-eks-test --region=us-east-2
```

4. Colocar un alias al Cluster

```
        aws eks update-kubeconfig --region us-east-2 --name jmlq-eks-test --alias jmlq-cluster-alias
```

5. Obtener los nodos

```
        kubectl get nodes
```

6. Eliminar Cluster EKS - Cuando ya no se usa

```
        eksctl delete cluster --name jmlq-eks-test
```

#### [**GITHUB ACTIONS**](https://docs.github.com/es/actions)

1. Archivo GitHub Actions [Github Actions](./.github/workflows/demo-github-actions.txt). Es un Workflow demo para saber como funciona `Github Actions`.

### TIPS GIT

```
        git status
        git add -A
        git commit -m "Mensaje"
        git push -u origin develop      //Push a otro branch que no existe
                                        //Se crea un pull request que se puede ejecutar
                                        //desde la consola o desde github

```

2. Archivo GitHub Actions [Github Actions](./.github/workflows/ci-ca.yml). Es un Workflow para cargar image `Docker` a `ECR` y a `EKS` con `Github Actions`.

3. Configurar Accesos

> - En GitHub Actions - [OpenID Connect in AWS](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services) copiar la URL y Audence que se van a usar para crear las credenciales de acceso en IAM.

![](./assets/3-CICD-GitHub-Actions-Credenciales.png)

URL: https://token.actions.githubusercontent.com
Audience: sts.amazonaws.com

> - En `IAM` ir a `Identity Providers`

![](./assets/3-CICD-IAM-IdentidadProveedores.png)

> - Pegar la URL y Audence para obtener Huella de Identidad

![](./assets/3-CICD-IAM-IdentidadProveedores-ObtenerHuella.png)

> - Agregar Proveedor

![](./assets/3-CICD-IAM-AgregarProveedor.png)

4. Crear Rol para conectarse al Kluster

> - Crear Politica Personalizada jmlq-eks-access-policy

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"eks:DescribeCluster",
				"eks:ListClusters"
			],
			"Resource": "*"
		}
	]
}
```

> - Seleccionar Entidad de Confianza

![](./assets/3-CICD-IAM-Rol-1.png)

> - Agregar Permisos

![](./assets/3-CICD-IAM-Rol-AgregarPermisos.png)

> - Crear Rol

![](./assets/3-CICD-IAM-Rol-Crear.png)

> - En GitHub Actions - [OpenID Connect in AWS](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services) copiar Codiciones. **NO SE PUDO**

![](./assets/3-CICD-GitHub-Actions-Conditions.png)

```
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:MLahuasi/todo-app-aws:*"
                },
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                }

```

> - En el Rol creado en `IAM` editar las politicas con los valores especificados en GitHub Actions. **NOTA**: Se cambia el nombre del repositorio.

![](./assets/3-CICD-IAM-Rol-Editar-RelacionesConfianza.png)

> - Agregar al usuario la política `AmazonEC2ContainerRegistryPowerUser`

![](./assets/3-CICD-IAM-Rol-Editar-AmazonEC2ContainerRegistryPowerUser.png)

4. Configurar Rol en `GitHub`

> - Ir a Settings

![](./assets/3-CICD-GitHub-ConfigurarRol-Settings.png)

> - Ir a Secrets and Variables/Actions

![](./assets/3-CICD-GitHub-ConfigurarRol-SecretsVariables.png)

> - New Secret

![](./assets/3-CICD-GitHub-ConfigurarRol-NewSecret.png)

> - Asignar un nombre y pegar el arn del `Rol`

![](./assets/3-CICD-GitHub-ConfigurarRol-NewSecret-Valores.png)

> - Configurar job `cd` (Deploy Continuo) en [Workflow](./.github/workflows/ci-ca.yml). Para configurar

```
      - name: AWS authentication
        uses: aws-actions/configure-aws-credentials@v1
        with:
          role-to-assume: ${{ secrets.AWS_IAM_ROLE }}
          role-duration-seconds: 1200
          role-session-name: ${{ github.sha }}
          aws-region: us-east-2
```

> > - Configurar Login a la imagen ECR

```
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1

        Es igual al comando:

        aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 425536599249.dkr.ecr.us-east-2.amazonaws.com
```

> > - Construir y Subir Imagen desde Docker

```
        run: |
          docker build -t $DOCKER_REPO:${{ github.sha }} .
          docker push $DOCKER_REPO:${{ github.sha }}
```

> > - Desplegar la Imagen en EKS

```
        run: |
          aws eks update-kubeconfig --region us-east-2 --name jmlq-eks-test
          kubectl set image deployment/app app=$DOCKER_REPO:${{ github.sha }} -n demo
```

### EJECUTAR ANTES DEL PUSH

```
        <!-- Login a la imagen ECR-->
        <!-- aws ecr get-login-password --region region-name | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region-name.amazonaws.com -->
        aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 425536599249.dkr.ecr.us-east-2.amazonaws.com


        <!-- Obtener credenciales Usuario AWS -->
        aws ecr get-login-password
        docker login
        <!-- kubectl apply -f todo-app.yml -->
        kubectl create -f todo-app.yml

        kubectl get pods --watch
        minikube service todo-app-service
```
