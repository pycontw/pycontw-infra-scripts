FROM python:3.8.13-slim

RUN apt-get update && apt-get -y install git

RUN git clone https://github.com/finlaysawyer/discord-uptime.git

WORKDIR /discord-uptime

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "bot.py"]
