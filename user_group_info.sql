WITH SRC AS (
    SELECT DISTINCT EMP_ID, EMP_NAME, EMP_CODE, NULL AS ORGANIZATION_, DEVICE_NAME, DEVICE_NUM
    FROM DMS_ACCT_PRL_INS_TIME
    --WHERE EMP_NAME IS NOT NULL
)--, SRC_GROUP AS (
    SELECT EMP_ID, --EMP_NAME, 
        LISTAGG(DISTINCT DEVICE_NAME, ', ') WITHIN GROUP (ORDER BY DEVICE_NAME) AS DEVICES_
    FROM SRC
    GROUP BY EMP_ID--, EMP_NAME
)
SELECT DEVICES_, 
    LISTAGG(EMP_NAME, ', '||CHR(10)) WITHIN GROUP (ORDER BY EMP_NAME) AS EMP_NAMES
FROM SRC_GROUP
GROUP BY DEVICES_
ORDER BY DEVICES_
;
