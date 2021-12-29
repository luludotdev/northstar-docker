FROM archlinux

RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm wget vulkan-icd-loader vulkan-swrast wine winetricks xorg-server-xvfb mesa && \
  mkdir Titanfall2

COPY launch.sh /
RUN chmod +x launch.sh

ENTRYPOINT ["/launch.sh"]
