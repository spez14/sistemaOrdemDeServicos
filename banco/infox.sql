-- comentários
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados a ser utilizado
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create -> insert
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(1, 'José de Assis', '9999-9999','joseassis','123456');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2, 'Administrador', '9999-9999','admin','admin');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Bill Gates', '9999-9999','bill','123456');

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone = '8888-8888' WHERE iduser = 2;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values('Linus Torvalds', 'Rua Tux, 2015', '9999-9999', 'linus@linux.com');

select * from tbclientes;

create table tbos (
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10, 2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Não liga', 'Troca de fonte', 'Zé', 87.50, 1);

select * from tbos;

-- o código abaixo traz informações de duas tabelas
select
O.os, equipamento, defeito,servico, valor,
C.nomecli, fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);


-- 3
use dbinfox;
select * from tbusuarios;
select * from tbusuarios where login='admin' and senha='admin';
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Leandro Ramos', '9999-9999', 'leandro', '123');

-- 4
use dbinfox;
describe tbusuarios;
select * from tbusuarios;
-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;
-- a linha abaixo remove um campo de uma tabela
alter table tbusuarios drop column perfil;
update tbusuarios set perfil = 'admin' where iduser = 1;
update tbusuarios set perfil = 'admin' where iduser = 2;
update tbusuarios set perfil = 'user' where iduser = 3;

-- 5
use dbinfox;
describe tbusuarios;
select * from tbusuarios;
select * from tbusuarios where iduser=2;

update tbusuarios set login = 'jefferson' WHERE iduser = 5;

-- 6
use dbinfox;
select * from tbclientes;
describe tbclientes;
select * from tbclientes;
select idcli as id, nomecli as nome, endcli as endereço, fonecli as fone, emailcli as email from tbclientes;
select * from tbclientes where nomecli like 'jo%';

-- 7

use dbinfox;
describe tbos;
-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

select * from tbos;

select os, date_format(data_os, '%d/%m/%Y - %H:%i'), tipo, situacao, equipamento, defeito, servico, tecnico, valor, idcli from tbos where os=3;

-- 8
use dbinfox;
select * from tbclientes;
select idcli, nomecli, fonecli from tbclientes where nomecli like 'jo%';
-- a linha abaixo cria um apelido aos campos da tabela
select idcli as Id, nomecli as Nome, fonecli as Fone from tbclientes where nomecli like 'jo%';

-- A instrução abaixo seleciona e ordena por nome todos os clientes cadastrados
select * from tbclientes order by nomecli;
describe tbclientes;

-- O bloco de instruções abaixo faz a seleção e união de dados de duas tabelas
-- OSER é uma variável que contém os campos desejados da tabela OS
-- CLI é outra variável que contém os campos desejados da tabela clientes
select
OSER.os, data_os, tipo, situacao, equipamento, valor,
CLI.nomecli, fonecli
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);

select * from tbos;
describe tbos;
select * from tbos where os=8;

select max(os) from tbos;


