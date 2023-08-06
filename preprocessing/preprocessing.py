import os
import sys

import pandas as pd
from sklearn.model_selection import train_test_split

def preprocessing(file):
    df = pd.read_csv(file)
    df = df.dropna()
    df = df.drop_duplicates()

    for col in df.columns:
        if df[col].dtype == "object":
            df[col] = df[col].replace(
                {v: i for i, v in enumerate(df[col].unique())}
            )

    return df

if __name__ == '__main__':
    train_size = float(os.getenv("TRAINING_SIZE", 1))
    file = sys.argv[1]
    df = preprocessing(file)

    if train_size == 1:
        train = df
    else:
        train, test = train_test_split(df, train_size=train_size)
    train = train.reset_index()
    train.to_feather("/data/train.feather")