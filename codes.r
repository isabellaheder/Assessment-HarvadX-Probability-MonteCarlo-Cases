library(gtools)
library(tidyverse)

# CREATED IN RSTUDIO
# FROM EXERCISE 4 YOU NEED TO USE THE ESOPH DATASET --> in RStudio

# You will find EXPLANATION of the codes in the PDF 

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
nrow(esoph)

all_cases <- sum(esoph$ncases)
all_cases

all_controls <- sum(esoph$ncontrols)
all_controls

# 4 
# A
head(esoph$alcgp)

esoph %>%
dplyr::filter(alcgp== "120+") %>%
summarize(ncases = sum(ncases), ncontrols = sum(ncontrols)) %>%
mutate(p_case = ncases / (ncases + ncontrols)) %>%
pull(p_case)

# B

esoph %>%
dplyr::filter(alcgp== "0-39g/day") %>%
summarize(ncases = sum(ncases), ncontrols = sum(ncontrols)) %>%
mutate(p_case = ncases / (ncases + ncontrols)) %>%
pull(p_case)

# C
smoke_case <- esoph %>%
dplyr::filter(tobgp != "0-9g/day") %>%
pull(ncases) %>%
sum()
smoke_case / all_cases

# D
smoke_case <- esoph %>%
dplyr::filter(tobgp != "0-9g/day") %>%
pull(ncontrols) %>%
sum()
smoke_case / all_controls

# 5
# A
highest_alc <- subset(esoph, alcgp== "120+")
highest_alc_cases <- sum(highest_alc$ncases)
highest_alc_cases

all_cases

45/200

# B
highest_tab <- subset(esoph, tobgp== "30+")
highest_tab_cases <- sum(highest_tab$ncases)
highest_tab_cases

31/200

# C
highest_tab_alc <- subset(esoph, tobgp== "30+" & alcgp== "120+")
highest_tab_alc_cases <- sum(highest_tab_alc$ncases)
highest_tab_alc_cases

10/200

# D
highest_tab_or_alc_cases <- highest_alc_cases + highest_tab_cases- highest_tab_alc_cases
highest_tab_or_alc_cases

66/200

# 6
# A
high_alc_controls <- esoph %>%
dplyr::filter(alcgp== "120+") %>%
pull(ncontrols) %>%
sum()
p_control_high_alc <- high_alc_controls/all_controls
p_control_high_alc

# B
high_tob_controls <- esoph %>%
dplyr::filter(tobgp== "30+") %>%
pull(ncontrols) %>%
sum()
p_control_high_tob <- high_tob_controls/all_controls
p_control_high_tob

# C
high_alc_tob_controls <- esoph %>%
dplyr::filter(alcgp== "120+" & tobgp== "30+") %>%
pull(ncontrols) %>%
sum()
p_control_high_alc_tob <- high_alc_tob_controls/all_controls
p_control_high_alc_tob

# D
p_control_either_highest <- p_control_high_alc + p_control_high_tob- p_control_high_alc_tob
p_control_either_highest

# E
0.33 / p_control_either_highest