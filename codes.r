library(gtools)
library(tidyverse)

# CREATED IN RSTUDIO
# FROM EXERCISE 4 YOU NEED TO USE THE ESOPH DATASET --> in RStudio

# EXERCISE 1
# A
medals <- permutations(8,3)
nrow(medals)

# B
jamaica <- permutations(3, 3)
nrow(jamaica)

# C
nrow(jamaica)/nrow(medals)

# D - MONTE CARLO
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "UK", "France", "Ireland", "Italy")
set.seed(1)
B <- 10000
monte_carlo <- replicate(B, {
winners <- sample(runners, 3, replace = FALSE)
all(winners== "Jamaica")})
mean(monte_carlo)


# EXERCISE 2
# A
6 * nrow(combinations(6,2)) * 2

# B and C
6 * 15 * 3
6 * 20 * 3

# D
n_entrees <- function(N) {
result <- 15 * 3 * N
result }
N <- seq(1, 12)
n_entrees_apply <- sapply(N, n_entrees)
n_entrees_apply

# E
side_choices <- function(n) {
6 * nrow(combinations(n, 2)) * 3 }
meals <- sapply(2:12, side_choices)
meals

# EXERCISES 3,4,5 and 6
# DATASET "ESOPH" in RStudio!

# 3