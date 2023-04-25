# syntax=docker/dockerfile:1
#imgae
FROM python:3.8-slim-buster 

WORKDIR /python-docker
#install requirements for python apps (describes needed Modules,... couldnt add them in CMD)
ENV FLASK_APP=app.py
#accept from all Ip addresses!
ENV FLASK_RUN_HOST=0.0.0.0

#RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
#'expose to host containe to access Flask container'
EXPOSE 5000

COPY . .
#Run command and use copuple ENV Variable
CMD ["flask", "run"]