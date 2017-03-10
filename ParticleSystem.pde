ArrayList<Particle> particleList;
float timer;
float red;
float green;
float blue;
float xSpeed;
float ySpeed;
int count;
Boolean straightPath;
Boolean invertColour;
Boolean randomColour;

void setup() {
  size(800, 800);
  count = 1;
  red = 0;
  green = 0;
  blue = 0;
  xSpeed = 0;
  ySpeed = 6;
  straightPath = true;
  invertColour = false;
  randomColour = false;
  particleList = new ArrayList<Particle>();
}

void draw() {

  timer = millis();

  AddParticle();
  RandomColour();
  Invert();
  Rotate();

  for (int i = 0; i < particleList.size(); i++) {
    xSpeed = particleList.get(i).ParticleDirection(straightPath, count);
    particleList.get(i).DrawParticle(straightPath, xSpeed, ySpeed, count);
  }
}

void AddParticle() {

  if (timer%2 == 0) {
    particleList.add (new Particle(red, green, blue));
    count++;
  }
}

void RandomColour() {

  if (randomColour) {

    red = random(0, 256);
    green = random(0, 256);
    blue = random(0, 256);
  }
}

void Invert() {

  if (invertColour) {
    background(0);
    if (!randomColour) {
      red = 255;
      green = 255;
      blue = 255;
    }
  } else {
    background(255);
    if (!randomColour) {
      red = 0;
      green = 0;
      blue = 0;
    }
  }
}

void Rotate() {

  if (keyPressed) {
    if (keyCode == UP) {
      if (ySpeed <= 6) {
        ySpeed += 3;
        println("hello");
      }
    }
    if (keyCode == DOWN) {
      if (ySpeed >= -6) {
        ySpeed -= 3;
      }
    }
    if (keyCode == LEFT) {
      if (xSpeed >= -6) {
        xSpeed -= 1;
      }
    }
    if (keyCode == RIGHT) {
      if (xSpeed <= 6) {
        xSpeed += 1;
      }
    }
  }
}

void keyReleased() {

  if (key == '1') {

    straightPath = !straightPath;
  }
  if (key == '2') {

    invertColour = !invertColour;
  }
  if (key == '3') {

    randomColour = !randomColour;
  }
}