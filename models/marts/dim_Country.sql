WITH country AS (
    SELECT * from {{ ref('stg_bronze__country_master') }}
),
customer AS (
    SELECT * from {{ ref('stg_bronze__customer_master') }}
),
product_availability AS (
    SELECT * from {{ ref('stg_bronze__product_availability') }}
)
SELECT
    c.CUSTOMER_ID,
    c.CUSTOMER_NUMBER,
    c.CUSTOMER_SEGMENT,
    co.COUNTRY_NAME,
    co.POPULATION_MILLIONS,
    pa.SKU_CODE,
    pa.IS_AVAILABLE,
    pa.LOCAL_LAUNCH_DATE
FROM customer c
LEFT JOIN country co ON c.COUNTRY_CODE = co.COUNTRY_CODE
LEFT JOIN product_availability pa ON c.COUNTRY_CODE = pa.COUNTRY_CODE