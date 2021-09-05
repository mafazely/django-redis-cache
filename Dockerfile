FROM python:latest

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PIP_NO_CACHE_DIR 1


RUN mkdir /backend
WORKDIR /backend

COPY requirements.txt /backend/

EXPOSE 8000

RUN pip install -r requirements.txt
COPY . /backend/

# RUN python manage.py makemigrations
# RUN python manage.py collectstatic --no-input --clear
# RUN python manage.py migrate

#CMD [ "python3", "./manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT [ "sh", "run.sh" ]