//this is just a Viewer that I prefer
import colladaLoader.*;

    ColladaLoader model;

    float rotX = -0.048000026f;
    float rotY = -0.32000035f;
    int x = 250;
    int y = 250;


    public void setup()
    {
      size(500, 500, P3D);
      //copy truck manually to processing's "data" first
      model = ColladaLoader.getInstance("truck5_8.dae", this);
      frameRate(10);

    }


    public void draw(){
      background(16);

      lights();
      
      translate(x, y);
      rotateX(rotY);
      rotateY(rotX);

      model.draw();

      
      stroke(125, 0, 0);
      strokeWeight(1);
      line(0, 0, 0, width, 0, 0);
      stroke(0, 125, 0);
      line(0, 0, 0, 0, 0, -width);
      stroke(0, 0, 125);
      line(0, 0, 0, 0, -height, 0);


    }

void mouseDragged()
    {
        if (key == 'a' )
        {
            rotX += (mouseX - pmouseX) * 0.001f;
            rotY -= (mouseY - pmouseY) * 0.001f;
         }
        if (key == 'd')
        {
            model.scale(1+(pmouseY - mouseY) * 0.01f);
        }
        if (key == 's' )
        {
            x += (mouseX - pmouseX)*5;
            y += (mouseY - pmouseY)*5;
        }

        if (key == 'y'||key == 'x'||key == 'c' )
        {
            char axis = (key == 'y')?'x':(key == 'x')?'y':(key == 'c')?'z':'0';
            model.shift((mouseY - pmouseY)*5, axis);
        }
        if (key == '1'||key == '2'||key == '3' )
        {
            char axis = (key == '1')?'x':(key == '2')?'y':(key == '3')?'z':'0';
            model.rotate((mouseY - pmouseY) * 0.004f, axis);
        }
 }

