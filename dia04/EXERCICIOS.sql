-- Databricks notebook source
-- DBTITLE 1,EXERCÍCIOS


-- COMMAND ----------

-- 1. Qual categoria tem mais produtos vendidos?

SELECT t2.descCategoria,
       count(*) AS qtdCategoria,
       count(DISTINCT t1.idPedido) AS qtdPedidos

FROM silver.olist.item_pedido AS t1

LEFT JOIN silver.olist.produto AS t2
ON t1.idProduto = t2.idProduto
GROUP BY t2.descCategoria
ORDER BY qtdCategoria DESC

LIMIT 1



-- COMMAND ----------

-- 2. Qual categoria tem produtos mais caros, em média? E Mediana?
SELECT t2.descCategoria,
       avg(t1.vlPreco) AS avgPreco,
       percentile(vlpreco, 0.5) AS medianaPreco

FROM silver.olist.item_pedido AS t1

LEFT JOIN silver.olist.produto AS t2
ON t1.idProduto = t2.idProduto

GROUP BY t2.descCategoria
order by medianaPreco DESC

LIMIT 1

-- COMMAND ----------

-- 3. Qual categoria tem maiores fretes, em média?
SELECT t2.descCategoria,
       avg(t1.vlFrete) AS avgFrete

FROM silver.olist.item_pedido AS t1

LEFT JOIN silver.olist.produto AS t2
ON t1.idProduto = t2.idProduto

GROUP BY t2.descCategoria
ORDER BY avgFrete DESC

LIMIT 1

-- COMMAND ----------

-- 4. Os clientes de qual estado pagam mais frete, em média?

SELECT 
       t3.descUF,
       sum(t1.vlFrete) / count(DISTINCT t1.idPedido) AS avgFrete,
       avg(t1.vlFrete) AS avgFreteItem,
       avg(t1.vlFrete) / count(DISTINCT t2.idCliente) AS avgFreteCliente

FROM silver.olist.item_pedido AS t1

INNER JOIN silver.olist.pedido AS t2
ON t1.idPedido = t2.idPedido

LEFT JOIN silver.olist.cliente AS t3
ON t2.idCliente = t3.idCliente

GROUP BY t3.descUF
ORDER BY avgFrete DESC

LIMIT 1

-- COMMAND ----------

-- 5. Clientes de quais estados avaliam melhor, em média? Proporção de 5?

SELECT 
       t3.descUF,
       avg(t1.vlNota) as avgNota,
       avg(CASE WHEN t1.vlNota = 5 THEN 1 ELSE 0 END) AS prop5

FROM silver.olist.avaliacao_pedido AS t1
INNER JOIN silver.olist.pedido AS t2

LEFT JOIN silver.olist.cliente AS t3
ON t2.idCliente = t3.idCliente

GROUP BY t3.descUF
ORDER BY avgNota DESC

LIMIT 1


-- COMMAND ----------

-- 6. Vendedores de quais estados têm as piores reputações?

select 
       t3.descUF,
       avg(t1.vlNota) avgNota

from silver.olist.avaliacao_pedido AS t1

left join silver.olist.item_pedido AS t2
ON t1.idPedido = t2.idPedido

left join silver.olist.vendedor AS t3
ON t2.idVendedor = t3.idVendedor

group by t3.descUF
order by avgNota

-- COMMAND ----------

-- 7. Quais estados de clientes levam mais tempo para a mercadoria chegar?

SELECT t2.descUF,
       avg(datediff(t1.dtEntregue, t1.dtPedido)) AS qtdDias

FROM silver.olist.pedido AS t1

LEFT JOIN silver.olist.cliente AS t2
ON t1.idCliente = t2.idCliente

WHERE t1.dtEntregue IS NOT NULL

GROUP BY t2.descUF
ORDER BY qtdDias DESC

-- COMMAND ----------

-- 8. Qual meio de pagamento é mais utilizado por clientes do RJ?

SELECT 
      t1.descTipoPagamento,
      count(DISTINCT t1.idPedido) AS qtdePedidos


FROM silver.olist.pagamento_pedido AS t1

INNER JOIN silver.olist.pedido AS t2
ON t1.idPedido = t2.idPedido

LEFT JOIN silver.olist.cliente AS t3
ON t2.idCliente = t3.idCliente

WHERE t3.descUF = 'RJ'

GROUP BY t1.descTipoPagamento
ORDER BY qtdePedidos DESC

-- COMMAND ----------

-- 9. Qual estado sai mais ferramentas?

SELECT 
       t3.descUF,
       count(*) AS qtdeProduto

FROM silver.olist.item_pedido AS t1

LEFT JOIN silver.olist.produto AS t2
ON t1.idProduto = t2.idProduto

LEFT JOIN silver.olist.vendedor AS t3
ON t1.idVendedor = t3.idVendedor

where t2.descCategoria LIKE '%ferramentas%'
GROUP BY t3.descUF
ORDER BY qtdeProduto DESC

-- COMMAND ----------

-- 10. Qual estado tem mais compras por cliente?

SELECT 
       t2.descUF,
       count(DISTINCT t1.idPedido) as qtdePedido,
       count(DISTINCT t2.idClienteUnico) As qtdeClienteUnico,
       count(DISTINCT t1.idPedido) / count(DISTINCT t2.idClienteUnico) AS avgPedidoCliente

FROM silver.olist.pedido AS t1

LEFT JOIN silver.olist.cliente AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t2.descUF
ORDER BY avgPedidoCliente DESC


-- COMMAND ----------


