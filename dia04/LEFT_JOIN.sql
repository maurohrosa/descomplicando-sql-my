-- Databricks notebook source
-- DBTITLE 1,Left Join convencional, usando o nome completo da tbl e .nome_coluna
SELECT *

FROM silver.olist.item_pedido 

LEFT JOIN silver.olist.produto -- outra tbl, adiciona a direita, no final
ON silver.olist.item_pedido.idProduto = silver.olist.produto.idProduto

-- COMMAND ----------

-- DBTITLE 1,Renomeando as tbl para t1 e t2, boa prática
SELECT t1.idPedido,
       t1.idPedidoItem,
       t1.idProduto,
       t1.vlPreco,
       t1.vlFrete,
       t2.descCategoria

FROM silver.olist.item_pedido as t1

LEFT JOIN silver.olist.produto AS t2 -- nomeando as colunas para diminuir o codigo
ON t1.idProduto = t2.idProduto

-- COMMAND ----------

-- DBTITLE 1,Categoria de produtos vendidos
SELECT t1.*,
       t2.descCategoria

FROM silver.olist.item_pedido as t1

LEFT JOIN silver.olist.produto AS t2 -- nomeando as colunas para diminuir o codigo
ON t1.idProduto = t2.idProduto

-- COMMAND ----------

-- DBTITLE 1,Trazendo todos os dados da tbl t1 e apenas descUF da t2
SELECT t1.*,
       t2.descUF

FROM silver.olist.item_pedido as t1

LEFT JOIN silver.olist.vendedor AS t2 -- nomeando as colunas para diminuir o codigo
ON t1.idVendedor = t2.idVendedor

-- COMMAND ----------

-- DBTITLE 1,Fazendo Left Join com mais de uma tbl
SELECT t1.*,
       t2.descUF,
       t3.descCategoria,
       t3.vlPesoGramas
       

FROM silver.olist.item_pedido as t1

LEFT JOIN silver.olist.vendedor AS t2 -- nomeando as colunas para diminuir o codigo
ON t1.idVendedor = t2.idVendedor

LEFT JOIN silver.olist.produto AS t3
ON t1.idProduto = t3.idProduto



-- COMMAND ----------

SELECT t1.*,
       t2.descUF,
       t3.descCategoria,
       t3.vlPesoGramas
       

FROM silver.olist.item_pedido as t1

LEFT JOIN silver.olist.vendedor AS t2 -- nomeando as colunas para diminuir o codigo
ON t1.idVendedor = t2.idVendedor

LEFT JOIN silver.olist.produto AS t3
ON t1.idProduto = t3.idProduto

WHERE t2.descUF = 'SP' -- Podemos usar um where para filtrar uma das tabelas

