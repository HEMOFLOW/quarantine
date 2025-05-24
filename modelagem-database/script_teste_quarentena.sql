
-- Usar o banco
USE quarentena;

-- Inserindo pessoas
INSERT INTO Pessoa (id_pessoa, nome, cpf, contato) VALUES
(1, 'João Silva', '123.456.789-00', 'joao@email.com'),
(2, 'Maria Souza', '987.654.321-00', 'maria@email.com');

-- Inserindo doadores (herdando de Pessoa)
INSERT INTO Doador (id_doador, tipo, ativo) VALUES
(1, 'O+', TRUE),
(2, 'A-', FALSE);

-- Inserindo regras
INSERT INTO Regra (id_regra, condicao, dias_quarentena) VALUES
(1, 'Tatuagem', 30),
(2, 'Cirurgia Dentária', 7);

-- Inserindo quarentenas
INSERT INTO Quarentena (id_quarentena, data_inicio, data_fim, id_doador, id_regra) VALUES
(1, '2025-05-01', '2025-05-31', 1, 1),
(2, '2025-05-15', '2025-05-22', 2, 2);

-- Inserindo agendamentos
INSERT INTO Agendamento (id_agendamento, data, hora, tipo, id_doador) VALUES
(1, '2025-06-01', '09:00:00', 'Doação', 1),
(2, '2025-06-05', '10:30:00', 'Revisão', 2);

-- Consultas de teste
-- Verificar todos os doadores e suas quarentenas
SELECT d.id_doador, p.nome, q.data_inicio, q.data_fim, r.condicao
FROM Doador d
JOIN Pessoa p ON d.id_doador = p.id_pessoa
LEFT JOIN Quarentena q ON d.id_doador = q.id_doador
LEFT JOIN Regra r ON q.id_regra = r.id_regra;

-- Verificar doadores liberados hoje (simulando que hoje é 2025-05-31)
SELECT p.nome, q.data_fim
FROM Quarentena q
JOIN Doador d ON q.id_doador = d.id_doador
JOIN Pessoa p ON d.id_doador = p.id_pessoa
WHERE q.data_fim = '2025-05-31';

-- Histórico completo de quarentenas por doador
SELECT p.nome, r.condicao, q.data_inicio, q.data_fim
FROM Quarentena q
JOIN Regra r ON q.id_regra = r.id_regra
JOIN Doador d ON q.id_doador = d.id_doador
JOIN Pessoa p ON d.id_doador = p.id_pessoa
ORDER BY p.nome, q.data_inicio;
