import javax.sound.sampled.*;
import java.io.*;
PImage photo;
int[] r;
int tolnt(byte hb, byte lb)
{
  return((int)hb<<8) | ((int)lb & 0xFF);
}
AudioFormat format;
TargetDataLine line;
DataLine.Info info;
ByteArrayOutputStream out;
int numBytesRead;
byte[] data;
void setup() {
  size(500, 500);
  //fullScreen();
  size(500, 500);
photo = loadImage("sistemi.jpg");
  r = new int[54];
  r[0]=29;
  r[1]=31;
  r[2]=34;
  r[3]=36;
  r[4]=37;
  r[5]=39;
  r[6]=41;
  r[7]=44;
  r[8]=47;
  r[9]=50;
  r[10]=53;
  r[11]=57;
  r[12]=60;
  r[13]=63;
  r[14]=66;
  r[15]=70;
  r[16]=37;
  r[17]=39;
  r[18]=41;
  r[19]=44;
  r[20]=47;
  r[21]=50;
  r[22]=53;
  r[23]=57;
  r[24]=60;
  r[25]=63;
  r[26]=66;
  r[27]=70;
  r[28]=73;
  r[29]=79;
  r[30]=83;
  r[31]=88;
  r[32]=94;
  r[33]=99;
  r[34]=105;
  r[35]=111;
  r[36]=119;
  r[37]=125;
  r[38]=133;
  r[39]=142;
  r[40]=149;
  r[41]=158;
  r[42]=168;
  r[43]=178;
  r[44]=188;
  r[45]=200;
  r[46]=212;
  r[47]=223;
  r[48]=238;
  r[49]=251;
  r[50]=267;
  r[51]=281;
  r[52]=298;
  r[53]=315;
  format=  new AudioFormat(44100, 16, 1, true, false);
  info = new DataLine.Info(TargetDataLine.class, format);
 // format is an AudioFormat object
  if (AudioSystem.isLineSupported(info)) {
  }
  try {
    line=(TargetDataLine) AudioSystem.getLine(info);
    line.open(format);
    out = new ByteArrayOutputStream();
    data = new byte[line.getBufferSize()/5];
    line.start();
  }
  catch
    (LineUnavailableException ex) {
    ex.printStackTrace();
  }
}
void draw() {
  //background(255);
  background(0);
 image(photo, 0, 0);//skidaj ako ne valja
  numBytesRead = line.read(data, 0, data.length);
  out.write(data, 0, numBytesRead);
  short[] a = new short[width];
  for (int i = 1; i <width; i++)    
    a[i]= (short)(tolnt(data[2*i+1], data[2*i])*0.005);
  plot(a);
  float[] f = dft(a);
  stroke(0, 0, 0);
  stroke(0, 128, 0);
  plot(a);
  stroke(255, 0, 0);
  plot(f);
  //println(maximum(f));
  //println(f[30]>300);
  line(maximum(f), 0, maximum(f), 500);
  //println(notaf((int)maximum(f)));
  println(sima(r, (int)maximum(f)));
  textSize(250);
  textAlign(LEFT, TOP);
  fill(200, 0, 255);

  int vrsima = sima(r, (int)maximum(f));
  if (vrsima == 0) {
    text("NAN", 0, 0);
  }
  if (vrsima == 1) {
    text("C", 0, 0);
  // ellipse(200, 302, 20, 15);
  }
  if (vrsima == 2) {
    text("CIS", 0, 0);
  //  ellipse(200, 302, 20, 15);
    //line(175,312,175,292);
    //line(182,312,182,292);
    //line(170,307,190,307);
   //line(170,298,190,298);
  }
  if (vrsima == 3) {
    text("D", 0, 0);
    //ellipse(200, 290, 20, 15);
  }
  if (vrsima == 4) {
    text("DIS", 0, 0);
    //ellipse(200, 290, 20, 15);
//line(175,300,175,280);
  //  line(182,300,182,280);
    //line(170,295,190,295);
   // line(170,286,190,286); 
}
  if (vrsima == 5) {
    text("E", 0, 0);
   // ellipse(200, 278, 20, 15);
  }
  if (vrsima == 6) {
    text("F", 0, 0);
   // ellipse(200, 266, 20, 15);
  }
  if (vrsima == 7) {
    text("FIS", 0, 0);
   // ellipse(200, 266, 20, 15);
    //line(175,276,175,256);
   // line(182,276,182,256);
   // line(170,271,190,271);
  //  line(170,262,190,262);
  }
  if (vrsima == 8) {
    text("G", 0, 0);
    //ellipse(200, 254, 20, 15);
  }
  if (vrsima == 9) {
    text("GIS", 0, 0);
   // ellipse(200, 254, 20, 15);
   // line(175,264,175,244);
   // line(182,264,182,244);
  //  line(170,259,190,259);
   // line(170,250,190,250); 
}
  if (vrsima == 10) {
    text("A", 0, 0);
  //  ellipse(200, 240, 20, 15);
  }
  if (vrsima == 11) {
    text("B", 0, 0);
   // ellipse(200, 230, 20, 15);
  }
  if (vrsima == 12) {
    text("H", 0, 0);
   // ellipse(200, 230, 20, 15);
  }
  if (vrsima == 13) {
    text("C", 0, 0);
    //ellipse(200,193,20,15);
  }
  if (vrsima == 14) {
    text("CIS", 0, 0);
    // ellipse(200,193,20,15);
    // line(175,204,175,184);
    //line(182,204,182,184);
   // line(170,199,190,199);
   // line(170,190,190,190); 
  }
  if (vrsima == 15) {
    text("D", 0, 0);
   // ellipse(200,182,20,15);
  }
  if (vrsima == 16) {
    text("DIS", 0, 0);
  //  ellipse(200, 374, 20, 15);
    // line(175,385,175,275);
   // line(182,385,182,275);
    //line(170,280,190,280);
   // line(170,270,170,270); 
  }
  if (vrsima == 17) {
    text("E", 0, 0);
  //  ellipse(200, 362, 20, 15);
  }
  if (vrsima == 18) {
    text("F", 0, 0);
    //ellipse(200, 350, 20, 15);
  }
  if (vrsima == 19) {
    text("FIS", 0, 0);
  // ellipse(200, 350, 20, 15);
  }
  if (vrsima == 20) {
    text("G", 0, 0);
    //ellipse(200, 338, 20, 15);
  }
  if (vrsima == 21) {
    text("GIS", 0, 0);
   // ellipse(200, 338, 20, 15);
  // line(300,338,300,300);
  }
  if (vrsima == 22) {
    text("A", 0, 0);
    //ellipse(200, 326, 20, 15);

  }
  if (vrsima == 23) {
    text("B", 0, 0);
   // ellipse(200, 314, 20, 15);
    
  }
  if (vrsima == 24) {
    text("H", 0, 0);
  //  ellipse(200, 314, 20, 15);
  }
  if (vrsima == 25) {
    text("C", 0, 0);
    //ellipse(200, 193, 20, 15);
    //line(200, 193, 15, 2);
  }
  if (vrsima == 26) {
    text("CIS", 0, 0);
 //  ellipse(200, 193, 20, 15);
  }
  if (vrsima == 27) {
    text("D", 0, 0);
   // ellipse(200, 182, 20, 15);
  }
  if (vrsima == 28) {
    text("DIS", 0, 0);
   // ellipse(200, 182, 20, 15);
  }
  if (vrsima == 29) {
    text("E", 0, 0);
   // ellipse(200, 171, 20, 15);
  }
  if (vrsima == 30) {
    text("F", 0, 0);
    //ellipse(200, 159, 20, 15);
  }
  if (vrsima == 31) {
    text("FIS", 0, 0);
  //  ellipse(200, 159, 20, 15);
  }
  if (vrsima == 32) {
    text("G", 0, 0);
    //ellipse(200, 148, 20, 15);
  }
  if (vrsima == 33) {
    text("GIS", 0, 0);
    //ellipse(200, 148, 20, 15);
  }
  if (vrsima == 34) {
    text("A", 0, 0);
    //ellipse(200, 137, 20, 15);
  }
  if (vrsima == 35) {
    text("B", 0, 0);
    //ellipse(200, 126, 20, 15);
  }
  if (vrsima == 36) {
    text('H', 0, 0);
  //  ellipse(200, 126, 20, 15);
  }
  if (vrsima == 37) {
    text("C", 0, 0);
   // ellipse(200, 115, 20, 15);
  }
  if (vrsima == 38) {
    text("CIS", 0, 0);
   // ellipse(200, 115, 20, 15);
  }
  if (vrsima == 39) {
    text("D", 0, 0);
   // ellipse(200, 104, 20, 15);
  }
  if (vrsima == 40) {
    text("DIS", 0, 0);
   // ellipse(200, 104, 20, 15);
    
  }
  if (vrsima == 41) {
    text('E', 0, 0);
   //  ellipse(200, 92, 20, 15);
  }
  if (vrsima == 42) {
    text('F', 0, 0);
    //ellipse(200, 80, 20, 15);
  }
  if (vrsima == 43) {
    text("FIS", 0, 0);
    //ellipse(200, 80, 20, 15);
  }
  if (vrsima == 44) {
    text('G', 0, 0);
   // ellipse(200, 68, 20, 15);
  }
  if (vrsima == 45) {
    text("GIS", 0, 0);
    // ellipse(200, 68, 20, 15);
  }
  if (vrsima == 46) {
    text('A', 0, 0);
   //  ellipse(200, 56, 20, 15);
  }
  if (vrsima == 47) {
    text('B', 0, 0);
    //ellipse(200, 44, 20, 15);
  }
  if (vrsima == 48) {
    text("H", 0, 0);
    //ellipse(200, 44, 20, 15);
  }
  if (vrsima == 49) {
    text('C', 0, 0);
    //ellipse(200, 32, 20, 15);
  }
  if (vrsima == 50) {
    text("CIS", 0, 0);
    // ellipse(200, 32, 20, 15);
  }
  if (vrsima == 51) {
    text('D', 0, 0);
  //   ellipse(200, 20, 20, 15);
  }
  if (vrsima == 52) {
    text("DIS", 0, 0);
    // ellipse(200, 20, 20, 15);
  }
  if (vrsima == 53) {
    text('E', 0, 0);
    // ellipse(200, 10, 20, 15);
  }
  if (vrsima == 54) {
    text('F', 0, 0);
  }
}
void plot(short[] f) {
  for (int i = 0; i <width-1; i++)
    line(i, -f[i]+256, i+1, -f[i+1]+256);
}
float[] dft(short[] x)
{ 
  int n = x.length;  
  float[] f = new float[n];
  for (int k = 0; k < n; k++) {
    f[k]= 0;
    float Sr = 0;
    for (int j = 0; j < n; j++) {
      Sr=Sr+x[j]*cos(-2*PI*j*(k)*0.05/n);
    }
    float Si = 0;
    for (int j = 0; j < n; j++) {
      Si=Si+x[j]*sin(-2*PI*j*(k)*0.05/n);
    }
    f[k]=sqrt(Si*Si + Sr*Sr)*0.01;
  }
  return f;
}
void plot(float[] f) {
  for (int i = 0; i <width-1; i++)
    line(i, height-f[i], i+1, height-f[i+1]);
}
float maximum(float[] a) {
  float max = 0;
  int maxi = 0;
  for (int i = 0; i < a.length; i++) {
    if (a[i]>max) {
      max=a[i];
      maxi = i;
    }
  }
  println(maxi);
  if (max>20)return maxi;
  else return 50000;
}
int sima(int[] t, int j) {
  int min = 500, mini = 0;
  for (int i = 0; i < t.length; i++) {
    if (abs(t[i] - j)<min) {
      min = abs(t[i]-j);
      mini = i;
    }
  }
  if (j<25) return 0;
  return mini+1;
}