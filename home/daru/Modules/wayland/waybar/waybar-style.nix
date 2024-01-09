{config, ...}:{
# Waybar styling
  programs.waybar.style = ''
* {
border: none;
border-radius: 40px;
font-family: Jetbrains Mono Nerd Font;
font-size: 15.5px;
min-height: 0;
}

window#waybar {
background: rgba(40,40,40,0);
}

#workspaces {
background: #212323;
margin: 5px 5px;
padding: 5px 5px;
border-radius: 16px;
}
#workspaces button {
padding: 0px 5px;
margin: 0px 3px;
min-width: 20px;
border-radius: 16px;
color: transparent;
background: rgba(21,24,24,1);
transition: all 0.3s ease-in-out;
}

#workspaces button.focused {
background: #5CA9A9;
color: #000000;
border-radius: 16px;
min-width: 40px;
background-size: 400% 400%;
transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
background-color: #5CA9A9;
color: #000000;
border-radius: 16px;
min-width: 40px;
background-size: 400% 400%;
}

#tray, #pulseaudio, #network, #battery, #cpu, #memory, #bluetooth{
background: rgba(24,28,28,1);
font-weight: bold;
margin: 5px 0px;
}
#tray, #pulseaudio, #network, #battery, #cpu, #memory, #bluetooth{
color: #65E7F5;
border-radius: 24px 24px 24px 24px;
padding: 0 20px;
margin-left: 7px;
}
#bluetooth {
border-radius: 0px;
margin: 5px 0;
}
#network {
border-radius: 24px 0px 0px 24px;
}
#battery {
border-radius: 0px 24px 24px 0px;
margin: 5px 0;
}

#clock {
color: #65E7F5;
background: rgba(24,28,28,1);
border-radius: 24px 24px 24px 24px;
padding: 0 20px;
margin-left: 7px;
margin: 5px 7px;
font-weight: bold;
}

#custom-launcher {
background: #292828;
border-radius: 0px 20px 20px 0px;
margin: 2px 7px 2px 0px;
padding: 0px 15px 0px 15px;
font-size: 24px;
}
#custom-notification {
color: #65E7F5;
background: #151818;
border-radius: 24px 24px 24px 24px;
margin: 5px 0px 5px 7px;
padding: 0px 20px 0px 20px;
}

#custom-playerctl {
background: rgba(29, 32, 32,1);;
color: #C042F1;
padding: 0 20px;
border-radius: 24px 24px 24px 24px;
margin: 5px 0;
font-weight: bold;
} 

#pulseaudio {
border-radius: 24px 0px 0px 24px;
}
#pulseaudio.muted {
color: #F07AF0;
}
#pulseaudio-slider {
background-color: rgba(24, 28, 28, 1);
color: #65E7F5;
border-radius: 0px 24px 24px 0px;
margin: 5px 0 5px 0;
padding: 0 20px 0 0px;
}
#pulseaudio-slider slider {
    min-height: 0px;
    color: #65E7F5;
    min-width: 0px;
    opacity: 1;
    border: none;
    border-radius: 7px;
    box-shadow: none;
}
#pulseaudio-slider trough {
    min-height: 10px;
    min-width: 90px;
    border-radius: 5px;
    background-color: #151818;
}
#pulseaudio-slider highlight {
    min-width: 0px;
    border-radius: 5px;
    background-color: #65E7F5;
    color: #65E7F5;
}'';
}