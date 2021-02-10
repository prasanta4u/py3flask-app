# Test web-app using Phtyon Flask on Alpine to build Docker Image
# Linux Arm664 (aarch64), X86 , and X86_64
FROM alpine

LABEL maintainer="prasanta.kumar@outlook.com"

# Install python and pip
RUN apk add --update py3-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 8080

# run the application
CMD ["python3", "/usr/src/app/app.py"]

