// recreation of the Laser_Level head-unit from the workshop
// John Bargman 2020-11-19

//all measurements in millimeters

// Top of the laser level
module LaserLevel()
{
//Add this tolerance to all measurements (to slip-fit)
Tolerance = 0.5;

//measurements for the battery box
BatteryBox_Width = 49;
BatteryBox_Height=62;
BatteryBox_Circle_Center_Distance=40;
BatteryBox_Top_Depth=15;
BatteryBox_Bottom_Depth=7.5;
BatteryBox_Top_Middle_Depth=5.5;
BatteryBox_Bottom_Middle_Depth=0;

//measurements for the cylender section at the top of the cone.
Circle_Diameter = 67;
Circle_Diameter_BatteryBox_Top = 69;
Circle_Height = 13;

//lower cone diameter
Cone_Bottom_Circle_Diameter = 78;

LaserLevel_Total_Height = 100;

origin = [0,0,-BatteryBox_Top_Depth /2];

    translate(origin)
    union()
    {
        //Combine Battery Box and Conical Center
        
        //Top Circular fitting is modeled as a rough cylender
        cylinder(h = Circle_Height + Tolerance,d1 = Circle_Diameter_BatteryBox_Top+(Tolerance * 2) ,d2 = Circle_Diameter +(Tolerance * 2), center=true);
        //Battery Box is a rough cube, translated into position.
        translate([BatteryBox_Circle_Center_Distance - (BatteryBox_Top_Depth/2),0,-BatteryBox_Height/2])
            cube([BatteryBox_Top_Depth + Tolerance,
                BatteryBox_Width+(Tolerance *2),
                BatteryBox_Height+ (Tolerance *2)],center=true);
        //Conical top secion modeled roughly as a cone
        translate([0,0,(-Circle_Height/2) -(LaserLevel_Total_Height-Circle_Height) /2])
                cylinder(
                    h = LaserLevel_Total_Height - Circle_Height , 
                    d1 = Cone_Bottom_Circle_Diameter +(Tolerance * 2), 
                    d2 = Circle_Diameter+(Tolerance * 2), center=true);
        
    }
    
}

LaserLevel();