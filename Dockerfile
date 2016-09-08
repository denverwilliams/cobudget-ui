FROM node

RUN apt-get update
RUN apt-get -y install vim 
RUN apt-get -y install sudo 
RUN useradd -m -s /bin/bash cobudget
RUN echo "cobudget ALL=(root) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/cobudget
WORKDIR /home/cobudget
USER cobudget
RUN git clone -b dockerv2 https://gitlab.ii.org.nz/cobudget/cobudget-ui.git
WORKDIR /home/cobudget/cobudget-ui
RUN npm install bower
RUN npm install 
