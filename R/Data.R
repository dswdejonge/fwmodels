#' Lovinkhoeve Experimental Farm, conventional practice
#'
#' Energy flux model of the Lovinkhoeve Experimental Farm, conventional practice (soil).
#' Includes flow matrix, biomasses, assimilation and growth efficiencies.
#'
#' @format A named list with 5 elements:
#' \describe{
#' \item{\code{type}}{"EF" because it is an energy flux model}
#' \item{\code{FM}}{Square flow matrix with named sources (rows) and sinks (columns).
#' Unit is kg ha-1 yr-1.}
#' \item{\code{BM}}{Named numeric vector with biomasses of all compartments.
#' Unit is kg ha-1.}
#' \item{\code{AE}}{Named numeric vector with assimilation efficiencies of all compartments.
#' Fractions. If AE is not relevent (i.e. detritus and roots) the value is set to NA.}
#' \item{\code{GE}}{Named numeric vector with growth efficiencies of all compartments.
#' Fractions. If GE is not relevent (i.e. detritus and roots) the value is set to NA.}
#' \item{\code{MR}}{Named numeric vector with mortality rates of all compartments.
#' Unit is yr-1.}
#' }
"LovinkhoeveExpFarmCP"
