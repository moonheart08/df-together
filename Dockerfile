# run 'docker build -t dftogether:1.0.0 .' in the directory of the docker file to init. this will make a docker instance that you can run named 'dftogether'
FROM node:7.4.0
RUN   sudo apt-get install ia32-libs libsdl-image1.2 libsdl-sound1.2 libsdl-ttf2.0-0 git xorg x11vnc \
   && wget http://www.bay12games.com/dwarves/df_43_05_linux.tar.bz2 \
   && tar xf df_43_05_linux.tar.bz2 \
   && git clone git://github.com/kanaka/noVNC \ #grab noVNC
   && git clone https://github.com/moonheart08/df-together.git \ #Recursive! ok not really, its grabbing some important files.
   && mv df-together/df-bootscript df_linux/df \
   && mv df-together/xorg.conf Xorg.conf \
   && mv df-together/passwd passwd 
   
CMD ["~/df_linux/df"]

