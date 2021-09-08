library(httr)
library(jsonlite)
library(methods)

#' @title fidapClient
#' @description this is main class.
#' @details This class is hidden and instantiate in fidap_client method, It contains method "sql" which allow user to qurey the data.
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
#' @description This function takes two arguments and return a class object.
#' @details This method allows you to connect with your fidap dashboard and run the query on source you want.
#' @param api_key place your dashboard api_key here.
#' @param source Source is bq(bigquery), sf_aws(Snowflake AWS) or sf_gcp(Snowflake GCP)
#' @return A object
#' @export
fidap_client <- function (api_key, source) {
  fidap_obj <- fidapClient$new(api_key = api_key, source = source)
  return(fidap_obj)
}
