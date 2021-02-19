void levelLoad() {

  if (level==1) {
    background(#102074);
    mapdraw();
    player.play();
    player.update();
    for (b = bullets.size()-1; b >= 0; b--) {
      Bullet bullet = bullets.get(b);
      bullet.update();
    }

    cen.EnemyPlace();
    cen.disparar();
    cen.update();
  } else if (level == 2) {
    background(#74E9FF);
    mapdraw();
  }
}
