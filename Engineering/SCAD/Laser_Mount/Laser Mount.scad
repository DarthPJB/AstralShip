// Mounting bracket for second Axis Gimble
// John Bargman 2020-11-19

// All measurements in millimeters

// Uses Laser-level & Laser Measure Mount
use <Laser Level.scad>
use <Laser Measure Mount.scad>
//use <Round-Anything\MinkowskiRound.scad>

//Set to height detail only for rendering:
$fn= $preview == true? 10 : 20;

Tolerance = 0.1;
Mounting_Screw_Diamiter = 8 + Tolerance;
Laser_Gimble_Height = 45;
Laser_Gimble_Width_Top = 100;
Laser_Gimble_Guide_Height = Laser_Gimble_Height / 3;

module Laser_Level_Gimble_Base()
{
    origin = [0,0,-Laser_Gimble_Height];

    //Only do rounding in final render
    Laser_Gimble_Width_Bottom = 70;

    //minkowskiOutsideRound(0.5, 1.5,Rounding, [Laser_Gimble_Width_Top,Laser_Gimble_Width_Top,Laser_Gimble_Height])
        difference()
        {
            union()
            {
                translate(origin)
                cylinder(h= Laser_Gimble_Height, d1=Laser_Gimble_Width_Bottom, d2=Laser_Gimble_Width_Top);
            }
            union()
            {
            LaserLevel();
            translate(origin)
                translate([0,0,-Tolerance])
                    cylinder(Laser_Gimble_Height + Tolerance * 2, d= Mounting_Screw_Diamiter);
            }
        }
}

module Laser_Level_Gimble_Top()
{
        origin = [0,0,Tolerance * 6];

        difference()
        {
            translate(origin)
                cylinder(h=Laser_Gimble_Guide_Height, d = Laser_Gimble_Width_Top /1.2);
            translate(origin)
                translate([0,0,-Tolerance])
                    cylinder(Laser_Gimble_Guide_Height + Tolerance * 2, d= Mounting_Screw_Diamiter);
        }

}

//LaserLevel();

//if not a preview, render with rounding for final-print
if($preview == false)
{
    minkowski()
    {
        Laser_Level_Gimble_Base();
        cylinder(1);
    }
    minkowski()
    {
        Laser_Level_Gimble_Top();
        sphere(1);
    }
}
else
{
    //if a preview render, do not round-anything, and also show other parts
    Laser_Level_Gimble_Base();
    translate([0,0,100])
        %Laser_Measure_Mount();
    #Laser_Level_Gimble_Top();
}