import codecs
import json
from pathlib import Path


class Utils:
    JSON_FOLDER = "./jsons/"
    JSON_NAME = "model_data.json"

    @classmethod
    def save_json(cls, data: dict):
        Path(cls.JSON_FOLDER).mkdir(parents=True, exist_ok=True)

        with codecs.open(cls.JSON_FOLDER + cls.JSON_NAME, "w", encoding='utf8') as outfile:
            json.dump(data, outfile, ensure_ascii=False)
    
    @classmethod
    def load_json(cls, path):
        file = open(path, encoding='utf-8')
        data = json.load(file)
        file.close()

        return data