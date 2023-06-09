-- Databricks notebook source
SELECT *

FROM silver.olist.pedido AS t1

LEFT JOIN silver.olist.item_pedido AS t2
ON t1.idPedido = t2.idPedido

WHERE t2.idPedido IS NULL -- temos varios pedidos na t2 que não estão na t1

-- COMMAND ----------

SELECT *

FROM silver.olist.pedido AS t1

LEFT JOIN silver.olist.item_pedido AS t2
ON t1.idPedido = t2.idPedido

WHERE t2.idPedido IS NOT NULL -- para contornar os campos vazios, como se fosse o procv

-- COMMAND ----------

SELECT *

FROM silver.olist.pedido AS t1

INNER JOIN silver.olist.item_pedido AS t2 -- INNER vai trazer todos os dados que tenham em ambas as tbls
ON t1.idPedido = t2.idPedido


-- COMMAND ----------

SELECT t1.idPedido,
       t1.idCliente,
       t4.descUF AS descUFCliente,
       t3.idVendedor,
       t3.descUF AS descUFVendedor

FROM silver.olist.pedido AS t1

INNER JOIN silver.olist.item_pedido AS t2 -- INNER vai trazer todos os dados que tenham em ambas as tbls
ON t1.idPedido = t2.idPedido

LEFT JOIN silver.olist.vendedor As t3
ON t2.idVendedor = t3.idVendedor

LEFT JOIN silver.olist.cliente AS t4
ON t1.idCliente = t4.idCliente
