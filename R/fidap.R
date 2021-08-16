library(httr)
library(jsonlite)
library(methods)

#' @title fidapClient
#' @import httr jsonlite methods
fidapClient <- setRefClass(
  'fidapClient',
  fields = list(api_key = "character", source = "character"),
  methods = list(
    sql = function(query) {
      response <-
        POST(
          'https://ws.fidap.com/api/v1/query/run/query/',
          encode = "json",
          body = list(sql_query = query, db = .self$source),
          add_headers("api-key" = .self$api_key)
        )
      if (status_code(response) == 200) {
        query_data <- fromJSON(content(response, "parsed")$data)
        return(data.frame(query_data))
      } else{
        return(content(response, "parsed")$detail)
      }
    }
  )
)

#' @title fidap_client
#' @param api_key place your dashboard api_key here.
#' @param source Source is bq(bigquery), sf_aws(Snowflake AWS) or sf_gcp(Snowflake GCP)
#' @return A object
#' @export
fidap_cleint <- function (api_key, source) {
  fidap_obj <- fidapClient$new(api_key = api_key, source = source)
  return(fidap_obj)
}
