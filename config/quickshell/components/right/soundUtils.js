.pragma library
/*!
  \param output - output of command scripts/getVolume.sh
  \returns - {
    soundText : string
  }
*/
function parseSound(output) {
    //console.log(output)
    let soundInfo = output.split("\n");
    let soundIcon = "";
    let soundText = soundInfo[0] + "%";
    let soundLevel = Number(soundInfo[0])
    if(soundInfo[1] === "yes"){
        soundIcon = "\ueee8"
        return {
            soundText: soundIcon + " " + soundText,
            muted: true,
            level: soundLevel
        }
    } else if (soundLevel < 34){
        soundIcon = "\uf026"
    } else if (soundLevel < 67){
        soundIcon = "\uf027"
    } else {
        soundIcon = "\uf028"
    }
    return {
        soundText: soundIcon + " " + soundText,
        muted: false,
        level: soundLevel
    }
}
/*!
  \param soundLevel : string
*/
function soundFormat(soundLevel){
    let soundIcon;
    if (Number(soundLevel) < 34){
        soundIcon = "\uf026"
    } else if (Number(soundLevel) < 67){
        soundIcon = "\uf027"
    } else {
        soundIcon = "\uf028"
    }
    return {
        soundText: soundLevel + " " + soundText
    }
}
