CREATE DATABASE fifa23;

USE fifa23;

#Tabela Usuários

CREATE TABLE tb_usuarios(
    id CHAR(4) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(16) NOT NULL,
    tipo VARCHAR(10) NOT NULL
);

# Tabela Uniforme

CREATE TABLE tb_uniforme(
    id CHAR(6) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    img VARCHAR(2083) NOT NULL
);

# Tabela Associativa Votação

CREATE TABLE tb_votacao(
    id CHAR(4) PRIMARY KEY NOT NULL,
    id_usuario CHAR(6) NOT NULL,
    id_uniforme CHAR(6) NOT NULL,
    data_votacao DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES tb_usuarios(id),
    FOREIGN KEY (id_uniforme) REFERENCES tb_uniforme(id)
);

# Tabela Bebidas

CREATE TABLE tb_bebida(
    id CHAR(6) PRIMARY KEY NOT NULL,
    nome CHAR(50) NOT NULL,
    preco FLOAT NOT NULL
);

# Tabela Alimentos

CREATE TABLE tb_alimento(
    id CHAR(6) PRIMARY KEY NOT NULL,
    nome CHAR(50) NOT NULL,
    preco FLOAT NOT NULL
);

# Tabela Ingressos

CREATE TABLE tb_ingresso(
    id CHAR(6) PRIMARY KEY NOT NULL,
    nome CHAR(150) NOT NULL,
    preco FLOAT NOT NULL,
    id_competicao CHAR(6) NOT NULL,
    FOREIGN KEY (id_competicao) REFERENCES tb_competicao(id)
);

# Tabela Competicao

CREATE TABLE tb_competicao(
    id CHAR(6) PRIMARY KEY NOT NULL,
    nome CHAR(150) NOT NULL,
    data DATE NOT NULL
);

#Tabela Competidor

CREATE TABLE tb_competidor(
    id CHAR(6) PRIMARY KEY NOT NULL,
    nome VARCHAR(150) NOT NULL,
    pais VARCHAR(150) NOT NULL,
    equipe VARCHAR(150) NOT NULL,
    id_competicao CHAR(6) NOT NULL,
    FOREIGN KEY (id_competicao) REFERENCES tb_competicao(id)
);

# Tabela Associativa Compra

CREATE TABLE tb_compra(
    id CHAR(6) PRIMARY KEY NOT NULL,
    id_usuario CHAR(6) NOT NULL,
    id_bebida CHAR(6) NOT NULL,
    id_alimento CHAR(6) NOT NULL,
    id_ingresso CHAR(6) NOT NULL,
    preco FLOAT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES tb_usuarios(id),
    FOREIGN KEY (id_bebida) REFERENCES tb_bebida(id),
    FOREIGN KEY (id_alimento) REFERENCES tb_alimento(id),
    FOREIGN KEY (id_ingresso) REFERENCES tb_ingresso(id)
);

# Inserindo dados na Tabela Usuários

INSERT INTO tb_usuarios (id, nome, email, senha, tipo) VALUES
('U001', 'João Silva', 'joao.silva@gmail.com', '123456', 'admin'),
('U002', 'Maria Santos', 'maria.santos@yahoo.com', '654321', 'user'),
('U003', 'Pedro Costa', 'pedro.costa@hotmail.com', '789012', 'user'),
('U004', 'Ana Lima', 'ana.lima@outlook.com', '210987', 'user'),
('U005', 'Carlos Souza', 'carlos.souza@bing.com', '345678', 'admin');

# Inserindo dados na Tabela Uniformes

INSERT INTO tb_uniforme (id, nome, pais, img) VALUES
('UNI001', 'Camisa da Seleção Brasileira', 'Brasil', 'https://bit.ly/3FJZ8xw'),
('UNI002', 'Camisa da Seleção Espanhola', 'Espanha', 'https://bit.ly/3FJZ8xw'),
('UNI003', 'Camisa da Seleção Francesa', 'França', 'https://bit.ly/3FJZ8xw'),
('UNI004', 'Camisa da Seleção Inglesa', 'Inglaterra', 'https://bit.ly/3FJZ8xw'),
('UNI005', 'Camisa da Seleção Argentina', 'Argentina', 'https://bit.ly/3FJZ8xw');

# Inserindo dados na Tabela Votação

INSERT INTO tb_votacao (id, id_usuario, id_uniforme, data_votacao) VALUES
('V002', 'U002', 'UNI003', '2023-07-31'),
('V003', 'U003', 'UNI002', '2023-07-31'),
('V004', 'U004', 'UNI004', '2023-07-31'),
('V008', 'U002', 'UNI001', '2023-07-31'),
('V009', 'U002', 'UNI004', '2023-07-31'),
('V010', 'U003', 'UNI001', '2023-07-31'),
('V011', 'U003', 'UNI005', '2023-07-31'),
('V012', 'U004', 'UNI002', '2023-07-31'),
('V013', 'U004', 'UNI003', '2023-07-31'),
('V018', 'U002', 'UNI002', '2023-07-31'),
('V019', 'U002', 'UNI005', '2023-07-31'),
('V020', 'U003', 'UNI002', '2023-07-31'),
('V021', 'U003', 'UNI003', '2023-07-31'),
('V022', 'U004', 'UNI001', '2023-07-31'),
('V023', 'U004', 'UNI005', '2023-07-31');

# Ordenando o Raking dos uniformes mais votados

SELECT id_uniforme, COUNT(*) AS votos FROM tb_votacao GROUP BY id_uniforme ORDER BY votos DESC;

# Inserindo dados na Tabela Bebida

INSERT INTO tb_bebida (id, nome, preco) VALUES
('BEB001', 'Coca-Cola', 3.50),
('BEB002', 'Fanta', 3.00),
('BEB003', 'Guaraná', 2.50),
('BEB004', 'Água Mineral', 1.50),
('BEB005', 'Suco de Laranja', 4.00);

# Inserindo dados na Tabela Alimento

INSERT INTO tb_alimento (id, nome, preco) VALUES
('ALI001', 'Pizza', 25.00),
('ALI002', 'Hambúrguer', 15.00),
('ALI003', 'Salada', 10.00),
('ALI004', 'Sushi', 30.00),
('ALI005', 'Sanduíche', 12.00);

# Inserindo dados na Tabela Competicao

INSERT INTO tb_competicao (id, nome, data) VALUES
('CAO001', 'Brasil vs Argentina', '2023-05-01'),
('CAO002', 'França vs Alemanha', '2023-06-15'),
('CAO003', 'Colômbia vs Chile', '2023-07-01'),
('CAO004', 'Espanha vs Inglaterra', '2023-09-01'),
('CAO005', 'Itália vs Portugal', '2023-12-01');

# Inserindo dados na Tabela Competidor

INSERT INTO tb_competidor (id, nome, pais, equipe, id_competicao) VALUES
('DOR001', 'Neymar', 'Brasil', 'Seleção Brasileira', 'CAO001'),
('DOR002', 'Messi', 'Argentina', 'Seleção Argentina', 'CAO001'),
('DOR003', 'Mbappé', 'França', 'Seleção Francesa', 'CAO002'),
('DOR004', 'Kroos', 'Alemanha', 'Seleção Alemã', 'CAO002'),
('DOR005', 'James Rodríguez', 'Colômbia', 'Seleção Colombiana', 'CAO003'),
('DOR006', 'Alexis Sánchez', 'Chile', 'Seleção Chilena', 'CAO003'),
('DOR007', 'Sergio Ramos', 'Espanha', 'Seleção Espanhola', 'CAO004'),
('DOR008', 'Harry Kane', 'Inglaterra', 'Seleção Inglesa', 'CAO004'),
('DOR009', 'Chiellini', 'Itália', 'Seleção Italiana', 'CAO005'),
('DOR010', 'Cristiano Ronaldo', 'Portugal', 'Seleção Portuguesa', 'CAO005');

# Inserindo dados na Tabela Ingresso

INSERT INTO tb_ingresso (id, nome, preco, id_competicao) VALUES
('ING001', 'Ingresso VIP', 500.00, 'CAO001'),
('ING002', 'Ingresso Arquibancada', 100.00, 'CAO001'),
('ING003', 'Ingresso VIP', 600.00, 'CAO002'),
('ING004', 'Ingresso Arquibancada', 120.00, 'CAO002'),
('ING005', 'Ingresso VIP', 400.00, 'CAO003'),
('ING006', 'Ingresso Arquibancada', 80.00, 'CAO003'),
('ING007', 'Ingresso VIP', 700.00, 'CAO004'),
('ING008', 'Ingresso Arquibancada', 140.00, 'CAO004'),
('ING009', 'Ingresso VIP', 800.00, 'CAO005'),
('ING010', 'Ingresso Arquibancada', 160.00, 'CAO005');

# Inserindo dados na Tabele Compra

INSERT INTO tb_compra (id, id_usuario, id_bebida, id_alimento, id_ingresso, preco) VALUES
('COM001', 'U001', 'BEB001', 'ALI001', 'ING001', 553.50),
('COM002', 'U002', 'BEB002', 'ALI002', 'ING002', 118.00),
('COM003', 'U003', 'BEB003', 'ALI003', 'ING003', 632.50),
('COM004', 'U004', 'BEB004', 'ALI004', 'ING004', 731.50),
('COM005', 'U005', 'BEB005', 'ALI005', 'ING005', 416.00),
('COM006', 'U001', 'BEB002', 'ALI002', 'ING006', 98.00);
