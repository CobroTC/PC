//import processing.sound.*;
//SoundFile file1, file2;
//String audioName = "login.mp3";
//String audioName2 = "GoodDing.mp3";
//String path1, path2;

int login = 0;//sort-of boolean to see what login state the pc is at: 0=not logged in, 1=logged in
String PCname = "Connor";
float length, width;
float PClength = 1024, PCwidth = 526;
String password = "hello";

// data numbers
int numbOfCount = 5, m = 0, numbOfData = 5, numbOfRed = 4, numbOfApps = 3, numbOfPics = 4;
boolean[] countdown = new boolean[numbOfCount];// countdowns

boolean[] open = new boolean[numbOfRed];//the different apps or menus that are open have open[i] = true.

//window coordinates
float xLogo = 0, yLogo = 476;// coords of the start button
boolean Menu = false;//menu is true if start menu is open

float xPower = 974, yPower = 476;// power button coords

float xSettings = 0, ySettings = 426, xSetMenu = 60, ySetMenu = 60, lSetMenu = 904, wSetMenu = 406;//settings button coords
float[] SetBarX = new float[2];//settings buttons coords
float[] SetBarY = new float[2];

int xAS = 100, yAS = 300, xASMenu = 400, yASMenu = 60, lASMenu = 224, wASMenu = 406;// app store button coords and app store menu coords
float[] xApp = new float[numbOfApps];
float[] yApp = new float[numbOfApps];
boolean[] downloadApp = new boolean[numbOfApps];

float xGame, yGame, xGameMenu = 60, yGameMenu = 60, lGameMenu = 300, wGameMenu = 300;// game button coords 
float xWe, yWe, xWeMenu = 350, yWeMenu = 60, lWeMenu = 324, wWeMenu = 406;// weather button coords

// all window coords
float[] RedX = new float[numbOfRed];// coords and width and length of red exit buttons.
float[] RedY = new float[numbOfRed];
float[] RedL = new float[numbOfRed];
float[] RedW = new float[numbOfRed];

float[] MenuX = new float[numbOfRed];
float[] MenuY = new float[numbOfRed];
float[] MenuL = new float[numbOfRed];
float[] MenuW = new float[numbOfRed];

void MenuCoords(){
  MenuX[0] = xSetMenu;
  MenuY[0] = ySetMenu;
  MenuL[0] = lSetMenu;
  MenuW[0] = wSetMenu;
  MenuX[1] = xASMenu;
  MenuY[1] = yASMenu;
  MenuL[1] = lASMenu;
  MenuW[1] = wASMenu;
  MenuX[2] = xGameMenu;
  MenuY[2] = yGameMenu;
  MenuL[2] = lGameMenu;
  MenuW[2] = wGameMenu;
  MenuX[3] = xWeMenu;
  MenuY[3] = yWeMenu;
  MenuL[3] = lWeMenu;
  MenuW[3] = wWeMenu;
}

boolean[] buttonPress = new boolean[2];//these booleans check to see if each button has been pressed

//images
PImage background, taskbar, logo, power, settings, appstore, game, download, downloaded, weather, profile, internet;//all imported images
PImage[] profileOpt = new PImage[numbOfPics];
float[] prX = new float[numbOfPics];
float[] prY = new float[numbOfPics];
int xProfile = 462, yProfile = 200;

//keyboard inputter
Console c = new Console(10,100,12);

boolean[] b = new boolean[numbOfApps];

//moving windows
boolean[] move = new boolean[numbOfRed];
float tempx, tempy, deltax, deltay;

void setup(){
  size(1024, 526, P2D);
  background(255);
  c.activate();//starts the keyboard inputter
  LoadSounds();
  countdown[0] = false;
  countdown[1] = false;
  loadData();//loads previous data
  LoadImages();//loads all imported images
  MenuCoords();
  profile = profileOpt[0];
  for(int i = 0; i < numbOfRed; i++){
    RedL[i] = 50;//sets all red x'es
    RedW[i] = 20;
    open[i] = false;
    move[i] = false;
  }
  for(int i = 0; i < numbOfApps; i++){
    xApp[i] = MenuX[3]+20;//sets app coords in app store
    yApp[i] = MenuY[3]+50+52*i;
    b[i] = false;
  }
}

void draw(){
  if(login==0){
    loginScreen();
  }
  if(login==1){
    desktop();
  }
  countdowns();
}

void loginScreen(){
  c.x = 400;
  c.y = 400;
  xPower = 974;
  yPower = 476;
  background(0, 170, 200);
  image(power, xPower, yPower);
  textSize(32);
  fill(255);
  textAlign(CENTER);
  text(PCname, 512, 350);
  fill(255);
  stroke(0, 130, 232);
  rect(390, 378, 244, 27);
  image(profile, xProfile, yProfile);
  c.display();
}

void desktop(){
  background(255);
  image(background, 0, 0);
  image(taskbar, 0, 476);
  image(appstore, xAS, yAS);
  image(logo, xLogo, yLogo);
  taskbar();
  menuScreen();
  Game();
  Weather();
  settingsScreen();
  AppStoreScreen();
  //saveData();
  clock();
  pressMouse();
}

void countdowns(){// waiting times
  if(countdown[0] == true){// login loading time
    m++;
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Logging in...", 512, 450);
    if(m > 100){
      countdown[0] = false;
      m = 0;
      login = 1;
      c.deactivate();
      //file1.play();
    }
  }
  if(countdown[1] == true){// shows "incorrect password" for a moment
    m++;
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Incorrect password.", 512, 450);
    if(m > 100){
      countdown[1] = false;
      m = 0;
    }
  }
}

void clock(){ // pc clock
  int h = hour();
  int mi = minute();
  int s = second();
  String time = h + ":" + mi + ":" + s;
  textSize(15);
  fill(255);
  textAlign(CENTER);
  text(time, 975, 497);
  
  int d = day();
  int mon = month();
  int y = year();
  String date = d + "/" + mon + "/" + y;
  textSize(15);
  fill(255);
  textAlign(CENTER);
  text(date, 975, 517);
}
  
  
void LoadSounds(){
  //path1 = sketchPath(audioName);
  //path2 = sketchPath(audioName2);
  //file1 = new SoundFile(this, path1);
  //file2 = new SoundFile(this, path2);
}

void LoadImages(){
  background = loadImage("Background1.jpg");
  taskbar = loadImage("Taskbar.jpg");
  logo = loadImage("Logo.jpg");
  power = loadImage("Power.jpg");
  settings = loadImage("Settings.jpg");
  appstore = loadImage("AppStore.jpg");
  game = loadImage("Game.jpg");
  download = loadImage("Download.jpg");
  downloaded = loadImage("Downloaded.jpg");
  weather = loadImage("Weather.jpg");
  profileOpt[0] = loadImage("Profile.jpg");
  profileOpt[1] = loadImage("Mushroom.jpg");
  profileOpt[2] = loadImage("Fish.jpg");
  profileOpt[3] = loadImage("BeachBall.jpg");
  internet = loadImage("Internet.jpg");
}
