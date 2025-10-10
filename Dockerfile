# Mulai dari image Jenkins LTS resmi yang terbaru
FROM jenkins/jenkins:lts-jdk17

# Ganti ke user root untuk bisa menginstal software
USER root

# Instalasi Docker CLI dengan metode resmi terbaru
RUN apt-get update && apt-get install -y ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Tambahkan repository Docker ke daftar sumber Apt
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update

# Instal Docker CLI
RUN apt-get install -y docker-ce-cli

# Kembali ke user jenkins untuk keamanan
USER jenkins
