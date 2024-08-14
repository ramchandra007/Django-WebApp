
FROM python:3.11

ENV PYTHONUNBUFFERED 1

RUN mkdir /django-sample

WORKDIR /django-sample

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
