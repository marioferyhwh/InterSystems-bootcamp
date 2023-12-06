# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Installation process
2.	Software dependencies
3.	Latest releases
4.	API references

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)


# DOCKER




```sh
mkdir iris-shared
touch iris-shared/pass.txt
mkdir mysql-shared
echo "clave" >> iris-shared/pass.txt
```

https://docs.intersystems.com/components/csp/docbook/DocBook.UI.Page.cls?KEY=PAGE_containerregistry

Ejecutamos el siguiente comando y listo



```sh
docker-compose up -d
```
URL
```
http://localhost:52773/csp/sys/utilhome.csp 
```

A continuación hay algunos comandos bastante utiles que conviene conocer de docker si no lo utilizamos habitualmente.


```sh
# ejecutar una consola bash del contenedor de iris de las katas
docker exec -ti katas-iris /bin/bash
# ejecutar una consola bash del contenedor de iris de las katas como root
docker exec -u root -ti katas-iris /bin/bash
# listar los contenedores
docker container list
```

