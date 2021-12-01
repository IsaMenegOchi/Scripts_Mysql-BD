
select * from tblfilme;
select * from tblClasificacao;
    
#select do genero do filme + filmes sem genero
select tblFilme.nome as nomeFilme, tblGeneroFilme.nome as nomeGeneroFilme
	from tblfilme left join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme
    left join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme;

#select da classificacao
select tblFilme.nome as nomeFilme, tblClasificacao.nome as nomeClassificacao
    from tblFilme left join tblclasificacao on tblFilme.idFilme = tblClasificacao.idClassificacao;

#select dos atores
select tblFilme.nome as nomeFilme, tblAtor.nome as nomeAtor
	from tblfilme right join tblIntermFilmeAtor on tblFilme.idFilme = tblIntermFilmeAtor.idFilme
	right join tblAtor on tblAtor.idAtor = tblIntermFilmeAtor.idAtor order by nomeAtor;


select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, tblGeneroFilme.nome as nomeGeneroFilme, tblClasificacao.nome as nomeClassificacao, tblAtor.nome as nomeAtor
	from tblfilme left join tblintermgenerofilme on tblFilme.idFilme = tblintermgenerofilme.idFilme
    left join tblgenerofilme on tblGeneroFilme.idGeneroFilme = tblintermgenerofilme.idGeneroFilme#
    left join tblclasificacao on tblFilme.idFilme = tblClasificacao.idClassificacao
    left join tblIntermFilmeAtor on tblFilme.idFilme = tblIntermFilmeAtor.idFilme
	left join tblAtor on tblAtor.idAtor = tblIntermFilmeAtor.idAtor order by nomeAtor;

#prof
	select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, tblGeneroFilme.nome as nomeGeneroFilme, tblClasificacao.nome as nomeClassificacao, tblAtor.nome as nomeAtor
	from tblfilme 
    inner join tblFilme 
		on tblClasificacao.idClassificacao = tblFilme.idClassificacao#
    inner join tblIntermGeneroFilme
		on tblGeneroFilme.idGeneroFilme = tblIntermGeneroFilme.idGeneroFilme
    inner join tblIntermFilmeAtor on tblFilme.idFilme = tblIntermFilmeAtor.idFilme
	left join tblAtor on tblAtor.idAtor = tblIntermFilmeAtor.idAtor order by nomeAtor;



select * from tblIntermFilmeAtor;