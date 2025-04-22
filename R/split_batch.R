#' Split vector into determined number of batches
#'
#' Returns a list containing multiple vectors (n_groups). It splits the lenght
#' of the vectors as fair as possible.
#'
#' @param .vec A vector
#' @param n_groups The number of desired batches
#'
#' @returns A list of vectors
#' @export
#'
#' @examples
#' \dontrun{
#' a <- 1:467
#' split_batch(a, n_groups=15)
#' }
split_batch <- function(.vec, n_groups) {
  n <- length(.vec)
  group_sizes <- rep(floor(n / n_groups), n_groups)
  remainder <- n %% n_groups
  if (remainder > 0) {
    group_sizes[1:remainder] <- group_sizes[1:remainder] + 1
  }
  split_indices <- rep(1:n_groups, times = group_sizes)
  result <- split(.vec, split_indices)
  return(result)
}

