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
background: rgba(30,33,34,1);
}

#workspaces {
background: #2F3332;
margin: 5px 5px;
padding: 5px 5px;
border-radius: 16px;
}
#workspaces button {
padding: 0px 5px;
margin: 0px 3px;
border-radius: 16px;
color: transparent;
background: rgba(21,24,24,1);
transition: all 0.3s ease-in-out;
}

#workspaces button.active {
background: #2D2324;
color: #11111B;
border-radius: 16px;
min-width: 50px;
background-size: 400% 400%;
transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
background-color: #CFBA95;
color: #11111B;
border-radius: 16px;
min-width: 50px;
background-size: 400% 400%;
}

#tray, #pulseaudio, #network, #battery, #cpu, #memory, #bluetooth{
background: #292828;
font-weight: bold;
margin: 5px 0px;
}
#tray, #pulseaudio, #network, #battery, #cpu, #memory, #bluetooth{
color: #A5B263;
border-radius: 10px 24px 10px 24px;
padding: 0 20px;
margin-left: 7px;
}
#clock {
color: #A5B263;
background: #292828;
border-radius: 24px 10px 24px 10px;
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
color: #A5B263;
background: #292828;
border-radius: 10px 24px 10px 24px;
margin: 5px 0px 5px 7px;
padding: 0px 20px 0px 20px;
}

#custom-playerctl {
background: #2F3332;
color: #A5B263;
padding: 0 20px;
border-radius: 24px 10px 24px 10px;
margin: 5px 0;
font-weight: bold;
} 
#pulseaudio {
border-radius: 10px 0px 0px 24px;
}
#pulseaudio-slider {
background-color: #292828;
border-radius: 0px 24px 10px 0px;
margin: 5px 0 5px 0;
padding: 0 20px 0 0px;
}
#pulseaudio-slider slider {
    min-height: 0px;
    min-width: 0px;
    opacity: 0;
    background-image: none;
    border: none;
    border-radius: 5px;
    box-shadow: none;
}
#pulseaudio-slider trough {
    min-height: 10px;
    min-width: 90px;
    border-radius: 5px;
    background-color: #151818;
}
#pulseaudio-slider highlight {
    min-width: 10px;
    border-radius: 5px;
    background-color: green;
}
'';
}
