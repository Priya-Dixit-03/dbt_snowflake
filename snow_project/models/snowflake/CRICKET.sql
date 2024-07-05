{{ config(materialized='view') }}
with cricket as(
    select NAME,TEAM FROM FALCON.PLAYER
)
SELECT * FROM cricket