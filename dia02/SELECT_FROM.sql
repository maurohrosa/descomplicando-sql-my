-- Databricks notebook source
-- DBTITLE 1,Consultando Tabelas
SELECT *  
FROM silver.olist.pedido
LIMIT 10 --limit limita a qtd de linhas/registro da tbl

-- COMMAND ----------

-- DBTITLE 1,Todas as Colunas +1
-- Crinado uma coluna nova
SELECT *,
  vlPreco + vlFrete AS vlTotal
FROM silver.olist.item_pedido

-- COMMAND ----------

SELECT  idPedido,
        idProduto,
        vlPreco,
        vlFrete,
        vlPreco + vlFrete AS vlTotal
FROM silver.olist.item_pedido
