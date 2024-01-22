FROM cm2network/steamcmd:root

# USER root
# RUN apt update -y && apt install vim -y


USER steam

WORKDIR /home/steam/steamcmd

RUN mkdir -p /home/steam/palworld/Pal/Saved

COPY entrypoint.sh /home/steam/steamcmd/entrypoint.sh


USER root

RUN chown steam:steam /home/steam/steamcmd/entrypoint.sh
RUN chmod +x /home/steam/steamcmd/entrypoint.sh


USER steam

EXPOSE 8211/udp

VOLUME ["/home/steam/palworld"]

ENTRYPOINT ["/home/steam/steamcmd/entrypoint.sh"]


