FROM node:12
#-slim

RUN  apt-get update 
     # Install latest chrome dev package, which installs the necessary libs to
     # make the bundled version of Chromium that Puppeteer installs work.
RUN      apt-get install -y wget  --no-install-recommends 
RUN      apt-get install -y gnupg2 
RUN      wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN      sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' 
RUN      apt-get update 
RUN      apt-get install -y google-chrome-unstable --no-install-recommends 
RUN      rm -rf /var/lib/apt/lists/* 
RUN      wget --quiet https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/sbin/wait-for-it.sh 
RUN      chmod +x /usr/sbin/wait-for-it.sh

# Install Puppeteer under /node_modules so it's available system-wide

#ADD package.json
copy package.json .
 
#run rm package-lock.json 
run touch package-lock.json

## Install puppeteer so it's available in the container.
#   RUN npm i puppeteer \
#     # Add user so we don't need --no-sandbox.
#     # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
#     && groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
#     && mkdir -p /home/pptruser/Downloads \
#     && chown -R pptruser:pptruser /home/pptruser \
#     && chown -R pptruser:pptruser /node_modules
# 

# Run everything after as non-privileged user.
# USER pptruser

# just run this after..
#RUN npm install

