import json
import os

from fastapi import FastAPI, File, UploadFile, Request, HTTPException, Form

from common.ai_trainer import AITrainer
from common.utils import Utils

app = FastAPI()


@app.post("/ai/train")
async def train(
    food_names: str = Form(...),
    csv_file: UploadFile = File(...)
):
    await AITrainer.train(csv_file, food_names=json.loads(food_names), save=True)

    return {"message": "Trained."}


@app.post("/ai/test")
async def test(
    food_names: str = Form(...)
):
    try:
        res = AITrainer.test(json.loads(food_names))

        return {"pred": int(res[0][0])}
    except:
        raise HTTPException(status_code=400, detail="Invalid data.")


@app.get("/ai/food_names")
def food_names():
    return Utils.load_json(path=Utils.JSON_FOLDER + Utils.JSON_NAME)


@app.get("/ai/is_trained")
def is_trained():
    return os.path.isfile(AITrainer.MODEL_FOLDER + AITrainer.MODEL_NAME) or False

