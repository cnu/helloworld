FROM python:3.8.5

ENV PYTHONDONTWRITEBYTECODE 1
ENV FLASK_APP "hello.py"
ENV FLASK_ENV "development"
ENV FLASK_DEBUG True

RUN mkdir /app
WORKDIR /app

COPY Pip* /app/

RUN pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --dev --system --deploy --ignore-pipfile

ADD . /app

EXPOSE 5000

CMD flask run --host=0.0.0.0