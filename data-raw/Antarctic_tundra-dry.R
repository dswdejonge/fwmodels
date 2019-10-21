## Antarctic Tundra - dry
source("top_down_balancing.R")

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
representative_taxa = c(
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

# Biomasses mg Dry Mass m2
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
  .5,
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
AE = c(
  NA,
  NA,
  1.00,
  1.00,
  0.25,
  0.50,
  0.50,
  0.50,
  0.38,
  0.25,
  0.60,
  0.95,
  0.50,
  0.95,
  0.50,
  0.90,
  0.50,
  0.60
)

# Growth efficiencies
GE = c(
  NA,
  NA,
  0.30,
  0.30,
  0.37,
  0.35,
  0.35,
  0.35,
  0.37,
  0.40,
  0.37,
  0.40,
  0.35,
  0.40,
  0.37,
  0.35,
  0.35,
  0.35
)
# Name vectors
names(BM) <- compartments
names(MR) <- compartments
names(AE) <- compartments
names(GE) <- compartments


# Preference in feeding matrix
PM <- matrix(
  0,
  nrow = length(compartments),
  ncol = length(compartments)
)
rownames(PM) <- compartments
colnames(PM) <- compartments
if(T){
  PM[4, 2]   <- 0.436
  PM[5, 2]   <- 0.0693
  PM[5, 3]   <- 0.0297
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
  PM[18, 8]  <- 216
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
  PM[21, 9]  <- 0.33
  PM[22, 4]  <- 0.0026
  PM[22, 7]  <- 0.12
  PM[22, 8]  <- 0.333
  PM[22, 9]  <- 0.005
  PM[22, 10] <- 0.9
  PM[22, 11] <- 0.95
  PM[22, 12] <- 0.05
  PM[22, 14] <- 1
  PM[22, 15] <- 1
  PM[23, 4]  <- 0.2
  PM[23, 7]  <- 0.414
  PM[23, 9]  <- 0.33
  PM[23, 13] <- 0.05
  PM[23, 16] <- 1
  PM[23, 17] <- 1
  PM[23, 18] <- 1
  PM[23, 19] <- 1
  PM[23, 20] <- 1
}


# Calculate feeding rates with top-down balancing
# ***********************************************
# Flow matrix kg C ha-1 yr-1
FM <- topDownBalancing(PM, MR, BM, AE, GE)



# Calculate feedback to detritus
# ******************************

# Excretion and mortality back into detritus are modeled implicitely,
# but useful to include in the Flow matrix as flows from compartments
# back into detritus.
# Feedback to detritus is excretion (1-AE)*consumption plus mortality MR * BM.
FM[,"Detritus"] <- (1-AE)*colSums(FM) + MR*BM




# Bundle model data in named lists
# *******************************
LovinkhoeveIF <- list(
  type = "EF",
  FM = FM,
  BM = BM,
  AE = AE,
  GE = GE,
  MR = MR
)
# Exclude detritus for simpler model
LovinkhoeveIF_noDet <- list(
  type = "EF",
  FM = FM[-1,-1],
  BM = BM[-1],
  AE = AE[-1],
  GE = GE[-1],
  MR = MR[-1]
)

usethis::use_data(LovinkhoeveIF, overwrite = TRUE)
usethis::use_data(LovinkhoeveIF_noDet, overwrite = TRUE)
