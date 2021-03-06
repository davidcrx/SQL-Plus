/*1-FECHAS, CONVERSIÓN*/
	/*1.1 ALTER SESSION*/
	ALTER SESSION SET NLS_DATE_FORMAT='/dd/mm/yyyy'
	/*1.2 TO_DATE*/
	SELECT * FROM AMIGOS WHERE FECHA<to_date('1/1/1999'); // que tengan mas de 18 años (ya que 
estamos en el 2017-18)
	/*1.3 TO_CHAR*/
	SELECT NOMBRE, TO_CHAR(FECHA,'YYYY/DD "de" MONTH') AS CUMPLE FROM AMIGOS;
	/*1.4 MONTHS_BETWEEN */
	SELECT MONTHS_BETWEEN(SYSDATE,FECHA)/12 FROM AMIGOS;
	SELECT MONTHS_BETWEEN('06/07/2000',FECHA) FROM AMIGOS; //DIFERENCIA DE MESES QUE HAY ENTRE 
DOS FECHAS
	/*1.5 ADD_MONTHS*/
	SELECT ADD_MONTHS(FECHA,3) FROM AMIGOS; //añade 3 meses
	
/*2-RESTRICCIONES*/
	/*2.1 PRIMARY KEY*/
	ALTER TABLE metge ADD CONSTRAINT PK_METGE PRIMARY KEY (num_colegiat);
	/*2.2 FOREIGN KEY*/
	ALTER TABLE ingres ADD CONSTRAINT FK_INGRES FOREIGN KEY (num_ss_pac) REFERENCES 
pacient(num_ss);
	/*Ejemplos*/
	ALTER TABLE POBLACION ADD CONSTRAINT CH_poblacion CHECK(extension>10);
	/*Dentro de las tablas se puede hacer un check*/
	sexo CHAR (1) CHECK(sexo='F' OR sexo='M'),
	
/*3-INSERTS*/
	INSERT INTO pacient VALUES (334333,'Alberto','11/03/1923','Barcelona','H');
	
/*4-CARACTERES*/
	/*4.1* UPPER*/
	SELECT NOM_EMPL FROM EMPLEATS WHERE UPPER(NOM_EMPL)='ANNA';
	/*4.2 LOWER*/
	SELECT NOM_EMPL FROM EMPLEATS WHERE LOWER(NOM_EMPL)='anna';
	/*4.3 LIKE*/
	SELECT NOM_EMPL FROM EMPLEATS WHERE UPPER(NOM_EMPL) LIKE '%A%';	
	/*4.4 INSTR (POSICION LETRA)*/
	SELECT nom_empl, INSTR (nom_empl, 'r') as donde FROM EMPLEATS;
	SELECT nom_empl FROM EMPLEATS WHERE INSTR(nom_empl,'g')>0;
	/*4.5 SUBSTR*/
	SELECT SUBSTR(nom_empl,2) FROM EMPLEATS; //de la segunda letra hasta el final
	SELECT SUBSTR(nom_empl,2,1) FROM EMPLEATS; /selecciona en la posicion dos el primer 
caracter
	/*4.6 NVL*/
	SELECT nom_empl,NVL(nom_dpt,'Desconocido') FROM EMPLEATS;
	/*4.7 LENGTH*/
	SELECT NOM_EMPL, length(nom_empl) FROM EMPLEATS;
	/*4.8 REVERSE*/
	SELECT nom_empl, REVERSE(NOM_EMPL) FROM EMPLEATS;

/*5-NUMEROS*/
	/*5.1 ROUND*/
	SELECT marca,modelo,precio,ROUND(precio*0.97,0) as descuento FROM COCHE;	
	/*5.2 TRUNC*/ //Decimales hacia abajo
	SELECT TRUNC(to_date('7/3/2017')-FECHA,0) FROM AMIGOS;
