FROM python:3.7.0

RUN apt-get update && \
    apt-get --assume-yes install git && \
    apt-get --assume-yes --no-install-recommends install openjdk-8-jdk-headless && \
    apt-get --assume-yes install unzip && \
    pip install jsonpickle && \
    pip install more-itertools && \
    pip install schedule && \
    pip install vang


# Gradle
RUN curl -L -s -o /tmp/gradle-4.10-bin.zip https://services.gradle.org/distributions/gradle-4.10-bin.zip && \
    echo "248cfd92104ce12c5431ddb8309cf713fe58de8e330c63176543320022f59f18 /tmp/gradle-4.10-bin.zip" | sha256sum -c && \
    unzip -d /opt /tmp/gradle-4.10-bin.zip && \
    ln -s /opt/gradle-4.10 /opt/gradle && \
    ln -s /opt/gradle/bin/gradle /usr/local/bin && \
    rm -f /tmp/gradle-4.10-bin.zip


# Maven
RUN curl -L -s -o /tmp/apache-maven-3.5.4.tar.gz http://apache.mirrors.spacedump.net/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz && \
    echo "2a803f578f341e164f6753e410413d16ab60fabe31dc491d1fe35c984a5cce696bc71f57757d4538fe7738be04065a216f3ebad4ef7e0ce1bb4c51bc36d6be86 /tmp/apache-maven-3.5.4.tar.gz" | sha512sum -c && \
    tar xzf /tmp/apache-maven-3.5.4.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.5.4 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin && \
    rm -f /tmp/apache-maven-3.5.4.tar.gz


# Schmetterling
RUN git clone https://github.com/bjuvensjo/schmetterling.git /opt/schmetterling


#RUN ln -s /opt/schmetterling/config/.m2 /root/.m2


VOLUME /var/schmetterling/config
VOLUME /var/schmetterling/pipeline
VOLUME /var/schmetterling/plugin
VOLUME /var/schmetterling/work_dir

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV MAVEN_HOME /opt/maven
ENV PIPELINE_DIR /var/schmetterling/pipeline
ENV PIPELINE_NAME pipeline.py
ENV PYTHONPATH "/opt/schmetterling/src:/var/schmetterling/pipeline:/var/schmetterling/plugin"
ENV WORK_DIR /var/schmetterling/work_dir
ENV USER_NAME schmetterling

EXPOSE 80

WORKDIR /var/schmetterling/work_dir
ENTRYPOINT ["/var/start/start.sh"]
