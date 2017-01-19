# run 'docker build -t dftogether:1.0.0 .' in the directory of the docker file to init. this will make a docker instance that you can run named 'dftogether'
FROM ubuntu:14.04.3
ADD . /dftogether
WORKDIR /dftogether
RUN   sudo apt-get update
RUN   sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0 libsdl-image1.2 libsdl-sound1.2 libsdl-ttf2.0-0 git xorg x11vnc nodejs wget -y \
   && wget http://www.bay12games.com/dwarves/df_43_05_linux.tar.bz2 \
   && tar xf df_43_05_linux.tar.bz2 \
   && git clone https://github.com/kanaka/noVNC \
   && mv df-bootscript df_linux/df \
   && mv xorg.conf Xorg.conf \
   && chmod +x df_linux/df

CMD ["/dftogether/df_linux/df"]
