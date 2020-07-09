## requires: import libraries
# import pandas as pd

## dfA = pd.DataFrame() <-- define dfA
## dfB = pd.DataFrame() <-- define dfB

## NOTE!
## when "indicator=True" is used, "_merge" column will contain either
##   of these three values: "left_only", "right_only" or "both"

## right anti-join
df = pd.merge(dfA, dfB, how="outer", indicator=True)
df[df['_merge'] == "left_only"]

## left anti-join
df = pd.merge(dfA, dfB, how="outer", indicator=True)
df[df['_merge'] == "right_only"]
