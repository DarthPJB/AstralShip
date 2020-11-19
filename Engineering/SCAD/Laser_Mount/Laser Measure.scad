// Laser measure recreation
// John Bargman 2020-11-19

// All measurements in millimeters

module Laser_Measure()
{
    origin = [0,0,0];
    origin_rotation = [0,90,90];

    translate(origin)
    {
        rotate(origin_rotation)
        {
            cylinder(100,10,10, center = true);   
        }
    }
}

