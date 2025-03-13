-- Criar tabelas
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso VARCHAR(100)
);

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    saldo FLOAT
);

CREATE TABLE compras (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto VARCHAR(100),
    valor FLOAT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserir dados na tabela alunos
INSERT INTO alunos (id, nome, idade, curso) VALUES
(1, 'Joao Silva', 22, 'Engenharia'),
(2, 'Maria Oliveira', 19, 'Medicina'),
(3, 'Carlos Souza', 25, 'Engenharia'),
(4, 'Ana Costa', 20, 'Direito'),
(5, 'Pedro Rocha', 23, 'Engenharia');

-- Inserir dados na tabela clientes
INSERT INTO clientes (id, nome, idade, saldo) VALUES
(1, 'Fernanda Lima', 35, 1500.50),
(2, 'Ricardo Santos', 28, 800.75),
(3, 'Juliana Pereira', 42, 2300.00),
(4, 'Marcos Oliveira', 31, 500.00);

-- Inserir dados na tabela compras
INSERT INTO compras (id, cliente_id, produto, valor) VALUES
(1, 1, 'Notebook', 2500.00),
(2, 3, 'Smartphone', 1200.00),
(3, 1, 'Tablet', 800.00);

-- Consultas
-- 1. Selecionar todos os alunos
SELECT * FROM alunos;

-- 2. Selecionar nome e idade dos alunos com mais de 20 anos
SELECT nome, idade FROM alunos WHERE idade > 20;

-- 3. Selecionar alunos do curso de Engenharia em ordem alfabetica
SELECT * FROM alunos WHERE curso = 'Engenharia' ORDER BY nome ASC;

-- 4. Contar o numero total de alunos
SELECT COUNT(*) AS total_alunos FROM alunos;

-- 5. Selecionar nome e idade dos clientes com mais de 30 anos
SELECT nome, idade FROM clientes WHERE idade > 30;

-- 6. Calcular o saldo medio dos clientes
SELECT AVG(saldo) AS saldo_medio FROM clientes;

-- 7. Encontrar o cliente com o saldo maximo
SELECT nome, saldo FROM clientes ORDER BY saldo DESC LIMIT 1;

-- 8. Contar clientes com saldo acima de 1000
SELECT COUNT(*) AS clientes_saldo_alto FROM clientes WHERE saldo > 1000;

-- 9. Exibir nome do cliente, produto e valor de cada compra
SELECT c.nome, co.produto, co.valor
FROM clientes c
JOIN compras co ON c.id = co.cliente_id;