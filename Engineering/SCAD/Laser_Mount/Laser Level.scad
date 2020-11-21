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


//measurements for the cylender section at the top of the cone.
Circle_Diameter = 67;
Circle_Diameter_BatteryBox_Top = 68;
Circle_Radius= Circle_Diameter /2 ;

//measurements for the battery box
BatteryBox_Width = 49 
    + (Tolerance *2);
BatteryBox_Height=62
    + (Tolerance *2);

BatteryBox_Bottom_Depth=7.5;
BatteryBox_Top_Middle_Depth=5.5;


//lower cone diameter
Cone_Middle_Circle_Diameter = 78;
Cone_Bottom_Circle_Diameter = 78;

Circle_Height = 12;
BatteryBox_Top_Height=14;
Level_Middle_Distance = 50;
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
 
        BatteryBox_Distance = (Circle_Radius + (BatteryBox_Top_Middle_Depth + Tolerance));
        //Battery Box is a rough cube, translated into position.
        translate([-BatteryBox_Distance,-BatteryBox_Width/2, -(BatteryBox_Height + BatteryBox_Top_Height)])
            cube([BatteryBox_Distance,
                BatteryBox_Width,
                BatteryBox_Height]);
        
        //Top Circular fitting is modeled as a rough cylender
        translate([0,0,-Circle_Dist])
            cylinder(h = Circle_Dist,
                d1 = Gimble_Base_Top,
                d2 = Gimble_Base_Top);

        //Conical top secion modeled as a series of cones
        union()
        {
            First_Cone_Base = BatteryBox_Top_Height;
            First_Cone_Height = BatteryBox_Top_Height - Circle_Dist;
            Second_Cone_Base = Level_Middle_Distance;
            Second_Cone_Height = Level_Middle_Distance - First_Cone_Base;
            translate([0,0,-First_Cone_Base])
                cylinder(h = First_Cone_Height, 
                    d1 = Gimble_Base_BatteryBox_Top, 
                    d2 = Gimble_Base_Top);
            translate([0,0, -Second_Cone_Base])
                cylinder(h = Second_Cone_Height,
                d1 = Gimble_Base_Middle,
                d2 = Gimble_Base_BatteryBox_Top);
            translate([0,0,-LaserLevel_Total_Height])
                    cylinder(
                        h = LaserLevel_Total_Height - Second_Cone_Base, 
                        d1 = Gimble_Base_Bottom, 
                        d2 = Gimble_Base_Middle);
        }
        
    }
    
}

LaserLevel();