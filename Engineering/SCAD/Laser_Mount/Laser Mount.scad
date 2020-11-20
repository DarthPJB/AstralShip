// Mounting bracket for second Axis Gimble
// John Bargman 2020-11-19

// All measurements in millimeters

// Uses Laser-level & Laser Measure Mount
use <Laser Level.scad>
use <Laser Measure Mount.scad>
use <Round-Anything\MinkowskiRound.scad>

//Set to height detail only for rendering:
$fn= $preview == true? 10 : 20;


module Laser_Level_Gimble_Base()
{
    //Only do rounding in final render
    Laser_Gimble_Height = 50;
    Laser_Gimble_Drop = 45;

    origin = [0,0,-Laser_Gimble_Drop];

    Laser_Gimble_Width_Bottom = 70;
    Laser_Gimble_Width_Top = 100;

    //minkowskiOutsideRound(0.5, 1.5,Rounding, [Laser_Gimble_Width_Top,Laser_Gimble_Width_Top,Laser_Gimble_Height])
        difference()
        {
            union()
            {
                translate(origin)
                cylinder(h= Laser_Gimble_Height, d1=Laser_Gimble_Width_Bottom, d2=Laser_Gimble_Width_Top);
            }
            LaserLevel();
        }
        cylinder(1);
}

//LaserLevel();

if($preview == false)
{
    minkowski()
        Laser_Level_Gimble_Base();
}
else
    Laser_Level_Gimble_Base();

translate([0,0,100])
    Laser_Measure_Mount();