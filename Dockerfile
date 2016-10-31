FROM vromero/activemq-artemis
COPY docker-entrypoint-with-jmx.sh /
EXPOSE 1098
EXPOSE 1099
ENTRYPOINT ["/docker-entrypoint-with-jmx.sh"]
CMD ["artemis-server"]
