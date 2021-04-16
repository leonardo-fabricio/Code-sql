DDL                                 DML

CREATE DATABASE                 INSERT INTO
CREATE TABLE                    UPDATE
ALTER TABLE                     TRUNCATE
DROP TABLE                      DELETE


Registrar instancias separadas de coisas que tem caracteristicas diferentes.
------------------------------------AULA 01---------------------------------------------------------------
CREATE TABLE - CREATE DATABASE ...

create database cadastro
default character set utf8
default collate utf8_general_ci;
=============================== COMANDO PARA CRIAR UMA BASE DE DADOS QUE ACEITE TIPOS DE DADOS DA REGIÃO


create table pessoas(
nome varchar() not null,
nascimento date,
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brazil',
sexo enum('M', 'F')
)default charset = utf8;
=========================== COMANDOS PARA CRIAR UMA TABELA COM ALGUNS TIPOS DE DADOS


com id

create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brazil',
sexo enum('M', 'F'),
primary key (id)
)default charset = utf8;
================================= COMANDO PARA CRIAR UMA TABELA UM POUCO MAIS COMPLETA E COM ID DEFINIDO AUTOMATICO

------------------------------------AULA 02---------------------------------------------------------------

Inserir dados - INSERT INTO

Insert into pessoas
(id, nome,nascimento,peso,altura, nacionalidade, sexo)
values
('1','Godofredo','1984-01-02','78,5','1.83','Estados Unidos','M');

========= Inserir na tabelas estes valores...

insert into pessoas values
(default,'Adalgiza','1930-11-2','63.2','1.75','Espanha','F');

=============

insert into pessoas values ===== INSERIR MULTIPLOS DADOS
(default,'Adalgiza','1930-11-2','63.2','1.75','Espanha','F'),
(default,'Adalgiza','1930-11-2','63.2','1.75','Espanha','F');

============ 

delete from pessoas where id = 2; ==== COMANDO DE DELETA USUARIO POR ID

------------------------------------AULA 03---------------------------------------------------------------

ALTER TABLE

alter table pessoas
add column profissao varchar(10); 
=== adicionar coluna

alter table pessoas
drop column profissao;
=== apagar coluna

alter table pessoas
add column profissao varchar(10) after nome;
=== adicionar em qualquer posição

alter table pessoas
add codigo int first;
=====Adicionar como primeiro campo

alter table pessoas 
modify column profissao varchar(20) not null default '';
==== modificar dados de uma coluna, como o tipo dela... definila com notnull e default "vazio"

alter table pessoas
change column profissao prof varchar(20) not null default '';
==== modificar nome da coluna

alter table pessoas
rename to garfanhotos;
==== Renomear tabela

create table if not exists cursos(
nome varchar(30) not null unique, === Nao vai deixa que um curso tenha o mesmo nome q outro
descrissao text,
carga int unsigned, ===barrar numeros negativos
totaulas int,
ano year default '2021'
)default charset = utf8;
====

alter table cursos 
add primary key (codigo);
=== colocar primary key

------------------------------------AULA 04---------------------------------------------------------------
COMANDO UPDATE

Manipular Registros, ou linhas ou tupla

update cursos
set nome = 'HTML5' 
where codigo = 1;   ATUALIZAR VALORES NUMA LINHA OU TUPLA

update cursos 
set nome = 'PHP' , ano = '2015'
where codigo = 4;  ATUALIZAR MULTIPOLOS VALORES

limit 1; ======== LIMITAR AÇÃO DO CODIGO A APENAS UMA LINHA, ISSO EVITA RISCOS MAIORES AO BANCO

delete from cursos
where ano = 2050   APAGANDO MULTIPLOS DADOS 
limit 3;

truncate table garfanhotos; APAGAR TODOS OS DADOS DE UMA TABELA


ALTER TABLE `clientes` ADD CONSTRAINT `fk_cidade` FOREIGN KEY ( `codcidade` ) REFERENCES `cidade` ( `codcidade` ) ; CHAVE ESTRANGEIRAAAAAAAAAAAAA
==================    CRIAR CHAVE ESTRANGEIRA

alter table anunciar 
add constraint idUsuario
foreign key (id)
references usuario (id);

================ APAGAR CHAVE ESTRANGEIRA

alter table tabela drop foreign key nomefk

------------------------------------AULA 05--------------------------------------------------------------- INICIO SELECT


select * from cursos order by nome asc;  ORDENAR DE ACORDO COM A COLUNA PASSADA, ORDENA ALFABETICAMENTE
select * from cursos order by nome desc; ORDENA DA MESMA FORMA SO QUE AO CONTRARIO

select nome,carga,ano from cursos order by nome asc; FILTAR BUSCA, OU SEJA SO VAI APARECER AS COLUNAS PASSADAS
select nome,carga,ano from cursos order by nome,ano asc; ORDENA PRIMEIRO PELO 'NOME' E CASO HAJA VALORES IGUAIS, TBM ORDENA ESSES VALORES, SO Q AGORA PELO 'ANO'

SELECT * FROM cursos 	SELECIONA VALORES ESPECIFICOS, NESSE CASO ELE ESTAR ORDENANDO PELO NOME OS VALORES CUJA CARGA SEJA IGUAL A 40;
where carga = 40
order by nome asc;

SELECT nome,ano FROM cursos  TBM EH POSSIVEL SELCIONAR AS COLUNAS
where carga = 40
order by nome asc;

SELECT * FROM cursos  ========== EH POSSIVEL USAR OPERADORES TBM COMO <=, >=, <, >, !=, ...
where carga <= 40
order by nome asc;

select * from cursos =========== TBM EH POSSIVEL SELECIONAR VALORES QUE ESTEJAM ENTRE UM VALOR PASSADO E OUTRO VALOR PASSADO
where totaulas between 1 and 16
order by nome, ano;

select * from cursos ================TBM EXISTE O OPERADOR ''IN'' QUE SELECIONA APENAS OS QUE ESTAO DENTRO DO PARAMETRO INFORMADO
where ano in (2018)
order by nome;


SELECT * FROM cursos  ==========TBM EH POSSIVEL USAR OPERADORES COM COMPARAÇÃO 
where carga < 40 AND carga > 1
order by nome asc;

SELECT * FROM cursos  =======TBM EH POSSIVEL USAR OPERADORES COM COMPARAÇÃO COM COLUNAS DIFERENTES
where carga < 40 AND ANO > 2010
order by nome asc;
SELECT * FROM cursos  =======TBM EH POSSIVEL USAR OPERADORES COM COMPARAÇÃO COM COLUNAS DIFERENTES, AGORA COM O ---OUR---
where carga < 40 OUR ANO > 2010
order by nome asc;

------------------------------------AULA 06--------------------------------------------------------------- CONTINUANDO SELECT
CARACTERES CORIGNGA (%   _ )

select * from cursos ==== VAI LISTAR TODOS OS CURSO QUE COMEÇAM COM '''P'''  ISSO EH POSSIVEL QUANDO UUTILIZA O ---LIKE---- E O CORINGA (%), MOSTRA OS DADOS Q COMEÇAM COM P
where nome like 'P%'; 

select * from cursos ===== LEMBRADO QUE A POSIÇAO DO CORINGA TEM TOTAL IMPORTANCIA, NESSE CASO ELE VAI MOSTRAR APENAS OS DADOS QUE TERMINAM COM H 
where nome like '%H';

select * from cursos === LISTA AS TUPLAS Q TEM ---A--- EM QUALQUER LUGAR
where nome like '%a%' 

SELECT * from cursos  ===== VAI LISTA TODOS AS TUPLAS ONDE COMECE COM ----PH----- EEEEE TERMINE COM -----P-----
where nome like 'PH%p';

SELECT * from cursos ==== VAI LISTAR QUANDO COMEÇA COM PH E TEM QUALQUER COISA E TENHA ---P--- EM QUALQUER LUGAR
where nome like 'PH%P%';

SELECT * from cursos ==== VAI LISTAR  QUANDO COMEÇA COM PH TENHA QUALQUER COISA E TERMINE COM P E TENHA ALGUM V
where nome like 'PH%P_';

SELECT distinct nacionalidade from pessoas; == ANULA DADOS REPETIDOS, EXEMPLO: NACIONALIDADE QUE LISTA OS PAISES DE TODAS AS TUPLAS SEM REPETIÇÃO

select count(*) from cursos; === CONTAR TODOS OS REGISTROS DAS TABELAS

select count(*) from cursos WHERE  carga = 40;  === CONTA QUANTOS REGISTRO TEM A -----CARGA IGUAL A 40---

select max(carga) from cursos; ====== LISTA MAIOR ELEMENTO

select *,  min(carga) from cursos where ano = 2014; ==== VAI LISTAR TODOS COM MENOR CARGA, ONDE O ANO É IGUAL A 2014

SELECT sum(carga) FROM cursos; ===== SOMAR TODOS OS ELEMENTOS DE UMA COLUNA

select avg(carga) from cursos; ==== TIRAR A MEDIA

							BUSCAS ESPECIFICASSSSS === RESOLUÇÃO DAS QUESTOES

select * from pessoas 
where  nome like  'a%' and sexo = 'F' and nacionalidade = 'Brasil' ; 

select nome, nacionalidade from pessoas 
where sexo = 'M' and nacionalidade != 'Brasil' and peso < 100 and nome like 'ro%';

select max(altura) from pessoas 
where sexo = 'M' and nacionalidade = 'brasil';

select avg(peso) from pessoas;

select min(peso) from pessoas
 where sexo ='F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

select count(*) from pessoas
 where sexo = 'F' and altura > 1.80;

select nacionalidade , count(*) from pessoas
group by nacionalidade
order by nacionalidade asc;

select sexo , count(sexo) from pessoas 		VAI LISTAR E CONTAR QUANTOS HOMENS E QUANTAS MULHERES FAZEM ANIVERSARIO DEPOIS DA DATA 
where nascimento > '2005-01-01'
group by sexo
having sexo = 'M' or sexo = 'F';

select nacionalidade, count(*) from pessoas  VAI AGRUPAR POR NACIONALIDADE E LISTAR APENAS OS COM MAIS DE 3 PESSOAS
where nacionalidade != 'Brasil'
group by(nacionalidade)
having count(*) > 3
order by nacionalidade asc;

select altura, count(*) from pessoas 		AGRUPAR PELA ALTURA E LISTAR APENAS AS QUE TEM PESO MAIOR QUE 100 E A ALTURA ACIMA DA MEDIA
where peso > 100
group by altura
having altura > (select avg(altura) from pessoas);

=================================================================================================================================================
								GROUP BY

select carga, count(nome) from cursos group by carga order by carga; ----------------VAI SELECIONAR E ORDENAR A COLUNA CARGA E CONTAR OS AGRUPAMENTOS

select ano, count(*) from cursos------------------ VAI FAZER A MESMA COISA DO ANTERIOR, MAS LISTAR APENAS O COUNT ANO MAIOR OU IGUAL A 5
group by ano
having count(ano) >= 5 
order by count(*) ;


select carga, count(*) from cursos-----------------VAI FAZER A MESMA COISA DO ANTERIOR SO QUE VAI LISTAR E CONTAR APENAS AS LINHAS COM CARGA ACIMA DA MEDIA 
 where ano>2015
group by carga
having carga > (select avg(carga) from cursos);


