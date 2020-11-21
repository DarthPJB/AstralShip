// Laser measure recreation
// John Bargman & Colin 2020-11-19

// All measurements in millimeters

width=25.5;
depth=47;
Top_height=40;
Bottom_height=20;
Middlepart_height=50;

//cube([width,depth,height], center)

module Laser_Measure()


{
    origin = [0,0,0];
    origin_rotation = [0,90,0];

    translate(origin)
    {
        rotate(origin_rotation)
        {
            translate([0,0,36]){
            minkowski(){
            cube([width,depth,Top_height], center = true); 
              rotate([0,30,0]){
                cylinder(r=2,h=1);
                      
              }
            }
        }
        translate([0,0,4]){
           minkowski() {
            cube([width,depth,Bottom_height], center = true); 
              cylinder(r=2,h=1);
           }
       }
            translate([0,0,-33]){
          minkowski(){  
            cube([width,depth,Middlepart_height], center = true); 
              rotate([0,30,0]){
              cylinder(r=2,h=1);
          }
      }
  }
           // #cube([29,51,116], center = true);   
  
            

        }
    }
}

Laser_Measure();