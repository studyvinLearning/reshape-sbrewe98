# Use data(federalistPapers, package='syllogi') to get the federalist paper data
# Create a data frame that has paper number, author, journal, date
# Determine the day of the week that each paper was published.
# Get the count of papers by day of the week and author
# create a new data frame that has authors as column names and dates of publication as the values

data(federalistPapers, package = 'syllogi')
class(federalistPapers)
lapply(federalistPapers, class)
lapply(federalistPapers, str) # see number, author, journal, and date for each paper

# Call new data frame 'fed' and include number, author, journal, and date for each paper
fed <- data.frame(number = 1:85,
                  author = federalistPapers$author,
                  journal = federalistPapers$journal,
                  date = as.Date(federalistPapers$date, format = "%Y-%m-%d")) # mismatch of number of rows?

# Why is the above code not working? The federalist papers seemed to load in fine.
print(nrow_author <- nrow(federalistPapers$author)) # NULL rows
print(nrow_journal <- nrow(federalistPapers$journal)) # NULL rows
print(nrow_date <- nrow(as.Date(federalistPapers$date, format = "%Y-%m-%d"))) # NULL rows

# So do I need to do something to the list before I can make the things into a dataframe?
lapply(federalistPapers, head) ## OK WHAT
names(federalistPapers)

authors <- federalistPapers$author ### I don't understand why everything is returning null!!!

federalistPapers$author[85] # test -- Still null 

    ### Try doing it in a loop?

# Initialize empty data frame
fed <- data.frame(Paper = numeric(0), Author = character(0), Journal = character(0), Date = character(0))

# Iterate over each paper
for (i in 1:86) {
  # Extract information for each paper
  paper_info <- c(number = i,
                  author = federalistPapers$author[i],
                  journal = federalistPapers$journal[i],
                  date = federalistPapers$date[i])
  
  # Append the information to the data frame
  fed <- rbind(fed, paper_info)
}

# Convert the 'Date' column to Date class
fed$date <- as.Date(fed$date, format = "%Y-%m-%d")

# Print the resulting data frame
print(fed)

##### This also isn't working, and I genuinely have no idea why and I don't know how to do the remaining 
    # stuff if I can't work with the dataset :(







