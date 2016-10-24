--script 300gym

create database 300gym;

use 300gym;

create table socio(
ID_Socio int not null primary key, 
Nombre_Socio varchar(40) not null, --normalización falta
fecha_nac date not null, 
genero_socio varchar(10) not null, 
correo_socio varchar(30) not null, 
Telefono_socio int not null, 
Notas varchar(100) not null, 
estado_salud varchar(100) not null, --preguntar
);

create table Entrenador(
id_Entrenado int not null primary key,
Nombre_Ent varchar(20) not null, 
Apellido_Ent varchar(20) not null, 
Fecha_nac date not null, 
Direccion varchar(100) not null, 
Telefono int not null, 
sexo int not null, --como se almacenara ese dato
Experiencia varchar(1000) not null, 
certificaciones varchar(500) not null,-- se debera cambiar el nombre al E-R, se encuentra como observaciones
turno varchar(10) not null, 
fecha_ing date not null, 
fotografia longblob not null not null
);

create table Rutina( --agregar tipo de dato que require
ID_Rutina int not null primary key, 
nombre_rutina not null, 
Tipo_Rutina not null, 
Sesiones not null);

create table visita(
id_visita int not null primary key, -- no se encuentra en el E-R preguntar
ID_Rutina int not null, 
ID_Socio int not null, 
fecha_visita date not null, 
horaEntrada TIME not null, --preguntar si este tipo de formato o otro a utilizar
totalSesiones not null,--???
FOREIGN KEY (ID_Rutina) REFERENCES Rutina(ID_Rutina),
FOREIGN kEY (ID_Socio) REFERENCES socio(ID_Socio)
);

create table paga(
folio int not null primary kEY, --* E-R
fecha_pago date not null, 
tipo_membresia varchar(20)not null, 
costo float not null);

create table membresia( --preguntar
No_membresia int not null primary kEY, 
tipo_membresia varchar(20) not null, 
tipo_disciplina varchar(20) not null, 
fecha_registro date not null, 
vigencia_membresia date not null);

create table Ejercicio(
ID_Ejercicio int not null primary key, 
nombre_ejercicio not null, 
Series not null, 
Repeticiones not null);

create table suplementos(
Nombre varchar (20) not null,
PrecioCompra float not null,
PrecioVenta float not null,
Exietencias integer(3) not null,
Descripcion varchar(50) not null
);

create table competencia(
id_Competencia Int not null primary key,
nombre_Competencia Varchar(100) not null,
fecha_Inicio_Competencia Date not null, 
fecha_Fin_Competencia Date not null, 
nombre_Lugar_Sede Varchar(100) not null,
dirección_Sede varchar(300) not null, 
costo_Inscripcion float not null, 
id_Competidor int not null, 
nombre_competidor Varchar(100) not null,
fecha_nacimiento Date not null, 
sexo_Competidor Date not null, 
teléfono_competidor Varchar(100) not null,
peso_competidor float not null, 
estatura_competidor Float not null, 
email_competidor Varchar(100) not null, 
costo_inscripcion_categoria Float not null, 
id_categoria_De_Competencia Int not null, 
nombre_categoria_competencia Varchar(100) not null
id_clasificación_de_categoria Varchar(100) not null);
