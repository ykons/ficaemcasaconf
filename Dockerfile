FROM adoptopenjdk:8-jre-openj9

RUN mkdir -p /usr/local/app

COPY target/*.jar /usr/local/app/app.jar

ENV JAVA_APP_OPTS="\
  -Djava.security.egd=file:/dev/./urandom \
  -Dfile.encode=UTF-8 \
  -Xms16m \
  -Xmx6G \
  -XX:ReservedCodeCacheSize=360m \
  -XX:+UseG1GC \
  -XX:G1HeapRegionSize=2 \
  -XX:MaxGCPauseMillis=100 \
  -XX:+UseStringDeduplication \
  -ea \
  -XX:+HeapDumpOnOutOfMemoryError \
  -XX:-OmitStackTraceInFastThrow \
  -server \
  -Xshareclasses:allowClasspaths,name=SpringBoot \
  -Xquickstart \
  -Xtune:virtualized \
  -Xscmx1G \
  -Xaggressive \
  -XX:+UseLWPSynchronization \
  -XX:+UseCompressedStrings \
  -XX:+AggressiveOpts \
  -XX:+OptimizeStringConcat \
  -XX:+UseFastAccessorMethods \
"

ENTRYPOINT [ "sh", "-c", "java $JAVA_APP_OPTS $JAVA_OPTS -jar /usr/local/app/app.jar" ]
