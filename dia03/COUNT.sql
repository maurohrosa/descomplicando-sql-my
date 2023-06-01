-- Databricks notebook source
-- DBTITLE 1,Contagem de linhas, não nulas, da tbl
SELECT 
     COUNT (*),
     count(1)
FROM silver.olist.pedido

-- COMMAND ----------

SELECT 
     COUNT (descSituacao), -- Linhas não duplicadas deste campo
     COUNT (DISTINCT descSituacao) -- linhas distinctas do campo
FROM silver.olist.pedido

-- COMMAND ----------

SELECT
     count(idPedido), -- linhas não nulas para pedidos
     count(DISTINCT idPedido) -- linhas distinctas para pedidos
FROM silver.olist.pedido
