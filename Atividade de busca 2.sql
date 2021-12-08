#É sempre bom fazermos a igualdade primeiro com a chave estrangeira e depois a chave primaria(fk = pk)
	#group by - mostra somente uma vez aquilo que pedimos (permite agrupar o resultado do select por colunas especificas, 
	#e elemina as repetições e manipula os resultados para mostrar somente uma vez a ocorrencia dos valores. 
	# OBS: É muito utilizados quando fazemos relações com diversar tabelas)
select tblFilme.nome as nomeFilme, tblFilme.dataLancamento, tblFilme.sinopse, 
	tblClasificacao.nome as nomeClassificacao, 
	tblgenerofilme.nome as generoFilme, 
	tblAtor.nome as nomeAtores, tblator.dataNascimento as dataNascimentoAtor, 
	tblnacionalidade.nome as nacionalidadeAtor,
	tblDiretor.nome as nomeDiretor,
	tblRoteirista.nome as nomeRoteirista
from tblFilme 
	inner join tblclasificacao on tblFilme.idFilme = tblClasificacao.idClassificacao
	inner join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme 
		inner join tblgeneroFilme on tblgenerofilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme
	inner join tblintermfilmeator on tblFilme.idfilme = tblintermfilmeator.idFilme 
		inner join tblator on tblAtor.idAtor = tblintermfilmeator.idAtor
	inner join tblintermnacionalidadeator on tblAtor.idAtor = tblintermnacionalidadeator.idAtor 
		inner join tblnacionalidade on tblnacionalidade.idNacionalidade = tblintermnacionalidadeator.idNacionalidade
	inner join tblfilmediretor on tblFilme.idFilme = tblFilmeDiretor.idfilme 
		inner join tblDiretor on tblDiretor.idDiretor = tblfilmediretor.idDiretor
	inner join tblintermfilmeroteirista on tblFilme.idFilme = tblintermfilmeroteirista.idFilme 
		inner join tblRoteirista on tblRoteirista.idRoteirista = tblintermfilmeroteirista.idRoteirista
group by nomeFilme, nomeAtores
order by nomeFilme asc, nomeAtores desc;


#criando uma view
	#view - criar uma view e colocar dentro o scrip/ tabela virtual/ mais agilidade
		#é uma tabela virtual criada com base em um select que já é pre-processada  pelo BD e permite dar uma resposta mias agil do que executar o escript manualmente
        
#cria uma view
create view vwListarFilmes as 
select tblFilme.nome as nomeFilme, tblFilme.dataLancamento, tblFilme.sinopse, 
	tblClasificacao.nome as nomeClassificacao, 
	tblgenerofilme.nome as generoFilme, 
	tblAtor.nome as nomeAtores, tblator.dataNascimento as dataNascimentoAtor, 
	tblnacionalidade.nome as nacionalidadeAtor,
	tblDiretor.nome as nomeDiretor,
	tblRoteirista.nome as nomeRoteirista
from tblFilme 
	inner join tblclasificacao on tblFilme.idFilme = tblClasificacao.idClassificacao
	inner join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme 
		inner join tblgeneroFilme on tblgenerofilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme
	inner join tblintermfilmeator on tblFilme.idfilme = tblintermfilmeator.idFilme 
		inner join tblator on tblAtor.idAtor = tblintermfilmeator.idAtor
	inner join tblintermnacionalidadeator on tblAtor.idAtor = tblintermnacionalidadeator.idAtor 
		inner join tblnacionalidade on tblnacionalidade.idNacionalidade = tblintermnacionalidadeator.idNacionalidade
	inner join tblfilmediretor on tblFilme.idFilme = tblFilmeDiretor.idfilme 
		inner join tblDiretor on tblDiretor.idDiretor = tblfilmediretor.idDiretor
	inner join tblintermfilmeroteirista on tblFilme.idFilme = tblintermfilmeroteirista.idFilme 
		inner join tblRoteirista on tblRoteirista.idRoteirista = tblintermfilmeroteirista.idRoteirista
group by nomeFilme, nomeAtores
order by nomeFilme asc, nomeAtores desc;

show tables;
#permite rodar uma view
select * from vwListarFilmes;

#permite visualizar as colunas virtuais de uma view
desc vwListarFilmes;

#para modificarmos a view, devemos modificar diretamente no script e depois altera-la
	#alter view vwListarFilmes as ...codigo;
#apagar view
	#drop view vwListarFilme;
 #permite ver a estrutura de criação da view (select que oi criado na mão)
 show create view vwListarFilmes;
 
 