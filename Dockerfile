FROM	centos:7
EXPOSE	80 22 5666 6556
VOLUME	["/omd/site"]
RUN		rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN		rpm -Uvh https://labs.consol.de/repo/stable/rhel7/x86_64/labs-consol-stable.rhel7.noarch.rpm
RUN		yum clean all
RUN		yum install -y omd
ENV		OMD_ENV prod
RUN		omd create ${OMD_ENV}
RUN		su -c "omd start" ${OMD_ENV}
RUN		su -c "omd config set TMPFS off" ${OMD_ENV}
CMD		/bin/bash