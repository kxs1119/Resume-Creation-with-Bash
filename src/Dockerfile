# Setting up docker for transport to others
# Creating image from mac enviorment
FROM appdynamics/sample-app-rest AS builder
WORKDIR /resumeProject
COPY . .
RUN chmod +x resumeScript.bash && ./resumeScript.bash

# Creating an image for ubuntu 
FROM ubuntu:22.10

# Create a new directory within the image
RUN mkdir -p /Desktop/resumeProject
WORKDIR /resumeProject

#Copy and setting permission
COPY --from=builder /resumeProject/resumeScript.bash .
# Command for the script to run
CMD ["./resumeScript.bash"]