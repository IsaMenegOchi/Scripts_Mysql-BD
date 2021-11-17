#SELECT 

show databases;

use dbfilmesturmab;
/*
Select - especifica as colunas que serão visualizadas 
from - especifica as tabelas que seraão utilizadas na consulta
where - especifica o criterio de filtro 
*/

#Permite visualizar todas as colunas e todos os registros de uma tabela (*)
SELECT * FROM tblFilme;
#Outra forma de visualizar todos os campos e colunas
SELECT tblFilme.* FROM tblFilme;

#Permite visualizar colunas especificas da tabela
SELECT nome, sinopse FROM tblFilme;

#from - onde declaramos a variavel 
#para que possamos selecionar um atributo com o mesmo nome em varias tabelas, devemos colocar o nome da tabela em questão . nome do atributo FROM nome das tabelas 
SELECT tblFilme.nome, tblFilme.sinopse, tblGeneroFilme.nome FROM tblFilme, tblGeneroFilme;


# AS = alias (#Podemos criar apelidos para as colunas ou tabelas)
#O apelido so funciona em um comando, ou seja, em um select, não conseguimos chamar por apelido em outros comandos
SELECT nome AS nomeFilme, duracao, sinopse FROM tblFilme;
#quando damos um apelido a tabela, devemos colocar o apelido da tabela, e não o nome, quando formos relacionar uma coluna com tabela com ponto
SELECT filme.nome, filme.duracao, filme.sinopse FROM tblFilme AS filme;
#Podemos fazer um apelido sem o as, somente com espaço
SELECT filme.nome, filme.duracao, filme.sinopse FROM tblFilme filme;



SELECT nome, sinopse FROM tblFilme WHERE idFilme = 2;

#Operadores de comparação
 /*
	Direfente = <>
    igual - =
    maior que - >
    Menor que - <
    Maior ou igual que - >=
    Menor ou igual que - <=
    Like - Semelhante ao um igual, porem com menos igualdade (busca pela igualdade do valor)
 */

/*OPERADORES LÓGICOS
	and
    or 
    not
*/
#quando fazemos uma comparação entre strings com igual, ela deve ser igual ao valor do campo para que o banco ache
SELECT nome, sinopse FROM tblFilme WHERE nome = 'Um sonho de liberdade';
#Porcentagem no inicio - A string dada deve ser igual ao termino do valor do campo
SELECT nome FROM tblFilme WHERE nome LIKE '%liberdade';
#Porcentagem no fim -  A string dada deve ser igual ao inicio do valor do campo
SELECT nome FROM tblFilme WHERE nome LIKE 'Um%';
#Porcentagem em ambos - A string dada deve ser igual a qualquer palavra do valor do campo
SELECT nome FROM tblFilme WHERE nome LIKE '%sonho%';

#Maisculo  minusculo não importam, pesquisa da mesma forma
#As porcentagens são do workbanch/mysql, ou seja, pode mudar o simbolo dependendo do banco


alter table tblFilme 
	add column qtde int;
    
update tblFilme set qtde = 5 where idFilme = 1;
update tblFilme set qtde = 8 where idFilme = 2;

select * from tblFilme where qtde <=6;

#Exemplo de utilização de operadores lógicos
select * from tblFilme where qtde >=6 and qtde <=10;
select * from tblFilme where qtde <6 or qtde >10;
select * from tblFilme where not (qtde >=6 and qtde <=10);

INSERT INTO tblFilme (nome,
nomeOriginal,
duracao,
dataLancamento,
dataRelancamento,
sinopse,
fotoCapa,
idClassificacao,
qtde) 
#Duracao - hora:min:sec
#Data - 4ano-2mes-2dia 
#Quando temos um atributo que não recebe valor, devemos colocar null
VALUES ('FORREST GUMP - O CONTADOR DE HISTÓRIAS',
'Forrest Gump',
 '02:20:00', 
 '1994-12-07', 
 null, 
 'Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump 
 (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, 
 ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, 
 mas continua pensando no seu amor de infância, Jenny Curran.', 
'filme03.jpg', 
4,
3),(
'À ESPERA DE UM MILAGRE',
'The Green Mile',
 '03:09:00', 
 '2000-03-10', 
 null, 
 '1935, no corredor da morte de uma prisão sulista. Paul Edgecomb (Tom Hanks) 
 é o chefe de guarda da prisão, que temJohn Coffey (Michael Clarke Duncan) 
 como um de seus prisioneiros. Aos poucos, desenvolve-se entre eles uma relação 
 incomum, baseada na descoberta de que o prisioneiro possui um dom mágico que 
 é, ao mesmo tempo, misterioso e milagroso.', 
'filme04.jpg', 
4,
4);

#select repetitiva
select * from tblFilme where qtde =2 or qtde =5 or qtde =8 or qtde =10;
#o comando IN substitui uma escrita repetitiva
#apenas utilizado quando for OR, não funciona com AND
select * from tblFilme where qtde in (2, 5, 8, 10);
#in negativo
select * from tblFilme where qtde not in (2, 5, 8, 10);

#seleciona numeros entre...
select * from tblFilme where qtde between 6 and 10;
select * from tblFilme where qtde not between 6 and 10;


#ORDENAÇÃO DE DADOS
#asc - Ascendente (crescente)
select * from tblFilme order by nome asc;
#desc - descendente (decrescente)
select * from tblFilme order by nome desc;


select * from tblFilme order by nome asc, duracao desc;

#limit - limita a quantidade de resultados
select * from tblFilme limit 1;

#somente o 1 registro da tabela
select * from tblFilme order by idFilme asc limit 1;

#somente o ultimo registro da tabela
select * from tblFilme order by idFilme desc limit 1;


#count - retorna a quantidade de itens no select
#com o apelido conseguimos resgatar
#ignora valores nulos
#não pode haver espaços entre as funções do select, pois vai achar que estamos apelidamos uma função
select count(*) as qtdeDeFilmes from tblFilme;
select count(nome) as qtdeNomeFilmes, count(dataRelancamento) from tblFilme;

#min - quando queremos saber qual a quantidade minima de certo campo, retornando o menor valor 
select min(qtde) as qtdeMinima from tblFilme;
#max - quando queremos saber qual a quantidade maxima de certo campo, retornando o maior valor 
select max(qtde) as qtdeMaxima from tblFilme;

#soma todos os campos de uma coluna
select sum(qtde) as somaQtdeFilmes from tblFilme;

#média de todos os campos de uma coluna
select avg(qtde) as somaQtdeFilmes from tblFilme;
#limitamos o resultado em uma casa pos a virgula
select round(avg(qtde), 1)  as somaQtdeFilmes from tblFilme;




