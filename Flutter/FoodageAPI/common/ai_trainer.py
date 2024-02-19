import io
import json
from pathlib import Path

from fastapi import UploadFile
from keras.models import Sequential, load_model
from keras.layers import Dense, Dropout
import numpy as np
import pandas as pd

from .utils import Utils


class AITrainer:
    MODEL_FOLDER = "./ai_models/"
    MODEL_NAME = "model.keras"

    @classmethod
    async def train(cls, csv_file: UploadFile, food_names: dict, save: bool = False):
        df = pd.read_csv(io.StringIO((await csv_file.read()).decode('utf-8')), sep=';')

        data = np.transpose(df.iloc[:-1,1:].values)
        total = df.iloc[-1][1:].values
        food_names = food_names or {'all': df[df.columns[0]].values.tolist()}

        X = np.asarray(data).astype(np.float32)
        Y = np.asarray(total).astype(np.float32)

        model = Sequential()
        model.add(Dense(512, activation='relu'))
        model.add(Dropout(0.5))
        model.add(Dense(256, activation='relu'))
        model.add(Dropout(0.25))
        model.add(Dense(1))
        model.compile(optimizer='Adam',
                    loss='mean_absolute_error',
                    metrics=['RootMeanSquaredError'])
        model.fit(X, Y, batch_size=16, epochs=500)

        if save:
            cls.save_model(model)
            Utils.save_json(food_names)

        return model

    @classmethod
    def save_model(cls, model: Sequential):
        Path(cls.MODEL_FOLDER).mkdir(parents=True, exist_ok=True)

        model.save(cls.MODEL_FOLDER + cls.MODEL_NAME)

    @classmethod
    def test(cls, food_names):
        """
        [[1., 0., 0., 0., 0., 0., 0., 0., 0., 1., 0., 0., 0., 0., 0., 0.,
        0., 0., 1., 0., 0., 0., 0., 0., 0.]]
        """
        model: Sequential = load_model(cls.MODEL_FOLDER + cls.MODEL_NAME)

        prediction_list = cls.food_names_to_pred_list(food_names)
        data = np.array(prediction_list)

        pred = model.predict(data)
        return pred
    
    @classmethod
    def food_names_to_pred_list(cls, food_names):
        pred_list = []
        all_names = Utils.load_json(path=Utils.JSON_FOLDER + Utils.JSON_NAME)['all']

        for name in all_names:
            if name in food_names:
                pred_list.append(1.)
            else:
                pred_list.append(0.)

        return [pred_list]
