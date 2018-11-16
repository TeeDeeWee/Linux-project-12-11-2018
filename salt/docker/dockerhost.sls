install_docker_repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
    - key_url: https://download.docker.com/linux/ubuntu/gpg

install_docker:
  pkg.installed:
    - name: docker-ce
    - version: 17.06.0~ce-0~ubuntu
    - required:
      - pkgrepo: install_docker_repo

install_pip:
  pkg.installed:
    - name: python-pip

    