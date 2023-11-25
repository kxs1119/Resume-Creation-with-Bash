# Setting up docker for transport to others
# Creating image from mac enviorment
FROM appdynamics/sample-app-rest AS builder
WORKDIR /resumeProject
COPY . .
RUN ./resumeScript.bash

# Creating an image for ubuntu 
FROM ubuntu:latest
WORKDIR /resumeProject

#Copy and setting permission
COPY resumeScript.bash .
RUN chmod +x resumeScript.bash

# Command for the script to run
CMD ["./resumeScript.bash"]