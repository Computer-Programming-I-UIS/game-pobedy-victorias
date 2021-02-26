void tutorial() {
  if (s[10].isPlaying()) {
    s[10].pause();
  }
  background(255,0,0);
  
  
  image(about, 0, 0);
  String[] tuto = loadStrings("data/tuto.txt");
  for (int i=0; i<tuto.length; i++)
    text(tuto[i], 200, 200+20*i);
  
  btn[4].backplace(500, 500, 4, "Volver");
}
