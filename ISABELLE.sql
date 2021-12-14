use dbfilmesturmaa;

#PODE RECEBER ARGUMENTOS OU NÃO
	#ARGUMENTOS: 
    #IN - Utilizada quando apenas teremos a chegada de argumetnos
    #OUT - utilizado quando a procedure terá apenas retorno da saída
    #INOUT - ambas as situações citadas acima
		#caso coloquemos argumentos, devemos colocar esses prefixos
        
#procedure - mistura entre função e view

#PARTE DA ISABELLE
DELIMITER $$
create procedure procListarFilmes(IN idGenero int)
	BEGIN
    #condicao para listar os filmes com filtro pelo id do genero
		if idGenero = 0 then 
			select tblFilme.tituloFilme, tblfilme.dataLancamento, tblGenero.nomeGenero 
			from tblFilme
			inner join tblFilmeGenero 
				on tblFilme.idFilme = tblFilmeGenero.idFilme 
			inner join tblGenero
				on tblGenero.idGenero = tblFilmeGenero.idGenero;
                #consicao para listar todos os filmes independente do id do genero
		else
			select tblFilme.tituloFilme, tblfilme.dataLancamento, tblGenero.nomeGenero 
				from tblFilme
				inner join tblFilmeGenero 
					on tblFilme.idFilme = tblFilmeGenero.idFilme 
				inner join tblGenero
					on tblGenero.idGenero = tblFilmeGenero.idGenero
					where tblGenero.idGenero = idGenero;
		end if;
	END $$
#para chamar uma procedure, devemos colocar uma call    
call procListarFilmes(1);


#PARTE DA MARIA
DELIMITER $$
create procedure procListarFilmesMaria(IN idGenero int)
	BEGIN
    
		DECLARE scriptBase text;
        DECLARE scriptFinal text;
        
        set scriptBase = 'select tblFilme.tituloFilme, tblfilme.dataLancamento, tblGenero.nomeGenero 
			from tblFilme
			inner join tblFilmeGenero 
				on tblFilme.idFilme = tblFilmeGenero.idFilme 
			inner join tblGenero
				on tblGenero.idGenero = tblFilmeGenero.idGenero';
		
                
		if idGenero = 0 then set scriptFinal = concat(scriptBase + ';');
		else set scriptFinal = concat(scriptBase + ' where tblGenero.idGenero =' + idGenero +';');
		end if;
        execute scriptFinal;
	END $$
    
call procListarFilmesMaria(0);
    

DELIMITER $$
create procedure procListarFilmesMariaSql(IN idGenero int)
	BEGIN
    
		DECLARE sqlPrincipal text;
        DECLARE sqlCriterioGenero text;
		DECLARE sqlCompleto text;

        set sqlPrincipal = 'select tblFilme.tituloFilme, tblfilme.dataLancamento, tblGenero.nomeGenero 
			from tblFilme
			inner join tblFilmeGenero 
				on tblFilme.idFilme = tblFilmeGenero.idFilme 
			inner join tblGenero
				on tblGenero.idGenero = tblFilmeGenero.idGenero';
		
		if idGenero > 0 then 
        set sqlCriterioGenero = concat(' where tblGenero.idGenero =', idGenero, ';');
        else set sqlCriterioGenero = ';'; 
		end if;
        
        set @sqlCompleto = concat(sqlPrincipal, sqlCriterioGenero);
        prepare myquery from @sqlCompleto;
        execute myquery;
	END $$

call procListarFilmesMariaSql(1);
drop procedure procListarFilmesMariaSql;


#PARTE PROF
DELIMITER $$
create procedure procListarFilmesProf(IN idGenero int)
	BEGIN
        set @comandoPrincipal := 'select tblFilme.tituloFilme, tblfilme.dataLancamento, tblGenero.nomeGenero 
			from tblFilme
			inner join tblFilmeGenero 
				on tblFilme.idFilme = tblFilmeGenero.idFilme 
			inner join tblGenero
				on tblGenero.idGenero = tblFilmeGenero.idGenero';
		
		if idGenero > 0 then 
			set @comando := concat(@comandoPrincipal, ' where tblGenero.idGenero =', idGenero );
        else 
			set @comando := concat(@comandoPrincipal,';'); 
		end if;
	
        prepare scriptSql from @comando;
        execute scriptSql;
	END $$

call procListarFilmesProf(1);
drop procedure procListarFilmesProf;
