{ config, pkgs, ... }: {
  programs.mpv = {
  enable = true;

  config = {
    vo = "gpu";
    gpu-api = "vulkan";
    hwdec = "auto-safe";

    profile = "gpu-hq";
    cache = true;
    cache-secs = 300;

    ytdl-format = "bestvideo+bestaudio";

    osc = true;
    osd-bar = true;

    keep-open = true;
    save-position-on-quit = true;

    volume = 80;
    audio-normalize-downmix = true;
  };
};
}