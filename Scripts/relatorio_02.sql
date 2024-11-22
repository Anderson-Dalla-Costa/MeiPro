/*
 * RelatÃ³rio 2
 * 
 * Este relatório mostra o faturamento mensal total de vendas,          
 * agrupado por mês.
 */

SELECT 
    TO_CHAR(v.data_venda, 'YYYY-MM') AS mes_venda, 
    SUM(v.valor_total) AS total_faturamento
FROM 
    vendas v
GROUP BY 
    TO_CHAR(v.data_venda, 'YYYY-MM')
ORDER BY 
    mes_venda;