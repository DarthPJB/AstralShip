// Mounting bracket for second Axis Gimble
// John Bargman 2020-11-19

// All measurements in millimeters

// Uses Laser-level & Laser Measure Mount
use <Laser Level.scad>
use <Laser Measure Mount.scad>


module Laser_Level_Gimble_Base()
{

    origin = [0,0,-50];
    Laser_Gimble_Width_Bottom = 70;
    Laser_Gimble_Width_Top = 100;

difference()
{
    union()
    {
        translate(origin)
           cylinder(h= 100, d1=Laser_Gimble_Width_Bottom, d2=Laser_Gimble_Width_Top);
    }
    LaserLevel();
}
}

LaserLevel();

#Laser_Level_Gimble_Base()


translate([0,0,100])
    %Laser_Measure_Mount();