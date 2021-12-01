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


show tables;

#TABELA GENERO PESSOA
select * from tblGeneroPessoa;
insert into tblGeneroPessoa(nome) values ("Feminino");
insert into tblGeneroPessoa(nome) values ("Masculino");
insert into tblGeneroPessoa(nome) values ("N binário");
insert into tblGeneroPessoa(nome) values ("Binário");


#TABELA ATOR
	#REI LEÃO
select * from tblAtor;

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Garcia Júnior", null, "1967-03-02", null, null, 2, "fotoAtor1");

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Jorgeh Ramos", null,  "1941-02-03", "2014-12-01", "Jorgeh Ramos foi ator, diretor de dublagem, 
autor de peças teatrais, já apresentou alguns telejornais, e foi um dos diretores 
artíticos da produtora Herbert Richards, hoje extinta. Entretanto, Jorgeh ficou mais 
conhecido por ser pioneiro na profissão dublador de filmes e narrador de trailers de cinema. 
Ele realizou a dublagem dos vilões Jafar, Scar e Rasputin, dos desenhos Aladdin, O Rei Leão 
e Anastasia, respectivamente, e de Peter McCallister, o pai do garotinho de Esqueceram de Mim, 
entre outros." , 2, "fotoAtor2");

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Mauro Ramos", null,  "1961-02-13", null, null , 2, "fotoAtor2");

	#UM SONHO DE LIBERDADE
insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Timothy Francis Robbins","Tim Robbins",  "1958-10-16", null, null, 2, "fotoAtor4");

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Morgan Freeman", null,  "1937-06-01", null, "Possui uma estrela na Calçada da Fama, localizada em 7021 Hollywood Boulevard.", 2, "fotoAtor5");

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Bob Gunton", null,  "1945-11-15", null, null, 2, "fotoAtor6");

	#A ESPERA DE UM MILAGRE
insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Thomas Jeffrey Hanks", "Tom Hanks",  "1956-06-09", null, 'Tom Hanks iniciou a carreira no cinema aos 24 anos, com um papel no filme de baixo orçamento Trilha de Corpos. Logo migrou para a TV, onde estrelou por dois anos a série Bosom Buddies. Nela passou a trabalhar com comédia, algo com o qual não estava habituado, rendendo convites para pequenas participações nas séries Táxi, Caras & Caretas e Happy Days.

Em 1984, veio seu primeiro sucesso no cinema: a comédia Splash - Uma Sereia em Minha Vida, na qual era dirigido por Ron Howard e contracenava com Daryl Hannah. Em seguida vieram várias comédias, entre elas A Última Festa de Solteiro (1984), Um Dia a Casa Cai (1986) e Dragnet - Desafiando o Perigo (1987), tornando-o conhecido do grande público.

Com Quero Ser Grande (1988) Hanks obteve sua primeira indicação ao Oscar de melhor ator. Apesar de consagrado como comediante, aos poucos passou a experimentar outros gêneros. Em 1993 surpreendeu em Filadélfia como um advogado homossexual que luta na justiça contra sua demissão, motivada por preconceito devido a ele ser portador do vírus da AIDS. Pelo papel conquistou seu primeiro Oscar.

Já no ano seguinte Hanks ganharia sua segunda estatueta dourada, repetindo um feito apenas obtido por Spencer Tracy, quase 60 anos antes. Forrest Gump - O Contador de Histórias foi sucesso de público e crítica, ganhando seis Oscar.

Estabelecido como um dos maiores astros de Hollywood, Hanks passou a emendar um sucesso atrás do outro: Apollo 13 - Do Desastre ao Triunfo (1995), Toy Story (1995), O Resgate do Soldado Ryan (1998), Mens@gem Para Você (1998), Toy Story 2 (1999), À Espera de um Milagre (1999), Náufrago (2000), Prenda-me Se For Capaz (2002) e Estrada para Perdição (2002).

Em 1996, resolveu se dedicar à sua estreia na direção. O resultado foi The Wonders - O Sonho Não Acabou, divertida comédia que rendeu a contagiante música "That Thing You Do!". Hanks voltaria a trabalhar como diretor em episódios das séries de TV Da Terra à Lua (1998) e Band of Brothers (2001) e também na comédia romântica Larry Crowne - O Amor Está de Volta (2011).

Em 2004, o ator encampou a ideia de interpretar vários personagens na animação O Expresso Polar, dirigida pelo colega Robert Zemeckis. Usando o método de captura de movimento, Hanks interpretou seis personagens de idades variadas.

Um de seus personagens mais famosos é o simbologista Robert Langdon, criado pelo autor Dan Brown. Hanks o interpretou em dois filmes, O Código Da Vinci (2006) e Anjos e Demônios (2009).', 2, "fotoAtor7");

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Michael Clarke Duncan", "Michael Duncan",  "1957-12-10", null, "Michael Clarke Duncan é conhecido pela atuação em À Espera de um Milagre, que lhe rendeu indicações ao Oscar e ao Globo de Ouro de Melhor Ator Coadjuvante. Fez sua estreia nos cinemas em 1995, com um papel não creditado em Sexta-Feira em Apuros. O primeiro trabalho de destaque viria três anos depois com Armageddon. Agradou tanto que Bruce Willis recomendou que Frank Darabont contratasse ele para À Espera de um Milagre, em 1999.

Muitas vezes tratado como Big Mike, por causa da altura de 1,96 m, o ator se destacou ainda em Meu Vizinho Mafioso, Planeta dos Macacos, O Escorpião Rei e A Ilha. Participou também de três adaptações dos quadrinhos: O Demolidor, Sin City - A Cidade do Pecado e Lanterna Verde. Robert Rodriguez contava com o retorno dele para Sin City 2: A Dame to Kill For, algo que infelizmente não irá mais acontecer.

Na TV, Clarke Duncan contou com participações em importantes seriados, como Um Maluco no Pedaço, Bones, Chuck e Two and a Half Men. Faleceu em setembro de 2012, aos 54 anos, após passar dois meses hospitalizado em Los Angeles.", 2, "fotoAtor8");
    
insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("David Bowditch Morse", "David Morse",  "1953-10-11", null, null, 2, "fotoAtor11");    
    
    #FORREST GUMP
    #TOM HANKS
insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Gary Alan Sinise", "Gary Sinise",  "1955-03-17", null, null, 2, "fotoAtor9");

insert into tblAtor(nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, idGeneroPessoa, foto)
values ("Robin Wright Penn", "Robin Wright",  "1966-04-08", null, "Robin Wright nasceu em Dallas, Texas, filha de Gayle Gaston, uma vendedora de cosméticos, e Freddie Wright, funcionário de uma empresa farmacêutica. A atriz ficou famosa por seus papeis em House of Cards, Mulher-Maravilha, Corpo Fechado e Forrest Gump - O Contador de Histórias.

Wright foi criada em San Diego, Califórnia. Quando jovem, frequentou a La Jolla High School, em La Jolla, e a Taft High School em Woodland Hills, em Los Angeles.

A atriz começou sua carreira como modelo quando tinha 14 anos. Aos 18, interpretou Kelly Capwell na novela Santa Barbara (1984), da NBC Daytime, recebendo diversas indicações ao Daytime Emmy e voltando os olhos do público para seu trabalho.

Das telas da TV para o cinema, Wright conseguiu um papel em Hollywood Vice Squad (1986) e protagonizou uma princesa em A Princesa Prometida, em 1987. Alguns anos mais tarde, a atriz foi aclamada pela crítica em seu papel como Jenny Curran, em Forrest Gump (1994), recebendo indicações ao Golden Globe Award e Screen Actors Guild de Melhor Atriz Coadjuvante.

Em 1996, ela protagonizou a adaptação cinematográfica de Moll Flanders, do diretor Daniel Defoe, recebendo uma indicação ao Satellite Award de Melhor Atriz em Drama. No ano seguinte, Wright foi indicada ao Screen Actors Guild Award de Melhor Atriz por seu papel em Loucos de Amor, filme no qual ela co-estrelou com seu então marido, Sean Penn.

Contracenando com Bruce Willis e Samuel L. Jackson, a atriz atuou no suspense Corpo Fechado, dirigido por M. Night Shyamalan, em 2000.

Em 2013, Wright apareceu na série da Netflix, House of Cards, interpretando a implacável Claire Underwood, esposa do político Frank Underwood (Kevin Spacey). Em 2014, ela ganhou um Globo de Ouro pelo papel, tornando-se a primeira atriz a ganhar o prêmio por uma série de televisão com transmissão apenas online. A atriz foi indicada para o mesmo prêmio no ano seguinte e também recebeu indicações para o Primetime Emmy Award em 2013 e 2014, pelo mesmo papel. Após a saída de Spacey por conta das acusações de má conduta sexual, Wright foi definida como a nova protagonista do show, continuando a ser indicada a diversos prêmios.

Em 2017, a atriz interpretou a General Antíope em Mulher-Maravilha, ao lado de Gal Gadot e Chris Pine. No mesmo ano, ela apareceu na superprodução sequência de Blade Runner, Blade Runner 2049, ao lado de Ryan Gosling, Harrison Ford e Jared Leto. O longa foi altamente aclamado pela crítica.

Wright é porta-voz honorária da Fundação Gordie, sem fins lucrativos, com sede no Texas. Em 2014, a atriz fez parceria com duas empresas sediadas na Califórnia; Pour Les Femmes e The SunnyLion. Essa última doa uma parte de seus lucros ao movimento Raise Hope For Congo.

A atriz é ativista dos direitos humanos na República Democrática do Congo. Ela é a narradora e produtora executiva do documentário When Elephants Fight, que destaca como corporações multinacionais de mineração e políticos ameaçam os direitos humanos e perpetuam conflitos na região.", 1, "fotoAtor10");
    

#TABELA DIRETOR
select * from tblDiretor;
	#REI LEÃO
    insert into tblDiretor(nome, dataNascimento, nomeArtistico, biografia, foto, idGeneroPessoa)
values ("Roger Charles Allers", "1949-06-29", 'Roger Allers', null, 'fotoDiretor1', 2);

insert into tblDiretor(nome, dataNascimento, nomeArtistico, biografia, foto, idGeneroPessoa)
values ("Rob Ralph Minkoff", "1962-08-11", 'Rob Minkoff', null, 'fotoDiretor2', 2);

    #UM SONHO DE LIBERDADE
    
    
	#A ESPERA DE UM MILAGRE
insert into tblDiretor(nome, dataNascimento, nomeArtistico, biografia, foto, idGeneroPessoa)
values ("Ferenc Árpád Darabont", "1959-01-28", 'Frank Darabont', ' É o autor dos roteiros de 
"A Hora do Pesadelo 3", "A Mosca 2" e "Frankenstein de Mary Shelley".- Trabalhou como 
roteirista na série de TV norte-americana "O Jovem Indiana Jones".', 'fotoDiretor1', 2);
	#FOREST GUMP
    
    select * from tblRoteirista;
    
    select * from tblNacionalidade;
    
insert into tblNacionalidade (nome) values ('Americano');
insert into tblNacionalidade (nome) values ('Brasileiro');
insert into tblNacionalidade (nome) values ('Espanhol');

 select * from tblAtor;
select * from tblIntermFilmeAtor;
	
select * from tblIntermNacionalidadeAtor;
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (2, 3);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (2, 4);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (2, 5);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 6);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 7);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 8);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 9);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 10);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 11);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 12);
insert into tblIntermNacionalidadeAtor (idNacionalidade, idAtor) values (1, 13);



select * from tblAtor;
select * from tblIntermFilmeAtor;
insert into tblIntermFilmeAtor (idFilme, idAtor) values (2, 3);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (2, 4);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (2, 5);

insert into tblIntermFilmeAtor (idFilme, idAtor) values (1, 6);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (1, 7);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (1, 8);

insert into tblIntermFilmeAtor (idFilme, idAtor) values (3, 9);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (3, 11);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (3, 12);

insert into tblIntermFilmeAtor (idFilme, idAtor) values (4, 9);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (4, 10);
insert into tblIntermFilmeAtor (idFilme, idAtor) values (4, 13);
show tables;

select * from tblFilme;
select * from tblGeneroFilme;
select * from tblIntermGeneroFilme;
insert into tblIntermGeneroFilme (idFilme, idGeneroFilme) values (4, 13);
