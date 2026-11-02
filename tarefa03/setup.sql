-- Reinicialização do Banco de Dados
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE biblioteca;

-- Estrutura DDL
CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  pais VARCHAR(50),
  ano_nascimento INT
);

CREATE TABLE livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  ano_publicacao INT,
  preco DECIMAL(10,2),
  autor_id INT,
  FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE emprestimos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  livro_id INT,
  data_emprestimo DATE,
  devolvido BOOLEAN,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Gerenciamento de Usuários
DROP USER IF EXISTS 'app_biblioteca'@'%';
DROP USER IF EXISTS 'consulta'@'%';
DROP USER IF EXISTS 'relatorios'@'%';

CREATE USER 'app_biblioteca'@'%' IDENTIFIED BY 'AppBib2026!';
GRANT SELECT, INSERT, UPDATE, DELETE ON biblioteca.* TO 'app_biblioteca'@'%';

CREATE USER 'consulta'@'%' IDENTIFIED BY 'Consulta2026!';
GRANT SELECT ON biblioteca.* TO 'consulta'@'%';

CREATE USER 'relatorios'@'%' IDENTIFIED BY 'Relatorios2026!';
GRANT SELECT ON biblioteca.livros TO 'relatorios'@'%';

FLUSH PRIVILEGES;

-- Carga Inicial de Dados (DML)
INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('Machado de Assis', 'Brasil', 1839),
('Clarice Lispector', 'Brasil', 1920),
('Gabriel García Márquez', 'Colômbia', 1927),
('Jane Austen', 'Inglaterra', 1775);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Dom Casmurro', 1899, 39.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
('A Hora da Estrela', 1977, 32.50, 2),
('Cem Anos de Solidão', 1967, 59.90, 3),
('Orgulho e Preconceito', 1813, 29.90, 4);

INSERT INTO emprestimos (livro_id, data_emprestimo, devolvido) VALUES
(1, '2026-03-01', FALSE),
(2, '2026-03-02', FALSE),
(3, '2026-02-15', TRUE);
