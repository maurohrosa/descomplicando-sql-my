-- Databricks notebook source
SELECT count(idVendedor),
       count(DISTINCT idVendedor)
FROM silver.olist.vendedor
WHERE descUF = 'RJ'

-- COMMAND ----------

SELECT count(DISTINCT idCliente),
       count(DISTINCT idClienteUnico),
       count(DISTINCT descCidade),
       count(DISTINCT idCliente) - count(DISTINCT idClienteUnico) AS diff -- diff entre as contagens
FROM silver.olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

SELECT count(*),
       avg(vlPesoGramas),
       percentile(vlPesoGramas,0.5 ),
       std(vlPesoGramas),
       min(vlPesoGramas),
       max(vlPesoGramas),
       max(vlPesoGramas) - min(vlPesoGramas)
FROM silver.olist.produto
WHERE descCategoria = 'perfumaria'
