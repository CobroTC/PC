void taskbar(){
  if(open[0]==true){
    image(settings, xLogo+50, yLogo);
  }
  if(open[1]==true){
    image(appstore, xLogo+100, yLogo);
  }
  if(open[2]==true){
    image(game, xLogo+150, yLogo);
  }
  if(open[3]==true){
    image(weather, xLogo+200, yLogo);
  }
  //if(open[4]==true){
  //  image(appstore, xLogo+250, yLogo);
  //}
}
