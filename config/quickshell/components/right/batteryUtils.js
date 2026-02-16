.pragma library

function batteryState(percentage, state) {
    let batteryIcon, batteryBgColor, batteryFontColor;
    if(state === "charging" && percentage !== 100){
        batteryIcon = "\uf0e7";
        batteryBgColor = "#6600aa22";
        batteryFontColor = "#aa00ffaa";
    }
    else if(percentage < 21){
        batteryIcon = "\uf244";
        batteryBgColor = "#66ff0000";
        batteryFontColor = "#ffff3377";
    } else if (percentage < 41){
        batteryIcon = "\uf243";
        batteryBgColor = "#66ff9900";
        batteryFontColor = "#ffff1100";
    } else if (percentage < 61){
        batteryIcon = "\uf242";
        batteryBgColor = "#66ffcc00";
        batteryFontColor = "#ffffcc11";
    } else if (percentage < 81){
        batteryIcon = "\uf241";
        batteryBgColor = "#66aaff99";
        batteryFontColor = "#ffaaff00";
    } else if (percentage < 100){
        batteryIcon = "\uf240";
        batteryBgColor = "#66610beb";
        batteryFontColor = "#aabb0044";
    } else {
        batteryIcon = "\uf240";
        batteryBgColor = "#6600aaff";
        batteryFontColor = "#aa0011ff";
    }
    return {
        batteryIcon = batteryIcon,
        batteryBgColor = batteryBgColor,
        batteryFontColor = batteryFontColor
    }
}
