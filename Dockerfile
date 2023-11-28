## Stage 1

FROM ubuntu:latest AS builder
WORKDIR /resumeProject
COPY src/ .

## Stage 2

# Creating an image for ubuntu 
FROM ubuntu:latest

# Create a new directory within the image
WORKDIR /home
RUN mkdir -p /home/resumeProject

#Copy and setting permission
COPY --from=builder /resumeProject/resumeScript.bash /home/resumeProject/

# installing pandoc on the other machine if needed
RUN apt-get update && apt-get install -y pandoc

# Adding a work directory to give permission 
WORKDIR /home/resumeProject

# Make the script executable to run it by giving permissions
RUN chmod +x resumeScript.bash && ./resumeScript.bash

# Command for the script to run
CMD ["./resumeScript.bash"] 