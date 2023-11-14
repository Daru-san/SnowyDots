{config, pkgs, lib, ...}:{
#Waybar styling
  programs.waybar.style = ''
  @import "waybar-theme.css";
* {
   
    font-family: JetBrainsMono Nerd Font;
    font-size: 18px;
}

/*
* {
   
    font-family: Maple Mono NF;
    font-size: 18px;
}
*/

window#waybar {
    background-color: #202220;
    transition-property: background-color;
    transition-duration: .5s;

}

window#waybar.hidden {
    opacity: 0.2;
}


window#waybar.termite {
    background-color: #e5e9f0;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 0px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    /*replace this; sway workspaces button*/
}

#workspaces button {
    background-color: transparent;
    color: #8abf97;
    padding-left: 4px;
    padding-right: 7px;


    
}

#workspaces button:hover {
    background: @light1;
    border-radius: 2rem 2rem 2rem 2rem;    
    color: @dark1;
    text-shadow: none;


}

#workspaces button.focused {
    background-color: @light2;
    border-radius: 2rem 2rem 2rem 2rem;
    color: @dark1;
    


}

#workspaces button.urgent {
    background-color: @red;

}



#workspaces {
    border-radius: 2rem 2rem 2rem 2rem;
    margin-top: 4px;
    margin-bottom: 4px;
    margin-left: 3px;
    margin-right: 3px;
    background-color: #313231;

}

#mode {
    background-color: @dark1;
}
#window {
    background-color: @dark1 ;
    color: @text2;
    font-size: 20px;


}


#custom-notification,
#battery,
#custom-updates,
#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#bluetooth,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#mpd {
    padding: 0 11px;
    margin-top: 4px;
    color: #f23131;
    margin-bottom: 4px;
    background-color: #98ada1;
    /*border-radius: 2rem 2rem 2rem 2rem;*/
}

#custom-notification {
    border-radius: 1rem 0rem 1rem 1rem;
}

#pulseaudio,
#clock{
    color: #1a1f1a;
    border-radius: 1rem 0rem 1rem 0rem;
    margin-right:3px;
    margin-left:3px;
/*    background-color: @light2;*/
}
 #cpu {
    margin-left:0px;
  /*  color: @text2;*/
    border-radius: 0 0 0 0;
} 

#bluetooth,
#memory {
   /* color: @text2;*/
    margin-right:3px;
    border-radius: 0rem 0rem 1rem 0rem;
}

#disk {
    color: @dark4;
    margin-right:3px;
    border-radius: 0 2rem 2rem 0;
    background-color: @light2;
}

#network,
#battery {
 /*   color: @text2;*/
    border-radius: 1rem 0 0 1rem;
    margin-left:3px;
    margin-right:0px;
}
#network,
#tray,
#custom-notification,
#bluetooth {
  background-color: #424242;
  color: #79bf9f;
}
#memory,
#cpu,
#battery {
/* background-color: @dark-blue;*/
 color: #102f2a;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#tray{
	border-radius: 1rem 1rem 1rem 1rem;
}
label:focus {
    background-color: #000000;
}


#pulseaudio.muted {
    
    color: @red;
}
    '';
}
