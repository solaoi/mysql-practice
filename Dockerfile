FROM mysql:5.7

RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update
RUN apt-get -y install locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

RUN mkdir -p /var/lib/mysql-log/binlog \
    && touch /var/lib/mysql-log/mysql-bin.index \
    && chown -R mysql:mysql /var/lib/mysql-log

RUN echo 'PS1="[\u@mysql \W]$ "' >> ~/.bashrc

COPY mysqld.cnf /etc/mysql/conf.d/mysqld.cnf

EXPOSE 3306
CMD ["mysqld"]
