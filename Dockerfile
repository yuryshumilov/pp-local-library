FROM python:3.9-slim

WORKDIR /opt/local-library

COPY . . 

RUN pip3 install -r requirements.txt

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
RUN python3 manage.py collectstatic
RUN python3 manage.py test 

CMD python3 manage.py runserver 0.0.0.0:8000