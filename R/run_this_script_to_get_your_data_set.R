# You only need to run this once to generate your data
# Then save it to file

# Add you numeric student number here
your_student_number = 35696699 

# Load the packages 
if(!require("randomNames"))  
  install.packages("randomNames")

library(tidyverse)
library(randomNames)

# Load the function 
source("R/create_your_unique_dataset.R")

# Load the data
warning("Data read takes a while to read in")
loan_data <- readRDS("raw_data/loanData.rds")

# Create your own data for the assignment
your_loan_data <- create_your_unique_dataset(
  loan_data = loan_data, 
  student_number = your_student_number)

# Save your loan data
saveRDS(your_loan_data, "data/your_loan_data")

# After you save your data clear everything from your R memory
rm(list = ls())
