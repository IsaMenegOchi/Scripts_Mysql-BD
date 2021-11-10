#SELECT 

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
    Like - Semelhante ao um igual, porem com menos igualdade
 */

#quando fazemos uma comparação entre strings com igual, ela deve ser igual ao valor do campo para que o banco ache
SELECT nome, sinopse FROM tblFilme WHERE nome = 'Um sonho de liberdade';
#Porcentagem no inicio - A string dada deve ser igual ao termino do valor do campo
SELECT nome FROM tblFilme WHERE nome LIKE '%liberdade';
#Porcentagem no fim -  A string dada deve ser igual ao inicio do valor do campo
SELECT nome FROM tblFilme WHERE nome LIKE '%Um';
#Porcentagem em ambos - A string dada deve ser igual a qualquer palavra do valor do campo
SELECT nome FROM tblFilme WHERE nome LIKE '%sonho%';

#Maisculo  minusculo não importam, pesquisa da mesma forma
#As porcentagens são do workbanch/mysql, ou seja, pode mudar o simbolo dependendo do banco





