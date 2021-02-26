void loadGraphics() {
  if (window==0) {
    loadMenu();
  } else if (window==1) {
    loadGamePlay();
  } else if (window==2) {
    loadConfig();
  } else if (window==3) {
    authorsInfo();
  } else if (window==4) {
    gamePaused();
  }else if(window==5){
   tutorial(); 
    
  }
}
