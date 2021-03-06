% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Data.R
\docType{data}
\name{Antarctic_tundra}
\alias{Antarctic_tundra}
\alias{Antarctic_tundra_dry}
\alias{Antarctic_tundra_wet}
\title{Antarctic Tundra}
\format{A named list with the elements:
\describe{
\item{\code{type}}{"EF" because it is an energy flux model}
\item{\code{FM}}{Square flow matrix with named sources (rows) and sinks (columns).
Unit is mg DM m-2 yr-1.}
\item{\code{BM}}{Named numeric vector with biomasses of all compartments.
Unit is mg DM m-2.}
\item{\code{AE}}{Named numeric vector with assimilation efficiencies of all compartments.
Fractions. AE for primary producers is set to 1, and for detritus set to NA.}
\item{\code{GE}}{Named numeric vector with growth efficiencies of all compartments.
Fractions. GE for primary producers is set to 1, and for detritus set to NA.}
\item{\code{G}{Named vector with growth of primary producers. Same unit as FM.}}
\item{\code{MR}}{Named numeric vector with mortality rates of all compartments.
Unit is yr-1.}
\item{\code{dead}}{A names list with the element 'names', that includes a character vector
with all names of non-living compartments (detritus, nutrients, etc.) and the element 'frac', that
includes a named matrix in the same format as FM that includes the fraction of each flow that
solely comprises of excretion (so if 60% of a flux to detritus is excretion, and 40% is mortality,
the value for this flux in the matrix is 0.6)}
\item{\code{representative_taxa}}{Taxonomic groups that are representative for the corresponding
trophic groups.}
\item{\code{Qj}{Named vector with consumption rates for all compartments calculated from respiration measurements.}}
\item{\code{PM}{Square matrix similar to FM with the proportion of each resource (row) in the diet of the consumer (column).}}
\item{\code{functions}{Functions used to derive the flowmatrix.}}
}}
\usage{
Antarctic_tundra_dry

Antarctic_tundra_wet
}
\description{
Material-flux networks (dry mass DM) of a dry moss turf community (Antarctic dry tundra) and a wet moss
carpet commnity (Antarctic wet tundra) at Signy Island, South Orkney Islands.
Includes flow matrix, biomasses, assimilation and growth efficiencies, natural
death rates, and representative taxa.
}
\details{
Two food web models are available for the Antarctic tundra: a dry moss turf
community (\code{Antarctic_tundra_dry}) and a wet moss carpet community
(\code{Antarctic_tundra_wet}).
It is a material flux network, with fluxes in the unit milligram dry mass per square meter
per year (mg DM m-2 yr-1). Conversion from material to energy fluxes was heaviliy dependent
on assumptions and broad extrapolation, and therefore not undertaken.
The data for these models was collected on Signy Island, South Orkney Islands.
The communities are relatively simple networks with poorly developed trophic structure.
The compartments (n = 23 for dry, and n = 18 for wet tundra) are trophic groups, but tend
towards single species dominance. Therefore, a list with corresponding representative taxa
is also included.
\cr
\cr
The food web model is constructed as in Neutel & Thorne (2014), with data taken from their
supplementary material or from the original source in literature.
All fluxes are inferred from measured respiration rates, collected over multiple years
(Davis 1981), generalized conversion efficiencies (Heal & Maclean 1975, Hunt et al. 1987),
and feeding preferences (Davis 1981).
Some feeding preferences were not provided by Davis (1981), in which case
specific assumptions were made and tested for ecosystem stability (details in supplementary
material of Neutel & Thorne 2014).
All consumers feed on detritus, algae, moss, or other consumers. Faecal material, exuviae,
and carcasses from all organisms flow back into the detritus compartment. The moss and algae
compartments are not seen as consumer compartments in this food web model, thus there is no uptake and excretion.
However, they do have a natural mortality rate, which was calculated from their reported growth rates.
\cr
\cr
Consumption rates per consumer (Qj, mg DM m-2 yr-2) was calculated as
$Q_j = \frac{R_j}{a_j(1-p_j)}$,
where Rj is annual respiration of the consumer, a is the assimilation efficiency, and
p is the production efficiency.
\cr
\cr
Consumption of resource i by consumer j (Fij) was calculated using diet proportions:
$Fij = pijQj$, where pij is the diet proportion of i in the diet of j. Note that the given diet
proportions in Neutel & Thorne (2014) do not always exactly add up to one, probably due to rounding.
These small discrepencies were left in the dataset to stay close to the published data.
\cr
\cr
Feedback back to detritus was the sum of egestion and non-predatory mortality of all
consumers.
Egestion is $E_{ij} = (1-a_j)*F_{ij}$
Mortality is $M_j = a_j * p_j * F_{ij} - F_{ji}$
\cr
\cr
The mortality rate \code{MR} is calculated as the mortality flow divided by the biomass.
}
\references{
\itemize{
\item{Davis, R.C., 1981. Structure and Function of Two Antarctic Terrestrial Moss
Communities. Ecol. Monogr. 51, 125–143. https://doi.org/10.2307/2937260}
\item{Neutel, A.M., Thorne, M.A.S., 2014. Interaction strengths in balanced carbon cycles
and the absence of a relation between ecosystem complexity and stability.
Ecol. Lett. 17, 651–661. https://doi.org/10.1111/ele.12266
}
\item{Heal, O.W. & MacLean, S.F. (1975). Comparative productivity in ecosystems -
secondary productivity. In: Unifying Concepts in Ecology. (eds Van Dobben, W.H. &
Lowe-McConnell, R.H.). Dr. W. Junk, The Hague, pp. 89–108.}
\item{Hunt, H.W., Coleman, D.C., Ingham, E.R., Ingham, R.E., Elliott, E.T., Moore, J.C.,
Rose, S.L., Reid, C.P.P., Morley, C.R.I., 1987. The detrital food web in a shortgrass prairie.
 Biol 3, 57–68.}
}
}
\keyword{datasets}
