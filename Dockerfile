FROM python:3.7.0-stretch

# Ignore debconf: delaying package configuration, since apt-utils is not installed
ENV DEBCONF_NOWARNINGS yes
ENV APP_ROOT /home/robot

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    pip install --upgrade pip && \
    pip install robotframework

WORKDIR ${APP_ROOT}

CMD ["robot", "--outputdir", "reports", "suites"]
