
void saveData(){
  String[] saveStr = new String[numbOfData];
  saveStr[0] = PCname;// saves the name of the user; if PCname is changed, it saves what PCname is currently at
  saveStr[1] = password;//saves the password
  saveStr[2] = str(downloadApp[0]);
  saveStr[3] = str(downloadApp[1]);
  saveStrings("logininfo.txt", saveStr);
}
  
void loadData(){
  String[] loadStr = loadStrings("logininfo.txt");
  PCname = loadStr[0];
  password = loadStr[1];
  downloadApp[0] = boolean(loadStr[2]);
  downloadApp[1] = boolean(loadStr[3]);
}
