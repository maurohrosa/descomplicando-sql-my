-- Databricks notebook source
-- DBTITLE 1,Exercício 01
-- 1. Selecione todos os clientes Paulistanos

SELECT *

FROM silver.olist.cliente

WHERE descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Exercício 02
-- 2. Selecione todos os clientes paulistas

SELECT *

FROM silver.olist.cliente

WHERE descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 03
-- 3. Selecione todos os Vendedores Cariocas e Paulistas

SELECT *

FROM silver.olist.vendedor

WHERE descCidade = 'rio de janeiro' -- pq carioca é apenas para a cidade do RJ
OR descUF = 'SP' -- pq paulista são todos do estado de SP

-- COMMAND ----------

-- DBTITLE 1,Exercício 04
-- 04. Selecione Produtos de Perfumaria e Bebes com altura maior que 5cm

SELECT *

FROM silver.olist.produto

WHERE descCategoria IN ('perfumaria','bebes')
AND vlAlturaCm > 5

-- COMMAND ----------

-- DBTITLE 1,Exercício 05
-- 5. Selecione todos os pedidos com mais de um item

SELECT *

FROM silver.olist.item_pedido

WHERE idPedidoItem > 1

-- COMMAND ----------

-- DBTITLE 1,Exercício 06
-- 6. Selecione os pedidos que o frete é mais caro que o item

SELECT *

FROM silver.olist.item_pedido

WHERE vlFrete > vlPreco

-- COMMAND ----------

-- DBTITLE 1,Exercício 07
-- 7. Lista de pedidos que ainda não foram enviados

SELECT *

FROM silver.olist.pedido

WHERE dtEnvio IS NULL


-- COMMAND ----------

-- DBTITLE 1,Exercício 08
-- 08. Lista de pedidos que foram entregues com atraso

SELECT *

FROM silver.olist.pedido

WHERE date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

-- DBTITLE 1,Exercício 09
-- 09. Lista de Pedidos que foram entregues com 2 dias de antecedência

SELECT *

FROM silver.olist.pedido

WHERE datediff(date(dtEstimativaEntrega), date(dtEntregue)) = 2

-- COMMAND ----------

-- DBTITLE 1,Exercício 10
-- 10. Selecione os pedidos feito em Dezembro de 2017 e entregues com atraso

SELECT date(dtPedido),
       date(dtEntregue)

FROM silver.olist.pedido

WHERE year(dtPedido) = 2017
AND month(dtPedido) = 12
AND date(dtEntregue) > date(dtEstimativaEntrega) 

-- COMMAND ----------

-- DBTITLE 1,Exercício 11
-- 11. Selecione os pedidos com avaliação maior ou igual que 4

SELECT *

FROM silver.olist.avaliacao_pedido

WHERE vlNota >=4



-- COMMAND ----------

-- DBTITLE 1,Exercício 12
-- 12. Selecione pedidos Pagos com cartão de crédito com duas ou mais parcelas menores que R$40

SELECT *

FROM silver.olist.pagamento_pedido

WHERE descTipoPagamento = 'credit_card'
AND nrParcelas >= 2
AND vlPagamento / nrParcelas < 40

-- COMMAND ----------


