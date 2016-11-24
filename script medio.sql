create database 300gym;

use 300gym;

create table socio(
ID_Socio varchar(9) not null primary key,
Nombre_Socio varchar(60) not null, 
Teléfono_socio varchar(13) not null, 
Correo_socio varchar(100) not null, 
Genero_socio varchar(1) not null, 
Fecha_nacimiento_socio date not null, 
Estado_salud_socio varchar(40) not null, 
Notas_socio varchar(40) not null,
Fecha_registro date not null) ;
create table Entrenador(
id_Entrenador int(2) not null primary key,
Nombre_Entrenador varchar(60) not null, 
Fecha_nacimineto_entrenador date not null, 
Direccion_entrenador varchar(100) not null, 
Telefono_entrenador varchar(13) not null, 
sexo_entrenador int not null,
Experiencia_entrenador varchar(1000) not null, 
Certificaciones_entrenador varchar(500) not null,
turno_entrenador varchar(10) not null, 
fecha_ingreso_entrenador date not null, 
Fotografia_entrenador longblob not null);

create table Rutina(
ID_Rutina varchar(4) not null primary key, 
Nombre_rutina varchar(25)not null,
numero_sesiones_faltantes_rutina int(12) not null
);

create table visita(
id_visita int not null primary key,
ID_Socio varchar(9) not null, 
fecha_visita date not null, 
Hora_Entrada_Visita varchar(5) not null,
FOREIGN kEY (ID_Socio) REFERENCES socio(ID_Socio)
);

create table pago_membresia(
folio_pago int(5) not null primary key,
ID_socio varchar(9) not null,
fecha_pago date not null, 
tipo_unidades_pago varchar(10) not null, 
cantidad_unidades_pago int(4) not null,
costo_unitario_pago float(7) not null, 
importe_pago float(7) not null,
FOREIGN KEY(ID_Socio) REFERENCES socio(ID_Socio));

create table membresia( 
id_membresia int(10) not null primary kEY, 
tipo_disciplina varchar(15) not null,
estado_membresia varchar(8) not null,
fecha_vencimiento date not null);
  
create table Ejercicio(
ID_Ejercicio varchar(4) not null primary key, 
nombre_ejercicio varchar(25) not null);

create table Proveedor(
Id_proveedor int(6) not null primary key,
nombre_Proveedor varchar(30) not null,
Direccion_Proveedor varchar(30) not null,
Sitio_Proveedor varchar(60) not null,
Telefono_Proveedor int(13) not null);

create table suplementos(
Id_suplemento int(6) not null primary key,
Nombre_Suplemento varchar(15) not null,
Precio_Venta_suplemento float not null,
Precio_Compra_suplemento float not null,
Exietencias_suplemento int(3) not null,
Descripcion_suplemento varchar(30) not null,
Id_Proveedor int not null,
FOREIGN KEY (Id_Proveedor) REFERENCES Proveedor(Id_Proveedor));

create table Competencia(
id_Competencia int(10) not null primary key,
Nombre_competencia varchar(100) not null,
nombre_sede_competencia varchar(100) not null, 
dirección_Sede varchar(100) not null, 
fecha_Inicio_Competencia date not null, 
fecha_Fin_Competencia date not null,  
costo_Inscripcion_competencia float not null);

create table Competidor(
Id_Competidor int(10) not null primary key,
nombre_competidor varchar(100) not null,
fecha_nacimiento_competidor Date not null,
genero_Competidor varchar(1) not null,
telefono_competidor int(13) not null,
peso_competidor float not null, 
estatura_competidor float not null,
email_competidor varchar(100) not null,
id_Competencia int not null,
FOREIGN KEY (Id_Competencia) REFERENCES Competencia(Id_Competencia));

create table Clasificacion(
id_clasificacion int(10) not null primary key auto_increment,
nombre_clasificacion varchar(100) not null);

create table Categoria(
id_categoria int(10) not null primary key auto_increment, 
id_clasificacion int(10), 
nombre_categoria varchar(100) not null,
FOREIGN KEY (id_clasificacion) REFERENCES clasificacion(id_clasificacion));

create table Aparatos(
id_aparato int not null primary key, 
tipo_aparato varchar(30)not null, 
cantidad_aparato int(6) not null, 
precio_aparato float not null, 
nombre_aparato varchar(40) not null, 
proveedor_aparato varchar(40) not null, 
observaciones_aparato varchar(300) not null);

create table dietas(
  ID_dieta int not null primary key auto_increment,
  peso_socio float not null,
  estatura_socio float not null,
  indice_Masa_Corporal_socio float not null,
  descripcion_dieta_socio varchar(1000) not null,
  actividad_Fisica_socio varchar(15) not null,
fecha_Asignacion_dieta date not null

create table usuario(
nombre_usuario varchar(20) not null primary key,
contrasena_usuario varchar(10) not null,
tipo_cuenta_usuario varchar(12) not null);

create table venta(
fecha_compra_suplemento date not null,
cantidad_suplemento int not null,
importe_suplemento int not null);

create table contenido (
repeticiones int(2) not null,
ID_Rutina varchar(4) not null,
ID_Ejercicio varchar(4) not null,
series int (2) not null,
FOREIGN KEY (ID_Rutina) REFERENCES Rutina (ID_Rutina),
FOREIGN KEY (ID_Ejercicio) REFERENCES Ejercicio (ID_Ejercicio));
