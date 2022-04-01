FROM mysql:8.0.28

ENV MYSQL_ROOT_PASSWORD secret
ENV MYSQL_DATABASE laravel
ENV MYSQL_USER laravel
ENV MYSQL_PASSWORD secret
ENV SERVICE_TAGS dev

RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y bash && \
    apt-get install -y curl &&\
    apt-get install -y libwww-perl &&\
    apt-get install -y git

# Tools for migration
RUN apt-get install -y ssh rsync gawk

#ADD my.cnf /etc/mysql/conf.d/myconf.cnf
#RUN chmod 775 /etc/mysql/conf.d/myconf.cnf

COPY .bashrc /root/.bashrc

RUN mkdir -p /var/log/mysql/ &&\
    chown -R mysql:mysql /var/log/mysql/

# RUN chmod 0444 /etc/mysql/conf.d/myconf.cnf
