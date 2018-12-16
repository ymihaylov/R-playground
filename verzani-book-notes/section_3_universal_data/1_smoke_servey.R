# Data can be of three basic types: 
# categorical, discrete numeric and continuous numeric.

# We often view categorical data with tables 
# but we may also look at the data graphically
# with bar graphs or pie charts.

# Smoking servey
smoke_servey = c("Yes", "No", "No", "Yes", "Yes")

table(smoke_servey) # Show frequency

factor(smoke_servey) # Prints different types of categorical data
