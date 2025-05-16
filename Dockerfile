FROM python:3.10.6-slim-buster
WORKDIR /app
COPY requirements.txt requirements.txt
RUN python3.10 -m venv env
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]