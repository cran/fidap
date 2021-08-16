# Fidap R Client
This Fidap client connect to our big data warehouses and gives you seamless access to external data.

**NOTE**: Fidap is currently invite only and requires an `api_key` to work.
## Installation
```bash
install.packages('fidap')
```
## Getting Started
```R
library(fidap)
client <- fidap_client(api_key="Paste API_KEY here from fidap dashboard", source="bq")
```
## API
### $sql
You can run your queries by using this method, it will return a Pandas dataframe containing the results of the query. Result would be None if something goes wrong i.e. incorrect query / not a valid API key.
```R
library(fidap)
client <- fidap_client(api_key="Paste API_KEY here from fidap dashboard", source="bq")
df <- client$sql(sql="paste your QUERY")
```

## Contributing
```bash
git clone https://github.com/fidapco/fidap-R-client.git
cd fidap-R-client
devtools::load_all()
devtools::install()
```
