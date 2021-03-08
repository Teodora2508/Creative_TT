int screen = 1;
int screen1width = 398;
int screen1height = 398;
int distanceC = #323536;
int timeC = 255;
int km1 = 0;
int km2 = 0;
int m1 = 0;
int m2 = 0;
int m3 = 0;
int min1 = 0;
int min2 = 0;
int sec1 = 0;
int sec2 = 0;
int ms1 = 0;
int ms2 = 0;
int disX1 = 85;
int disX2 = 115;
int timeX1 = 0;
int timeX2 = 0;
float i = 398;
float j = 398;
float speedDistance;
float speedTime;
boolean timeOver = false;
String feedback = "";
int feedbackC;
int contact;
int cadence;
int speed;
int paceMin;
int paceSec;
int contactC = #6BA7CC;
int cadenceC = #6BA7CC;
int paceC = #6BA7CC;
int currentFeedback = 134;
int countDown = 5;
float distanceR = 214;
float distanceG = 223;
float distanceB = 189;
float timeR = 255;
float timeGB = 255;
char or = ' ';
float time;

void setup() {
  size(400, 700);
  textAlign(CENTER);
  speedDistance = random(1, 4);
  speedTime = random(2, 5);
  contact = int(random(160, 300));
  cadence = int(random(150, 200));
  paceMin = int(random(5,15));
  paceSec = int(random(10,60));
  time = random(10);
}

void draw() {
  background(255);
  fill(#AEDBF0);
  rect(1, 460, 398, 199);
  inputControls();
  feedbackControls();
  if (screen == 1) {
    screen1();
  } else if(screen == 2){
    screen3();
    
  } else if(screen == 3){
    screen2();
    textSize(55);
    fill(feedbackC);
    text(feedback, 200, 560);
  }
}

void screen1() {
  fill(#3F7EB3);
  rect(1, 1, screen1width, screen1height);
  fill(distanceC);
  textSize(55);
  text("DISTANCE", 200, 115);
  fill(255);
  text(km1, 60, 175);
  text(km2, 100, 175);
  fill(#97A5A8);
  text("km", 160, 175);
  fill(255);
  text(m1, 220, 175);
  text(m2, 260, 175);
  text(m3, 300, 175);
  fill(#97A5A8);
  text("m", 345, 175);

  fill(255);
  text(min1, 75, 320);
  text(min2, 115, 320);
  fill(#97A5A8);
  text(":", 145, 315);
  fill(255);
  text(sec1, 175, 320);
  text(sec2, 215, 320);
  fill(#97A5A8);
  text(".", 245, 320);
  fill(255);
  text(ms1, 275, 320);
  text(ms2, 315, 320);

  fill(timeC);
  text("TIME", 200, 260);
  fill(0);

  line(disX1, 180, disX2, 180);
  line(timeX1, 330, timeX2, 330);
}
void mouseClicked() {
  if (screen == 1) {
    input();
  } else if(screen == 3){
    controlFeedback();
  }
}

void screen2() {
  fill(#AEDBF0);
  stroke(255);
  rect(1, 1, screen1width/2 - 0.5, screen1height);
  String timeFeedback = or + str(time);
  rect(screen1width/2 + 1, 1, screen1width/2, screen1height);
  screen2Distance();
  screen2Time();
  feedback();
  textSize(25);
  fill(255);
  if(i<0)text(timeFeedback, 300, j+30);
}

void screen2Distance() {
  fill(distanceR, distanceG, distanceB);
  rect(1, i, screen1width/2 - 0.5, 398 - i);
  if(i>0 && j<=0){
    or ='+';
  }
  if (i>0){ 
    i-=speedDistance;
    distanceR -= speedDistance/3;
    distanceB -= speedDistance/3;
  }
}

void screen2Time() {
  fill(#1F618D);
  if (j-speedTime<speedTime && i-speedDistance>speedDistance*5)timeGB -= speedTime / 10;
  fill(timeR, timeGB, timeGB);
  if(i<=0 && j>0){
    fill(#45771E);
    or ='-';
  }
  rect(screen1width/2 + 1, j, screen1width/2 - 0.5, 398 - j);
  if (i>speedDistance) {
    if (j>0)j-=speedTime;
    timeGB -= speedTime / 3;
  }
}

void screen3(){
  fill(#3F7EB3);
  rect(1, 1, screen1width, screen1height);
  countDown();
  if(countDown == 0)screen = 3;

}

void countDown(){
  textSize(230);
  fill(255);
  text(countDown, 200, 280);
  countDown --;
  delay(1000);
}


void input() {
  if (distanceC == #323536) {
    if (mouseY >= 660) {
      if (mouseX>=240 && mouseX<=318) {
        if (disX1 >= 85) {
          lineToLeft();
        }
      } else if (mouseX>=319 && mouseX<=398) {
        if (disX1 <= 245) {
          lineToRight();
        }
      } else if (mouseX>=1 && mouseX<=79) {
        increase();
      } else if (mouseX>=80 && mouseX<=159) {
        decrease();
      } else if (mouseX>=160 && mouseX<=239) {
        save();
      }
    }
  } else if (distanceC == 255 && timeC == #323536) {
    if (mouseY >= 660) {
      if (mouseX>=240 && mouseX<=318) {
        lineToLeft();
      } else if (mouseX>=319 && mouseX<=398) {
        lineToRight();
      } else if (mouseX>=1 && mouseX<=79) {
        increase();
      } else if (mouseX>=80 && mouseX<=159) {
        decrease();
      } else if (mouseX>=160 && mouseX<=239) {
        save();
      }
    }
  }
}

void save() {
  if (distanceC == #323536) {
    distanceC = 255;
    timeC = #323536;
    disX1 = 0;
    disX2 = 0;
    timeX1 = 100;
    timeX2 = 130;
    min2 = int(random(1, 9));
  } else {
    screen = 2;
    timeC = 255;
  }
}

void increase() {
  if (distanceC == #323536) {
    if (disX1 == 45) {
      if (km1 < 9) {
        km1++;
      }
    } else if (disX1 == 85) {
      if (km2 < 9) {
        km2++;
      }
    } else if (disX1 == 205) {
      if (m1 < 9) {
        m1++;
      }
    } else if (disX1 == 245) {
      if (m2 < 9) {
        m2++;
      }
    } else if (disX1 == 285) {
      if (m3 < 9) {
        m3++;
      }
    }
  } else if (distanceC == 255 && timeC == #323536) {
    if (timeX1 == 60) {
      if (min1 < 9) {
        min1++;
      }
    } else if (timeX1 == 100) {
      if (min2 < 9) {
        min2++;
      }
    } else if (timeX1 == 160) {
      if (sec1 < 9) {
        sec1++;
      }
    } else if (timeX1 == 200) {
      if (sec2 < 9) {
        sec2++;
      }
    } else if (timeX1 == 260) {
      if (ms1 < 9) {
        ms1++;
      }
    } else if (timeX1 == 300) {
      if (ms2 < 9) {
        ms2++;
      }
    }
  }
}

void decrease() {
  if (distanceC == #323536) {
    if (disX1 == 45) {
      if (km1 > 0) {
        km1--;
      }
    } else if (disX1 == 85) {
      if (km2 > 0) {
        km2--;
      }
    } else if (disX1 == 205) {
      if (m1 > 0) {
        m1--;
      }
    } else if (disX1 == 245) {
      if (m2 > 0) {
        m2--;
      }
    } else if (disX1 == 285) {
      if (m3 > 0) {
        m3--;
      }
    }
  } else if (distanceC == 255 && timeC == #323536) {
    if (timeX1 == 60) {
      if (min1 > 0) {
        min1--;
      }
    } else if (timeX1 == 100) {
      if (min2 > 0) {
        min2--;
      }
    } else if (timeX1 == 160) {
      if (sec1 > 0) {
        sec1--;
      }
    } else if (timeX1 == 200) {
      if (sec2 > 0) {
        sec2--;
      }
    } else if (timeX1 == 260) {
      if (ms1 > 0) {
        ms1--;
      }
    } else if (timeX1 == 300) {
      if (ms2 > 0) {
        ms2--;
      }
    }
  }
}

void lineToLeft() {
  if (distanceC == #323536) {
    if (disX1 == 85) {
      disX1 = 45;
      disX2 = 75;
    } else if ( disX1 == 205) {
      disX1 = 85;
      disX2 = 115;
    } else if ( disX1 == 245) {
      disX1 = 205;
      disX2 = 235;
    } else if ( disX1 == 285) {
      disX1 = 245;
      disX2 = 275;
    }
  } else if (distanceC == 255 && timeC == #323536) {
    if (timeX1 == 100) {
      timeX1 = 60;
      timeX2 = 90;
    } else if ( timeX1 == 160) {
      timeX1 = 100;
      timeX2 = 130;
    } else if ( timeX1 == 200) {
      timeX1 = 160;
      timeX2 = 190;
    } else if ( timeX1 == 260) {
      timeX1 = 200;
      timeX2 = 230;
    } else if ( timeX1 == 300) {
      timeX1 = 260;
      timeX2 = 290;
    }
  }
}

void lineToRight() {
  if (distanceC == #323536) {
    if (disX1 == 45) {
      disX1 = 85;
      disX2 = 115;
    } else if ( disX1 == 85) {
      disX1 = 205;
      disX2 = 235;
    } else if ( disX1 == 205) {
      disX1 = 245;
      disX2 = 275;
    } else if ( disX1 == 245) {
      disX1 = 285;
      disX2 = 315;
    }
  } else if (distanceC == 255 && timeC == #323536) {
    if (timeX1 == 60) {
      timeX1 = 100;
      timeX2 = 130;
    } else if ( timeX1 == 100) {
      timeX1 = 160;
      timeX2 = 190;
    } else if ( timeX1 == 160) {
      timeX1 = 200;
      timeX2 = 230;
    } else if ( timeX1 == 200) {
      timeX1 = 260;
      timeX2 = 290;
    } else if ( timeX1 == 260) {
      timeX1 = 300;
      timeX2 = 330;
    } else if ( timeX1 == 260) {
      timeX1 = 300;
      timeX2 = 330;
    }
  }
}

void colorDistance() {
}

void colorTime() {
}

void feedbackControls() {
  fill(contactC);
  rect(1, 400, 132, 59);
  fill(255);
  textSize(20);
  text("CONTACT", 66, 435);
  fill(cadenceC);
  rect(134, 400, 132, 59);
  fill(255);
  textSize(20);
  text("CADENCE", 200, 435);
  fill(paceC);
  rect(267, 400, 132, 59);
  fill(255);
  textSize(20);
  text("PACE", 333, 435);
  fill(#1F618D);
}

void inputControls() { 
  fill(255);
  stroke(#323536);
  rect(1, 660, 79, 38);
  //up arrow
  line(20, 690, 39.5, 670);
  line(39.5, 670, 59, 690);
  rect(81, 660, 78, 38);
  //down arrow
  line(100, 670, 119.5, 690);
  line(139, 670, 119.5, 690);
  rect(160, 660, 79, 38);
  fill(#323536);
  textSize(25);
  text("SAVE", 201, 688);
  fill(255);
  rect(240, 660, 78, 38);
  //left arrow
  line(265, 679, 292, 669);
  line(265, 679, 292, 689);
  rect(319, 660, 79, 38);
  //right arrow
  line(373, 679, 346, 669);
  line(373, 679, 346, 689);
  stroke(255);
}

void controlFeedback() {
  if (i<=0) {
    
    if (mouseY >= 660) {
      if (mouseX>=240 && mouseX<=318) {
        if(currentFeedback == 134){
          currentFeedback = 1;
          cadenceC = #6BA7CC;
          contactC = #3F7EB3;
          if(contact<200) feedbackC = #76CD31;
          else feedbackC = #FF2222;
          feedback = str(contact) + " MS";
        } else if (currentFeedback == 267) {
          currentFeedback = 134;
          paceC = #6BA7CC;
          feedback();
        }
      } else if (mouseX>=319 && mouseX<=398) {
        if(currentFeedback == 1){
          currentFeedback = 134;
          contactC = #6BA7CC;
          feedback();
        } else if (currentFeedback == 134) {
          currentFeedback = 267;
          cadenceC = #6BA7CC;
          paceC = #3F7EB3;
         if(paceMin<7) feedbackC = #76CD31;
         else feedbackC = #FF2222;
         feedback = str(paceMin) + ":" + str(paceSec) + " KM/MIN";
        }
      }
    }
  }
}
       
void feedback(){
  if(i<=0 && currentFeedback == 134){
    cadenceC = #3F7EB3;
    if(cadence<170) feedbackC = #76CD31;
    else feedbackC = #FF2222;
    feedback = str(cadence) + " SPM";
  }
}
