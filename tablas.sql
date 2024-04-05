
/**
  Tablas
 */

/*---------------------------------------------CICLO 1: Tablas---------------------------------------------*/

CREATE TABLE evaluaciones (
    a_omes VARCHAR(6) NOT NULL,
    tid VARCHAR(2) NOT NULL,
    nid VARCHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    descripcion CHAR(1) NOT NULL,
    reporte VARCHAR(100) NOT NULL,
    resultado CHAR(2) NOT NULL,
    idAuditoria NUMBER(9) NOT NULL
);

CREATE TABLE evaluaciones_respuestas (
    a_omes VARCHAR(6) NOT NULL,
    repuestas VARCHAR(100) NOT NULL
);

CREATE TABLE auditorias (
    id NUMBER(9) NOT NULL,
    fecha DATE NOT NULL,
    accion CHAR(1) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    codigoCategoria VARCHAR(5) NOT NULL
);

CREATE TABLE categorias (
    codigo VARCHAR(5) NOT NULL,
    nombre VARCHAR(20),
    tipo CHAR(1) NOT NULL,
    minimo NUMBER(3) NOT NULL,
    maximo NUMBER(3)
    idAuditoria NUMBER(9) NOT NULL;
);

CREATE TABLE articulos (
    id NUMBER(16) NOT NULL,
    descripcion VARCHAR(20) NOT NULL,
    estado CHAR(1) NOT NULL,
    foto VARCHAR(100) NOT NULL,
    precio NUMBER(3) NOT NULL,
    disponible NUMBER(1) NOT NULL,
    codigoCategoria VARCHAR(5) NOT NULL,
    codigoUsuario VARCHAR(10) NOT NULL
);

CREATE TABLE ropa (
    id NUMBER(16) NOT NULL,
    talla VARCHAR(2) NOT NULL,
    material VARCHAR(10) NOT NULL,
    color VARCHAR(10) NOT NULL
);

CREATE TABLE perecederos (
    id NUMBER(16) NOT NULL,
    vencimiento DATE NOT NULL
);

CREATE TABLE articulos_caracteristicas (
    id NUMBER(16) NOT NULL,
    caracteristicas VARCHAR(5) NOT NULL
);

CREATE TABLE usuarios (
    codigo VARCHAR(10) NOT NULL,
    tid VARCHAR(2) NOT NULL,
    nid VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    programa VARCHAR(20) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    registro DATE NOT NULL,
    suspension DATE NULL,
    nSuspension NUMBER(3) NOT NULL,
    codigoUniversidad VARCHAR(3) NULL
);

CREATE TABLE calificaciones(
    codigoUsuario VARCHAR(10) NOT NULL,
    idArticulo NUMBER(16) NOT NULL,
    estrellas NUMBER(1) NOT NULL
);

CREATE TABLE universidades (
    codigo VARCHAR(3) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);

/*---------------------------------------------CICLO 1: XTablas---------------------------------------------*/

DROP TABLE evaluaciones_respuestas;
DROP TABLE evaluaciones;
DROP TABLE auditorias;
DROP TABLE categorias;
DROP TABLE articulos;
DROP TABLE articulos_caracteristicas;
DROP TABLE usuarios;
DROP TABLE calificaciones;
DROP TABLE universidades;
DROP TABLE ropa;
DROP TABLE perecederos;


/*---------------------------------------------CICLO 1: PoblarOk (1)--------------------------------------------*/

SELECT * FROM universidades;

INSERT INTO universidades VALUES('001', 'Los Andes', 'Carrera 1 # 18A - 12');
INSERT INTO universidades VALUES('002', 'Nacional', 'Carrera 30 # 45 - 12');
INSERT INTO universidades VALUES('003', 'Javeriana', 'Carrera 7 # 40 - 12');

SELECT * FROM usuarios;

INSERT INTO usuarios VALUES('001', 'CC', '1234567890', 'Juan Perez', 'Sistemas', 'juanperez@gmail.com', SYSDATE, NULL, 0, '001');
INSERT INTO usuarios VALUES('002', 'CC', '1234567890', 'Maria Perez', 'Sistemas', 'mariaperez@gmail.com', SYSDATE, NULL, 2,'002');
INSERT INTO usuarios VALUES('003', 'CC', '1234567890', 'Pedro Perez', 'Sistemas', 'padroperez@gmail.com', SYSDATE, NULL, 3,'003');

SELECT * FROM articulos;

INSERT INTO articulos VALUES(1, 'Computador', 'N', 'https://www.image.com/computador.jpg', 325, 5, '001', '001');
INSERT INTO articulos VALUES(2, 'Jeans', 'N', 'https://www.image.com/jean.jpg', 80, 1, '002', '002');
INSERT INTO articulos VALUES(3, 'Camiseta', 'N', 'https://www.image.com/camiseta.jpg', 50, 1, '003', '003');

SELECT * FROM articulos_caracteristicas;

INSERT INTO articulos_caracteristicas VALUES(1, 'LAPTO');
INSERT INTO articulos_caracteristicas VALUES(2, 'M');
INSERT INTO articulos_caracteristicas VALUES(3, 'S');

SELECT * FROM ropa;

INSERT INTO ropa VALUES(2, 'M', 'Algodon', 'Azul');
INSERT INTO ropa VALUES(3, 'S', 'Algodon', 'Rojo');
INSERT INTO ropa VALUES(4, 'L', 'Algodon', 'Verde');

SELECT * FROM perecederos;

INSERT INTO perecederos VALUES(5, TO_DATE('2019-01-04', 'YYYY-MM-DD'));
INSERT INTO perecederos VALUES(4, TO_DATE('2019-01-04', 'YYYY-MM-DD'));
INSERT INTO perecederos VALUES(3, TO_DATE('2019-01-04', 'YYYY-MM-DD'));

SELECT * FROM categorias;

INSERT INTO categorias VALUES('001', 'Computadores', 'D', 1, 5);
INSERT INTO categorias VALUES('002', 'Comida', 'D', 1, 5);
INSERT INTO categorias VALUES('003', 'Accesorios', 'D', 1, 5);

SELECT * FROM auditorias;

INSERT INTO auditorias VALUES(1, TO_DATE('2019-01-01','YYYY-MM-DD') , 'I', 'Juan Perez', '001');
INSERT INTO auditorias VALUES(2, TO_DATE('2019-02-21','YYYY-MM-DD') , 'I', 'Maria Perez', '002');
INSERT INTO auditorias VALUES(3, TO_DATE('2019-06-12','YYYY-MM-DD') , 'I', 'Pedro Perez', '003');


SELECT * FROM evaluaciones;

INSERT INTO evaluaciones VALUES('200001', 'CC', '1', TO_DATE('2019-01-01', 'YYYY-MM-DD') , 'A', 'https://www.image.com/001.pdf', 'AP', 1);
INSERT INTO evaluaciones VALUES('200002', 'TI', '1', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 'A', 'https://www.image.com/002.pdf', 'PE', 2);
INSERT INTO evaluaciones VALUES('200003', 'CC', '1', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 'A', 'https://www.image.com/003.pdf', 'AP', 3);

SELECT * FROM evaluaciones_respuestas;

INSERT INTO evaluaciones_respuestas VALUES('001', 'Todo bien');
INSERT INTO evaluaciones_respuestas VALUES('002', 'Algo malo');
INSERT INTO evaluaciones_respuestas VALUES('003', 'Hay datos que estan mal');

SELECT * FROM calificaciones;

INSERT INTO calificaciones VALUES('001', 1, 5);
INSERT INTO calificaciones VALUES('002', 2, 4);
INSERT INTO calificaciones VALUES('003', 3, 3);


/*---------------------------------------------CICLO 1: PoblarNoOk (2)---------------------------------------------*/
-- Debido a la longitud de los campos de la tabla usuario, se generan errores al intentar insertar datos
INSERT INTO universidades VALUES('001', 'Universidad de Los Andes', 'Carrera 1 # 18A - 12');
-- Debido a la longitud de los campos de la tabla universidad en el codigo no pasa
INSERT INTO universidades VALUES('ADSFAS', 'Universidad Nacional', 'Carrera 30 # 45 - 12');
-- Debido a que los valores de la tabla universidad no son los mismo de la insercion no pasan las inserciones
INSERT INTO universidades VALUES('001', 'CC', '1234567890', 'Juan Perez', 'Sistemas');


-- Debidoa al atributo de fecha no deja pasar los cassos prueba y presenta un fallo al insertar
INSERT INTO usuarios VALUES('001', 'CC', '1234567890', 'Juan Perez', 'Sistemas', 'juanperez@gmail.com', '2058-56-89', NULL, 0, '001');
-- Razon: Falla por que en el campo de Tid no se puede insertar un valor de 3 caracteres
INSERT INTO usuarios VALUES('001', 'C.C', '1234567890', 'Juan Perez', 'Sistemas', 'juanperez@gmail.com', '2058-56-89', NULL, 0, '002');
-- Razon: falla por que el correo no puede ser nulo
INSERT INTO usuarios VALUES('001', 'CC', '1234567890', 'Juan Perez', 'Sistemas', NULL, '2058-56-89', NULL, 0, '003');


--Razón: Falla porque descripcion no permite valores nulos.
INSERT INTO articulos VALUES (1, NULL, 'N', 'urlfoto.jpg', 10, 1, '001', '001');
--Razón: Falla porque precio  no permite valores nulos.
INSERT INTO articulos VALUES (1, 'Producto', 'A', 'foto.jpg', NULL, 1, '002', '002');
--Razón: Falla porque disponible asume un valor booleano (0 o 1), y se intenta insertar un 10 que esta fuera del rango.
INSERT INTO articulos VALUES (1, 'Producto', 'A', 'foto.jpg', 10, 10, '003', '003');


-- Razón: Falla porque caracteristicas no puede ser un valor vacío.
INSERT INTO articulos_caracteristicas VALUES (10001, '');
-- Razón: Falla porque id no puede ser un valor vacío.
INSERT INTO articulos_caracteristicas VALUES (NULL, 'ABCD');
--Razón: Falla porque caracteristicas excede el límite de 5 caracteres.
INSERT INTO articulos_caracteristicas VALUES (10002, 'AAABCDE');


-- Razón: Falla porque id no puede ser nulo.
INSERT INTO ropa (id, talla, material, color) VALUES (NULL, 'M', 'Algodón', 'Azul');
-- Razón: Falla porque material excede el límite de 10 caracteres.
INSERT INTO ropa (id, talla, material, color) VALUES (10001, 'XXL', 'MaterialMuyLargo', 'Azul');
-- Razón: Falla porque color excede el límite de 10 caracteres.
INSERT INTO ropa (id, talla, material, color) VALUES (10001, 'XXL', 'Lino', 'ColorMuyLargoParaElCampo');


-- Razón: Falla porque la fecha tiene que mandarse con formato.
INSERT INTO perecederos (id, vencimiento) VALUES (10001, '2024-02-30');
-- Razón: Falla porque el id no puede ser nula.
INSERT INTO perecederos (id, vencimiento) VALUES (NULL, '2024-02-30');
-- Razón: Falla porque la fecha no puede ser nula.
INSERT INTO perecederos (id, vencimiento) VALUES (10002, NULL);


-- Razón: Falla porque el codigo no puede ser un valor vacío.
INSERT INTO categorias VALUES ('', 'Electrónica', 'A', 1, 100);
-- Razón: Falla porque el nombre no puede ser un valor vacío.
INSERT INTO categorias VALUES ('EL01', NULL, 'X', 0, 100);
-- Razón: Falla porque el nombre excede los 20 caracteres y además el valor minimo no puede ser mayor que maximo.
INSERT INTO categorias VALUES ('EL01', 'ElectrónicaSuperLargaQueExcede', 'A', 10, 5);


-- Razón: Falla porque la columna fecha no permite valores nulos.
INSERT INTO auditorias  VALUES (1, NULL, 'C', 'Usuario', '001');
-- Razón: Falla porque el valor de nombre excede el límite de 20 caracteres.
INSERT INTO auditorias  VALUES (1, '2024-03-13', 'E', 'NombreMuyLargoParaEsteCampo', '002');
--Razón: Aunque no se especifica una restricción explícita sobre los valores permitidos para accion, si la intención es que sólo acepte ciertos caracteres (por ejemplo, 'C' para crear, 'U' para actualizar, 'D' para eliminar), este insert fallaría debido a la violación de dicha regla de negocio al intentar insertar 'X'.
INSERT INTO auditorias VALUES (1, '2024-03-13', 'X', 'Usuario', '003');


-- Razón: Falla porque el valor de reporte excede el límite de 100 caracteres.
INSERT INTO evaluaciones VALUES ('ABCDE', 'CC', '1234567890', '2024-03-13', 'A', 'Reporte muy largo que excede el límite permitido', 'OK', 1);
-- Razón: Falla porque el valor de descripcion excede el límite de 1 caracter.
INSERT INTO evaluaciones VALUES ('ABCDEF', 'CC', '1234567890', '2024-03-13', 'Descripción muy larga que excede el límite permitido', 'Reporte', 'OK', 2);
-- Razón: Falla porque la fecha '2024-02-30' es inválida (Febrero no tiene 30 días).
INSERT INTO evaluaciones VALUES ('ABCDE', 'CC', '1234567890', '2024-02-30', 'A', 'Reporte', 'OK', 3);


-- Razón: Falla porque repuestas no puede ser un valor vacío.
INSERT INTO evaluaciones_respuestas (a_omes, repuestas) VALUES ('ABCDE', '');
-- Razón: Falla porque el valor de a_omes excede el límite de 6 caracteres.
INSERT INTO evaluaciones_respuestas (a_omes, repuestas) VALUES ('ABCDEF7', 'Respuesta muy larga que excede el límite permitido para este campo');
-- Razón: Falla porque repuestas no puede ser nulo.
INSERT INTO evaluaciones_respuestas (a_omes, repuestas) VALUES ('ABCDE', NULL);

-- Razón: Falla porque estrellas debe estar en un rango de 1 a 5 y se pasa del rango.
INSERT INTO calificaciones (codigoUsuario, idArticulo, estrellas) VALUES ('U1000', 10001, 10);
-- Razón: Falla porque codigoUsuario no puede ser nulo.
INSERT INTO calificaciones (codigoUsuario, idArticulo, estrellas) VALUES (NULL, 10001, 4);
-- Razón: Falla porque idArticulo no puede ser nulo.
INSERT INTO calificaciones (codigoUsuario, idArticulo, estrellas) VALUES ('U1000', NULL, 3);

/*---------------------------------------------CICLO 1: PoblarNoOk (3)---------------------------------------------*/


SELECT * FROM universidades;
-- En el atributo de cidreccion debido a que no hay una definicion clara del atributo
INSERT INTO universidades VALUES('001', 'Los Andes', '45');
-- En el atributo de codigo no debe de recibir cadeanas y numeros
INSERT INTO universidades VALUES('AA2', 'Nacional', 'Carrera 30 # 45 - 12');
-- en el atributo de nombre no debe de recibir numeros
INSERT INTO universidades VALUES('003', '2565', 'Carrera 7 # 40 - 12');


SELECT * FROM usuarios;
-- En el atributo de Tid no debe de recibir el valor de AA debido a que esto no representa nada
INSERT INTO usuarios VALUES('001', 'AA', '1234567890', 'Juan Perez', 'Sistemas', 'juanperez@gmail.com', SYSDATE, NULL, 0, '001');
-- En este falla debido a que el correo no tiene el formato correcto
INSERT INTO usuarios VALUES('002', 'CC', '1234567890', 'Maria Perez', 'Sistemas', 'mariaperez', SYSDATE, NULL, 0, '002');
-- en este falla debido a que en el atributo de nSuspension no puede ser un valor negativo
INSERT INTO usuarios VALUES('003', 'CC', '1234567890', 'Pedro Perez', 'Sistemas', 'padroperez@gmail.com', SYSDATE, NULL, -5, '003');


SELECT * FROM articulos;
-- En este el atributo de estado no puede recibir el valor de M
INSERT INTO articulos VALUES(1, 'Computador', 'M', 'https://www.image.com/computador.jpg', 325, 5, '001', '001');
-- En este el atributo de foto esta mla definido
INSERT INTO articulos VALUES(2, 'Jeans', 'N', 'image', 80, 1, '002', '002');
-- En este el atributo de disponible solo puede recibir valores de 0 o 1
INSERT INTO articulos VALUES(3, 'Camiseta', 'N', 'https://www.image.com/camiseta.jpg', 50, 5, '003', '003');


SELECT * FROM articulos_caracteristicas;
-- En este el atributo de caracteristica no esta bien definido
INSERT INTO articulos_caracteristicas VALUES(1, '6');
-- en este caso el atributo de caracteristica no esta claro
INSERT INTO articulos_caracteristicas VALUES(2, 'ASASF');
-- En este caso esta insertando una descripcion a un atributo que no existe
INSERT INTO articulos_caracteristicas VALUES(555, 'S');


SELECT * FROM ropa;
-- En este caso el acero no es un valor calido para el material de una ropa
INSERT INTO ropa VALUES(2, 'M', 'Acero', 'Azul');
-- en este caso el color 6 no es un valor valido
INSERT INTO ropa VALUES(3, 'S', 'Algodon', '6');
-- En este caso la talla 0 no es un valor valido
INSERT INTO ropa VALUES(4, '0', 'Algodon', 'Verde');


SELECT * FROM perecederos;
-- En este caso se esta haciendo perecedero a un atributo que no es perecedero
INSERT INTO perecederos VALUES(1, TO_DATE('2019-01-04', 'YYYY-MM-DD'));
-- En este caso la fecha es la misma que el valor perecedero
INSERT INTO perecederos VALUES(4, TO_DATE('2019-01-04', 'YYYY-MM-DD'));
-- En este caso se esta haciendo referencia a un atributo que no existe
INSERT INTO perecederos VALUES(55353, TO_DATE('2019-01-04', 'YYYY-MM-DD'));


SELECT * FROM categorias;
-- En este caso el tipo agua no es un valor valido
INSERT INTO categorias VALUES('001', 'Agua', 'D', 1, 5);
-- En este caso el valor minimo no puede ser negativo
INSERT INTO categorias VALUES('002', 'Comida', 'D', -1, 5);
--Ene ste casi el valor maximo no puede ser menor al negativo
INSERT INTO categorias VALUES('003', 'Accesorios', 'D', 10, 5);


SELECT * FROM auditorias;
-- En este caso el valor de accion no es valido
INSERT INTO auditorias VALUES(1, TO_DATE('2019-01-01','YYYY-MM-DD') , 'H', 'Juan Perez', '001');
-- en este caso el valor de accion no es valido
INSERT INTO auditorias VALUES(2, TO_DATE('2019-02-21','YYYY-MM-DD') , 'O', 'Maria Perez', '002');
-- En este caso el id no puede ser negativo
INSERT INTO auditorias VALUES(-3, TO_DATE('2019-06-12','YYYY-MM-DD') , 'I', 'Pedro Perez', '003');


SELECT * FROM evaluaciones;
-- En este caso, se intenta insertar una evaluación con una fecha '2024-02-30', que es inválida ya que febrero no tiene 30 días.
INSERT INTO evaluaciones VALUES ('200001', 'CC', '1234567890', TO_DATE('2019-02-28', 'YYYY-MM-DD'), 'A', 'Reporte', 'OK', 1);
-- En este caso el a_omes no dbedria recibir esos parametros ya que no es un valor valido.
INSERT INTO evaluaciones VALUES ('ABCDEF', 'CC', '1234567890', TO_DATE('2019-01-04', 'YYYY-MM-DD'), 'D', 'Reporte', 'OK', 2);
-- En este caso no se bede permitir en tid el parametro de AA debido a que no es un valor valido.
INSERT INTO evaluaciones VALUES ('ABCDEF', 'AA', '1234567890', TO_DATE('2019-01-04', 'YYYY-MM-DD'), 'D', 'Reporte', 'OK', 3);


SELECT * FROM evaluaciones_respuestas;
-- En este caso se esta haciendo una respuesta a un atributo que no existe
INSERT INTO evaluaciones_respuestas VALUES('200099', 'Todo bien');
-- En este caso el valor de a_omes no es valido
INSERT INTO evaluaciones_respuestas VALUES('GTA', 'Algo malo');
-- En este caso ambos campos estan mal definidos
INSERT INTO evaluaciones_respuestas VALUES('AGR', '6');


SELECT * FROM calificaciones;
-- En este caso se el atributo de idCodigo no esta bien definido
INSERT INTO calificaciones VALUES('sada', 1, 5);
-- En est caso el valor de estrellas no puede ser negativo
INSERT INTO calificaciones VALUES('AAA', 2, -4);
-- En este caso la es mayor a 5
INSERT INTO calificaciones VALUES('003', 3, 9);


/*---------------------------------------------CICLO 1: XPoblar---------------------------------------------*/
TRUNCATE TABLE universidades;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE articulos;
TRUNCATE TABLE articulos_caracteristicas;
TRUNCATE TABLE ropa;
TRUNCATE TABLE perecederos;
TRUNCATE TABLE categorias;
TRUNCATE TABLE auditorias;
TRUNCATE TABLE evaluaciones;
TRUNCATE TABLE evaluaciones_respuestas;
TRUNCATE TABLE calificaciones;


/*---------------------------------------------CICLO 1: Atributos---------------------------------------------*/
ALTER TABLE usuarios ADD CONSTRAINT ck_usuarios_tid CHECK (tid IN ('CC', 'TI'));
ALTER TABLE usuarios ADD CONSTRAINT ck_usuarios_correo CHECK (REGEXP_LIKE(correo, '.*@.*\..*'));
ALTER TABLE usuarios ADD CONSTRAINT ck_usuarios_nSuspension CHECK (nSuspension >= 0);

ALTER TABLE articulos ADD CONSTRAINT ck_articulos_estado CHECK (estado IN ('N', 'U'));
ALTER TABLE articulos ADD CONSTRAINT ck_articulos_url CHECK (REGEXP_LIKE(foto, '^https://.*\.pdf$'));
ALTER TABLE articulos ADD CONSTRAINT ck_articulos_tmoneda CHECK (precio >= 0 AND precio IN(50, 100, 150, 200, 250));

ALTER TABLE ropa ADD CONSTRAINT ck_ropa_talla CHECK (talla IN ('XS', 'S', 'M', 'L', 'XL'));

ALTER TABLE categorias ADD CONSTRAINT ck_categorias_tipo CHECK (tipo IN ('A', 'R', 'L', 'T', 'O'));
ALTER TABLE categorias ADD CONSTRAINT ck_categorias_miinimo CHECK (minimo >= 0 AND minimo IN(50, 100, 150, 200, 250));
ALTER TABLE categorias ADD CONSTRAINT ck_categorias_maximo CHECK (maximo >= 0 AND maximo IN(50, 100, 150, 200, 250));

ALTER TABLE auditorias ADD CONSTRAINT ck_auditorias_id CHECK (id > 0);
ALTER TABLE auditorias ADD CONSTRAINT ck_auditorias_accion CHECK (accion IN ('I', 'U', 'D'));

ALTER TABLE evaluaciones ADD CONSTRAINT ck_evaluaciones_tid CHECK (tid IN ('CC', 'TI'));
ALTER TABLE evaluaciones ADD CONSTRAINT ck_evaluaciones_descripcion CHECK (descripcion IN ('A', 'M', 'B'));
ALTER TABLE evaluaciones ADD CONSTRAINT ck_evaluaciones_reporte CHECK (REGEXP_LIKE(reporte, '^https://.*\.pdf$'));
ALTER TABLE evaluaciones ADD CONSTRAINT ck_evaluaciones_resultado CHECK (resultado IN ('AP', 'PE'));

ALTER TABLE calificaciones ADD CONSTRAINT ck_calificaciones_estrellas CHECK (estrellas >= 0 AND estrellas <= 5);

/*---------------------------------------------CICLO 1: Primarias--------------------------------------------*/

ALTER TABLE universidades ADD CONSTRAINT pk_universidades PRIMARY KEY (codigo);
ALTER TABLE usuarios ADD CONSTRAINT pk_usuarios PRIMARY KEY (codigo);
ALTER TABLE articulos ADD CONSTRAINT pk_articulos PRIMARY KEY (id);
ALTER TABLE articulos_caracteristicas ADD CONSTRAINT pk_articulos_caracteristicas PRIMARY KEY (id, caracteristicas);
ALTER TABLE calificaciones ADD CONSTRAINT pk_calificaciones PRIMARY KEY (codigoUsuario, idArticulo);
ALTER TABLE ropa ADD CONSTRAINT pk_ropa PRIMARY KEY (id);
ALTER TABLE perecederos ADD CONSTRAINT pk_perecederos PRIMARY KEY (id);
ALTER TABLE categorias ADD CONSTRAINT pk_categorias PRIMARY KEY (codigo);
ALTER TABLE auditorias ADD CONSTRAINT pk_auditorias PRIMARY KEY (id);
ALTER TABLE evaluaciones ADD CONSTRAINT pk_evaluaciones PRIMARY KEY (a_omes);
ALTER TABLE evaluaciones_respuestas ADD CONSTRAINT pk_evaluaciones_respuestas PRIMARY KEY (a_omes, repuestas);

/*---------------------------------------------CICLO 1: Unicas--------------------------------------------*/

ALTER TABLE usuarios ADD CONSTRAINT uk_usuarios_tid UNIQUE (nid, tid);
ALTER TABLE articulos ADD CONSTRAINT uk_articulos_foto UNIQUE (foto);
ALTER TABLE evaluaciones ADD CONSTRAINT uk_evaluaciones_reporte UNIQUE (reporte);

/*---------------------------------------------CICLO 1: Foraneas---------------------------------------------*/
ALTER TABLE usuarios ADD CONSTRAINT fk_usuarios_universidades FOREIGN KEY (codigoUniversidad) REFERENCES universidades(codigo);

ALTER TABLE calificaciones ADD CONSTRAINT fk_calificaciones_usuarios FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo);
ALTER TABLE calificaciones ADD CONSTRAINT fk_calificaciones_articulos FOREIGN KEY (idArticulo) REFERENCES articulos(id);


ALTER TABLE articulos ADD CONSTRAINT fk_articulos_categorias FOREIGN KEY (codigoCategoria) REFERENCES categorias(codigo);
ALTER TABLE articulos ADD CONSTRAINT fk_articulos_usuarios FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo);
ALTER TABLE articulos_caracteristicas ADD CONSTRAINT fk_articulos_caracteristicas FOREIGN KEY (id) REFERENCES articulos(id);

ALTER TABLE ropa ADD CONSTRAINT fk_ropa_articulos FOREIGN KEY (id) REFERENCES articulos(id);

ALTER TABLE perecederos ADD CONSTRAINT fk_perecederos_articulos FOREIGN KEY (id) REFERENCES articulos(id);

ALTER TABLE auditorias ADD CONSTRAINT fk_auditorias_categoria FOREIGN KEY (codigoCategoria) REFERENCES categorias(codigo);

ALTER TABLE evaluaciones ADD CONSTRAINT fk_evaluaciones_auditorias FOREIGN KEY (idAuditoria) REFERENCES auditorias(id);

ALTER TABLE evaluaciones_respuestas ADD CONSTRAINT fk_evaluaciones_respuestas FOREIGN KEY (a_omes) REFERENCES evaluaciones(a_omes);

ALTER TABLE categorias ADD CONSTRAINT fk_auditoria_categorias FOREIGN KEY (idAuditoria) REFERENCE auditorias(id)

/*---------------------------------------------CICLO 1: PoblarNoOk (2)---------------------------------------------*/
ALTER TABLE articulos ADD CONSTRAINT ck_articulos_disponible CHECK (disponible IN (0, 1));

ALTER TABLE evaluaciones ADD CONSTRAINT ck_nid CHECK (REGEXP_LIKE(nid, '^[0-9]+$'));

-- No inserta debido a que en atributos no existe dicho atributo
INSERT INTO ropa VALUES(1, 'M', 'Algodon', 'Azul');
--
INSERT INTO calificaciones VALUES('001', 1, 5);

/*---------------------------------------------CICLO 1 <Consultas>---------------------------------------------*/

SELECT codigoCategoria, COUNT(*) AS num_articulos
FROM articulos
GROUP BY codigoCategoria
ORDER BY num_articulos DESC;



--<obtener el número total de calificaciones que ha recibido cada artículo>
SELECT a.id AS id_articulo, a.descripcion AS descripcion_articulo, COUNT(c.estrellas) AS total_calificaciones
FROM articulos a
LEFT JOIN calificaciones c ON a.id = c.idArticulo
GROUP BY a.id, a.descripcion
ORDER BY total_calificaciones DESC;


/*---------------------------------------------CICLO 1: PoblarOk---------------------------------------------*/



/*-------------------------------------------------LAB-4----------------------------------------------------*/

/*-------------------------------------------------CRUD Caso de uso 1----------------------------------------------------*/
/*-------------------------------------------------Atributos----------------------------------------------------*/
ALTER TABLE categorias ADD CONSTRAINT ck_categorias_minimomenormaximo CHECK (minimo <= maximo);
/*-------------------------------------------------Disparadores----------------------------------------------------*/
/*-------------Adicionar------------*/
CREATE OR REPLACE TRIGGER tr_categorias_mayusculas_bi
BEFORE INSERT ON categorias 
FOR EACH ROW 
BEGIN 
    :NEW.codigo := INITCAP(:NEW.codigo);
END;
/

CREATE OR REPLACE TRIGGER tr_categorias_nombrenulo_bi
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN 
    IF :NEW.nombre IS NULL THEN
    :NEW.nombre := INITCAP(:NEW.codigo);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER tr_categorias_nomaximo_bi
BEFORE INSERT ON categorias
FOR EACH ROW 
BEGIN 
    IF :NEW.maximo IS NULL THEN
    :NEW.maximo := :NEW.minimo * 2;
    END IF;
END;
/
/*----------MODIFICAR---------*/
CREATE OR REPLACE TRIGGER tr_categoria_modificar_bu
BEFORE UPDATE ON categorias
FOR EACH ROW
BEGIN
    IF :NEW.nombre != :OLD.nombre OR :NEW.tipo != :OLD.tipo THEN
        RAISE_APPLICATION_ERROR(-20001, 'no se pueden modificar los atributos nombre o tipo');
    ELSE
        IF :NEW.minimo < :OLD.minimo OR :NEW.maximo < :OLD.maximo THEN
            RAISE_APPLICATION_ERROR(-20002, 'Los atributos de maximo y minimo solo pueden aumentar');
        ELSE:
            IF :NEW.minimo != :OLD.minimo THEN
                :NEW.maximo := 2*:NEW.minimo
            END IF;
        END IF;
    END IF;

END;
/

/*--------ELIMINAR---------*/

CREATE OR REPLACE TRIGGER tr_categorias_eliminarcategoriasV_bd
BEFORE DELETE ON categorias
FOR EACH ROW 
DECLARE 
    cantidad NUMBER;
BEGIN 
    SELECT COUNT(*) INTO cantidad FROM categorias WHERE categoria = :OLD.categoria;
    IF cantidad > 0 THEN 
        RAISE_APPLICATION_ERROR(-20003,'No se pueden eliminar las categorias que tinen algun articulo asociado');
    END IF 
END tr_categorias_eliminarcategoriasV_bd;
/

/*----------CRUD caso 2--------*/
/*----------ADICIONAR----------*/

CREATE OR REPLACE TRIGGER tr_evaluacion_


