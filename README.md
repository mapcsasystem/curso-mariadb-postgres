# CURSO mariaDB/MySQL y postgresql 

## Requisitos
1. En Linux tener instalado docker y docker-compose 
2. Windows y MacOS instalar docker-desktop ya trae docker y docker-compose
3. Tener instalado un gestor de base de datos mysql-compass, dbeaver

## Levantar base de datos en la raíz del proyecto
```
docker compose up -d 
```

## Bajar base de datos en la raíz del proyecto
```
docker compose down 
```
## Conectar a mariadb
1. HOST 127.0.0.1
2. PORT 3306
3. Usuario por default root
4. Contraseña la que se designa en el docker-compose.yml