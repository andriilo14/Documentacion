create database warlock_soft

use warlock_soft

create table tipo_usuario(
id_tipo_usuario int primary key not null,
usuario_administrador bit not null,
usuario_co_administrador bit not null,
usuario_normal bit not null);

create table usuario(
id_usuario int primary key not null,
nombre_completo varchar(20) not null,
correo varchar(20) not null,
fecha_nacimiento date not null,
nombre_usuario varchar(20) not null,
contraseña varchar(20) not null,
id_tipo_usuario int not null,
foreign key (id_tipo_usuario) references tipo_usuario (id_tipo_usuario));

create table habilidad(
id_habilidad int primary key not null,
nombre varchar (20) not null,
id_usuario int not null,
foreign key (id_usuario) references usuario (id_usuario));

create table conocimiento(
id_conocimiento int primary key not null,
nombre varchar (20) not null,
id_habilidad int not null,
foreign key (id_habilidad) references habilidad (id_habilidad));

create table asociacion(
id_asociacion int primary key not null,
nombre varchar (20) not null,
resumen_objetivo varchar (50) not null,
logo image,
id_usuario int not null,
foreign key (id_usuario) references usuario (id_usuario));

create table karma(
id_karma int primary key not null,
nombre varchar (20) not null,
puntos_proyecto int not null,
puntos_tarea int not null,
puntos_habilidad int not null,
id_usuario int not null,
foreign key (id_usuario) references usuario (id_usuario));

create table proyecto(
id_proyecto int primary key not null,
nombre varchar (20) not null,
fecha_inicio date not null,
fecha_fin date not null,
id_usuario int not null,
foreign key (id_usuario) references usuario (id_usuario));

create table tarea(
id_tarea int primary key not null,
nombre varchar(20) not null,
descripcion varchar (20) not null,
fecha_inicio date not null,
id_proyecto int not null,
id_conocimiento int not null,
foreign key (id_proyecto) references proyecto (id_proyecto),
foreign key (id_conocimiento) references conocimiento (id_conocimiento));