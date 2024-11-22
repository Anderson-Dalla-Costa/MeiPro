/*
 * Relatório 1
 * Esse relatório exibe as vendas realizadas em um determinado período,
 * com base nas informações das tabelas de vendas e clientes.;
 */

SELECT 
    c.nome_cliente, 
    SUM(v.valor_total) AS total_vendas, 
    COUNT(v.id_venda) AS numero_vendas,
    MIN(v.data_venda) AS data_primeira_venda,
    MAX(v.data_venda) AS data_ultima_venda
FROM 
    vendas v
JOIN 
    cliente c ON v.id_cliente = c.id_cliente
WHERE 
    v.data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    c.nome_cliente
ORDER BY 
    total_vendas DESC;