FROM debian
RUN apt-get update && apt-get install -y procps curl boinc-client

COPY start.sh /start.sh
RUN chmod 777 /start.sh

COPY check.py /check.py
COPY global_prefs_override.xml /etc/boinc-client/global_prefs_override.xml
RUN chmod 777 /check.py

RUN echo $(grep $(hostname) /etc/hosts | cut -f1) fakehostname >> /etc/hosts && /bin/bash -c "source /start.sh"

CMD ["sleep", "600000000"]