#' Split vector into batches with maximum size
#'
#' @param .vec A vector
#' @param max_content The maximum lenght of each batch
#'
#' @returns A list of vectors
#' @export
#'
#' @examples
#' \dontrun{
#' a <- 1:467
#' split_batch(a, max_content=40)
#' }
split_batch_maxn <- function(.vec, max_content) {
  x <- seq_along(.vec)
  result <- split(.vec, ceiling(x/max_content))
  return(result)
}
