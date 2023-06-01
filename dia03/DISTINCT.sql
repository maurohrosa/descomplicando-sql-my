-- Databricks notebook source
SELECT DISTINCT descUF  -- VALORES ÚNICOS
FROM silver.olist.vendedor
ORDER BY descUF

-- COMMAND ----------

SELECT DISTINCT descCidade, descUF

FROM silver.olist.vendedor
ORDER BY descUF, descCidade

-- COMMAND ----------

SELECT DISTINCT descCategoria
FROM silver.olist.produto
WHERE descCategoria IS NOT NULL
order by descCategoria
