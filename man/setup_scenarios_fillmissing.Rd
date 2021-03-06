% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setup_scenarios.R
\name{setup_scenarios_fillmissing}
\alias{setup_scenarios_fillmissing}
\title{Add missing arguments needed to run scenarios}
\usage{
setup_scenarios_fillmissing(dataframe)
}
\arguments{
\item{dataframe}{A data frame input by the user specifying the scenario
structure for the simulation.}
}
\value{
A data frame with potentially more columns than what was provided.
}
\description{
Add columns for missing arguments that are needed to run scenarios
and that can be set to some default value. E.g., the operating model
can be the default operating model in the package but users must set
the number of age-composition samples that they want because users
might not want to sample any ages so we don't want to set everything
to a default value.
}
