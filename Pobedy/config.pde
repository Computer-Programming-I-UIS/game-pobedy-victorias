void loadConfig(){
   if(s[10].isPlaying()){
  s[10].pause(); 
 }
   background(#FF2424);
   btn[4].backplace(500,500,4, "Volver");
  pbtn[0].imagedir = pl[0];
  pbtn[0].load(100,200);
  pbtn[1].imagedir = pl[1];
  pbtn[1].load(300,200);
  tbtn[0].load(300,400);
  tbtn[1].load(500,400);
  pbtn[2].imagedir = pl[2];
  pbtn[2].load(500,200);
}
