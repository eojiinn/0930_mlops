FROM amd64/python:3.9-slim

WORKDIR /usr/app

RUN pip install -U pip &&\
    pip install mlflow==1.30.0 pandas scikit-learn "fastapi[all]"

COPY schemas.py schemas.py
COPY inference.py app.py

CMD ["uvicorn", "inference:app", "--host", "0.0.0.0", "--reload"]