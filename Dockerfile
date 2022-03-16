FROM centos:7

# Install Python
RUN yum update -y \
 && yum install -y \
    python3-pip \
    python3-devel

#Set the working directory in the Docker container
WORKDIR /code

#Copy the dependencies file to the working directory
COPY requirements.txt .

#Install the dependencies
RUN pip3 install -r requirements.txt

#Copy the Flask app code to the working directory
COPY src/ .

#Run the container
CMD [ "python3", "./sample_app.py" ]