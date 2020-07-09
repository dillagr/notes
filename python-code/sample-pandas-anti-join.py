## requires: import libraries
# import pandas as pd

## dfA = pd.DataFrame() <-- define dfA
## dfB = pd.DataFrame() <-- define dfB

## right anti-join
df = pd.merge(dfA, dfB, how="outer", indicator=True)
df[df['_merge'] == "left_only"]

## left anti-join
df = pd.merge(dfA, dfB, how="outer", indicator=True)
df[df['_merge'] == "right_only"]
