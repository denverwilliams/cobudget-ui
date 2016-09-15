FROM node

RUN useradd -m -s /bin/bash cobudget
USER cobudget
WORKDIR /home/cobudget
RUN git clone -b docker_updates https://github.com/debiannz/cobudget-ui.git
WORKDIR /home/cobudget/cobudget-ui
RUN npm install bower
RUN npm install

RUN chmod +x entry.sh

ENTRYPOINT ["/home/cobudget/cobudget-ui/entry.sh"]

EXPOSE 8080
EXPOSE 9000
