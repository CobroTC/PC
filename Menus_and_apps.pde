void menuScreen(){
  xPower = 50;
  yPower = 426;
  if (Menu == true){
    fill(0, 130, 232);
    noStroke();
    rect(0, 200, 150, 276);
    image(settings, xSettings, ySettings);
    image(power, xPower, yPower);

  }  
}

void settingsScreen(){ // id of 0
  if (open[0] == true){
    RedL[0] = 50;
    RedW[0] = 20;
    RedX[0] = MenuX[0]+MenuL[0]-RedL[0];
    RedY[0] = MenuY[0];
    SetBarX[0] = MenuX[0]+50;
    SetBarY[0] = MenuY[0]+50;
    SetBarX[1] = MenuX[0]+50;
    SetBarY[1] = MenuY[0]+100;
    for(int i = 0; i < numbOfPics; i++){
      prX[i] = MenuX[0]+50+110*i;
      prY[i] = MenuY[0]+150;
    }
    fill(255);// settings menu screen
    stroke(0, 130, 232);
    rect(MenuX[0], MenuY[0], MenuL[0], MenuW[0]);
    fill(245, 0, 0);// redx
    stroke(0,130, 232);
    rect(RedX[0], RedY[0], RedL[0], RedW[0]);
    fill(235);// button1 in menu screen
    stroke(200);
    rect(SetBarX[0], SetBarY[0], 100, 30);
    textSize(17);// name
    textAlign(LEFT);
    fill(0);
    text("Name", SetBarX[0]+5, SetBarY[0]+20);
    fill(235);// button2 in menu screen
    stroke(200);
    rect(SetBarX[1], SetBarY[1], 100, 30);
    textSize(17);// password
    textAlign(LEFT);
    fill(0);
    text("Password", SetBarX[1]+5, SetBarY[1]+20);
    for(int i = 0; i < numbOfPics; i++){
      image(profileOpt[i], prX[i], prY[i]);
    }
    c.display();
  }
}


void AppStoreScreen(){// id of 1
  if(open[1]==true){
    RedL[1] = 50;
    RedW[1] = 20;
    RedX[1] = MenuX[1]+MenuL[1]-RedL[1];
    RedY[1] = MenuY[1];
    fill(1, 83, 147);// appstore 
    stroke(0, 130, 232);
    rect(MenuX[1], MenuY[1], MenuL[1], MenuW[1]);
    fill(245, 0, 0);
    stroke(0,130,232);
    rect(RedX[1], RedY[1], RedL[1], RedW[1]);
    image(game, xApp[0], yApp[0]);
    image(weather, xApp[1], yApp[1]);
    image(internet, xApp[2], yApp[2]);
    for (int i = 0; i < numbOfApps; i++){
      if(downloadApp[i]==false){
        image(download, MenuX[1]+MenuL[1]-70, yApp[i]);
      } else {
        image(downloaded, MenuX[1]+MenuL[1]-70, yApp[i]);
      }
    }
    for(int i = 0; i < numbOfApps; i++){
      xApp[i] = MenuX[1]+20;//sets app coords in app store
      yApp[i] = MenuY[1]+50+52*i;
    }
  }
}

void Game(){// if of 2
  if(downloadApp[0]==true){
    if(b[0] == false){
      int r = int(random(20, 900));
      int t = int(random(20, 400));
      b[0] = true;
      xGame = r;
      yGame = t;
    }
    image(game, xGame, yGame);
    if(open[2] == true){
      RedL[2] = 50;
      RedW[2] = 20;
      RedX[2] = MenuX[2]+MenuL[2]-RedL[2];
      RedY[2] = MenuY[2];
      fill(0);
      stroke(0,130,232);
      rect(MenuX[2], MenuY[2], MenuL[2], MenuW[2]);
      fill(245, 0, 0);
      stroke(0,130,232);
      rect(RedX[2], RedY[2], RedL[2], RedW[2]);
    }
  }
}
void Weather(){// id of 3
  if(downloadApp[1]==true){
    if(b[1] == false){
      int r = int(random(20, 900));
      int t = int(random(20, 400));
      b[1] = true;
      xWe = r;
      yWe = t;
    }
    image(weather, xWe, yWe);
    if(open[3]==true){
      RedL[3] = 50;
      RedW[3] = 20;
      RedX[3] = MenuX[3]+MenuL[3]-RedL[1];
      RedY[3] = MenuY[3];
      fill(1, 83, 147);
      stroke(0, 130, 232);
      rect(MenuX[3], MenuY[3], MenuL[3], MenuW[3]);
      fill(245, 0, 0);
      stroke(0,130,232);
      rect(RedX[3], RedY[3], RedL[3], RedW[3]);
      
    }
  }
}


void pressMouse(){
  if(mousePressed == true && mouseButton == LEFT){
    for(int i = 0; i < numbOfRed; i++){
      if(open[i]==true){
        if(mouseX >= MenuX[i] && mouseY >= MenuY[i] && mouseX <= MenuX[i]+MenuL[i] && mouseY <= MenuY[i]+MenuW[i] && move[i] == false){
          tempx = mouseX;
          tempy = mouseY;
          move[i] = true;
        }
      }
    }
  }
}

void mouseReleased(){
  for(int i = 0; i < numbOfRed; i++){
    if(move[i]==true){
      deltax = mouseX - tempx;
      deltay = mouseY - tempy;
      MenuX[i] += deltax;
      MenuY[i] += deltay;
      move[i] = false;
    }
  }
}
  
