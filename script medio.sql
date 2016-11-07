--script 300gym

create database 300gym;

use 300gym;

create table socio(
ID_Socio varchar(9) not null primary key,
Nombre_Socio varchar(40) not null, 
Teléfono_socio varchar(13) not null, 
Correo_socio varchar(40) not null, 
Genero_socio varchar(1) not null, 
Fecha_nacimiento_socio date not null, 
Estado_salud_socio varchar(40) not null, 
Notas_socio varchar(40) not null);

create table Entrenador(
id_Entrenador int not null primary key,
Nombre_Entrenador varchar(60) not null, 
Fecha_nacimineto_entrenador date not null, 
Direccion_entrenador varchar(120) not null, 
Telefono_entrenador varchar(20) not null, 
genero_entrenador int not null,
Experiencia_entrenador varchar(1000) not null, 
Certificaciones_entrenador varchar(500) not null,
turno_entrenador varchar(10) not null, 
fecha_ingreso_entrenador date not null, 
Fotografia_entrenador longblob not null);

create table Rutina( --agregar tipo de dato que require
ID_Rutina int not null primary key, 
Nombre_rutina not null,
numero_sesiones_fltantes_rutina not null);

create table visita(
id_visita int not null primary key,
ID_Rutina int not null, 
ID_Socio int not null, 
fecha_visita date not null, 
Hora_Entrada_Visita TIME not null,
FOREIGN KEY (ID_Rutina) REFERENCES Rutina(ID_Rutina),
FOREIGN kEY (ID_Socio) REFERENCES socio(ID_Socio)
);

create table pago_membresia(
folio_pago int not null primary key,
fecha_pago date not null, 
tipo_unidades_pago date not null, 
cantidad_unidades_pago int not null,
costo_unitario_pago float not null, 
importe_pago float not null);

create table membresia( --preguntar
id_membresia int not null primary kEY, 
fecha_registro_membresia date not null,
estado_membresia varchar(30) not null,
 fecha_vencimiento date not null);
  
create table Ejercicio(
ID_Ejercicio int not null primary key, 
nombre_ejercicio not null, 
Series not null, 
Repeticiones not null);

create table Proveedor(
Id_proveedor int not null primery key,
nombre_Proveedor varchar(50) not null,
Direccion_Proveedor varvhar(50) not null,
Sitio_Proveedor varchar(50) not null,
Telefono_Proveedor int not null);

create table suplementos(
Id_suplemento int not null primary key,
Nombre_Suplemento varchar (20) not null,
Precio_Venta_suplemento float not null,
Precio_Compra_suplemento float not null,
Exietencias_suplemento integer(3) not null,
Descripcion_suplemento varchar(50) not null
Id_Proveedor int not null,
FOREIGN KEY (Id_Proveedor) REFERENCES Proveedor(Id_Proveedor));


create table Competencia(
id_Competencia Int not null primary key,
Nombr_competencia varchar(30) not null,
nombre_sede_competencia Varchar(100) not null, 
dirección_Sede varchar(100) not null, 
fecha_Inicio_Competencia Date not null, 
fecha_Fin_Competencia Date not null,  
costo_Inscripcion_competencia float not null);

create table Competidor(
Id_Competidor int not null primary key,
nombre_competidor Varchar(100) not null,
fecha_nacimiento_competidor Date not null,
sexo_Competidor varchar(10) not null,
teléfono_competidor int not null,
peso_competidor float not null, 
estatura_competidor Float not null,
email_competidor Varchar(100) not null,
id_Competencia int not null,
FOREIGN KEY (Id_Competendia) REFERENCES Competencia(Id_Competencia));

create table Categoria(
id_categoria int not null primery key, 
nombre_categoria varchar(20) not null);

create table Clasificacion(
id_clasificacion int not null primary key,
nombre_clasificacion varchar(20) not null);

create table Login(
nombre_usuario varchar(20) not null primary key, 
conatrasena_usuario varchar(10) not null, 
tipo_cuenta_usuraio varchar(30));

create table Aparatos(
id_aparato int not null primary key, 
tipo_aparato varchar(30)not null, 
cantidad_aparato int not null, 
precio_aparato double(6) not null, 
nombre_aparato varchar(40) not null, 
proveedor_aparato varchar(40) not null, 
observaciones_aparato varchar(300) not null);

create table dietas(
  ID_dieta int not null primary key,
  peso_socio float not null,
  estatura_socio float not null,
  indice_Masa_Corporal_socio float not null,
  descripcion_dieta_socio varchar(30) not null,
  actiidad_Fisica_socio varchar(50) not null,
  fecha_Asignacion_dieta date not null);

