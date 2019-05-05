FROM wowzamedia/wowza-streaming-engine-linux:4.7.7

COPY ./wowza/conf/Server.xml /usr/local/WowzaStreamingEngine-4.7.7/conf/

COPY ./wowza/conf/VHost.xml /usr/local/WowzaStreamingEngine-4.7.7/conf/
RUN chown wowza:wowza /usr/local/WowzaStreamingEngine-4.7.7/conf/VHost.xml && \
    chmod 775 /usr/local/WowzaStreamingEngine-4.7.7/conf/VHost.xml

ENTRYPOINT /sbin/entrypoint.sh
