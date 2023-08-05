import os
import pickle

from sklearn.linear_model import LinearRegression
import pandas as pd

def training(df, target_name):
    X = df.drop(columns=[target_name])
    y = df[target_name]
    model = LinearRegression()
    model.fit(X, y)

    return model

if __name__ == '__main__':
    target_name = os.getenv("TARGET_NAME", "target")
    df = pd.read_feather("./data/train.feather")
    model = training(df, target_name)
    with open("./data/model.pkl", "wb") as f:
        pickle.dump(model, f)
