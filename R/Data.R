#' Lovinkhoeve Experimental Farm, conventional practice
#'
#' Energy flux carbon-based model of the Lovinkhoeve Experimental Farm (Marknesse, the Netherlands),
#' conventional practice (soil).
#' Includes flow matrix, biomasses, assimilation and growth efficiencies.
#'
#' @format A named list with 5 elements:
#' \describe{
#' \item{\code{type}}{"EF" because it is an energy flux model}
#' \item{\code{FM}}{Square flow matrix with named sources (rows) and sinks (columns).
#' Unit is kg C ha-1 yr-1.}
#' \item{\code{BM}}{Named numeric vector with biomasses of all compartments.
#' Unit is kg C ha-1.}
#' \item{\code{AE}}{Named numeric vector with assimilation efficiencies of all compartments.
#' Fractions. If AE is not relevent (i.e. detritus and roots) the value is set to NA.}
#' \item{\code{GE}}{Named numeric vector with growth efficiencies of all compartments.
#' Fractions. If GE is not relevent (i.e. detritus and roots) the value is set to NA.}
#' \item{\code{MR}}{Named numeric vector with mortality rates of all compartments.
#' Unit is yr-1.}
#' }
#' @references \itemize{
#' \item{de Ruiter, P.C., Van Veen, J.A., Moore, J.C., Brussaard, L., Hunt, H.W., 1993.
#' Calculation of nitrogen mineralization in soil food webs. Plant Soil 157, 263–273.
#' https://doi.org/10.1007/BF00011055}
#' \item{de Ruiter, P.C., Neutel, A.M., Moore, J.C., 1995. Energetics,
#' Patterns of Interaction Strengths, and Stability in Real Ecosystems. Science (80-. ).
#' 269, 1257–1260. https://doi.org/10.1126/science.269.5228.1257}
#' }
#' @details The model was used by de Ruiter et al. (1993) to model nitrogen mineralization rates.
#' This data comes from soil resulted from conventional farming practice. This package also
#' includes the same food web model with data of soil resulting from integrated farming;
#' meaning reduced input of inorganic fertilizer, pesticides, and soil tillage.
#' \cr
#' \cr
#' Annual feeding rates are calculated as \eqn{\frac{MR * BM + P}{AE * GE}}, where MR is natural mortality rate
#' (yr-1), BM is biomass (kg C ha-1), P is death rate due to predation (kg C ha-1 yr-1),
#' AE is assimilation rate i.e. assimilated carbon per unit consumed carbon,
#' GE is growth (production) efficiency i.e. biomass-C production per unit assimilated carbon.
#' Therefore, in this model, excretion and respiration flows are not explicitly modeled, but
#' are included in the feeding rates.
#' \cr
#' \cr
#' Physiological values used in this food web are largely similar to physiological values
#' used in other soil food webs.
#' @seealso LovinkhoeveExpFarmIF
"LovinkhoeveExpFarmCP"
