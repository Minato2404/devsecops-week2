# Mulai dari image Jenkins LTS resmi yang terbaru
FROM jenkins/jenkins:lts-jdk17

# Ganti ke user root untuk bisa menginstal software
USER root

# Instal Docker CLI di dalam image Jenkins
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.gpg https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce-cli

# Tambahkan user 'jenkins' ke grup 'docker' agar bisa menjalankan perintah docker
# (Meskipun kita akan menggunakan socket, ini adalah praktik yang baik)
RUN usermod -aG docker jenkins

# Kembali ke user jenkins untuk keamanan
USER jenkins
