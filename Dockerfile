FROM ubuntu:18.04

ENV HOME /root
ENV PATH $HOME/.poetry/bin:$PATH

WORKDIR /root

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y apt-utils && \
    apt-get install -y build-essential && \
    apt-get install -y curl python3.7 python3.7-dev python3.7-distutils git && \
    rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3.7 /usr/bin/python
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN git clone https://github.com/ghost242/website.git

WORKDIR /root/website

EXPOSE 5000

CMD ["poetry shell", "python3 website/app.py"]
