-- Drop constraints
ALTER TABLE produtos DROP CONSTRAINT IF EXISTS fk_produto_fornecedor;
ALTER TABLE vendas DROP CONSTRAINT IF EXISTS fk_venda_cliente;
ALTER TABLE itens_venda DROP CONSTRAINT IF EXISTS fk_item_venda_produto;
ALTER TABLE itens_venda DROP CONSTRAINT IF EXISTS fk_item_venda_venda;

-- Drop tables
DROP TABLE IF EXISTS itens_venda CASCADE;
DROP TABLE IF EXISTS vendas CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;
DROP TABLE IF EXISTS fornecedores CASCADE;
DROP TABLE IF EXISTS despesas CASCADE;
