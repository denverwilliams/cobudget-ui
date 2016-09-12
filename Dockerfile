FROM node

RUN useradd -m -s /bin/bash cobudget
USER cobudget
WORKDIR /home/cobudget
RUN git clone -b Docker_updates https://gitlab.ii.org.nz/ii/cobudget-ui.git
WORKDIR /home/cobudget/cobudget-ui
RUN npm install bower
RUN npm install

RUN chmod +x entry.sh

ENTRYPOINT ["entry.sh"]

EXPOSE 8080
EXPOSE 9000