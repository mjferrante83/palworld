# Set the base image
FROM ubuntu:latest

# Install prerequisites
RUN apt update -y && apt dist-upgrade -y && apt install software-properties-common -y
RUN dpkg --add-architecture i386
RUN apt update -y

# Presetting Values for liscence agreement keys using debconf-set-selections
RUN echo steam steam/question select "I AGREE" |  debconf-set-selections 
RUN echo steam steam/license note '' | debconf-set-selections 

# Installing SteamCMD  
RUN apt-get install -y --no-install-recommends steamcmd

# Create symlink for SteamCMD executable in /bin
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

# Make /palworld folder
RUN mkdir -p /palworld

# Create steam user
RUN useradd -m steam

# Provide steam user ownership of /palworld folder
RUN chown -R steam:steam /palworld

# Copy entrypoint.sh from host and make executable
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Change user
USER steam
WORKDIR /

# Expose port 8211
EXPOSE 8211/udp

# Set default command
#ENTRYPOINT ["/bin/sh","-c","sleep infinity"]
ENTRYPOINT ["/entrypoint.sh"]
