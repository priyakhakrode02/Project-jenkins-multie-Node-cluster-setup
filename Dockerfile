FROM centos:7

RUN yum update -y
RUN yum install -y git wget openssh-server
RUN yum install -y shadow-utils-2:4.9-12.amzn2023.0.2.x86_64

RUN wget https://download.oracle.com/java/17/archive/jdk-17.0.9_linux-x64_bin.rpm
RUN yum install -y jdk-17.0.9_linux-x64_bin.rpm

RUN echo 'root:redhat'  | chpasswd

RUN ssh-keygen -A
RUN /usr/sbin/sshd

CMD ["/usr/sbin/sshd", "-D"]
