DROP DATABASE `TCC`;

CREATE DATABASE `TCC`;

USE `TCC`;

CREATE TABLE `tb_cliente` (
	`id_cliente` INT NOT NULL AUTO_INCREMENT,
	`nm_nome` varchar(45) NOT NULL,
	`ds_cpf` VARCHAR(11) NOT NULL UNIQUE,
	`ds_bairro` varchar(50) NOT NULL,
	`ds_cep` INT NOT NULL,
	`ds_rua` varchar(65) NOT NULL,
	`ds_telefone` varchar(45) NOT NULL,
	`id_animal` INT NOT NULL,
	`ds_email_cliente` VARCHAR(45) NOT NULL UNIQUE,
	`ds_senha_cliente` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);

insert into tb_cliente (nm_nome, ds_cpf, ds_bairro, ds_cep, ds_rua, ds_telefone,
 id_animal, id_funcionario, ds_email_cliente, ds_senha_cliente) 
		values ("gabriel", "4227556480", "Jd.Lucélia", 04852214, "Rua Charles Richet",
  "59762358", 1, 1, "ggfs@ggfs.com", "59762358");

select * from tb_cliente;

CREATE TABLE `tb_animal` (
	`id_animal` INT NOT NULL AUTO_INCREMENT,
	`ds_nome_animal` varchar(45) NOT NULL,
	`ds_especie` varchar(45) NOT NULL,
	`ds_pelagem` varchar(45) NOT NULL,
	`ds_porte` varchar(45) NOT NULL,
	`ds_raca` varchar(45) NOT NULL,
	`ds_cor` varchar(45) NOT NULL,
	`ds_castracao` BOOLEAN NOT NULL,
	`ds_carteira_vacinacao` varchar(45) NOT NULL,
	PRIMARY KEY (`id_animal`)
);
INSERT INTO tb_animal (ds_nome_animal, ds_especie, ds_pelagem, ds_porte, ds_raca, ds_cor, ds_castracao, ds_carteira_vacinacao)
				VALUES ("Pituxa", "canis familiaris", "Encaracolado", "Médio", "Poodle", "Branca", true, "1234564879");  

select * from tb_animal;

CREATE TABLE `tb_funcionario` (
	`id_funcionario` INT NOT NULL AUTO_INCREMENT,
	`nm_nome` varchar(45) NOT NULL,
	`ds_cpf` varchar(11) NOT NULL,
	`ds_cargo` varchar(45) NOT NULL,
	`ds_email_funcionario` varchar(45) NOT NULL UNIQUE,
	`ds_senha_funcionario` varchar(45) NOT NULL,
	`ds_data_de_nascimento` DATE NOT NULL,
	`ds_telefone` varchar(45) NOT NULL,
	`ds_rua` varchar(65) NOT NULL,
	`ds_bairro` varchar(45) NOT NULL,
	`ds_cep` INT NOT NULL,
	`nr_numero` varchar(7) NOT NULL,
	`ds_cidade` varchar(45) NOT NULL,
	`ds_estado` varchar(3) NOT NULL,
	`bt_adm` BOOLEAN NOT NULL,
	`bt_funcionario` BOOLEAN NOT NULL,
    
	PRIMARY KEY (`id_funcionario`)
);	


insert into tb_funcionario (nm_nome, ds_cpf, ds_cargo, ds_email_funcionario, ds_senha_funcionario, ds_data_de_nascimento,
 ds_telefone, ds_rua, ds_bairro, ds_cep, nr_numero, ds_cidade, ds_estado, bt_adm, bt_funcionario) 
		values ("gabriel", "42277864870", "Administrador", "admin@admin.com", "admin", "2001/10/17","11980181735", "Rua Charles Richet",
"Jd.Lucélia", 04852214, "10", "São Paulo", "SP", true, false);

select * from tb_funcionario;

CREATE TABLE `tb_fornecedor` (
	`id_fornecedor` INT NOT NULL AUTO_INCREMENT,
	`nm_nome` varchar(45) NOT NULL,
	`ds_telefone` varchar(45) NOT NULL,
	PRIMARY KEY (`id_fornecedor`)
);

CREATE TABLE `tb_produto` (
	`id_produto` INT NOT NULL AUTO_INCREMENT,
	`nm_produto` varchar(45) NOT NULL,
	`vl_preco` DECIMAL NOT NULL,
	`id_fornecedor` INT NOT NULL,
	PRIMARY KEY (`id_produto`)
);

CREATE TABLE `tb_pedido` (
	`id_pedido` INT NOT NULL AUTO_INCREMENT,
	`id_cliente` INT NOT NULL,
	`dt_venda` DATE NOT NULL,
	PRIMARY KEY (`id_pedido`)
);

CREATE TABLE `tb_pedido_item` (
	`id_pedido_item` INT NOT NULL AUTO_INCREMENT,
	`id_pedido` INT NOT NULL,
	`id_produto` INT NOT NULL,
	PRIMARY KEY (`id_pedido_item`)
);



CREATE TABLE `tb_folha_de_pagamento` (
	`id_folha_de_pagamento` INT NOT NULL AUTO_INCREMENT,	
	`ds_horas_extras` INT(20) NOT NULL,
	`ds_atrasos` INT(20) NOT NULL,
	`ds_faltas` INT(20) NOT NULL,
	`vl_inss` DECIMAL NOT NULL,
	`vl_imposto_de_renda` DECIMAL NOT NULL,	
	`vl_fgts` DECIMAL NOT NULL,	
	`func_id_funcionario` INT NOT NULL,
	PRIMARY KEY (`id_folha_de_pagamento`)
);

CREATE TABLE `tb_estoque` (
	`id_estoque` INT NOT NULL AUTO_INCREMENT,
	`qt_produto` varchar(10) NOT NULL,
	`vl_custo_atual` DECIMAL NOT NULL,
	`vl_custo_total` DECIMAL NOT NULL,
	`Produto_id_produto` INT NOT NULL,
	PRIMARY KEY (`id_estoque`)
);

CREATE TABLE `tb_fluxo_de_caixa` (
	`id_fluxo_de_caixa` INT NOT NULL AUTO_INCREMENT,
	`ds_descricao` INT NOT NULL,
	`ds_valor` DECIMAL NOT NULL,
	`ds_saldo_atual` DECIMAL NOT NULL,
	`vl_saldo_dia` DECIMAL NOT NULL,
	`vl_subtotal` DECIMAL NOT NULL,
	`id_pedido` INT NOT NULL,
	PRIMARY KEY (`id_fluxo_de_caixa`)
);

CREATE TABLE `tb_login` (
	`id_login` INT NOT NULL AUTO_INCREMENT,
	`fucionario_id_funcionario` INT NOT NULL,
	`cliente_id_cliente` INT NOT NULL,
	PRIMARY KEY (`id_login`)
);
ALTER TABLE `tb_cliente` ADD CONSTRAINT `tb_cliente_fk0` FOREIGN KEY (`id_animal`) REFERENCES `tb_animal`(`id_animal`);


SELECT * FROM tb_login;


insert into tb_login (fucionario_id_funcionario, cliente_id_cliente) values(1, 1);

CREATE TABLE `tb_Folha_Funcionario` (
	`id_folha` INT NOT NULL AUTO_INCREMENT,
	`pagm_id_folha_de_pagamento` INT NOT NULL,
	`func_id_funcionario` INT NOT NULL,
	PRIMARY KEY (`id_folha`)
);

drop table tb_usuario;
		
CREATE TABLE `tb_usuario` (
	`id_usuario` INT NOT NULL AUTO_INCREMENT,
	`nm_usuario` varchar(45) NOT NULL,
	`ds_cpf` varchar(15) NOT NULL,
	`ds_telefone` varchar(45) NOT NULL,
	`ds_celular` varchar(45),
	`ds_email_usuario` varchar(45) NOT NULL UNIQUE,
	`ds_senha_usuario` varchar(45) NOT NULL,
    `bt_adm` BOOLEAN NOT NULL,
	`bt_funcionario` BOOLEAN NOT NULL,
	PRIMARY KEY (`id_usuario`)
);

select * from tb_usuario;

ALTER TABLE `tb_cliente` ADD CONSTRAINT `tb_cliente_fk0` FOREIGN KEY (`id_animal`) REFERENCES `tb_animal`(`id_animal`);


ALTER TABLE `tb_produto` ADD CONSTRAINT `tb_produto_fk0` FOREIGN KEY (`id_fornecedor`) REFERENCES `tb_fornecedor`(`id_fornecedor`);

ALTER TABLE `tb_pedido` ADD CONSTRAINT `tb_pedido_fk0` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente`(`id_cliente`);

ALTER TABLE `tb_pedido_item` ADD CONSTRAINT `tb_pedido_item_fk0` FOREIGN KEY (`id_pedido`) REFERENCES `tb_pedido`(`id_pedido`);

ALTER TABLE `tb_pedido_item` ADD CONSTRAINT `tb_pedido_item_fk1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto`(`id_produto`);

ALTER TABLE `tb_folha_de_pagamento` ADD CONSTRAINT `tb_folha_de_pagamento_fk0` FOREIGN KEY (`func_id_funcionario`) REFERENCES `tb_funcionario`(`id_funcionario`);

ALTER TABLE `tb_estoque` ADD CONSTRAINT `tb_estoque_fk0` FOREIGN KEY (`Produto_id_produto`) REFERENCES `tb_produto`(`id_produto`);

ALTER TABLE `tb_fluxo_de_caixa` ADD CONSTRAINT `tb_fluxo_de_caixa_fk0` FOREIGN KEY (`id_pedido`) REFERENCES `tb_pedido`(`id_pedido`);

ALTER TABLE `tb_login` ADD CONSTRAINT `tb_login_fk0` FOREIGN KEY (`fucionario_id_funcionario`) REFERENCES `tb_funcionario`(`id_funcionario`);

ALTER TABLE `tb_login` ADD CONSTRAINT `tb_login_fk1` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `tb_cliente`(`id_cliente`);

ALTER TABLE `tb_Folha_Funcionario` ADD CONSTRAINT `tb_Folha_Funcionario_fk0` FOREIGN KEY (`pagm_id_folha_de_pagamento`) REFERENCES `tb_folha_de_pagamento`(`id_folha_de_pagamento`);

ALTER TABLE `tb_Folha_Funcionario` ADD CONSTRAINT `tb_Folha_Funcionario_fk1` FOREIGN KEY (`func_id_funcionario`) REFERENCES `tb_funcionario`(`id_funcionario`);

drop view VW_CONSULTAR_LOGIN;
CREATE VIEW VW_CONSULTAR_LOGIN AS
	SELECT 	tb_login.id_login,
			tb_funcionario.id_funcionario,
            tb_funcionario.ds_email_funcionario,
            tb_funcionario.ds_senha_funcionario,
            tb_funcionario.bt_adm,
            tb_funcionario.bt_funcionario,
            tb_cliente.id_cliente,
            tb_cliente.ds_email_cliente,
            tb_cliente.ds_senha_cliente
	   FROM tb_login
       join tb_funcionario
         on	tb_login.fucionario_id_funcionario
	   join	tb_cliente
         on tb_login.cliente_id_cliente;
         
         select * from VW_CONSULTAR_LOGIN;
         
         CREATE VIEW VW_VER_LOGIN AS
	SELECT 	tb_login.id_login,
			tb_funcionario.id_funcionario,
            tb_funcionario.ds_email_funcionario,
            tb_funcionario.ds_senha_funcionario,
            tb_cliente.id_cliente,
            tb_cliente.ds_email_cliente,
            tb_cliente.ds_senha_cliente
	   FROM tb_login
       join tb_funcionario
         on	tb_login.fucionario_id_funcionario
	   join	tb_cliente
         on tb_login.cliente_id_cliente;
         
         select * from VW_VER_LOGIN;