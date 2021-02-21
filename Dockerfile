FROM python:3.8

RUN apt update
RUN apt install -y cron

RUN pip3 install requests discord

RUN useradd -m tradebot

USER tradebot
WORKDIR /home/tradebot

RUN git clone https://github.com/gsakis/mfl-tradebot --branch 0.1.0

WORKDIR /home/tradebot/mfl-tradebot

USER root

COPY startup.sh /home/tradebot/mfl-tradebot/startup.sh
RUN chmod +x /home/tradebot/mfl-tradebot/startup.sh

CMD /home/tradebot/mfl-tradebot/startup.sh

