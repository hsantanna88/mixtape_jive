### JIVE example in the mixtape.

#libraries used
library(haven)
library(tidyverse)
library(SteinIV)

#the dataset
judge <- read_dta("https://storage.googleapis.com/causal-inference-mixtape.appspot.com/judge_fe.dta")

#building the function arguments
y <- judge %>% 
  pull(guilt)

X_min <- judge %>% 
  mutate(bailDate = as.numeric(bailDate)) %>% 
  select(jail3, day, day2, day3, t1, t2, t3, t4, t5, t6, bailDate)

Z <- judge %>%
  select(starts_with("judge_pre"))

Z <- as.matrix(Z)
X_min <- as.matrix(X_min)

#the function itself (from SteinIV)
jive.est(y, X_min, Z)

#-- Trying to solve for this dataset gives the following error:
#
#-- Error in solve.default(XXj) : 
#--   system is computationally singular: reciprocal condition number = 6.1421e-25
