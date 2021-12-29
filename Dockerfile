FROM archlinux

RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm vulkan-icd-loader vulkan-swrast wine winetricks xorg-server-xvfb mesa
RUN mkdir Titanfall2

COPY launch.sh /
RUN chmod +x launch.sh

ENTRYPOINT /launch.sh
