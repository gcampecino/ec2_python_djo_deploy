FROM python:3.10
WORKDIR /app
COPY requirements.txt requirements.txt
RUN python3.10 -m venv env
RUN pip3 install -r requirements.txt

RUN apt-get update && \
    apt-get install -y sqlite3


RUN sqlite3 --version

COPY . .
EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]