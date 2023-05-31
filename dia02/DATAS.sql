-- Databricks notebook source
-- DBTITLE 1,Somando Dias
SELECT date_add('2023-01-01',45) -- ano-mes-dia + qtd dias


-- COMMAND ----------

-- DBTITLE 1,Forma 1 para subtrair dias
SELECT date_add('2023-01-01',-45)

-- COMMAND ----------

-- DBTITLE 1,Forma 2 para subtrair dias
SELECT date_sub('2023-01-01',45)

-- COMMAND ----------

-- DBTITLE 1,Navegado em meses
SELECT add_months('2023-01-01',12) -- se colocar -12 seria para trás

-- COMMAND ----------

-- DBTITLE 1,Extraindo o ano
SELECT year('2023-01-01')

-- COMMAND ----------

-- DBTITLE 1,Extraindo o mês
SELECT month('2023-01-01')

-- COMMAND ----------

-- DBTITLE 1,Extraindo o dia
SELECT day('2023-01-01')

-- COMMAND ----------

-- DBTITLE 1,Extraindo o dia da semana (1 - domingo, 2 - segunda etc.)
SELECT dayofweek('2023-01-01')

-- COMMAND ----------

-- DBTITLE 1,Diferença em dias entre duas datas
SELECT date_diff('2023-06-01', '2023-01-01')

-- COMMAND ----------

-- DBTITLE 1,Diferença entre meses
SELECT months_between('2023-06-01', '2023-01-01')

-- COMMAND ----------

SELECT idPedido,
      idCliente,
      dtPedido,
      dtEntregue,
        datediff(dtEntregue, dtPedido) AS diasEntreEntregasPedidos
FROM silver.olist.pedido

-- COMMAND ----------


