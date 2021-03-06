FROM java:jre 
RUN apt-get update
RUN apt-get install -y libxt6 libxrender1
RUN apt-get clean
WORKDIR /tmp
RUN wget https://jaist.dl.sourceforge.net/project/openofficeorg.mirror/4.1.4/binaries/zh-CN/Apache_OpenOffice_4.1.4_Linux_x86_install-deb_zh-CN.tar.gz
RUN tar xf Apache_OpenOffice_4.1.4_Linux_x86_install-deb_zh-CN.tar.gz
WORKDIR /tmp/zh-CN/DEBS
RUN dpkg -i *.deb
WORKDIR /opt/openoffice4/program
RUN rm -rf /tmp/zh-CN /tmp/Apache_OpenOffice_4.1.4_Linux_x86_install-deb_zh-CN.tar.gz
RUN useradd -ms /bin/bash soffice
USER soffice EXPOSE 8100 CMD ./soffice -headless -accept="socket,host=0.0.0.0,port=8100;urp;" -nofirststartwizard
