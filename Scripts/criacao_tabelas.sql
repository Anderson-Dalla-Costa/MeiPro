-- Tabela clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    endereco TEXT,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

COMMENT ON TABLE clientes IS 'Cadastro de clientes do MEIPro';
COMMENT ON COLUMN clientes.id_cliente IS 'ID único do cliente';
COMMENT ON COLUMN clientes.nome IS 'Nome do cliente';
COMMENT ON COLUMN clientes.cpf IS 'CPF do cliente';
COMMENT ON COLUMN clientes.endereco IS 'Endereço do cliente';
COMMENT ON COLUMN clientes.telefone IS 'Telefone de contato do cliente';
COMMENT ON COLUMN clientes.email IS 'Email do cliente';

-- Tabela fornecedores
CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    endereco TEXT,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

COMMENT ON TABLE fornecedores IS 'Cadastro de fornecedores do MEIPro';
COMMENT ON COLUMN fornecedores.id_fornecedor IS 'ID único do fornecedor';
COMMENT ON COLUMN fornecedores.nome IS 'Nome do fornecedor';
COMMENT ON COLUMN fornecedores.cnpj IS 'CNPJ do fornecedor';
COMMENT ON COLUMN fornecedores.endereco IS 'Endereço do fornecedor';
COMMENT ON COLUMN fornecedores.telefone IS 'Telefone de contato do fornecedor';
COMMENT ON COLUMN fornecedores.email IS 'Email do fornecedor';

-- Tabela produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

COMMENT ON TABLE produtos IS 'Cadastro de produtos do MEIPro';
COMMENT ON COLUMN produtos.id_produto IS 'ID único do produto';
COMMENT ON COLUMN produtos.nome IS 'Nome do produto';
COMMENT ON COLUMN produtos.descricao IS 'Descrição do produto';
COMMENT ON COLUMN produtos.preco IS 'Preço do produto';
COMMENT ON COLUMN produtos.estoque IS 'Quantidade disponível no estoque';
COMMENT ON COLUMN produtos.id_fornecedor IS 'ID do fornecedor do produto';

-- Tabela vendas
CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_cliente INT,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

COMMENT ON TABLE vendas IS 'Registro das vendas realizadas no MEIPro';
COMMENT ON COLUMN vendas.id_venda IS 'ID único da venda';
COMMENT ON COLUMN vendas.data_venda IS 'Data da venda';
COMMENT ON COLUMN vendas.id_cliente IS 'ID do cliente que realizou a compra';
COMMENT ON COLUMN vendas.valor_total IS 'Valor total da venda';

-- Tabela itens_venda
CREATE TABLE itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

COMMENT ON TABLE itens_venda IS 'Itens vendidos em cada venda no MEIPro';
COMMENT ON COLUMN itens_venda.id_item IS 'ID único do item da venda';
COMMENT ON COLUMN itens_venda.id_venda IS 'ID da venda em que o item foi incluído';
COMMENT ON COLUMN itens_venda.id_produto IS 'ID do produto vendido';
COMMENT ON COLUMN itens_venda.quantidade IS 'Quantidade do produto vendido';
COMMENT ON COLUMN itens_venda.preco_unitario IS 'Preço unitário do produto';

-- Tabela despesas
CREATE TABLE despesas (
    id_despesa INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_despesa DATE NOT NULL
);

COMMENT ON TABLE despesas IS 'Despesas registradas no MEIPro';
COMMENT ON COLUMN despesas.id_despesa IS 'ID único da despesa';
COMMENT ON COLUMN despesas.descricao IS 'Descrição da despesa';
COMMENT ON COLUMN despesas.valor IS 'Valor da despesa';
COMMENT ON COLUMN despesas.data_despesa IS 'Data da despesa';