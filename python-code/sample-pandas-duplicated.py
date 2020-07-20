## take care of duplicate rows!
duplicated_rows = df.duplicated(keep = "first")
print(f"Removing {duplicated_rows.sum()} rows that are exact duplicates.")
df = df.loc[~duplicated_rows,:]
