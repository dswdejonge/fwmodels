context("Top-down balancing is done right")

test_that("Lovinkhoeve figure values are same as calculated.", {
  expect_equal(consumptionRate(1.84, 0.0635, 0, 0.6, 0.35), (1.84 * 0.0635) / (0.6 * 0.35))
  expect_equal(FM, FM2)
})
