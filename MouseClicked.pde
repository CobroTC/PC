void mouseClicked(){
  if( mouseX <= xLogo+50 && mouseY >= yLogo){// menu button fncts
    if (Menu == false){
      Menu = true;
    } else {
      Menu = false;
    }
  }
  if( mouseX >= xPower && mouseY >= yPower && mouseX <= xPower+50 && mouseY <= yPower+50){//power button fncts
    if (login == 0){
      exit();
    }
    if (login == 1){
      login = 0;
    }
  }
  if( mouseX >= xSettings && mouseY >= ySettings && mouseX <= xSettings+50 && mouseY <= ySettings+50 && login == 1 && Menu == true){//settings button fnct
    open[0] = true;
  }
  if( mouseX >= xAS && mouseY >= yAS && mouseX <= xAS+50 && mouseY <= yAS+50 && login == 1 && Menu == false){//appstore button fnct
    open[1] = true;
  }
  if( mouseX >= xGame && mouseY >= yGame && mouseX <= xGame+50 && mouseY <= yGame+50 && downloadApp[0]==true){// game button fnct
    open[2] = true;
  }
  if( mouseX >= xWe && mouseY >= yWe && mouseX <= xWe+50 && mouseY <= yWe+50 && downloadApp[1]==true){// weather button fnct
    open[3] = true;
  }
  for(int i = 0; i < numbOfRed; i++){//clicking on each red x
    if(mouseX >= RedX[i] && mouseY >= RedY[i] && mouseX <= RedX[i]+RedL[i] && mouseY <= RedY[i]+RedW[i]){
      open[i] = false;
    }
  }
  for(int i = 0; i < 2; i++){// clicking on each button in settings
    if(mouseX >= SetBarX[i] && mouseY >= SetBarY[i] && mouseX <= SetBarX[i]+100 && mouseY <= SetBarY[i]+30){
      c.x=SetBarX[i]+150;
      c.y=SetBarY[i]+15;
      c.activate();
      buttonPress[i] = true;
    }
  }
  for(int i = 0; i < numbOfApps; i++){// download button fncts in appstore
    if(mouseX >= MenuX[1]+MenuL[1]-70 && mouseY >= yApp[i] && mouseX <= MenuX[1]+MenuL[1]-70+50 && mouseY <= yApp[i]+50 && open[1] == true){
      println("Downloading!");
      downloadApp[i] = true;
      //file2.play();
    }
  }
  for(int i = 0; i < numbOfPics; i++){
    if(mouseX >= prX[i] && mouseY >= prY[i] && mouseX <= prX[i]+100 && mouseY <= prY[i]+100){
      profile = profileOpt[i];
    }
  }
}
