## Lovinkhoeve Experimental Farm - integrated farming
source("top_down_balancing.R")

# Raw data from literature.
# *************************

# Compartment names
compartments <- c(
  "Detritus",
  "Roots",
  "Fungi",
  "Bacteria",
  "Phytophagous_nematodes",
  "Collembola",
  "Cryptostigmatic_mites",
  "Noncryptostigmatic_mites",
  "Fungivorous_nematodes",
  "Enchytraeids",
  "Bacteriophagous_nematodes",
  "Flagellates",
  "Bacteriophagous_mites",
  "Amoebae",
  "Predatory_nematodes",
  "Nematophagous_mites",
  "Predatory_collembola",
  "Predatory_mites"
)

# Biomasses kg C ha-1
BM <- c(
  2500, #????
  300, #?????
  3.27,
  245,
  0.35,
  0.38,
  0.003,
  0.04,
  0.13,
  0.21,
  0.36,
  0.63,
  0.0003,
  18.9,
  0.06,
  0.006,
  0.008,
  0.08
)

# Mortalities year-1
MR <- c(
  NA,
  1.00,
  1.20,
  1.20,
  1.08,
  1.84,
  1.20,
  1.84,
  1.92,
  5.00,
  2.68,
  6.00,
  1.84,
  6.00,
  3.00,
  1.84,
  1.84,
  1.84
)

# Assimilation efficiency
AE <- c(
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
GE <- c(
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
W.nem_nem <- 1000
W.protozoa_nem <- 10
W.bac_nem <- 1
W.arthro_mite <- 2
W.nem_mite <- 1
W.none <- 1

PM <- matrix(
  0,
  nrow = length(compartments),
  ncol = length(compartments),
  byrow = T
)
rownames(PM) <- compartments
colnames(PM) <- compartments
if(T){
  PM["Detritus", "Fungi"]                 <- W.none
  PM["Detritus", "Bacteria"]              <- W.none
  PM["Roots", "Phytophagous_nematodes"]   <- W.none
  PM["Fungi", "Collembola"]               <- W.none
  PM["Fungi", "Cryptostigmatic_mites"]    <- W.none
  PM["Fungi", "Noncryptostigmatic_mites"] <- W.none
  PM["Fungi", "Fungivorous_nematodes"]    <- W.protozoa_nem
  PM["Fungi", "Enchytraeids"]             <- W.protozoa_nem
  PM["Detritus", "Enchytraeids"]          <- W.none
  PM["Bacteria", "Enchytraeids"]          <- W.protozoa_nem
  PM["Bacteria", "Bacteriophagous_nematodes"] <- W.bac_nem
  PM["Bacteria", "Flagellates"]           <- W.none
  PM["Bacteria", "Bacteriophagous_mites"] <- W.none
  PM["Bacteria", "Amoebae"]               <- W.none
  PM["Bacteriophagous_nematodes", "Predatory_nematodes"] <- W.nem_nem
  PM["Bacteria", "Predatory_nematodes"]                  <- W.bac_nem
  PM["Flagellates", "Predatory_nematodes"]               <- W.protozoa_nem
  PM["Flagellates", "Amoebae"]                           <- W.none
  PM["Amoebae", "Predatory_nematodes"]                   <- W.protozoa_nem
  PM["Phytophagous_nematodes", "Predatory_mites"]        <- W.nem_mite
  PM["Phytophagous_nematodes", "Predatory_collembola"]   <- W.none
  PM["Phytophagous_nematodes", "Nematophagous_mites"]    <- W.nem_mite
  PM["Phytophagous_nematodes", "Predatory_nematodes"]    <- W.nem_nem
  PM["Collembola", "Predatory_mites"]                    <- W.arthro_mite
  PM["Cryptostigmatic_mites", "Predatory_mites"]         <- W.arthro_mite
  PM["Noncryptostigmatic_mites", "Predatory_mites"]      <- W.arthro_mite
  PM["Fungivorous_nematodes", "Predatory_mites"]         <- W.nem_mite
  PM["Fungivorous_nematodes", "Predatory_collembola"]    <- W.none
  PM["Fungivorous_nematodes", "Nematophagous_mites"]     <- W.nem_mite
  PM["Fungivorous_nematodes", "Predatory_nematodes"]     <- W.nem_nem
  PM["Bacteriophagous_mites", "Predatory_mites"]         <- W.arthro_mite
  PM["Bacteriophagous_nematodes", "Predatory_mites"]     <- W.nem_mite
  PM["Bacteriophagous_nematodes", "Predatory_collembola"] <- W.none
  PM["Bacteriophagous_nematodes", "Nematophagous_mites"] <- W.nem_mite
  PM["Predatory_nematodes", "Predatory_mites"]           <- W.nem_mite
  PM["Predatory_nematodes", "Predatory_collembola"]      <- W.none
  PM["Predatory_nematodes", "Nematophagous_mites"]       <- W.nem_mite
  PM["Nematophagous_mites", "Predatory_mites"]           <- W.arthro_mite
  PM["Predatory_collembola", "Predatory_mites"]          <- W.arthro_mite
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
#FM[,"Detritus"] <- (1-AE)*colSums(FM) + MR*BM
toDetritus <- detritusFeedback(FM=FM, AE=AE, BM=BM, MR=MR)
FM[,"Detritus"] <- rowSums(toDetritus, na.rm = T)

# What fraction of each flow to detritus is excretion?
frac <- matrix(0, dim(FM)[1], dim(FM)[2])
colnames(frac) <- colnames(FM) ; rownames(frac) <- rownames(FM)
frac[,"Detritus"] <- toDetritus[,"excretion"] / FM[,"Detritus"]
frac[which(is.nan(frac))] <- 0
dead <- list(
  names = "Detritus",
  frac = frac
)


# Bundle model data in named lists
# *******************************
LovinkhoeveIF <- list(
  type = "EF",
  FM = FM,
  BM = BM,
  AE = AE,
  GE = GE,
  MR = MR,
  dead = dead
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
