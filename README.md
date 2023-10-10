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

```
docker build -t jmlqtest/to-do .
docker container run -dp 85:80 --name to-do-gitactions jmlqtest/to-do


<!-- Subir a Docker Hub -->
docker push jmlqtest/to-do
docker image tag jmlqtest/to-do:latest jmlqtest/to-do:1.0.0
docker push jmlqtest/to-do:1.0.0

<!-- Descargar Imagen Docker Hub -->
docker pull jmlqtest/to-do:1.0.0

kubectl apply -f todo-app.yml
kubectl get pods --watch
minikube service todo-app-service

<!-- Eliminar -->
kubectl get deployments
kubectl delete deployment todo-app-deployment
kubectl get services
kubectl delete service todo-app-service
```
