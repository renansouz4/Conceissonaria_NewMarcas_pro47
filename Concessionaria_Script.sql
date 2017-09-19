create database concessionaria;

use concessionaria;


CREATE TABLE IF NOT EXISTS Funcionario (
cpf varchar(11) PRIMARY KEY,
nome varchar(50) not null,
cargo varchar(20) not null,
salario double not null,
comissao double null,
rua varchar(50) not null,
numero varchar(5) not null,
bairro varchar(20) not null,
cidade varchar(20) not null,
estado varchar(20) not null,
telefone varchar(13) not null
)DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS Cliente (
cpf_cnpj varchar(14) PRIMARY KEY,
nome varchar(50) not null,
tipo varchar(10) not null,
rua varchar(50) not null,
numero varchar (5) not null,
bairro varchar(20) not null,
cidade varchar(20) not null,
estado varchar(20) not null,
telefone varchar(13) not null
)DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Venda (
idvenda int PRIMARY KEY,
data date not null,
valor_total double not null,
cpf varchar(11) not null,
cpf_cnpj varchar(14) not null,
FOREIGN KEY(cpf) REFERENCES Funcionario (cpf),
FOREIGN KEY(cpf_cnpj) REFERENCES Cliente (cpf_cnpj)
)DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Marca (
idmarca int PRIMARY KEY,
nome varchar(20) not null
)DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Modelo (
idmodelo int PRIMARY KEY,
nome varchar(20) not null,
cor varchar(20),
ano int not null,
potencia double not null,
cambio varchar(20) not null,
combustivel varchar(20) not null,
idmarca int not null,
FOREIGN KEY(idmarca) REFERENCES Marca (idmarca)
)DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Carro (
idcarro int PRIMARY KEY,
valor double not null,
km int null,
idmodelo int not null,
FOREIGN KEY(idmodelo) REFERENCES Modelo (idmodelo)
)DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS Itemvenda (
quantidade int not null,
preco double not null,
idvenda int not null,
idcarro int not null,
FOREIGN KEY(idvenda) REFERENCES Venda (idvenda),
FOREIGN KEY(idcarro) REFERENCES Carro (idcarro)
)DEFAULT CHARSET = utf8;

insert into funcionario (cpf, nome, cargo, salario, comissao, rua, numero, bairro, cidade, estado, telefone) values
('96975121400', 'Weverson Gomes', 'Sub-Gerente', 3500, null, 'Av. Dantas Barretos', 121, 'Santo Antonio', 'Recife', 'PE', '81978451265'),
('57370330400', 'Abner Jose', 'Gerente', 4000, null, 'Av. Boa Viagem', 1546, 'Pina', 'Recife', 'PE', '81999669966'),
('28980334486', 'Ildo Gomes', 'Vendedor', 937, 0.02, 'Rua da Aurora', 213, 'Santo Amaro', 'Recife', 'PE', '82988754812'),
('43485970492', 'Marcos Simao', 'Faxineiro', 937, null, 'Av. Cruz Cabuga', 24, 'Santo Amaro', 'Recife', 'PE', '253230241520'),
('83785631464', 'Tayenne Carla', 'Vendedor', 937, 0.02, 'Av. Rosa e Silva', 276, 'Espinheiro', 'Recife', 'PE','81997979799'),
('52973805457', 'Ricardo', 'Vendedor', 937, 0.02, 'Av. Rui Barbosa', 171, 'Jaqueira', 'Recife', 'PE', '81987878797'),
('43194983482', 'Renan Augusto', 'Manobrista', 937, null, 'Av. Agamenon Magalhaes', 157, 'Derby', 'Recife', 'PE', '81965896586'),
('61255453427', 'Caio Augusto', 'Mecanico', 937, null, 'Av. Conde Boa Vista', 155, 'Boa Vista', 'Recife', 'PE', '84988587335'),
('58887376409', 'Isabelle Correia', 'Recepcionista', 937, null, 'Rua da Concordia', 69, 'São Jose', 'Recife', 'PE', '12984011888'),
('16628981428', 'Ziibiu', 'Vendedor', 937, 0.02, 'Rua Paissandú', 2411, 'Ilha do Leite', 'Recife', 'PE', '81996255500');

insert into cliente (cpf_cnpj, nome, tipo, numero, rua, bairro, cidade, estado,telefone)
values
('81468271792', 'Isumcuth', 'fisica', 107, 'Agamenon Magalhaes', 'Santo Amaro', 'Recife', 'PE', '81984784821'),
('87621357240', 'Ferfrithcwen', 'fisica', 282, 'Berlim','Santo Amaro', 'Recife', 'PE', '81945785123'),
('79733772399', 'Ciabri', 'fisica', 28, 'Campo do Onze', 'Santo Amaro', 'Recife', 'PE', '81954784123'),
('88997240838', 'Meschris', 'fisica', 171, 'Doutor Jayme da Fonte', 'Santo Amaro', 'Recife', 'PE', '81965897825'),
('25634521718', 'Orahhew', 'fisica', 230, 'Fausto Rabelo', 'Boa vista', 'Recife', 'PE', '81998567741'),
('11415667292', 'Fortinmen', 'fisica', 471, 'Rua Artur Orlando', 'Boa vista', 'Recife', 'PE', '81932659845'),
('85338122642', 'Pecon', 'fisica', 324, 'Rua Cambara', 'Boa vista', 'Recife', 'PE', '81981817897'),
('7942531210', 'Leofured', 'fisica', 86, 'Rua Bulhoes Marques', 'Boa vista', 'Recife', 'PE', '81914578891'),
('11107805244', 'Werdbur', 'fisica', 200, 'Conde da Boa Vista', 'Boa vista', 'Recife', 'PE', '81923164975' ),
('14716021769', 'Cyron', 'fisica', 267, 'Clube Nautico Capibaribe', 'Boa vista', 'Recife', 'PE', '81936497585'),
('6180705755', 'Egelea', 'fisica', 39, 'Clovis da Silveira Barros', 'Boa vista', 'Recife', 'PE', '81945213256'),
('4627083734', 'Manncrowlas', 'fisica',392,'Rua do Giriquiti', 'Boa vista', 'Recife', 'PE', '81956232211'),
('96056284573', 'Gaar', 'fisica', 331, 'Rua do Hospicio', 'Boa vista', 'Recife', 'PE', '81963003625'),
('37247613000138', 'Sereald', 'juridica', 268,'Rua Angelim', 'Janga', 'Paulista', 'PE', '81978451200'),
('45508876000181', 'Beorthceo', 'juridica', 75,'Rua Ana Preta', 'Janga', 'Paulista', 'PE', '81999696961'),
('30753354000178', 'Nieldan', 'juridica', 161,'Rua Alto do Pascoal', 'Janga', 'Paulista', 'PE', '81974411722'),
('77031778000192', 'Tolha', 'juridica', 339,'Rua Amaraji','Janga','Paulista','PE', '81987878786'),
('84527152000137', 'Mitja', 'juridica', 52, 'Rua Arco-iris', 'Janga', 'Paulista', 'PE', '81987875858'),
('24271516000139', 'Robson', 'juridica',326, 'Avenida Boa Viagem', 'Boa viagem', 'Recife', 'PE', '81987878585'),
('74135185000188', 'Rolmondkev', 'juridica', 382, 'Av. Armindo Moura', 'Boa viagem', 'Recife', 'PE', '81987875588'),
('93347685000128', 'Kacas', 'juridica',47,'Av. Beira Mar', 'Boa viagem', 'Recife', 'PE', '81987878855'),
('16211671000131', 'Sylnan', 'juridica',147,'Av. Cons Aguiar','Boa viagem','Recife','PE', '81985857788'),
('75166381000182', 'Sadra', 'juridica',32,'Av. Vinte de Janeiro', 'Boa viagem', 'Recife', 'PE', '81988557788'),
('43581675000184', 'Mithol', 'juridica',243,'Rua Afonso Rique', 'Boa viagem', 'Recife', 'PE',  '81955887788'),
('3168645000126', 'Anregin', 'juridica',55,'Rua Agenor Lopes', 'Boa viagem', 'Recife', 'PE', '8199656588' );

insert into Venda (idvenda,data,valor_total,cpf,cpf_cnpj)
values
(1,'2019-11-24',86194,'16628981428','81468271792'),
(2,'2019-11-25',71354,'16628981428','87621357240'),
(3,'2019-11-27',116179,'28980334486','79733772399'),
(4,'2019-11-28',53457,'52973805457','88997240838'),
(5,'2019-11-30',34000,'83785631464','4627083734'),
(6,'2019-12-01',67894,'52973805457','3168645000126'),
(7,'2020-12-03',141840,'83785631464','43581675000184'),
(8,'2020-12-05',38000,'28980334486','75166381000182'),
(9,'2020-12-15',112621,'28980334486','16211671000131'),
(10,'2019-12-28',110000,'16628981428','74135185000188');

insert into marca (idmarca,nome)
values
(1,'chevrolet'),
(2,'citroen'),
(3,'ford'),
(4,'honda'),
(5,'hyundai'),
(6,'jaguar'),
(7,'jeep'),
(8,'kia'),
(9,'nissan'),
(10,'peugeot'),
(11,'renault'),
(12,'mercedes bens'),
(13,'geely'),
(14,'porsche'),
(15,'mitsubishi'),
(16,'maserati'),
(17,'dogle'),
(18,'hummer'),
(19,'volvo'),
(20,'audi'),
(21,'fiat'),
(22,'volkswagen'),
(23,'toyota'),
(24,'lamborghini');

insert into modelo (idmodelo, nome, cor, ano, potencia, cambio, combustivel, idmarca) values
(1, 'camaro', 'azul', 2015,	6.2, 'automatico', 'gasolina', 1),
(2, 'aircross',	'branco', 2016,	1.6, 'automatico', 'flex', 2),
(3, 'novo fiesta', 'azul', 2016,	1.6, 'manual', 'flex', 3),
(4, 'crv', 'preto', 2016, 2.0, 'automatico', 'flex', 4),
(5, 'HB20', 'cinza', 2016, 1.0,	'manual', 'flex', 5),
(6, 'XKR', 'preto', 2014, 5.0,	'automatico', 'gasolina', 6),
(7, 'renegade',	'cinza', 2016,	1.8, 'manual',	'flex',	7),
(8, 'soul', 'cinza', 2016, 1.6, 'automatico', 'flex', 8),
(9, 'versa', 'preto', 2016, 1.0, 'manual', 'flex', 9),
(10, 'RCZ', 'azul', 2012, 1.6, 'automatico', 'gasolina', 10),
(11, 'logan', 'branco', 2016, 1.6, 'manual', 'flex', 11),
(12, 'S500', 'cinza', 2016, 4.7, 'automatico', 'gasolina', 12),
(13, 'cayene', 'personalizado', 2015, 4.8, 'automatico', 'gasolina', 14),
(14, 'EC7', 'personalizado', 2014, 1.8, 'manual', 'gasolina', 13),
(15, 'outlander', 'vermelho', 2016, 2.0, 'CVT','gasolina', 15),
(16, 'quattroporte', 'personalizado', 2016, 3.8, 'automatico', 'gasolina', 16),
(17, 'viper', 'personalizado', 2017, 8.4, 'manual', 'gasolina', 17),
(18, 'H3', 'azul', 2010, 5.3, 'automatico', 'gasolina', 18),
(19, 'XC60', 'personalizado', 2016, 2.0, 'automatico', 'gasolina', 19),
(20, 'TT', 'branco', 2016, 2.0, 'automatico', 'gasolina', 20),
(21, 'CRUZE', 'branco', 2016, 1.8, 'automatico', 'flex', 1),
(22, 'ranger', 'prata',	2016, 3.2, 'automatico', 'diesel', 3),
(23, 'tucson', 'preto', 2016, 2.0, 'automatico', 'flex', 5),
(24, 'cerato', 'verde',	2016, 1.6, 'automatico', 'flex', 8),
(25, 'santana',	'azul', 2006, 1.8, 'manual', 'gasolina', 22),
(26, 'fox','rosa', 2016, 1.6, 'manual',	'flex',	22),
(27, 'siena', 'prata', 2016, 1.4, 'manual', 'flex', 21),
(28, 'sandero',	'azul',	2016, 1.0, 'manual', 'flex', 11),
(29, 'corolla','preto', 2016, 2.0, 'CVT','flex', 23),
(30, 'onix',	'preto', 2016,	1.0, 'manual', 'flex',	1),
(31, 'ka', 'laranja', 2016, 1.0, 'manual', 'flex', 3),
(32, 'palio', 'cinza', 2016,	1.0, 'manual', 'flex',	21),
(33, 'celta', 'verde lagoon', 2014, 1.0, 'manual', 'flex', 1),
(34, 'classic',	'azul pisina',	2016, 1.0, 'manual', 'flex', 1),
(35, 'golf','amarelo', 2016, 2.0, 'automatico', 'gasolina', 22),
(36, 'gol', 'marrom', 2016, 1.6, 'manual', 'flex', 22),
(37, 'up', 'prata', 2016, 1.0, 'manual', 'flex', 22),
(38, 'uno' ,'vermelho', 2016, 1.4, 'manual', 'flex', 21),
(39, 'amarok', 'vermelho', 2016, 2.0, 'automatico', 'diesel', 22),
(40, 'duster', 'preto', 2016, 2.0, 'manual', 'flex', 11),
(41, 'civic', 'prata', 2016, 2.0, 'automatico', 'flex', 4),
(42, 'gallardo', 'preto', 2010, 5.2, 'automizato', 'gasolina', 24),
(43, 'diablo', 'cinza', 1996, 5.7, 'manual', 'gasolina', 24),
(44, 'ka', 'preto', 2016, 1.0, 'manual', 'flex', 3),
(45, 'camaro', 'vermelho', 2015, 6.2, 'automatico', 'gasolina', 1);

insert into carro (idcarro,valor,km,idmodelo)
values
(1,179950,null,1),
(2,40000,50000,2),
(3,38000,40000,3),
(4,129099,null,4),
(5,33200,25000,5),
(6,463362,null,6),
(7,59000,30000,7),
(8,75000,35000,8),
(9,35969,null,9),
(10,81747,null,10),
(11,38460,22000,11),
(12,578958,null,12),
(13,769319,null,13),
(14,39890,null,14),
(15,112621,null,15),
(16,350000,null,16),
(17,900000,null,17),
(18,240000,null,18),
(19,211877,null,19),
(20,255538,null,20),
(21,69650,42000,21),
(22,139005,null,22),
(23,57900,null,23),
(24,55000,32000,24),
(25,12000,60000,25),
(26,46194,null,26),
(27,34457,null,27),
(28,32894,null,28),
(29,87429,null,29),
(30,28750,42000,30),
(31,28000,50000,31),
(32,19000,34500,32),
(33,17000,54321,33),
(34,20000,41000,34),
(35,116554,null,35),
(36,35000,39000,36),
(37,44298,null,37),
(38,32500,28976,38),
(39,152826,null,39),
(40,55640,43000,40),
(41,70920,null,41),
(42,867150,null,42),
(43,580000,75000,43),
(44,62145,null,2),
(45,68469,null,7),
(46,38403,null,44),
(47,179950,null,45);

insert into itemvenda (quantidade,preco,idvenda,idcarro)
values
(1,40000,1,2),
(1,38460,2,11),
(1,87429,3,29),
(1,34457,4,27),
(1,17000,5,33),
(1,35000,6,36),
(1,70920,7,41),
(1,38000,8,3),
(1,112621,9,15),
(2,110000,10,24),
(2,92388,11,26),
(2,38000,12,32),
(2,305652,13,39),
(10,328940,14,28),
(5,582770,15,35),
(5,143750,16,30),
(5,221490,17,37),
(3,105000,18,36),
(3,84000,19,31),
(2,1734300,20,42),
(3,192300,21,25),
(5,192300,22,11),
(5,172285,23,27),
(3,107907,24,9),
(3,1050000,25,16),
(1,46194,1,26),
(1,32894,2,28),
(1,28750,3,30),
(1,19000,4,32),
(1,17000,5,33),
(1,32894,6,28),
(1,70920,7,41);

select modelo.nome as modelo, min(carro.valor) as menor_valor
from marca inner join modelo inner join carro
where modelo.idmarca = marca.idmarca and carro.idmodelo = modelo.idmodelo
group by modelo.nome
having min(carro.valor) < 50000
order by min(carro.valor) desc;

/* os modelos com preço o maior que 400.000*/
select modelo.nome as modelo, max(carro.valor) as maior_valor
from marca inner join modelo inner join carro
where modelo.idmarca = marca.idmarca and carro.idmodelo = modelo.idmodelo
group by modelo.nome
having max(carro.valor) > 400000
order by max(carro.valor) desc;

/* o faturamento das vendas de 2022,2021,2019,2020*/
select extract(year from venda.data) as data,sum(venda.valor_total) as total
from venda
where extract(year from venda.data) in (2022,2021,2019,2020)
group by extract(year from venda.data)
order by extract(year from venda.data) desc;

/*a quantidade de clientes que são de Recife e paulista sendo juridico*/
select cliente.cidade, count(*) as total
from cliente
where upper(cliente.tipo) = 'JURIDICA'
group by cidade
having upper(cliente.cidade) in ('RECIFE' and 'PAULISTA');

/* a quantidade de clientes que são de Recife e paulista sendo fisico*/
select cidade, count(*) as total
from cliente
where upper(tipo) = 'FISICA'
group by cidade
having upper(cidade) in ('RECIFE' and 'PAULISTA');

/* a media do salario dos funcionarios que não são vendedores*/
select avg(funcionario.salario) as media
from funcionario
where upper(funcionario.cargo) not in('VENDEDOR');

/* a quantidade de funcionarios por cargo*/
select funcionario.cargo ,count(*)
from funcionario
group by cargo
order by cargo desc;

/*os modelos que tenhao a cor azul*/
select modelo.potencia,modelo.nome as modelo,modelo.cor,modelo.ano,modelo.cambio,modelo.combustivel 
from modelo
where upper(modelo.cor) like '%PERSONALIZADO%' and ano in (2016 ,2017)
order by modelo.potencia desc;

/*os modelos que não tenham cambio manual e combustivel a gasolina*/
select modelo.potencia,modelo.nome as modelo,modelo.cor,modelo.ano,modelo.cambio,modelo.combustivel
from modelo
where upper(modelo.cambio) not like '%MANUAL%' and modelo.combustivel not like '%GASOLINA%'
order by modelo.potencia desc;

/*os carros novos*/
select modelo.ano,modelo.nome,modelo.potencia,carro.valor,carro.km
from modelo inner join carro
on carro.idmodelo = modelo.idmodelo
where carro.km is null
order by modelo.ano desc;

/*os carros semi-novos*/
select modelo.ano,modelo.nome,modelo.potencia,carro.valor,carro.km
from modelo inner join carro
on carro.idmodelo = modelo.idmodelo
where carro.km is not null
order by modelo.ano desc;

/*o total de modelos por marca*/
select marca.nome as marca , count(modelo.idmodelo) as total
from marca join modelo
on modelo.idmarca=marca.idmarca
group by marca.nome
order by marca.nome; 

/*os salarios dos vendedores*/
select funcionario.nome, sum(valor_total) * funcionario.comissao + funcionario.salario as salario_total
from funcionario join venda
on venda.cpf = funcionario.cpf
group by funcionario.cpf
order by funcionario.nome; 

