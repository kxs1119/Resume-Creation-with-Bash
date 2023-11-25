# Stage 1: Building from the "appdynamics/sample-app-rest" image
FROM appdynamics/sample-app-rest as builder
WORKDIR /resumeProject
COPY . .
RUN ./resumeScript.bash

# Stage 2: Creating image based on Ubuntu
FROM ubuntu:latest
WORKDIR /resumeProject

# Copy the script directly from the build context
COPY resumeScript.bash .

# Set permissions for the script
RUN chmod +x resumeScript.bash

# Define the default command to run the script
CMD ["./resumeScript.bash"]
