#' Makes a raw query
#'
#' Executes a query allowing pasing a direct Hivepod/Baucis query using JSON
#' syntax as defined here:
#' https://github.com/wprl/baucis/wiki/Query-String-Parameters
#'
#' @param resource The resource to query.
#' @param query Raw URL query. See doc here: https://github.com/wprl/baucis/wiki/Query-String-Parameters
#'
#' @return Returns a dataframe with the returned data.
#' @export
#' @examples
#' cnx <- connect("http://jacaton-r.herokuapp.com", "demo", "1234")
#' off <- resource(cnx, "oficinas")
#'
#' queryRaw(off, "?skip=2&limit=3")

queryRaw <- function(resource, query) {
  urlbase <- httr::handle(resource[[1]])
  aut <- httr::authenticate(resource[[2]], resource[[3]])
  q1 <- httr::GET(handle=urlbase, config=aut, path=paste("api/", resource[[5]], query, sep="") )
  dataQ1 <- httr::content(q1, type="application/json")
  df <- to_dataframe(dataQ1)
  return (df)
}
