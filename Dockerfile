FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget unzip gcc-multilib
WORKDIR /usr/
RUN wget https://github.com/pawn-lang/compiler/releases/download/v3.10.10/pawnc-3.10.10-linux.tar.gz -O -| tar -xz --strip-components 1
WORKDIR /home/
RUN wget http://files.sa-mp.com/samp037_svr_R2-1-1_win32.zip
RUN unzip samp037_svr_R2-1-1_win32.zip -d samp
RUN cp /home/samp/pawno/include/* /usr/include/
RUN cp /home/samp/include/* /usr/include/
RUN rm -rf /home/*

ENTRYPOINT ["pawncc"]
