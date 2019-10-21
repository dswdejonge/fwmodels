#' Lovinkhoeve Experimental Farm
#'
#' Carbon-based energy flux models of the soil food web at the Lovinkhoeve Experimental Farm
#' (Marknesse, the Netherlands) for both conventional practice and integrated farming.
#' Includes flow matrix, biomasses, assimilation and growth efficiencies, and natural
#' death rates.
#'
#' @name Lovinkhoeve
#' @format A named list with 6 elements:
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
#' \item{Hunt, H.W., Coleman, D.C., Ingham, E.R., Ingham, R.E., Elliott, E.T., Moore, J.C.,
#' Rose, S.L., Reid, C.P.P., Morley, C.R.I., 1987. The detrital food web in a shortgrass prairie.
#'  Biol 3, 57–68.}
#' \item{Zwart, K.B., Burgers, S.L.G.E., Bloem, J., Bouwman, L.A., Brussaard, L., Lebbink, G.,
#' Didden, W.A.M., Marinissen, J.C.Y., Vreeken-Buijs, M.J., de Ruiter, P.C., 1994.
#' Population dynamics in the belowground food webs in two different agricultural systems.
#' Agric. Ecosyst. Environ. 51, 187–198.
#' https://doi.org/https://doi.org/10.1016/0167-8809(94)90043-4}
#' }
#' @details The soil food web at the Lovinkhoeve Experimental Farm was constructed for
#' farming according to conventional practice (CP) and for integrated farming practice (IF),
#' the latter meaning reduced input of inorganic fertilizer, pesticides, and soil tillage.
#' The flow values for \code{LovinkhoeveCP2} are taken from the figure in de Ruiter et al. (1995),
#' whereas the flow values for \code{LovinkhoeveCP} are calculated from the given data by
#' top-down balancing. The flow matrices are very similar, but not exactly equal, probably
#' due to rounding errors. The flow values for \code{LovinkhoeveIF} are calculated with
#' top-down balancing. The model \code{LovinkhoeveCP_noDet} is simply the \code{LovinkhoeveCP}
#' excluding the detritus compartments.
#' \cr
#' \cr
#' Annual feeding rates are calculated as
#' \eqn{F = \frac{MR * BM + P}{AE * GE}},
#' where MR is natural mortality rate #' (yr-1),
#' BM is biomass (kg C ha-1),
#' P is death rate due to predation (kg C ha-1 yr-1),
#' AE is assimilation rate i.e. assimilated carbon per unit consumed carbon,
#' GE is growth (production) efficiency i.e. biomass-C production per unit assimilated carbon.
#' Feeding rates per prey type i (if there are multiple) is
#' \eqn{Fi = \frac{Wi * BMi}{\sum_{j=1}^{n}{Wj * BMj}} * F},
#' where Wi is the preference for prey type i relative to other prey types, and
#' n is the number of prey types.
#' \cr
#' \cr
#' The model is then solved by top-down mass-balancing, starting at the top of the food chain
#' where no predation occurs, then sequentially moving down the food web to compartments for
#' which predation rates have been determined.
#' Therefore, in this model, excretion and respiration flows are not explicitly modeled, but
#' are included in the feeding rates.
#' \cr
#' \cr
#' Physiological values used in this food web are largely similar to physiological values
#' used in other soil food webs. Feeding preference values are taken from Hunt et al. 1987.
#' Biomasses for detritus and roots could not be retraced in literature, so the biomass values
#' as reported in the figure in de Ruiter et al. (1995), are used for both the conventional
#' practice and integrated farming model.
NULL

#' @rdname Lovinkhoeve
"LovinkhoeveCP"

#' @rdname Lovinkhoeve
"LovinkhoeveCP_noDet"

#' @rdname Lovinkhoeve
"LovinkhoeveCP2"

#' @rdname Lovinkhoeve
"LovinkhoeveIF"

#' @rdname Lovinkhoeve
"LovinkhoeveIF_noDet"


#' Antarctic Tundra
#'
#' Material-flux networks of a dry moss turf community (Antarctic dry tundra) and a wet moss
#' carpet commnity (Antarctic wet tundra) at Signy Island (one of the South Orkney Islands).
#' Includes flow matrix, biomasses, assimilation and growth efficiencies, and natural
#' death rates.
#'
#' @name Antarctic_tundra
#' @format A named list with 7 elements:
#' \describe{
#' \item{\code{type}}{"EF" because it is an energy flux model}
#' \item{\code{FM}}{Square flow matrix with named sources (rows) and sinks (columns).
#' Unit is mg DM m-2 yr-1.}
#' \item{\code{BM}}{Named numeric vector with biomasses of all compartments.
#' Unit is mg DM m-2.}
#' \item{\code{AE}}{Named numeric vector with assimilation efficiencies of all compartments.
#' Fractions. If AE is not relevent the value is set to NA.}
#' \item{\code{GE}}{Named numeric vector with growth efficiencies of all compartments.
#' Fractions. If GE is not relevent the value is set to NA.}
#' \item{\code{MR}}{Named numeric vector with mortality rates of all compartments.
#' Unit is yr-1.}
#' \item{code{representative_taxa}}{Taxonomic groups that are representative for the corresponding
#' trophic groups.}
#' }
#' @references \itemize{
#' \item{Davis, R.C., 1981. Structure and Function of Two Antarctic Terrestrial Moss
#' Communities. Ecol. Monogr. 51, 125–143. https://doi.org/10.2307/2937260}
#' \item{Neutel, A.M., Thorne, M.A.S., 2014. Interaction strengths in balanced carbon cycles
#' and the absence of a relation between ecosystem complexity and stability.
#' Ecol. Lett. 17, 651–661. https://doi.org/10.1111/ele.12266
#' }
#' \item{Heal, O.W. & MacLean, S.F. (1975). Comparative productivity in ecosystems -
#' secondary productivity. In: Unifying Concepts in Ecology. (eds Van Dobben, W.H. &
#' Lowe-McConnell, R.H.). Dr. W. Junk, The Hague, pp. 89–108.}
#' \item{Hunt, H.W., Coleman, D.C., Ingham, E.R., Ingham, R.E., Elliott, E.T., Moore, J.C.,
#' Rose, S.L., Reid, C.P.P., Morley, C.R.I., 1987. The detrital food web in a shortgrass prairie.
#'  Biol 3, 57–68.}
#' }
#' @details Two food web models are available for the Antarctic tundra: a dry moss turf
#' community (\code{Antarctic_tundra_dry}) and a wet moss carpet community
#' (\code{Antarctic_tundra_wet}).
#' It is a material flux network, with fluxes in the unit milligram dry mass per square meter
#' per year (mg DM m-2 yr-1). Conversion from material to energy fluxes was heavility dependent
#' on assumptions and broad extrapolation, and therefore not undertaken.
#' The data for these models was collected on Signy Island, South Orkney Islands.
#' The communities are relatively simple networks with poorly developed trophic structure.
#' The compartments (n = 23 for dry, and n = 18 for wet tundra) are trophic groups, but tend
#' towards single species dominance. Therefore, a list with corresponding representative taxa
#' is also included.
#' \cr
#' \cr
#' The food web model is constructed as in Neutel & Thorne (2014), with data taken from their
#' supplementary material or from the original source in literature.
#' All fluxes are inferred from measured respiration rates, collected over multiple years
#' (Davis 1981), generalized conversion efficiencies (Heal & Maclean 1975, Hunt et al. 1987),
#' and feeding preferences (Davis 1981).
#' Some feeding preferences were not provided by Davis (1981), in which case
#' specific assumptions were made and tested for ecosystem stability (details in supplementary
#' material of Neutel & Thorne 2014).
#' All consumers feed on detritus, algae, moss, or other consumers. Faecal material, exuviae,
#' and carcasses from all organisms flow back into the detritus compartment. The moss and algae
#' compartments are not seen as consumer compartments in this food web model.
#' \cr
#' \cr
#' Consumption rates per consumer (Qj, mg DM m-2 yr-2) was calculated as
#' $Q_j = \frac{R_j}{a_j(1-p_j)}$,
#' where Rj is annual respiration of the consumer, a is the assimilation efficiency, and
#' p is the production efficiency.
#' \cr
#' \cr
#' Consumption of resource i by consumer j (Fij) was calculated using diet proportions:
#' $Fij = pijQj$, where pij is the diet proportion of i in the diet of j. The given diet
#' proportions in Neutel & Thorne (2014) did not always exactly add up to one.
#' In those cases rounding error were assumed and fixed before calculating the consumption fluxes.
#' \cr
#' \cr
#' Feedback back to detritus was the sum of egestion and non-predatory mortality of all
#' consumers.
#' Egestion is $E_{ij} = (1-a_j)*F_{ij}$
#' Mortality is $M_j = a_j * p_j * F_{ij} - F_{ji}$
#' \cr
#' \cr
#' The mortality rate \code{MR} is calculated as the mortality flow divided by the biomass.
NULL

#' @rdname Antarctic_tundra
"Antarctic_tundra_dry"

#' @rdname Antarctic_tundra
"Antarctic_tundra_wet"


