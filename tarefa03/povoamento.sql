USE biblioteca;


INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('George Orwell', 'Reino Unido', 1903),
('J.R.R. Tolkien', 'Reino Unido', 1892),
('Franz Kafka', 'República Tcheca', 1883),
('Virginia Woolf', 'Reino Unido', 1882),
('Fyodor Dostoevsky', 'Rússia', 1821),
('Haruki Murakami', 'Japão', 1949),
('Isabel Allende', 'Chile', 1942),
('Gabriel García Márquez', 'Colômbia', 1927),
('Jorge Luis Borges', 'Argentina', 1899),
('Lygia Fagundes Telles', 'Brasil', 1923);


INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('1984', 1949, 42.90, 5),
('A Revolução dos Bichos', 1945, 29.90, 5),
('O Hobbit', 1937, 59.90, 6),
('O Senhor dos Anéis: A Sociedade do Anel', 1954, 69.90, 6),
('A Metamorfose', 1915, 25.00, 7),
('O Processo', 1925, 34.90, 7),
('Mrs. Dalloway', 1925, 38.00, 8),
('Ao Farol', 1927, 36.50, 8),
('Crime e Castigo', 1866, 54.90, 9),
('Os Irmãos Karamázov', 1880, 64.90, 9),
('Kafka à Beira-Mar', 2002, 48.00, 10),
('Norwegian Wood', 1987, 44.90, 10),
('A Casa dos Espíritos', 1982, 52.00, 11),
('Ficções', 1944, 39.90, 13),
('O Aleph', 1949, 35.00, 13),
('As Meninas', 1973, 31.90, 14),
('Ciranda de Pedra', 1954, 28.50, 14),
('O Postino de Neruda', 1985, 27.90, 11),
('O Amor nos Tempos do Cólera', 1985, 49.90, 3),
('O General em Seu Labirinto', 1989, 41.00, 3),
('Razão e Sensibilidade', 1811, 33.90, 4),
('Persuasão', 1817, 31.00, 4),
('Quincas Borba', 1891, 37.50, 1),
('Esaú e Jacó', 1904, 39.00, 1),
('Laços de Família', 1960, 33.00, 2);
