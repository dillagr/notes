## ensure that pandas dataframe has no duplicates
assert len(df[df.index.duplicated()]) == 0, "Dataframe has duplicates"
