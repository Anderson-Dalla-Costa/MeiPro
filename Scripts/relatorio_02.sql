/*
 * Relatório 2
 * 
 * Este relat�rio mostra o faturamento mensal total de vendas,          
 * agrupado por m�s.
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