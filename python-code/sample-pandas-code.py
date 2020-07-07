## requires: import libraries
# import pandas as pd
# import os
# import csv

## NOTES:
## this aims to count unique values for every column in the dataframe
## uses the column as index, so need to write it with index=True
## uses pipe as separator or delimiter

sample_df = pd.DataFrame()

for col in df.columns.to_list():
	
	## create this directory, if it doesn't exist
    sample_bin = "_explore-directory"
    if not os.path.exists(sample_bin):
        os.makedirs(sample_bin)
    
    ## output file, based on column header
    sample_obj = os.path.join(sample_bin, f"explore-{col}.csv")
    sample_df = pd.DataFrame(df[col].value_counts())
    sample_df.columns = ["count"]
    sample_df.index.name = col
    sample_df.to_csv(sample_obj, index=True, sep="|", quoting=csv.QUOTE_MINIMAL, escapechar="\\")
    ## QUOTE_MINIMAL, QUOTE_ALL, QUOTE_NONE, and QUOTE_NONNUMERIC
    
