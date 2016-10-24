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

create table compatencia(
id_competencia int not null primary key, 
fecha_inicio date not null, 
fecha_fin date not null, 
costo_inscripcion float not null, 
sede_competencia varchar(50) not null);


--control de versiones
--0.1 primera creacion del script muchas tablas le faltan los tipo de datos y dudas. 22-10-2016