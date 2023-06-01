-- Databricks notebook source
SELECT *
FROM SILVER.OLIST.item_pedido
ORDER BY vlPreco ASC , vlFrete DESC -- Ordenar mais de uma coluna



-- COMMAND ----------

SELECT *
FROM silver.olist.produto
WHERE descCategoria = 'perfumaria'
ORDER BY nrTamanhoDescricao DESC
LIMIT 5 

-- COMMAND ----------

SELECT *,
       vlComprimentoCm * vlAlturaCm * vlLarguraCm as volumeCm
FROM silver.olist.produto
WHERE descCategoria = 'perfumaria'
ORDER BY vlComprimentoCm * vlAlturaCm * vlLarguraCm DESC -- PRECISAMOS REPETIR A OPERAÇÃO MATEMATICA DE CIMA NO ORDER BY
LIMIT 5 
