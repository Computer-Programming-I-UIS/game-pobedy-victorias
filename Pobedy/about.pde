//En esta pagina se muestra la informacion de los autores
void authorsInfo() {
  if (s[10].isPlaying()) {
    s[10].pause();
  }
  image(about, 0, 0);
  btn[4].backplace(500, 500, 4, "Volver");
  String[] biblia = loadStrings("data/about.txt");
  for (int i=0; i<biblia.length; i++)
    text(biblia[i], 200, 200+20*i);
}
