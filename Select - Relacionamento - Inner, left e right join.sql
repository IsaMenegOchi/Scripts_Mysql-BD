#RELACIONAMENTO ENTRE TABELAS NO DB

#Forma 1 de fazer - no where
select tblFilme.nome as nomefilme, tblfilme.duracao, tblfilme.dataLancamento, 
	tblGeneroFilme.nome as nomeGeneroFilme 
	from tblFilme, tblGeneroFilme, tblIntermGeneroFilme
	where tblFilme.idFilme = tblIntermGeneroFilme.idFilme 
		and tblGeneroFilme.idGeneroFilme = tblIntermGeneroFilme.idGeneroFilme;


#Forma 2 de fazer - no from (melhor desempenho/performance para o banco)
# Inner join - Aquilo que contem na tabela um e na tabela dois, ou seja, os id de uma tbl interm 
	# retorna dados que foram relacionados entre a tabela da esqueda e que contem relação com a tabela da direita
  
    
select tblFilme.nome as nomeFilme, tblfilme.duracao, tblfilme.dataLancamento, tblGeneroFilme.nome as nomeGeneroFilme
	from tblfilme inner join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme
    inner join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme;
    
    
# Left join - Retorna dados relacionados entre a tabela da esqueda e que contem relação com a tabela da direita, 
	#porem tambem retorna os dados da tabela da esquerda que não foram relacionados com a tabela da direita
    
    # neste caso ele traz aqueles que possuem relação com o genero e tambem aqueles que não
    select tblFilme.nome as nomeFilme, tblfilme.duracao, tblfilme.dataLancamento, tblGeneroFilme.nome as nomeGeneroFilme
	from tblfilme left join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme
    left join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme;
    
# Rigth join - Retorna dados relacionados entre a tabela da esqueda e que contem relação com a tabela da direita, 
	#porem tambem retorna os dados da tabela da direita que não foram relacionados com a tabela da esquerda
select tblFilme.nome as nomeFilme, tblfilme.duracao, tblfilme.dataLancamento, tblGeneroFilme.nome as nomeGeneroFilme
	from tblfilme right join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme
    right join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme;
    

#Full join no mysql - Union all
	#como o mysql não possui o full join, para representar esse resultado, é necssario utilizar o comando union all (o comando union serve para unir um ou mais scripts de select). 
	#Criamos um select apena com left join e unimos com outro select que possui o right join
select tblFilme.nome as nomeFilme, tblfilme.duracao, tblfilme.dataLancamento, tblGeneroFilme.nome as nomeGeneroFilme
	from tblfilme right join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme 
    right join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme union all
select tblFilme.nome as nomeFilme, tblfilme.duracao, tblfilme.dataLancamento, tblGeneroFilme.nome as nomeGeneroFilme
	from tblfilme left join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme 
    left join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme;




select * from tblintermgenerofilme;
select * from tblFilme;
select * from tblGeneroFilme;