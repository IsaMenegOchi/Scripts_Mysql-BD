
#curdate() - retorna a data do dia de hoje
select curdate() as dataHoje;
#currtent_date - retorna o mesmo que o curdate, é apenas a função extensa de escrever
select current_date() as dataAtual;

#curtime() - retorna a hora do servidor
select curtime() as horaAgora;
#currtent_time - retorna o mesmo que o curtime, é apenas a função extensa de escrever
select current_time() horaAtual;

#currente_timestamp() - retorna a data e a hora atual do servidor
select current_timestamp() as dataHoraAtual;


#FUNÇÕES DE FORMATAÇÃO DE HORA
#time_format() - ajuda na formatação da hora
select time_format(curtime(), '%H') as hora;
select time_format(curtime(), '%i') as minutos;
select time_format(curtime(), '%s') as segundo;
select time_format(curtime(), '%H:%i') as horaMin;
select time_format(curtime(), '%r') as periodoDia;
select time_format(curtime(), '%T') as hora24h; #de 0 a 24

#hour(), minute(), second() -informações mais rapidas, sem formatação
select hour(curtime()) as hora;
select minute(curtime()) as minutos;
select second(curtime()) as segundos;

#timediff() - encaminhamos dois valores de hora, e retorna o periodo entre eles
#o primeiro é a hora atual/final e a hora inicial
select timediff(curtime(), '09:23:54') as periodoTempo;


# FUNÇÕES DE FORMATAÇÃO DE DATA
select date_format(curdate(), '%W') as diaSemana;
select date_format(curdate(), '%w') as numeroDiaSemana; #domingo = 0
select date_format(curdate(), '%a') as diaSemanaAbreviado;
select date_format(curdate(), '%d') as dia;
select dayofyear(curdate()) as numeroDiaAno;

select date_format(curdate(), '%m') as numeroMes;
select date_format(curdate(), '%M') as nomeMes;
select date_format(curdate(), '%c') as numeroMes;
select date_format(curdate(), '%b') as mesAbreviado;

select date_format(curdate(), '%y') as anoAbreviado;
select date_format(curdate(), '%Y') as anoExtenso;

select date_format(curdate(), '%Y-%m-%d') as dataUniversal;
select date_format(curdate(), '%d/%m/%Y') as dia;

select week(curdate()) as numeroSemana;
select weekofyear(curdate()) as numeroSemana;
select weekday('2021-11-22') as numeroSemana; #segunda = 0 e domingo = 6
select yearweek(curdate()) as anoNumeroSemana;

#day(), month(), year()
select day(curdate()) as diaAtual;
select month(curdate()) as mesAtual;
select year(curdate()) as yearAtual;

select datediff(curdate(), '2020-11-23') as diferencaData;

 
