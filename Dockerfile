
FROM archlinux
# Based on https://github.com/WhyNotHugo/docker-makepkg/blob/master/Dockerfile
RUN useradd -m notroot
RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Sy --noconfirm base-devel git tmux && \
    pacman -Syu --noconfirm

RUN echo "notroot ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/notroot

USER notroot
WORKDIR /home/notroot

RUN mkdir .gnupg && \
    echo "keyserver-options auto-key-retrieve" > .gnupg/gpg.conf \
    gpg --recv-key 74460D32B80810EBA9AFA2E962394C698C2739FA

RUN git clone https://aur.archlinux.org/ncdc.git && \
    cd ncdc && \
    makepkg --noconfirm --syncdeps --rmdeps --install --clean
COPY .ncdc/ .
EXPOSE 4242
VOLUME ["/home/notroot/.ncdc/dl", "/home/notroot/.ncdc/inc", "/mnt/share"]
ENTRYPOINT ["tmux", "new-session", "/usr/bin/ncdc"]


