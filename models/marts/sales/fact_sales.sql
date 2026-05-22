WITH sales_header AS (
     SELECT * from {{ ref('stg_sales__sales_header') }}
),
sales_item AS (
    SELECT * from {{ ref('stg_sales__sales_item') }}
),
customer AS (
    SELECT * from {{ ref('stg_sales__customer_master') }}
)
SELECT
    sh.TRANSACTION_ID,
    sh.TRANSACTION_NUMBER,
    sh.TRANSACTION_TIMESTAMP,
    si.TRANSACTION_LINE_ID,
    si.SKU_CODE,
    si.QUANTITY,
    si.UNIT_PRICE,
    si.DISCOUNT_AMOUNT,
    si.TAX_AMOUNT,
    si.LINE_TOTAL,
    sh.CURRENCY,
    c.CUSTOMER_SEGMENT,
    c.COUNTRY_CODE
FROM sales_header sh
INNER JOIN sales_item si ON sh.TRANSACTION_ID = si.TRANSACTION_ID
LEFT JOIN customer c ON sh.CUSTOMER_ID = c.CUSTOMER_ID