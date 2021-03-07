FROM debian:bullseye-slim

# Basic configuration of the user - orthoxp/orthoxp
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y  sudo\
        python3 python3-pip  && \
	useradd --password 'orthoxp' orthoxp &&\
	adduser orthoxp sudo && \
	mkdir -p /home/orthoxp /Ortho4XP &&\
	chown -R orthoxp:orthoxp /home/orthoxp /Ortho4XP

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y  sudo\
        python3 python3-pip python3-requests python3-numpy python3-pyproj python3-gdal \
        python3-shapely python3-rtree python3-pil python3-pil.imagetk p7zip-full libnvtt-bin \
    && apt-get autoclean -y && apt-get autoremove -y && apt-get clean -y &&\
	rm -rf /var/lib/apt/lists/*

# Do not use root user to build the files..
USER orthoxp
COPY . /Ortho4XP/

WORKDIR /Ortho4XP

ENV PYTHONIOENCODING=UTF-8

ENTRYPOINT ["./Ortho4XP_v130.py"]
