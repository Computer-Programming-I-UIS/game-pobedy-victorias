void loadConfig() {
  if (s[10].isPlaying()) {
    s[10].pause();
  }
  background(#FF2424);
  textSize(20);
  text("Selecciona tu nave Capitan!", 250, 100);
  btn[4].backplace(500, 500, 4, "Volver");
  pbtn[0].imagedir = pl[0];
  pbtn[0].load(150, 200);
  pbtn[1].imagedir = pl[1];
  pbtn[1].load(350, 200);
  tbtn[0].load(350, 400);
  tbtn[1].load(550, 400);
  pbtn[2].imagedir = pl[2];
  pbtn[2].load(550, 200);
}
