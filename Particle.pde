class Particle {

  float red;
  float green;
  float blue;
  float alpha;
  float xPoz;
  float yPoz;
  float gravity;

  Particle(float _red, float _green, float _blue) {

    red = _red;
    green = _green;
    blue = _blue;
    alpha = 255;
    xPoz = mouseX;
    yPoz = mouseY;
  }
  
  void DrawParticle(Boolean straightPath, float xSpeed, float ySpeed, int count) {
    noStroke();
    fill(red, green, blue, alpha);
    ellipse(xPoz, yPoz, 100, 100);

    ParticleMovement(straightPath, xSpeed, ySpeed);
  }

  void Gravity(float ySpeed) {

    ySpeed = ySpeed - gravity;
  }

  void ParticleMovement(Boolean straightPath, float xSpeed, float ySpeed) {

    alpha = alpha - 3.0;
    xPoz = xPoz + xSpeed;
    yPoz = yPoz - ySpeed;

    if (!straightPath) {

      Gravity(ySpeed);
    }
  }

  float ParticleDirection(Boolean straightPath, int count) {

    float xSpeed;

    if (!straightPath) {
      if (count%2==0) {

        xSpeed = 5;
      } else {
        xSpeed = -5;
      }
    } else {
      xSpeed = 0;
    }

    return xSpeed;
  }
}