FROM wowzamedia/wowza-streaming-engine-linux:4.7.7

COPY ./wowza/conf/Server.xml /usr/local/WowzaStreamingEngine-4.7.7/conf/

COPY ./wowza/conf/VHost.xml /usr/local/WowzaStreamingEngine-4.7.7/conf/
RUN chown wowza:wowza /usr/local/WowzaStreamingEngine-4.7.7/conf/VHost.xml && \
    chmod 775 /usr/local/WowzaStreamingEngine-4.7.7/conf/VHost.xml

COPY ./wowza/conf/webrtc/Application.xml /usr/local/WowzaStreamingEngine-4.7.7/conf/webrtc/
RUN chown -R wowza:wowza /usr/local/WowzaStreamingEngine-4.7.7/conf/webrtc && \
    chmod -R 775 /usr/local/WowzaStreamingEngine-4.7.7/conf/webrtc

RUN mkdir /usr/local/WowzaStreamingEngine-4.7.7/applications/webrtc && \
    chown -R wowza:wowza /usr/local/WowzaStreamingEngine-4.7.7/applications/webrtc && \
    chmod -R 775 /usr/local/WowzaStreamingEngine-4.7.7/applications/webrtc

ENTRYPOINT /sbin/entrypoint.sh
