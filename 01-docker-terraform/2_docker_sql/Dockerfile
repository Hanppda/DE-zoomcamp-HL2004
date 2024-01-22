FROM python:3.9.1

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2

#Copy file from current working directory to directory inside the container
WORKDIR /app
COPY ingest_data.py ingest_data.py 

#Specify default executable.
ENTRYPOINT [ "python", "ingest_data.py" ]