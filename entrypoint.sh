#!/bin/bash

# Install Palworld server files to /palworld
steamcmd +force_install_dir "/palworld" +login anonymous +app_update 2394010 validate +quit

# Fix missing directories and libraries
mkdir -p /home/steam/.steam
ln -s /home/steam/.local/share/Steam/steamcmd/linux32 /home/steam/.steam/sdk32
ln -s /home/steam/.local/share/Steam/steamcmd/linux64 /home/steam/.steam/sdk64

# Launch server
/palworld/PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
