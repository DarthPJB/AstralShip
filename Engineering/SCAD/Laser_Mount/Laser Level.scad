// recreation of the Laser_Level head-unit from the workshop
// John Bargman 2020-11-19

//all measurements in millimeters

// Top of the laser level
module LaserLevel()
{
//Add this tolerance to all measurements (to slip-fit)
Tolerance = 0.5;
//Set to height detail only for rendering:
$fn= $preview == true? 50 : 100;
//measurements for the battery box
BatteryBox_Width = 49;
BatteryBox_Height=62;
BatteryBox_Circle_Center_Distance=40;
BatteryBox_Top_Height=15;
BatteryBox_Bottom_Depth=7.5;
BatteryBox_Top_Middle_Depth=5.5;
BatteryBox_Bottom_Middle_Depth=0;

//measurements for the cylender section at the top of the cone.
Circle_Diameter = 67;
Circle_Diameter_BatteryBox_Top = 70;
Circle_Height = 13;

//lower cone diameter
Cone_Middle_Circle_Diameter = 80;
Cone_Bottom_Circle_Diameter = 82;

Level_Middle_Distance = 10;

//Additional value providing extra distance in battery-case width (to properly intersect)
Battery_Top_Overlap = 10;

LaserLevel_Total_Height = 100;

origin = [0,0,0];

    translate(origin)
    union()
    {
        Circle_Dist = Circle_Height + Tolerance;
        //Combine Battery Box and Conical Center
        Gimble_Base_Top = Circle_Diameter + (Tolerance * 2);
        Gimble_Base_BatteryBox_Top= Circle_Diameter_BatteryBox_Top +(Tolerance * 2);
        Gimble_Base_Middle = Cone_Middle_Circle_Diameter  +(Tolerance * 2);
        Gimble_Base_Bottom = Cone_Bottom_Circle_Diameter +(Tolerance * 2);

        BatteryBox_Distance = (BatteryBox_Circle_Center_Distance + BatteryBox_Top_Middle_Depth);
        //Battery Box is a rough cube, translated into position.
        translate([-BatteryBox_Distance,- BatteryBox_Width/2, - (BatteryBox_Height + BatteryBox_Top_Height)])
            cube([BatteryBox_Top_Height + Tolerance + Battery_Top_Overlap,
                BatteryBox_Width+(Tolerance *2),
                BatteryBox_Height+ (Tolerance *2)]);
        
        //Top Circular fitting is modeled as a rough cylender
        translate([0,0,-Circle_Dist])
            cylinder(h = Circle_Dist,
                d1 = Gimble_Base_Top,
                d2 = Gimble_Base_Top);

        //Conical top secion modeled as a series of cones
        union()
        {
            translate([0,0,-(Circle_Dist + BatteryBox_Top_Height)])
                cylinder(h = BatteryBox_Top_Height, 
                    d1 = Gimble_Base_BatteryBox_Top, 
                    d2 = Circle_Dist)
            translate([0,0,-LaserLevel_Total_Height])
                    cylinder(
                        h = LaserLevel_Total_Height - Circle_Height , 
                        d1 = Gimble_Base_Bottom, 
                        d2 = Gimble_Base_Top);
        }
        
    }
    
}

LaserLevel();