-- Databricks notebook source
SELECT 
     descUF,
     count(DISTINCT idVendedor)
FROM silver.olist.vendedor
GROUP BY descUF
ORDER BY count(DISTINCT idVendedor) DESC -- podemos agrupar tb colocando o numero 2, que seria pela 2° linhas

-- COMMAND ----------

SELECT 
     descUF,
     count(DISTINCT idVendedor) AS qtVendedor
FROM silver.olist.vendedor
GROUP BY descUF
ORDER BY qtVendedor DESC -- spark aceita este forma

-- COMMAND ----------

SELECT 
      descCategoria,
      count(idProduto) AS qtProduto,
      avg(vlPesoGramas) as avgPeso,
      percentile(vlPesoGramas, 0.5 ) AS medianaPeso,

      avg(vlComprimentoCm * vlAlturaCm * vlLarguraCm) AS avgVolume,
      percentile(vlComprimentoCm * vlAlturaCm * vlLarguraCm, 0.5) AS medianaVolume
FROM silver.olist.produto
GROUP BY descCategoria
ORDER BY qtProduto DESC



-- COMMAND ----------

SELECT year(dtPedido),
       count(idPedido)
FROM silver.olist.pedido
GROUP BY year(dtPedido)
ORDER BY 1

-- COMMAND ----------

SELECT year(dtPedido) || '-' || month(dtPedido) AS anoMes,
       count(idPedido)
FROM silver.olist.pedido
GROUP BY anoMes
ORDER BY anoMes

-- COMMAND ----------

SELECT 
      CASE
        WHEN month(dtPedido) < 10 THEN year(dtPedido) || '-0' || month(dtPedido)
        WHEN month(dtPedido) > 9 THEN year(dtPedido) || '-' || month(dtPedido)
      END anoMes,
      count(idPedido)
FROM silver.olist.pedido
GROUP BY anoMes
ORDER BY anoMes

-- COMMAND ----------

-- OUTRA FORMA DE FAZER UM ANOMES

SELECT date(date_trunc('month',dtPedido)) AS anoMes,
       count(idPedido)
FROM silver.olist.pedido
GROUP BY anoMes
ORDER BY anoMes
