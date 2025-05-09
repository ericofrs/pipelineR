% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_data.R
\name{format_data}
\alias{format_data}
\title{Format the data}
\usage{
format_data(.data)
}
\arguments{
\item{.data}{The untidy tibble containing the stock data}
}
\value{
A tidy tibble with columns symbol, date, metric and value
}
\description{
Format the data
}
\examples{
\dontrun{
format_data(untidy_data)
}
}
