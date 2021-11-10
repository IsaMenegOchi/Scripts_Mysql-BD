#Comentário linha
/*Comentário em bloco*/
create database dbFilmesTurmaB;

#Permite visualizar os databases existentes no BD
show databases;

#Permite apagar um database do BD
drop database nomeDB;

/*Seleciona o database a ser utilizado
	primeira coisa a fazermos quando formos mexer no banco
*/
use dbFilmesTurmaB;

#TABELAS PRINCIPAIS

#Cria uma tabela e seus atributos
create table tblClasificacao (
	idClassificacao int not null auto_increment primary key,
    nome varchar(20) not null,
    #campos que nao se repetem
    unique index(idClassificacao)
);

show tables;

CREATE TABLE tblGeneroPessoa (
	idGeneroPessoa int not null auto_increment,
    nome varchar(10) not null,
    primary key (idGeneroPessoa),
    unique index (idGeneroPessoa)
);


#Permite visualizar a descrição da estrutura da tabela
DESC tblGeneropessoa;

CREATE TABLE tblEstudio(
	idEstudio int not null auto_increment primary key,
    nome varchar(80) not null,
    unique index(idEstudio)
);

CREATE TABLE tblGeneroFilme (
	idGeneroFilme int not null auto_increment primary key,
    nome varchar(30) not null,
    unique index(idGeneroFilme)
);

CREATE TABLE tblNacionalidade (
	idNacionalidade int not null auto_increment primary key,
    nome varchar(20),
    unique index (idNacionalidade)
);

CREATE TABLE tblFilme(
	idFilme int not null auto_increment primary key,
    nome varchar(100) not null,
    nomeOriginal varchar(100),
    duracao time not null,
    dataLancamento date not null,
    dataRelancamento date,
    sinopse text not null,
    fotoCapa varchar(80),
		#Deve haver as mesmas caracteristicas colocadas na chave primaria de sua tabela
    idClassificacao int not null,
		#criar um nome para o relacionamento
		#devemos criar um nome para o relacionamento saber onde ela esta vindo e para onde ela esta indo
    constraint FK_Classificacao_Filme
		#criamos uma chave estrangeira, especificando-a como chave estrangeira
    foreign key (idClassificacao)
		#pegamos a referencia de qual tabela ela vai vir e qual é a chave primaria desta tabela
    references tblClasificacao(idClassificacao),
    unique index (idFilme)
);


create table tblDiretor (
	idDiretor int not null auto_increment primary key,
	nome varchar(80) not null,
	dataNascimento date not null,
	nomeArtistico varchar (80),
	biografia text,
	foto varchar(80),
	idGeneroPessoa int not null,
	constraint FK_Genero_diretor
	foreign key(idGeneroPessoa)
	references tblGeneroPessoa (idGeneroPessoa),
	unique index (idDiretor)
);

CREATE TABLE tblAtor (
	idAtor int not null auto_increment primary key,
    #erro proposital
    nome varchar (8),
    nomeArtistico varchar (80),
    dataNasc date not null,
    dataFalecimento date,
    biografia text,
    idGeneroPessoa int not null,
    unique index (idAtor)
);

CREATE TABLE tblRoteirista(
	idRoteirista int not null auto_increment primary key,
	nome varchar (100) not null,
    idGeneroPessoa int not null,
    unique index (idRoteirista)
);



#TABELAS INTERMEDIARIAS

CREATE TABLE tblIntermGeneroFilme(
idIntermGeneroFilme int not null auto_increment primary key,
    idFilme int not null,
    idGeneroFilme int not null,
    constraint FK_Filme_FilmeGenero
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    constraint FK_GeneroFilme_FilmeGenero
    foreign key (idGeneroFilme)
    references tblGeneroFilme (idGeneroFilme),
    
    unique index (idIntermGeneroFilme)
);


CREATE TABLE tblIntermFilmeRoteirista(
idIntermFilmeRoteirista int not null auto_increment primary key,
    idFilme int not null,
    idRoteirista int not null,
    constraint FK_Filme_FilmeRoteirista
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    constraint FK_Roteirista_FilmeRoteirista
    foreign key (idRoteirista)
    references tblRoteirista (idRoteirista),
    
    unique index (idIntermFilmeRoteirista)
);

CREATE TABLE tblIntermFilmeEstudio(
idIntermFilmeEstudio int not null auto_increment primary key,
    idFilme int not null,
    idEstudio int not null,
    constraint FK_Filme_FilmeEstudio
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    constraint FK_Estudio_FilmeEstudio
    foreign key (idEstudio)
    references tblEstudio (idEstudio),
    
    unique index (idIntermFilmeEstudio)
);

create table tblFilmeDiretor (
	idFilmeDiretor int not null auto_increment primary key,
    idFilme int not null,
    idDiretor int not null,
    constraint FK_Filme_FilmeDiretor
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    constraint FK_Diretor_FilmeDiretor
    foreign key (idDiretor)
    references tblDiretor (idDiretor),
    
    unique index (idFilmeDiretor)
);

CREATE TABLE tblIntermNacionalidadeAtor(
idIntermNacionalidadeAtor int not null auto_increment primary key,
    idNacionalidade int not null,
    idAtor int not null,
    constraint FK_Nacionalidade_NacionalidadeAtor
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    constraint FK_Ator_NacionalidadeAtor
    foreign key (idAtor)
    references tblAtor (idAtor),
    
    unique index (idIntermNacionalidadeAtor)

);

CREATE TABLE tblIntermNacionalidadeDiretor(
idIntermNacionalidadeDiretor int not null auto_increment primary key,
    idNacionalidade int not null,
    idDiretor int not null,
    constraint FK_Nacionalidade_NacionalidadeDiretor
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    constraint FK_Diretor_NacionalidadeDiretor
    foreign key (idDiretor)
    references tblDiretor (idDiretor),
    
    unique index (idIntermNacionalidadeDiretor)
);

CREATE TABLE tblIntermNacinalidadeRoteirista(
idIntermNacionalidadeRoteirista int not null auto_increment primary key,
    idNacionalidade int not null,
    idRoteirista int not null,
    constraint FK_Nacionalidade_NacionalidadeRoteirista
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    constraint FK_Roteirista_NacionalidadeRoteirista
    foreign key (idRoteirista)
    references tblRoteirista (idRoteirista),
    
    unique index (idIntermNacionalidadeRoteirista)
);

CREATE TABLE tblIntermFilmeAtor(
idIntermFilmeAtor int not null auto_increment primary key,
    idFilme int not null,
    idAtor int not null,
    constraint FK_Ator_FilmeAtor
    foreign key (idAtor)
    references tblAtor (idAtor),
    
    constraint FK_Filme_FilmeAtor
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    unique index (idIntermFilmeAtor)
);

#modify column - permite alterar as propriedades de um atributo
#alterando a estrutura da tabela
	#altera propriedades de uma tabla
	alter table tblAtor
		modify column nome varchar(80) not null;
		
	#permite mudar a escrita e as propriedades
	alter table tblAtor
		change column dataNasc dataNascimento date not null;

	#permite adicionar novo atributo
	alter table tblAtor
		add column foto varchar(80);

	#adicionar relacionamento em tabela já existente
	alter table tblAtor
		add constraint FK_Genero_Ator
		foreign key (idGeneroPessoa)
		references tblGeneroPessoa (idGeneroPessoa);

	#adicionando nova unique index (exemplo)
	alter table tblAtor
		add unique index(idAtor, foto);

	#drop foreign key - perite apagar um relacionamento
	alter table tblAtor
		drop foreign key FK_Genero_Ator;
		
	#drop column - permite apagar um atributo
	alter table tblAtor
		drop column idGeneroPessoa;


	desc tblAtor;


#mostrar constraint (exemplo mySQL)
SELECT
	CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
	REFERENCED_TABLE_NAME = 'tblFilme';
    
    
#INSERTS, UPDATES E DELETES

#Sempres que fomos manipular dados no banco, devemos SEMPRE utilizar as aspas simples
#Devemos sempre colocar aspas para todos os tipos de dados, aspas simples, menos o INT
# insert de valores individual
INSERT INTO tblGeneroFilme (nome) VALUES ('Drama');

#Inserção de multiplos valores
INSERT INTO tblGeneroFilme (nome) VALUES ('Aventura'), ('Animação'), ('Musical'), ('Policial'), ('Fantasia'), ('Policial'), ('Ação'), ('Terror'); 
SELECT * FROM tblGeneroFilme;

INSERT INTO tblClasificacao (nome) VALUES ('+10'), ('+12'), ('+14'), ('+18'), ('+16'), ('Livre');  

SELECT * FROM tblClasificacao;

INSERT INTO tblFilme (nome,
nomeOriginal,
duracao,
dataLancamento,
dataRelancamento,
sinopse,
fotoCapa,
idClassificacao) 
#Duracao - hora:min:sec
#Data - 4ano-2mes-2dia 
#Quando temos um atributo que não recebe valor, devemos colocar null
VALUES ('Um sonho de liberdade',
'The Shawshank Redemption',
 '02:20:00', 
 '1995-01-25', 
 null, 
 'Em 1946, Andy Dufresne (Tim Robbins), um jovem e bem sucedido banqueiro, tem a sua
vida radicalmente modificada ao ser condenado por um crime que nunca cometeu, o homicídio de sua esposa e do amante dela. Ele é mandado para uma prisão 
que é o pesadelo de qualquer detento, a Penitenciária Estadual de Shawshank, no Maine. Lá ele irá cumprir a pena perpétua. Andy logo será apresentado 
a Warden Norton (Bob Gunton), o corrupto e cruel agente penitenciário, que usa a Bíblia como arma de controle e ao Capitão Byron Hadley (Clancy Brown) 
que trata os internos como animais. Andy faz amizade com Ellis Boyd Redding (Morgan Freeman), um prisioneiro que cumpre pena há 20 anos e controla o 
mercado negro da instituição.', 
'filme01.jpg', 
5),
('O rei leão',
 'The lion king', 
 '01:29:00',
 '1994-07-08', 
 '2011-08-26', 
 'Clássico da Disney, a animação acompanha Mufasa (voz de James Earl Jones), o Rei Leão, e a rainha Sarabi (voz de Madge Sinclair), apresentando ao 
 reino o herdeiro do trono, Simba (voz de Matthew Broderick). O recém-nascido recebe a bênção do sábio babuíno Rafiki (voz de Robert Guillaume), mas 
 ao crescer é envolvido nas artimanhas de seu tio Scar (voz de Jeremy Irons), o invejoso e maquiavélico irmão de Mufasa, que planeja livrar-se do 
 sobrinho e herdar o trono.', 
 'foto02.png', 
 6);
 
 INSERT INTO tblIntermGeneroFilme (idFilme, idGeneroFilme) VALUES (1,1), (2,2), (2,3), (2,4);

select * from tblIntermGeneroFilme;


#update
#nome da tabela SET nome do atributo
#deste modo modificamos todos os filmes e suas duracoes
	#UPDATE tblFilme set duracao = '03:00:00'
#where - criterio do que exatamente queremos mudar
UPDATE tblFilme set duracao = '03:00:00' WHERE idFilme = 1;
#fazer com que a coluna de data relancamento seja nulo
UPDATE tblFilme set dataRelancamento = null;

#delete - apaga a alinha inteira
DELETE  FROM tblGeneroFilme WHERE idGeneroFilme = 10; 
#se for chaves estrangeiras, ou seja, que faz parte de outra tabela, ele não deixa deletar
DELETE  FROM tblGeneroFilme WHERE idGeneroFilme = 1; 
#os ids daqueles que foram apagados nunca mais voltam

