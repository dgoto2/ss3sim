% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/change_q.R
\name{check_q}
\alias{check_q}
\title{Check if desired q parameters exist in control file}
\usage{
check_q(ctl_list, Nfleets, desiredfleets)
}
\arguments{
\item{ctl_list}{A control file read in by \code{\link[r4ss]{SS_readctl}}.}

\item{Nfleets}{The number of fleets in the model. This can be determined
from the data file or using \code{\link[r4ss]{SS_readdat}}, of which
\code{Nfleets} is a named element.}

\item{desiredfleets}{A numeric vector specifying which fleets you want
to have q parameters for.}
}
\value{
A list with two vectors specifying which fleets to add and which
to remove from the control file.
}
\description{
Check a Stock Synthesis control file to determine if the desired fleets
have q parameters.
}
\examples{
dat <- r4ss::SS_readdat(
  dir(system.file("extdata", "models", "cod-om", package = "ss3sim"),
 "\\\\.dat", full.names = TRUE), verbose = FALSE)
ctl <- r4ss::SS_readctl(
  dir(system.file("extdata", "models", "cod-om", package = "ss3sim"),
 "\\\\.ctl", full.names = TRUE), verbose = FALSE, echoall = FALSE,
 use_datlist = TRUE, datlist = dat)
stopifnot(check_q(ctl, dat$Nfleets, desiredfleets = 1)$remove == 2)
stopifnot(all(mapply(is.null, check_q(ctl, dat$Nfleets, desiredfleets = 1:2))))
stopifnot(check_q(ctl, dat$Nfleets, desiredfleets = 1:3)$add == 3)
stopifnot(check_q(ctl, dat$Nfleets, desiredfleets = 2:3)$remove == 1)

}
\seealso{
\code{change_q}
}
