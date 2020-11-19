// Laser Measure Mounting
// John Bargman 2020-11-19

// All measurements in millimeters

// Uses Laser_measure
use<Laser Measure.scad>

module Laser_Measure_Mount()
{
    origin = [0,0,0];

    translate(origin)
    {
        Laser_Measure();
    }

}