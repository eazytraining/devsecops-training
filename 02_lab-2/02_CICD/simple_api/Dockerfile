FROM python:3.8-buster
LABEL maintainer="EAZYTraining" email="eazytrainingfr@gmail.com"
RUN apt update -y && apt install python3-dev libsasl2-dev libldap2-dev libssl-dev -y 
RUN pip3 install flask==2.0.0 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0 Werkzeug==2.0.0 
COPY student_age.py /
VOLUME /data
EXPOSE 5000
CMD [ "python", "./student_age.py" ]
