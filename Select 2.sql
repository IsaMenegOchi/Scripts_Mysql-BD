#concat() - permite realizar a concatenação de dados
#forma de solicitar uma forma de saida, assim sabemos qual campo estamos chamando ou especificar
#sempre devemos separar por virgula
select concat('Filme: ', nome) as nomeFilme,
concat('O filme ', nome, ' tem duração de: ', duracao) as resultado from tblFilme;

#concat_ws() - Permite realizar a concatenação de dados, utilizando um caracter de separação entre os dados
	#finalizadade mais especifica
select concat_ws(' | ', nome, duracao, dataLancamento) as concatWs from tblFilme;

#locate() - retorna a posição da palavra ou caracter desejado
 #apenas retorna a primeira palavra encontrada
 #começa contando do 1
select locate('rei', sinopse) as locate from tblFilme;

#reverse() - inverte a escrita/conteudo de uma coluna
select reverse(nome) as reverse from tblFilme;

#length() - retorna a quantidade de caracteres de uma coluna
select length(nome) as lengthFilme from tblFilme;

#char_length - não considera caracteres especiais 
select char_length(nome) as charLengthfilme from tblfilme;

#insert() permite inserir um novo conteudo dentro do texto de uma coluna
#apenas aparece quando pedimos a coluna, mas não é salva no banco
#devemos passar o nome da coluna, a posição que queremos inserir, quantidade de caracteres para deletar, e o que quero inserir
select insert(sinopse, 5, 0, ' Video locadora ') as resultadoInsert, sinopse from tblFilme;

#EXERCICIO - colocar <b>prisão</b> 
select insert (sinopse, locate('prisão', sinopse), length('prisão'), '<b>prisão</b>') as locatePrisao from tblFilme;


#substr() - permite retirar o pedaço de um conteudo (nome da coluna, primeiro caracter, ate onde quero que vá)
select substr(nome, 1, 10) as nomeRetirado from tblFilme;
select substr(sinopse, 1, locate('.', sinopse)) as nomeRetirado from tblFilme;
select concat(substr(sinopse, 1, locate('.', sinopse)), ' Saiba mais...') as nomeRetirado from tblFilme;

#replace() - permite localizar um conteudo e substrituir por outra coisa
#todas as ocorrencias
select replace(sinopse, 'prisão', '<b>prisão<b>') as replaceSinopse from tblFilme;


alter table  tblFilme add column valor float;
update tblfilme set valor = '6.50' where idFilme = 1;
update tblfilme set valor = '10.80' where idFilme = 2;
update tblfilme set valor = '8.00' where idFilme = 3;
update tblfilme set valor = '9.75' where idFilme = 4;

select nome, qtde, valor, round((qtde*valor), 2) as valorTotal from tblfilme;

#EXERCICIO - das 10% de desconto do valor do filme
select nome, qtde, valor, round((valor - ((valor*10)/100)), 2) as valorDesconto from tblfilme;

#prof

