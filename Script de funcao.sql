#FUNCTION E PROCEDURES
#ao inves de chaves, temos o begin e end

#END - serve para terminar um laço, uma função, ou outras coisas tambem

#DELIMETER - caracter delimitador que serve como end, servindo como simbolo de encerramento da function

#DETERMINISTIC - Serve para especificar que o retorna da função será o mesmo tipo de dados da entrada de
	#argumento (caso houver) ou quando não existir argumentos de entrada
#NOT DETERMINISTIC - Para especificar que o retorno da função será diferente do tipos de dados da entrada dos argumentos

#DECLARE - serve para declararmos uma variavel

#SET - atribuição de dados a uma variavel

#

#INFO - nçao conseguimos "ver" a função
	#devemos dizer se a função vai retornar algo e qual o tipo de dados que será retornado
    
DELIMITER $$
create function saudacao2()
	returns char(15)
	deterministic
    BEGIN
    #declaração de variaveis
		declare horaAtual time;
        declare hora char(2);
        declare mensagem char(15);
	
    #atribuição de dados a uma variavel
		set horaAtual = '14:45:43';
        set hora = hour(horaAtual);
	
    #condicionamento
        if hora >= 5 and hora < 12 then 
        set mensagem = 'Bom dia!';
        
        elseif hora >= 12 and hora < 18 then
        set mensagem = 'Boa tarde!';
        
        elseif hora >= 18 and hora <= 23 then
        set mensagem = 'Boa noite';
        
        else 
        set mensagem = 'Boa madrugada!';
        end if;
        
        return mensagem;
        
	END $$
    
    
#outra funcao
DELIMITER $$
create function saudacao2()
	returns char(15)
	deterministic
    BEGIN
    #declaração de variaveis
		declare horaAtual time;
        declare hora char(2);
        declare mensagem char(15);
	
    #atribuição de dados a uma variavel
		set horaAtual = '14:45:43';
        set hora = hour(horaAtual);
	
    #condicionamento
        if hora >= 5 and hora < 12 then 
        set mensagem = 'Bom dia!';
        
        elseif hora >= 12 and hora < 18 then
        set mensagem = 'Boa tarde!';
        
        elseif hora >= 18 and hora <= 23 then
        set mensagem = 'Boa noite';
        
        else 
        set mensagem = 'Boa madrugada!';
        end if;
        
        return mensagem;
        
	END $$

DELIMITER $$
create function saudacao3()
	returns char(15)
	deterministic
    BEGIN
    #declaração de variaveis
		declare horaAtual time;
        declare hora char(2);
        declare mensagem char(15);
	
    #atribuição de dados a uma variavel
		set horaAtual = '18:00:00';
        set hora = hour(horaAtual);
	
    #condicionamento
        if hora >= 5 and hora < 12 then 
        set mensagem = 'Bom dia!';
        
        elseif hora >= 12 and hora < 18 then
        set mensagem = 'Boa tarde!';
        
        elseif hora >= 18 and hora <= 23 then
        set mensagem = 'Boa noite';
        
        else 
        set mensagem = 'Boa madrugada!';
        end if;
        
        return mensagem;
        
	END $$
    
DELIMITER $$
create function saudacaoUsuario(usuario char(20))
	returns char(35)
	deterministic
    BEGIN
    #declaração de variaveis
		declare horaAtual time;
        declare hora char(2);
        declare mensagem char(15);
	
    #atribuição de dados a uma variavel
		set horaAtual = curtime();
        set hora = hour(horaAtual);
	
    #condicionamento
        if hora >= 5 and hora < 12 then 
        set mensagem = 'Bom dia!';
        
        elseif hora >= 12 and hora < 18 then
        set mensagem = 'Boa tarde!';
        
        elseif hora >= 18 and hora <= 23 then
        set mensagem = 'Boa noite';
        
        else 
        set mensagem = 'Boa madrugada!';
        end if;
        
        return concat(mensagem + usuario);
        
	END $$
    
select saudacao() as mensagem;
select saudacao2() as mensagem;
select saudacao3() as mensagem;

select saudacaoUsuario('José') as mensagemUsuario;



#caso quisermos uma função com paremetro, devemos colocar dentro dos parenteses a variavel e o tipo e quantidade (usuario char(20))
    
    