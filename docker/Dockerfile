FROM ubuntu
ADD init.sh /imageinit/init.sh
ADD entrypoint.sh /imageinit/entrypoint.sh
RUN chmod +x /imageinit/*.sh
RUN /imageinit/init.sh
ENTRYPOINT /imageinit/entrypoint.sh
