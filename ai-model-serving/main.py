from fastapi import FastAPI
import torch

app = FastAPI()

model = torch.load('model.pth')

@app.get("/predict")
async def predict(data: str):
    # Placeholder for prediction logic
    return {"prediction": "anomaly"}
