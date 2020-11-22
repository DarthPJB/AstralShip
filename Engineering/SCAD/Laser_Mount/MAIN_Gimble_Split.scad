// Laser Measure Mounting
// John Bargman 2020-11-19

// All measurements in millimeters

// Uses section
use <MAIN_Laser_Mount.scad>
use <MAIN_Laser_Measure_Mount.scad>


//Set to height detail only for rendering:
$fn= $preview == true? 20 : 30;


Tolerance = 0.1;
Laser_Gimble_Width_Top = 100;
Laser_Gimble_Cull_Width = 85;


Rounding_Hull_Sphere_Seperation = 25;
Rounding_Hull_Sphere_Diameter = 45;
Rounding_Hull_Sphere_Height = Rounding_Hull_Sphere_Diameter + 20;

Gimble_Arm_Height = 85;


minkowskiRound=1;

origin = [0,0,minkowskiRound + Tolerance];
origin_rotation = [0,0,0];

// Module defintion
module Gimble_Split_Base()
{
    translate(origin)
    {
        rotate(origin_rotation)
        {

                difference()
                {
                    minkowski()
                    {
                        cylinder(h=Gimble_Arm_Height,d=Laser_Gimble_Cull_Width-minkowskiRound  *2);
                        sphere(minkowskiRound);
                    }
                    union()
                    {
                        HullSphere1 = [Rounding_Hull_Sphere_Seperation,0,Rounding_Hull_Sphere_Height];
                        HullSphere2 = [-Rounding_Hull_Sphere_Seperation,0,Rounding_Hull_Sphere_Height];
                        translate(HullSphere1)
                            sphere(Rounding_Hull_Sphere_Diameter);
                        translate(HullSphere2)
                            sphere(Rounding_Hull_Sphere_Diameter);
                        HullSphere3 = [Rounding_Hull_Sphere_Seperation,0,Rounding_Hull_Sphere_Height*2];
                        HullSphere4 = [-Rounding_Hull_Sphere_Seperation,0,Rounding_Hull_Sphere_Height*2];
                        translate(HullSphere3)
                            sphere(Rounding_Hull_Sphere_Diameter);
                        translate(HullSphere4)
                            sphere(Rounding_Hull_Sphere_Diameter);
                            HullSphere5 = [Rounding_Hull_Sphere_Seperation,0,Rounding_Hull_Sphere_Height - 20];
                            HullSphere6 = [-Rounding_Hull_Sphere_Seperation,0,Rounding_Hull_Sphere_Height - 20];
                            translate(HullSphere5)
                                sphere(Rounding_Hull_Sphere_Diameter);
                            translate(HullSphere6)
                                sphere(Rounding_Hull_Sphere_Diameter);
                    }
                }
        }
    }
}

module Gimble_Base_Split_Final()
{
    union()
    {
        Gimble_Split_Base();
        translate(-origin)
            Laser_Level_Gimble_Top();
        translate(origin + [0,0,Gimble_Arm_Height])
            rotate([90,0,0])
                cylinder(r=10, h=100, center=true);
    }
}

//if not a preview, render with rounding for final-print
if($preview == false)
{
    Gimble_Base_Split_Final();
}
else
{
    //if a preview render, do not round-anything, and also show other parts
    #Laser_Level_Gimble_Base();
    //Use a union, hull, or some module call and assemble here
    translate([0,0,Gimble_Arm_Height ])
        rotate([0,90,0])
        Laser_Measure_Mount();


    Gimble_Base_Split_Final();
}