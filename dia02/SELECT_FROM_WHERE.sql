-- Databricks notebook source
-- DBTITLE 1,Filtros para produtos mais caros ou iguais a R$ 500,00
SELECT *

FROM silver.olist.item_pedido
WHERE vlPreco >= 500

-- COMMAND ----------

-- DBTITLE 1,Comparando valor frete e valor produto
SELECT *

FROM silver.olist.item_pedido

WHERE vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,Preço maior que 100 e frete maior que preço
SELECT *

FROM silver.olist.item_pedido

WHERE vlPreco >=100 
AND vlFrete > vlPreco

-- COMMAND ----------

SELECT *

FROM silver.olist.produto

WHERE descCategoria = 'pet_shop' 
OR descCategoria = 'telefonia'
OR descCategoria = 'bebes'

-- COMMAND ----------

-- DBTITLE 1,Utilizando o IN para mais de um critério no filtro
SELECT *

FROM silver.olist.produto

WHERE descCategoria IN ('pet_shop','telefonia','bebes')

-- COMMAND ----------

SELECT *

FROM silver.olist.pedido

WHERE date(dtPedido) >= '2017-01-01'
AND date(dtPedido) <= '2017-01-31'
-- como a data esta no formato data e hora, a query não capturou pedidos do dia 31 das 0h as 23h59 mesmo sendo <=
-- Para isso iremos mudar o formato das mesmas para data, com o comando date


-- COMMAND ----------

-- DBTITLE 1,Mês 1 e 6 de 2017
SELECT *

FROM silver.olist.pedido

WHERE year(dtPedido) = 2017
AND (month(dtPedido) = 1
OR month(dtPedido) = 6)

-- COMMAND ----------

-- DBTITLE 1,Mês 1 e 6 mais simples com o IN
SELECT *

FROM silver.olist.pedido

WHERE year(dtPedido) = 2017
AND month(dtPedido) IN (1,6)
