FROM ubuntu

COPY resumeScript.bash /resumeScript.bash

RUN chmod +x /resumeScript.bash

CMD ["/resumeScript.bash"]
