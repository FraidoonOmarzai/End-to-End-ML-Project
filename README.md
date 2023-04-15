<h1 align=center> End-to-End-ML-Project</h1>

**Note:** Implementing end to end ML project with docker and github action. In this project we will use Linear Regression model.


*******************************************************************************************************************

## Steps

* Create an environment and acitvate it
```bash
conda create -n my_env python==3.7 -y
conda activate my_env
```

* create req file and run it
```bash
touch requirements.txt
pip install -r requirements.txt
```

* open jupyer-notebook and create a new notebook 
* follow the belove steps:
    * import libraries
    * get the dataset
    * EDA
    * feature engineering
    * train the model
    * model evaluation
    * save the model

* creating web app
    * create app.py
    * create templates folder along home.html


* create Dockerfile and add code to it

* create .github/workflows/main.yaml for CI/CD purpose to build docker image
```bash
name: Build Docker Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2
    - name: Build Docker image
      uses: docker/build-push-action@v2
      with:
        context: .
        push: false
        tags: my-docker-image:${{ github.sha }}
```

* play with ci/cd

* code for main.yaml inorder to bulid and push docker images

```bash
name: Build and Push Docker Image

on:
  push:
    branches: [ main ]

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Login to Docker registry
      uses: docker/login-action@v1
      with:
        registry: docker.io
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build Docker image
      run: |
        docker build -t my-docker-username/my-docker-image-name:${{ github.sha }} .

    - name: Push Docker image
      run: |
        docker push my-docker-username/my-docker-image-name:${{ github.sha }}
```