-- Databricks notebook source
-- 1. Qual pedido com maior valor de frete? E o menor?
SELECT idPedido,
       SUM(vlFrete) AS totalFrete
FROM silver.olist.item_pedido
GROUP BY idPedido
order by totalFrete DESC

-- COMMAND ----------

-- 2. Qual vendedor tem mais pedidos?
SELECT idVendedor,
       count(DISTINCT idPedido) AS qtPedido
FROM silver.olist.item_pedido
GROUP BY idVendedor
ORDER BY qtPedido DESC

-- COMMAND ----------

-- 3. Qual vendedor tem mais itens vendidos? E o com menos?
SELECT idVendedor,
       count(idProduto) AS qtItens
FROM silver.olist.item_pedido
GROUP BY idVendedor
ORDER BY qtItens DESC -- asc para oq menos vendeu

-- COMMAND ----------

-- 4. Qual dia tivemos mais pedidos?
SELECT 
       date(dtPedido) as diaPedido,
       count(distinct idPedido) AS qtPedido
FROM silver.olist.pedido
GROUP BY diaPedido
ORDER BY qtPedido DESC

-- COMMAND ----------

-- 5. Quantos vendedores são do estado de São Paulo?
SELECT 
      count(idVendedor) AS qtVendedor

FROM silver.olist.vendedor
WHERE descUF = 'SP'


-- COMMAND ----------

-- 6. Quantos vendedores são de Presidente Prudente?
SELECT 
      count(idVendedor) AS qtVendedor

FROM silver.olist.vendedor
WHERE descCidade = 'presidente prudente'

-- COMMAND ----------

-- 7. Quantos clientes são do estado do Rio de Janeiro?
SELECT 
      count(idCliente) AS qtCliente

FROM silver.olist.cliente
WHERE descUF = 'RJ'


-- COMMAND ----------

-- 8. Quantos produtos são de construção?
SELECT count(DISTINCT idProduto) AS qtProduto

FROM silver.olist.produto
WHERE descCategoria LIKE '%construcao%'

-- COMMAND ----------

-- 9. Qual o valor médio de um pedido? E do frete?
SELECT SUM(vlPreco) / COUNT(DISTINCT idPedido) AS vlMedioPedido,
       SUM(vlFrete) / COUNT(DISTINCT idPedido) AS vlMedioFrete
FROM silver.olist.item_pedido

-- COMMAND ----------

-- 10. Em média os pedidos são de quantas parcelas de cartão? E o valor médio por parcela?
SELECT 
     avg(nrParcelas) as avgQtParcelas,
     avg(vlPagamento / nrParcelas) AS avgValorParcela

FROM silver.olist.pagamento_pedido
WHERE descTipoPagamento = 'credit_card'


-- COMMAND ----------

-- 11. Quanto tempo em média demora para um pedido chegar depois de aprovado?
SELECT
      avg(datediff(dtEntregue, dtAprovado)) AS avgQtDias

FROM silver.olist.pedido
WHERE descSituacao in ('approved','shipped','delivered','invoiced')

-- COMMAND ----------

-- 12. Qual estado tem mais vendedores?
SELECT 
     descUF,
     count(DISTINCT idVendedor) as qtVendedor

FROM silver.olist.vendedor
GROUP BY descUF
ORDER BY descUF DESC


-- COMMAND ----------

-- 13. Qual cidade tem mais clientes?

SELECT descCidade,
       count(DISTINCT idCliente) AS qtCliente,
       count(DISTINCT idClienteUnico) AS qtClienteUnico
FROM silver.olist.cliente
GROUP BY descCidade
ORDER BY qtCliente DESC


-- COMMAND ----------

-- 14. Qual categoria tem mais itens?

select descCategoria,
       count(distinct idProduto) AS qtProduto

from silver.olist.produto
group by descCategoria
order by qtProduto desc

-- COMMAND ----------

-- 15. Qual categoria tem maior peso médio de produto?

SELECT descCategoria,
       avg(vlPesoGramas) AS pesoMedio

from silver.olist.produto
GROUP BY descCategoria
ORDER BY pesoMedio DESC

-- COMMAND ----------

 -- 16. Qual a série histórica de pedidos por dia? E receita?
 SELECT 
       date(dtPedido) AS diaPedido,
       count(DISTINCT idPedido) AS qtPedido  

 FROM silver.olist.pedido
 GROUP BY diaPedido
 ORDER BY diaPedido 


-- COMMAND ----------

-- 17. Qual produto é o campeão de vendas? Em receita? Em quantidade?

SELECT idProduto,
       count(*) AS qtvenda,
       sum(vlPreco) AS vlReceita

FROM silver.olist.item_pedido
GROUP BY idProduto
ORDER BY vlReceita DESC


-- COMMAND ----------


