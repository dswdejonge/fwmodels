## Antarctic Tundra - wet

# Raw data from literature.
# *************************

# Compartment names
compartments <- c(
  "Carnivorous_nematodes",
  "Carnivorous_tardigrades",
  "Omnivorous_nematodes",
  "Fungivorous_nematodes",
  "Bacterivorous_nematodes",
  "Omnivorous_collembola",
  "Omnivorous_rotifers",
  "Omnivorous_tardigrades",
  "Herbivorous_Microbivorous_protozoa",
  "Herbivorous_tardigrades",
  "Detritivorous_tardigrades",
  "Detritivorous_rotifers1",
  "Detritivorous_rotifers2",
  "Bacteria",
  "Fungi",
  "Mosses_Lichens_Liverworts",
  "Algae",
  "Detritus"
)
representative_taxa <- c(
  "Coomansus_gerlachei",
  "Macrobiotus_furgicer",
  "Eudorylaimus_sp.",
  "Aphelenchoides_haguei",
  "Plectus_antarcticus",
  "Cryptopygus_antarcticus",
  "Monogononta",
  "Echiiniscus_capillatus",
  "Sarcodina",
  "Hypsibius_dujardini",
  "Hypsibius_alpinus",
  "Adineta",
  "other_Bdelloidea",
  "Bacteria",
  "Fungi",
  "Polytrichum_alpestre_and_Chorisondontum_aciphyllum_(mosses)_Cephaloziella_varians_and_Barbilophozoia_hatchery_(liverworts)",
  "Algae",
  "Detritus"
)

# Biomasses mg Dry Mass m-2
BM = c(
  3.8,
  7.2,
  41.3,
  1.7,
  13.8,
  55.5,
  0.3,
  28.7,
  1660,
  28.7,
  28.7,
  24.5,
  9.1,
  4.42,
  0.49,
  180000,
  1200,
  29600000
)

# Assimilation efficiency
AE <- c(
  0.8,
  0.8,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  0.3,
  1,
  1,
  NA,
  NA,
  NA
)

# Growth efficiency
GE <- c(
  0.3,
  0.3,
  rep(0.4, 13),
  NA,
  NA,
  NA
)

# Total feeding rate consumers (mg DM m-2 yr-1)
Qj <- c(
  16.6,
  155.9,
  677.2,
  201.1,
  721.7,
  1033.33,
  6.5,
  829.3,
  291666.7,
  829.26,
  829.26,
  530.8,
  197.15,
  695691.05,
  38200,
  0,
  0,
  0
)
names(BM) <- compartments
names(AE) <- compartments
names(GE) <- compartments
names(Qj) <- compartments

# Proportion of resource in diet consumer.
PM <- matrix(
  0,
  nrow = 23,
  ncol = 23
)
if(T){
  PM[4, 2]   <- 0.727
  PM[5, 2]   <- 0.0299
  PM[5, 3]   <- 0.0154
  PM[5, 4]   <- 0.0114
  PM[6, 2]   <- 0.243
  PM[6, 3]   <- 0.125
  PM[6, 4]   <- 0.092
  PM[7, 1]   <- 0.94
  PM[9, 3]   <- 0.259
  PM[10, 1]  <- 0.04
  PM[11, 1]  <- 0.02
  PM[12, 4]  <- 0.111
  PM[13, 4]  <- 0.0001
  PM[15, 3]  <- 0.259
  PM[16, 3]  <- 0.259
  PM[17, 8]  <- 0.09
  PM[18, 3]  <- 0.08
  PM[18, 8]  <- 0.243
  PM[19, 4]  <- 0.319
  PM[19, 6]  <- 1
  PM[19, 8]  <- 0.3
  PM[19, 9]  <- 0.3
  PM[19, 12] <- 0.95
  PM[19, 13] <- 0.95
  PM[20, 4]  <- 0.036
  PM[20, 5]  <- 1
  PM[20, 7]  <- 0.26
  PM[20, 8]  <- 0.033
  PM[20, 9]  <- 0.033
  PM[20, 10] <- 0.1
  PM[20, 11] <- 0.05
  PM[21, 4]  <- 0.214
  PM[21, 9]  <- 0.33
  PM[22, 4]  <- 0.0014
  PM[22, 7]  <- 0.18
  PM[22, 8]  <- 0.333
  PM[22, 9]  <- 0.0022
  PM[22, 10] <- 0.9
  PM[22, 11] <- 0.95
  PM[22, 12] <- 0.05
  PM[22, 14] <- 1
  PM[22, 15] <- 1
  PM[23, 4]  <- 0.215
  PM[23, 7]  <- 0.56
  PM[23, 9]  <- 0.33
  PM[23, 13] <- 0.05
  PM[23, 16] <- 1
  PM[23, 17] <- 1
  PM[23, 18] <- 1
  PM[23, 19] <- 1
  PM[23, 20] <- 1
}
PM <- PM[-c(1,10,11,13,14),-c(1,10,11,13,14)]
rownames(PM) <- compartments
colnames(PM) <- compartments


# Model functions that result in final flow matrix
# ***********************************************

# Calculate feeding rates with diet proportions and total feeding rates
# Flow matrix mg DM m-2 yr-1
getFeedingRates <- function(Qj, PM) {
  FM <- t(t(PM) * Qj)
  return(FM)
}

# Egestion of all compartments: (1-AE)*Fij
getEgestion <- function(FM, AE) {
  egestion <- (1-AE)*colSums(FM, na.rm = T)
  return(egestion)
}

# Mortality of all compartments: AE*GE*Fij - Fji
getMortality <- function(FM, AE, GE) {
  mortality <- AE*GE*colSums(FM, na.rm = T) - rowSums(FM, na.rm = T)
  return(mortality)
}

FM <- getFeedingRates(Qj, PM)
egestion <- getEgestion(FM, AE)
mortality <- getMortality(FM, AE, GE)
FM[,"Detritus"] <- egestion + mortality


# Calculate mortality rates
# *************************
# Mortality rate (yr-1) is mortality (mg DM m-2 yr-1) divided by biomass (mg DM m-2)
MR <- mortality / BM

# Bundle model data in named lists
# *******************************
Antarctic_tundra_wet <- list(
  type = "EF",
  FM = FM,
  BM = BM,
  AE = AE,
  GE = GE,
  MR = MR,
  representative_taxa = representative_taxa,
  PM = PM,
  functions = list(
    getFeedingRates = getFeedingRates,
    getEgestion = getEgestion,
    getMortality = getMortality
  )
)

usethis::use_data(Antarctic_tundra_wet, overwrite = TRUE)
