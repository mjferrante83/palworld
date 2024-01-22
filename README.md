# palworld
Custom Palworld Docker implementation.

_**I will not be maintaining this repository. I am not liable for any loss or hardships incurred by utilizing these instructions. Use at your own risk.**_

This was stood for convenience to **A1RM4X** on YouTube (https://www.youtube.com/@A1RM4X) as I told him I had done this and he asked to see my implementation.
This is in no way perfect, I just had a lot of trouble with other Docker implementations for this and thus decided to quickly whip one together myself.
I assume anyone here utilizing these files has a basic understanding of Docker, Linux, networking, etc.

**STEPS:**
- Download files to your host file system and place them in folder
- Create a new folder within the above folder and open up permissions on that folder ```chmod 777 <HOST-FOLDER-EXPOSED-TO-CONTAINER>``` -- you will refer to this folder later to create persistent storage.
- Ensure firewalling on the host and port forwarding on your network gear is setup to allow traffic on Port 8211
- Build the Dockerfile via ```docker build -t <GIVE-THIS-IMAGE-A-NAME> .```
- Once the Dockerfile is built, you could deploy it via ```docker run```, ```docker compose```, or in Swarm Mode with ```docker stack deploy```
  - I run Docker Swarm and have attached a sample Docker Swarm stack file. You could easily extrapolate this file into a ```docker-compose.yml``` file as well.
  - Ensure to replace all <> sections with the appropriate information.

Once the server is operational, the folder you created and modified permissions on earlier will have been populated with your Palworld server files, thus providing your Palworld server persistence. You can access your server's ``PalWorldSettings.ini`` file at the following location within that folder: ``/Pal/Saved/Config/LinuxServer``.

I hope this helps some people. Good luck and have fun!

_**I will not be maintaining this repository. I am not liable for any loss or hardships incurred by utilizing these instructions. Use at your own risk.**_
