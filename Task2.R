# Download and read in the bloodPressure.RDS file
# each row is a person
# blood pressure is measure with two values: systolic and diastolic
# each persons blood pressure was measured every day for a month
# reshape the data to only have 4 columns: person, date, systolic/diastolic, and the value
# fix the date to be in the nice format for R
# calculate the mean diastolic and the mean systolic by the days of the week

blood <- readRDS('bloodPressure.RDS')
head(blood, n = 2)
str(blood)

# Is this data long or wide? Thinking this is wide, so we want to reshape to long so that 
# the categorical variable is systolic or diastolic

blood2 <- reshape(data = blood,
              direction = 'long', 
              varying = c('systolic', 'diastolic'), # wide column names we're taking data from
              v.names = 'value', # new column name for data under wide names
              timevar = 'measure', # new name we give for what was the original column names
              times = c('systolic', 'diastolic')) # outcome values in the new long data
head(blood2) 

## I think I need to somehow break up the way the variables are listed? 
# I'm confused by the structure of this data because the column names seem kind of insane
# I need to break up diastolic/systolic from the date listed and somehow make the date its own column?
# Is this something I can do using regular expressions?
