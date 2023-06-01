-- Databricks notebook source
SELECT avg(vlPreco), -- MÉDIA SIMPLES
       min(vlPreco),  -- MÍNIMO
       percentile(vlPreco, 0.25 ), -- MEDIANA 50% DOS VALORES SÃO MAIORES E MENORES
       max(vlFrete),  -- MAXIMO
       std(vlFrete),  -- DESVIO PADRAO
       percentile(vlFrete, 0.5 ), -- MEDIANA 50% DOS VALORES SÃO MAIORES E MENORES
       avg(vlFrete),

       sum(vlPreco) / count(vlPreco)
FROM silver.olist.item_pedido
