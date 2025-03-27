{ config, pkgs, ... }:

{
  home.file.".config/wofi/config".text = ''
    mode=drun
    allow_images=true
    image_size=30
    prompt= Search
    columns=1
    width=300
    height=600
    no_actions=true
    monitor=DP-1
    location=center
    colors=colors
    filter_rate=100
    allow_markup=true
    halign=fill
    orientation=vertical
    content_halign=fill
    matching=contains
    insensitive=true
    term=kitty
    parse_search=true
    allow_markup=true
    single_click=false
    line_wrap=char
    key_down=Down
    key_forward=Right
    monitor=auto
  '';

  home.file.".config/wofi/style.css".text = '' 
    * {
      border: none;
      box-shadow: none;
      outline: none;
    }

    window {
      font-size: 14px;
      background-color: transparent;
      border-radius: 0px;
      opacity: 1.0;
      padding: 10px 10px 10px 10px;
    }

    #outer-box {
      margin: 10px 10px 10px 10px;
      opacity: 1.0;
      background: rgba(30, 30, 30, 255);
    }

    #inner-box {
      background: rgba(0, 0, 0, 255);
      margin: 0px;
      opacity: 1.0;
    }

    #entry {
      padding: 5px 10px;
      /* border-radius: 20px; */
    }

    #entry #text {
      padding: 0px 0px 0px 10px;
      font-weight: normal;
      color: white;
    }

    #entry:selected {
      background-color: rgba(100, 100, 100, 255);
    }

    #entry:selected #text {
      padding: 0px 0px 0px 10px;
      font-weight: normal;
    }

    #input {
      background: rgba(30, 30, 30, 255);
      margin: 0px 5px 0px 20px;
      padding: 5px;
      color: white;
    }

    #image {
      margin-left: 20px;
      margin-right: 20px;
    }

    #scroll {
      margin: 0px;
    }
  '';
}
