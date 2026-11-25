USE superstore_db;

-- 1. Ventas totales y ticket promedio general
SELECT
    COUNT(*) AS total_ordenes,
    ROUND(SUM(sales), 2) AS ventas_totales,
    ROUND(AVG(sales), 2) AS venta_promedio
FROM ventas;

-- 2. Rendimiento por categoria de producto
SELECT
    category,
    COUNT(*) AS cantidad_items,
    ROUND(SUM(sales), 2) AS ventas_totales
FROM ventas
GROUP BY category
ORDER BY ventas_totales DESC;

-- 3. Evolucion de ventas por ano
SELECT
    YEAR(order_date) AS anio,
    COUNT(*) AS cantidad_items,
    ROUND(SUM(sales), 2) AS ventas_totales
FROM ventas
GROUP BY YEAR(order_date)
ORDER BY anio;

-- 4. Ventas y volumen por region y segmento de cliente
SELECT
    region,
    segment,
    COUNT(*) AS total_ordenes,
    ROUND(SUM(sales), 2) AS ventas_totales,
    ROUND(AVG(sales), 2) AS ticket_promedio
FROM ventas
GROUP BY region, segment
ORDER BY ventas_totales DESC;

-- 5. Tiempo promedio de entrega segun metodo de envio
SELECT
    ship_mode,
    COUNT(*) AS total_ordenes,
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 1) AS promedio_dias_envio,
    ROUND(SUM(sales), 2) AS ventas_totales
FROM ventas
GROUP BY ship_mode
ORDER BY ventas_totales DESC;
