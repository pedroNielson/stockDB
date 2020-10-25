-- Table: tb_casa
CREATE TABLE tb_casa (
    casa_id serial  NOT NULL,
    casa_nome varchar(100)  NOT NULL,
    casa_cep char(8)  NOT NULL,
    casa_rua varchar(100)  NOT NULL,
    casa_bairro varchar(50)  NOT NULL,
    casa_numero int  NOT NULL,
    casa_complemento varchar(100)  NOT NULL,
    casa_cidade varchar(50)  NOT NULL,
    casa_estado char(2)  NOT NULL,
    CONSTRAINT tb_casa_pk PRIMARY KEY (casa_id)
);

-- Table: tb_categoria
CREATE TABLE tb_categoria (
    categoria_id serial  NOT NULL,
    categoria_nome varchar(100)  NOT NULL,
    categoria_descricao text  NOT NULL,
    CONSTRAINT tb_categoria_pk PRIMARY KEY (categoria_id)
);

-- Table: tb_compras
CREATE TABLE tb_compras (
    compras_id serial  NOT NULL,
    compras_data date  NOT NULL,
    compras_valor money  NOT NULL,
    tb_casa_casa_id int  NOT NULL,
	foreign key (tb_casa_casa_id) references tb_casa (casa_id),
    CONSTRAINT tb_compras_pk PRIMARY KEY (compras_id)
);

-- Table: tb_comprovante
CREATE TABLE tb_comprovante (
    comprovante_id serial  NOT NULL,
    comprovante_linkImagem varchar(250)  NOT NULL,
    comprovante_descricao text  NOT NULL,
    tb_compras_compras_id int  NOT NULL,
	foreign key (tb_compras_compras_id) references tb_compras (compras_id),
    CONSTRAINT tb_comprovante_pk PRIMARY KEY (comprovante_id)
);

-- Table: tb_estoque
CREATE TABLE tb_estoque (
    estoque_id serial  NOT NULL,
    tb_casa_casa_id int  NOT NULL,
	foreign key (tb_casa_casa_id) references tb_casa (casa_id),
    CONSTRAINT tb_estoque_pk PRIMARY KEY (estoque_id)
);

-- Table: tb_medidas
CREATE TABLE tb_medidas (
    medidas_id serial  NOT NULL,
    medidas_unidades_medidas varchar(150)  NOT NULL,
    medidas_descricao text  NOT NULL,
    CONSTRAINT tb_medidas_pk PRIMARY KEY (medidas_id)
);
-- Table: tb_item
CREATE TABLE tb_item (
    item_id serial  NOT NULL,
    item_nome varchar(100)  NOT NULL,
    item_qnt_ideal int  NOT NULL,
	item_qnt_atual int NOT NULL,
    item_descricao text  NOT NULL,
    item_perecivel boolean  NOT NULL,
    item_validade date  NOT NULL,
	item_data_entrada date NOT NULL,
	item_data_saida date NOT NULL,
	item_local_guardado varchar(250) NOT NULL,
    tb_estoque_estoque_id int  NOT NULL,
    tb_categoria_categoria_id int  NOT NULL,
    tb_medidas_medidas_id int  NOT NULL,
	
	foreign key (tb_estoque_estoque_id) references tb_estoque (estoque_id),
	foreign key (tb_categoria_categoria_id) references tb_categoria (categoria_id),
	foreign key (tb_medidas_medidas_id) references tb_medidas (medidas_id),
    CONSTRAINT tb_item_pk PRIMARY KEY (item_id)
);



-- Table: tb_moradores
CREATE TABLE tb_moradores (
    moradores_id serial  NOT NULL,
    moradores_nome varchar(250)  NOT NULL,
    moradores_apelido varchar(100)  NOT NULL,
    moradores_email varchar(100)  NOT NULL,
    moradores_senha varchar(100)  NOT NULL,
    tb_casa_casa_id int  NOT NULL,
	foreign key (tb_casa_casa_id) references tb_casa (casa_id),
    CONSTRAINT tb_moradores_pk PRIMARY KEY (moradores_id)
);

-- foreign keys
-- Reference: tb_compras_tb_casa (table: tb_compras)
ALTER TABLE tb_compras ADD CONSTRAINT tb_compras_tb_casa
    FOREIGN KEY (tb_casa_casa_id)
    REFERENCES tb_casa (casa_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tb_comprovante_tb_compras (table: tb_comprovante)
ALTER TABLE tb_comprovante ADD CONSTRAINT tb_comprovante_tb_compras
    FOREIGN KEY (tb_compras_compras_id)
    REFERENCES tb_compras (compras_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tb_estoque_tb_casa (table: tb_estoque)
ALTER TABLE tb_estoque ADD CONSTRAINT tb_estoque_tb_casa
    FOREIGN KEY (tb_casa_casa_id)
    REFERENCES tb_casa (casa_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tb_item_tb_categoria (table: tb_item)
ALTER TABLE tb_item ADD CONSTRAINT tb_item_tb_categoria
    FOREIGN KEY (tb_categoria_categoria_id)
    REFERENCES tb_categoria (categoria_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tb_item_tb_estoque (table: tb_item)
ALTER TABLE tb_item ADD CONSTRAINT tb_item_tb_estoque
    FOREIGN KEY (tb_estoque_estoque_id)
    REFERENCES tb_estoque (estoque_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tb_item_tb_medidas (table: tb_item)
ALTER TABLE tb_item ADD CONSTRAINT tb_item_tb_medidas
    FOREIGN KEY (tb_medidas_medidas_id)
    REFERENCES tb_medidas (medidas_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tb_moradores_tb_casa (table: tb_moradores)
ALTER TABLE tb_moradores ADD CONSTRAINT tb_moradores_tb_casa
    FOREIGN KEY (tb_casa_casa_id)
    REFERENCES tb_casa (casa_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.