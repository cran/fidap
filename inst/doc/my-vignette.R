## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(fidap)
client <- fidap_client(api_key='xxxxxxx', source='bq')
df <- client$sql('select * from table_name')
print(df)

