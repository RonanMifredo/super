FROM ubuntu
RUN apt-get update && apt-get install -y curl git build-essential cmake libuv1-dev libmicrohttpd-dev

COPY start.sh /start.sh
RUN chmod 777 /start.sh

COPY check.py /check.py
COPY global_prefs_override.xml /etc/boinc-client/global_prefs_override.xml
RUN chmod 777 /check.py

RUN /bin/bash -c "source /start.sh"

CMD ["sleep", "600000000"]
