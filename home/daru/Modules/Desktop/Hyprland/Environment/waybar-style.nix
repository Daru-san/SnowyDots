{config, ...}:{
# Waybar styling
  programs.waybar.style = ''
* {
border: none;
border-radius: 0px;
font-family: Jetbrains Mono Nerd Font;
font-size: 16px;
min-height: 0;
}

window#waybar {
background: rgba(17,27,27,1);
}

#workspaces {
background: #25353a;
margin: 5px 5px;
padding: 5px 5px;
border-radius: 16px;
color: #cba6f7
}
#workspaces button {
padding: 0px 5px;
margin: 0px 3px;
border-radius: 16px;
color: transparent;
background: rgba(17,24,24,1);
transition: all 0.3s ease-in-out;
}

#workspaces button.active {
background-color: #89f4fa;
color: #11111B;
border-radius: 16px;
min-width: 50px;
background-size: 400% 400%;
transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
background-color: #f5f5f5;
color: #11111B;
border-radius: 16px;
min-width: 50px;
background-size: 400% 400%;
}

#tray, #pulseaudio, #network, #battery, #cpu, #memory, #bluetooth{
background: #25353a;
font-weight: bold;
margin: 5px 0px;
}
#tray, #pulseaudio, #network, #battery, #cpu, #memory, #bluetooth{
color: #f5f5f5;
border-radius: 10px 24px 10px 24px;
padding: 0 20px;
margin-left: 7px;
}
#cpu,#network { 
padding: 0 5px 0 20px;
border-radius: 10px 0px 0px 24px;
}
#memory, #bluetooth {
border-radius: 0 24px 10px 0;
margin-left: 0
}
#clock {
color: #f5f5f5;
background: #25353a;
border-radius: 24px 10px 24px 10px;
padding: 0 20px;
margin-left: 7px;
margin: 5px 7px;
font-weight: bold;
}
#custom-launcher {
color: #89b4fa;
background: #25353a;
border-radius: 0px 20px 20px 0px;
margin: 5px 7px 5px 0px;
padding: 0px 35px 0px 15px;
font-size: 30px;
}
#custom-notification {
color: #89b4fa;
background: #25353a;
border-radius: 40px 0px 0px 40px;
margin: 5px 0px 5px 7px;
padding: 0px 15px 0px 15px;
}

#custom-playerctl {
background: #25353a;
color: #f5f5f5;
padding: 0 20px;
border-radius: 24px 10px 24px 10px;
margin: 5px 0;
font-weight: bold;
}
'';
}
