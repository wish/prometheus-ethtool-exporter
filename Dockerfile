FROM alpine:3.13

RUN apk add --no-cache python3 ethtool py3-pip
RUN ln -s /usr/sbin/ethtool /sbin/ethtool
RUN pip install prometheus_client==0.9.0 
COPY ethtool-exporter.py /ethtool-exporter.py
EXPOSE 9417

CMD ["python3", "/ethtool-exporter.py", "-l", "0.0.0.0:9417"]
