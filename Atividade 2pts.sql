/*Gabriel Silva de Sousa, Matricula: 202118748*/




CREATE DATABASE empresa_recrutamento;

USE empresa_recrutamento;

CREATE TABLE candidatos (
    id_candidato INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    habilidades VARCHAR(500),
    nivel_habilidade ENUM('básico', 'intermediário', 'avançado'),
    disponibilidade ENUM('integral', 'parcial'),
    pretensao_salarial DECIMAL(9,2),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE empresas (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    ramo_atividade VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vagas (
    id_vaga INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    habilidades_necessarias text,
    nivel_habilidade ENUM('iniciante', 'medio', 'avançado'),
    tipo_contrato ENUM('CLT', 'PJ'),
    salarial decimal(10,2),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_expiracao TIMESTAMP NOT NULL
);

CREATE TABLE processos_seletivos (
    id_processo INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT NOT NULL,
    id_vaga INT NOT NULL,
    id_candidato INT NOT NULL,
    status ENUM('em_andamento', 'finalizado', 'cancelado'),
    data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_fim TIMESTAMP,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_vaga) REFERENCES vagas(id_vaga),
    FOREIGN KEY (id_candidato) REFERENCES candidatos(id_candidato)
);
INSERT INTO candidatos (nome_completo, email, telefone, endereco, habilidades, nivel_habilidade, disponibilidade, pretensao_salarial) VALUES
('João Silva', 'joao.silva@gmail.com', '(11) 9999-9999', 'Rua das Flores, 123', 'Java, Python, SQL', 'avançado', 'parcial', 5000.00),
('Maria Santos', 'maria.santos@yahoo.com', '(21) 8888-8888', 'Avenida Paulista, 456', 'HTML, CSS, JavaScript', 'intermediário', 'integral', 7000.00),
('Pedro Alves', 'pedro.alves@hotmail.com', '(31) 7777-7777', 'Rua da Praia, 789', 'C#, .NET, SQL Server', 'intermediário', 'parcial', 8000.00),
('Ana Fernandes', 'Ana.fernandes@gmail.com', '(11) 6666-6666', 'Rua das Árvores, 321', 'Python, Django, Flask', 'avançado', 'integral', 6000.00),
('Lucas Oliveira', 'lucas.oliveira@gmail.com', '(21) 5555-5555', 'Rua dos Macacos, 456', 'C#, React, SQL Server.js', 'avançado', 'parcial', 8000.00),
('Chico Bento', 'chico.bento@gmail.com', '(21) 6666-6666', 'Rua dos Ovinis, 456', 'JavaScript, React, Java', 'básico', 'parcial', 6000.00),
('Mano Brown', 'mano.brown@gmail.com', '(21) 7777-7777', 'Rua dos Aviões, 456', 'SQL Server, React, Node.js', 'intermediário', 'integral', 7000.00),
('Carlos Oliveira', 'carlos.oliveira@gmail.com', '(21) 8888-8888', 'Rua dos Alemão, 456', 'JavaScript, Python, Java', 'básico', 'parcial', 9000.00),
('Jeferson Carretinha', 'jeferson.carretinha@gmail.com', '(21) 9999-9999', 'Rua dos Pinheiros, 456', '.NET, React, Java', 'intermediário', 'integral', 7000.00),
('Magaiver Andaimes', 'magaiver.andaimes@gmail.com', '(21) 0000-0000', 'Rua dos Arbustos, 456', 'JavaScript, React, Node.js', 'avançado', 'parcial', 6000.00);


INSERT INTO empresas (nome_empresa, cnpj, email, telefone, endereco, ramo_atividade) VALUES
('Empresa A', '12345678901234', 'contato@empresaA.com.br', '(11) 1111-1111', 'Rua da Empresa A, 123', 'Tecnologia'),
('Empresa B', '23456789012345', 'contato@empresaB.com.br', '(21) 1222-2222', 'Rua da Empresa B, 456', 'Comércio'),
('Empresa C', '34567890123456', 'contato@empresaC.com.br', '(31) 1333-3333', 'Rua da Empresa C, 789', 'Indústria'),
('Empresa D', '14345678901234', 'contato@empresaD.com.br', '(11) 1444-4444', 'Rua da Empresa A, 123', 'Tecnologia'),
('Empresa E', '25456789012345', 'contato@empresaE.com.br', '(21) 1555-5555', 'Rua da Empresa B, 456', 'Comércio'),
('Empresa F', '36567890123456', 'contato@empresaF.com.br', '(31) 1666-6666', 'Rua da Empresa C, 789', 'Indústria'),
('Empresa G', '17345678901234', 'contato@empresaG.com.br', '(11) 1777-7777', 'Rua da Empresa A, 123', 'Tecnologia'),
('Empresa H', '28456789012345', 'contato@empresaH.com.br', '(21) 1888-8888', 'Rua da Empresa B, 456', 'Comércio'),
('Empresa I', '39567890123456', 'contato@empresaI.com.br', '(31) 1999-9999', 'Rua da Empresa C, 789', 'Indústria'),
('Empresa J', '30567890123456', 'contato@empresaJ.com.br', '(31) 1000-0000', 'Rua da Empresa C, 789', 'Indústria');


INSERT INTO vagas (titulo, descricao, habilidades_necessarias, nivel_habilidade, tipo_contrato, salarial, data_expiracao) VALUES
('Desenvolvedor Full Stack', 'Vaga para desenvolvedor full stack com experiência em tecnologias web', 'HTML, CSS, JavaScript, Node.js, React', 'avançado', 'PJ', 10000.00, '2023-04-30'),
('Analista de Marketing', 'Vaga para analista de marketing com foco em mídias sociais', 'Marketing Digital, Google Ads, Facebook Ads', 'medio', 'CLT', 7000.00, '2023-05-15'),
('Gerente de Projetos', 'Vaga para gerente de projetos com experiência em gestão de equipes', 'Gerenciamento de Projetos, Scrum, Kanban', 'avançado', 'CLT', 1000.00, '2023-04-21'),
('Desenvolvedor Full Stack', 'Vaga para desenvolvedor full stack SEM experiência em tecnologias web', 'HTML, CSS, JavaScript, Node.js, React', 'iniciante', 'PJ', 9000.00, '2023-04-30'),
('Analista de Marketing', 'Vaga para analista de marketing com foco em administração de redes', 'Marketing Digital, Google Ads, Facebook Ads', 'iniciante', 'CLT', 7000.00, '2023-05-17'),
('Gerente de Projetos Trainee', 'Vaga Trainee para gerente de projetos SEM experiência em gestão de equipes', 'Gerenciamento de Projetos, Scrum, Kanban', 'avançado', 'CLT', 12000.00, '2023-04-25'),
('Desenvolvedor Back end', 'Vaga para desenvolvedor Back end com experiência em tecnologias web', 'JavaScript, Node.js, React', 'avançado', 'PJ', 2000.00, '2023-04-23'),
('Marketeiro', 'Vaga para estagio de marketing com foco em mídias sociais sem experiencia', 'Marketing Digital, Google Ads, Facebook Ads', 'medio', 'CLT', 7000.00, '2023-05-19'),
('Professor', 'Vaga para professor sem experiencia', 'Gerenciamento de Projetos, Scrum, Kanban', 'avançado', 'CLT', 12000.00, '2023-04-25'),
('Desenvolvedor Front end', 'Vaga para desenvolvedor front end com experiência em tecnologias web', 'HTML, CSS, JavaScript', 'avançado', 'PJ', 1000.00, '2023-04-30');


INSERT INTO processos_seletivos (id_empresa, id_vaga, id_candidato, status, data_inicio, data_fim) VALUES
(1, 2, 3, 'em_andamento', '2022-01-11 08:27:33', NULL),
(2, 3, 4, 'em_andamento', '2022-02-21 09:55:32',  NULL),
(3, 4, 5, 'finalizado', '2022-10-21 03:54:13', '2022-01-01 01:22:33'),
(4, 5, 6, 'finalizado', '2022-01-09 04:44:32', '2022-02-05 02:03:44'),
(5, 6, 7, 'em_andamento', '2022-11-05 23:22:12',  NULL),
(6, 7, 8, 'em_andamento', '2022-03-06 13:32:42',  NULL),
(7, 8, 9, 'cancelado', '2022-01-12 07:55:12', '2022-07-09 07:34:45'),
(8, 9, 10, 'cancelado', '2022-03-17 09:23:32', '2022-12-05 15:32:34'),
(9, 10, 2, 'finalizado', '2022-09-16 08:21:42', '2022-08-04 22:32:21'),
(10, 1, 3, 'em_andamento', '2022-08-09 01:20:00',  NULL);

/*Selecionar nome_completo, email, telefone, nivel_habilidade, disponibilidade e processo seletivo que o candidato 
    participou exibindo os dados status do processo seletivo, data_inicio e data_fim e nome da vaga*/


SELECT candidato.nome_completo, candidato.email, candidato.telefone, candidato.nivel_habilidade, candidato.disponibilidade, 
       processo_seletivo.nome as nome_processo, processo_seletivo.status, processo_seletivo.data_inicio, processo_seletivo.data_fim, vaga.nome as nome_vaga
FROM candidato 
JOIN candidato_processo_seletivo ON candidato.id = candidato_processo_seletivo.candidato_id 
JOIN processo_seletivo ON candidato_processo_seletivo.processo_seletivo_id = processo_seletivo.id
JOIN vaga ON processo_seletivo.vaga_id = vaga.id;

/*Selecionar a quantidade processos seletivos por vagas, caso tenha alguma vaga sem processo seletivo também deverá ser exibida*/

SELECT v.nome_vaga, COUNT(ps.id_processo_seletivo) AS qtd_processos_seletivos
FROM vaga v
LEFT JOIN processo_seletivo ps ON v.id_vaga = ps.id_vaga
GROUP BY v.nome_vaga;

/*Selecionar a quantidade de processos seletivos que cada candidato participou, listando o nome do candidato e telefone.*/

/*Selecionar a vaga, salario e a descrição da vaga que tem o maior salario e liste também a vaga que tem o menor salario */

select descricao, salario from vagas where salario = (select max(salario) from salario);


