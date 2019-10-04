## Lovinkhoeve Experimental Farm - integrated farming

# Compartment names
compartments = c(
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
BM = c(
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
MR = c(
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


# Flow matrix kg C ha-1 yr-1

# Create model list
LovinkhoeveExpFarmIF <- list(
  type = "EF",
  FM = FM,
  BM = BM,
  AE = AE,
  GE = GE,
  MR = MR
)

usethis::use_data(LovinkhoeveExpFarmIF, overwrite = TRUE)
