## Antarctic Tundra - dry

# Raw data from literature.
# *************************

# Compartment names
compartments <- c(
  "Predatory_mites",
  "Carnivorous_nematodes",
  "Carnivorous_tardigrades",
  "Omnivorous_nematodes",
  "Fungivorous_nematodes",
  "Bacterivorous_nematodes",
  "Omnivorous_collembola",
  "Omnivorous_rotifers",
  "Omnivorous_tardigrades",
  "Herbivorous_Microbivorous_mites1",
  "Herbivorous_Microbivorous_mites2",
  "Herbivorous_Microbivorous_protozoa",
  "Detritivorous_Microbivorous_protozoa",
  "Herbivorous_mites",
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
  "Gamasellus_racovitzai",
  "Coomansus_gerlachei",
  "Macrobiotus_furgicer",
  "Eudorylaimus_sp.",
  "Aphelenchoides_haguei",
  "Plectus_antarcticus",
  "Cryptopygus_antarcticus",
  "Monogononta",
  "Echiiniscus_capillatus",
  "Eupodes_minutus",
  "Ereynetes_macquariensis",
  "Sarcodina",
  "Mastigophora",
  "Nanorchestes_antarcticus",
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
  5.9,
  0.2,
  9.2,
  13.1,
  2,
  15,
  224.9,
  5.3,
  12.6,
  1.7,
  1,
  1240,
  1.5,
  0.5,
  12.6,
  12.6,
  6.9,
  13.1,
  50.8,
  5.6,
  604000,
  8400,
  33500000
)

# Assimilation efficiency
AE <- c(
  0.8,
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
  1,
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
  0.3,
  rep(0.4, 17),
  NA,
  NA,
  NA
)

# Total feeding rate consumers (mg DM m-2 yr-1)
Qj <- c(
  50.2,
  0.7,
  27.9,
  232.2,
  186.1,
  775.6,
  6622,
  197,
  409.8,
  275,
  158.3,
  182222,
  16000,
  54.4,
  409.8,
  409.8,
  256,
  486,
  537300,
  59700,
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
  nrow = length(compartments),
  ncol = length(compartments)
)
rownames(PM) <- compartments
colnames(PM) <- compartments
if(T){
  PM[4, 2]   <- 0.436
  PM[5, 2]   <- 0.069 #0.0693
  PM[5, 3]   <- 0.030 #0.0297
  PM[5, 4]   <- 0.0139
  PM[6, 2]   <- 0.495
  PM[6, 3]   <- 0.218
  PM[6, 4]   <- 0.102
  PM[7, 1]   <- 0.94
  PM[9, 3]   <- 0.188
  PM[10, 1]  <- 0.04
  PM[11, 1]  <- 0.02
  PM[12, 4]  <- 0.084
  PM[13, 4]  <- 0.0001
  PM[15, 3]  <- 0.188
  PM[16, 3]  <- 0.188
  PM[17, 8]  <- 0.118
  PM[18, 3]  <- 0.188
  PM[18, 8]  <- 0.216
  PM[19, 4]  <- 0.359
  PM[19, 6]  <- 1
  PM[19, 8]  <- 0.3
  PM[19, 9]  <- 0.3
  PM[19, 12] <- 0.95
  PM[19, 13] <- 0.95
  PM[20, 4]  <- 0.04
  PM[20, 5]  <- 1
  PM[20, 7]  <- 0.465
  PM[20, 8]  <- 0.033
  PM[20, 9]  <- 0.033
  PM[20, 10] <- 0.1
  PM[20, 11] <- 0.05
  PM[21, 4]  <- 0.198
  PM[21, 9]  <- 0.331
  PM[22, 4]  <- 0.003 #0.0026
  PM[22, 7]  <- 0.12
  PM[22, 8]  <- 0.333
  PM[22, 9]  <- 0.005
  PM[22, 10] <- 0.9
  PM[22, 11] <- 0.95
  PM[22, 12] <- 0.05
  PM[22, 14] <- 1
  PM[22, 15] <- 1
  PM[23, 4]  <- 0.2
  PM[23, 7]  <- 0.415 #0.414
  PM[23, 9]  <- 0.331
  PM[23, 13] <- 0.05
  PM[23, 16] <- 1
  PM[23, 17] <- 1
  PM[23, 18] <- 1
  PM[23, 19] <- 1
  PM[23, 20] <- 1
}


# Calculate feeding rates with diet proportions
# *********************************************
# Flow matrix mg DM m-2 yr-1
FM <- t(t(PM) * Qj)


# Calculate feedback to detritus
# ******************************

# Egestion and mortality back into detritus.
# Egestion is (1-AE)*Fij
egestion <- (1-AE)*colSums(FM, na.rm = T)
# Mortality is AE*GE*Fij - Fji
mortality <- AE*GE*colSums(FM, na.rm = T) - rowSums(FM, na.rm = T)
FM[,"Detritus"] <- egestion + mortality

# Calculate mortality rates
# *************************
# Mortality rate (yr-1) is mortality (mg DM m-2 yr-1) divided by biomass (mg DM m-2)
MR <- mortality / BM

# Bundle model data in named lists
# *******************************
Antarctic_tundra_dry <- list(
  type = "EF",
  FM = FM,
  BM = BM,
  AE = AE,
  GE = GE,
  MR = MR
)
# Exclude detritus for simpler model
#LovinkhoeveIF_noDet <- list(
#  type = "EF",
#  FM = FM[-1,-1],
#  BM = BM[-1],
#  AE = AE[-1],
#  GE = GE[-1],
#  MR = MR[-1]
#)

usethis::use_data(Antarctic_tundra_dry, overwrite = TRUE)
#usethis::use_data(LovinkhoeveIF_noDet, overwrite = TRUE)
