// Workshop rafter point-data; 
// This file should be used by a higher level file
// to better represent the data.

// The data will be devided into sets; such that important structures are recorded together, with their own unique origin point, witch is referenced to world-co-ordinates. 
// This should allow for rapid recoring and efficient matrix transformation to final CAD data.
$fn = 5;

use<lib/Workshop_Utility.scad>
use<beams/WorkshopRafterBeams.scad>

Origin_one = [[0,0,1453],[0,0,0]];
Origin_two = [[0,0,0],[0,0,0]];
Test_Set_One = [
    //    [Yaw, Pitch, Distance]

    //Test Data
    [0,90,5740],
    [0,120,3417],
    [0,130,2543],
    [0,150,1790],


    //Test  Data Set 2
    [0,115,3912],
    [352.5,115,3953],
    [14,86,3364],
    [23,85.5,3531],

    [53,86,4858],
    [52,94,4771],

    //John reading test data 1
    [89,86,4446],
    [100,86,4458],
    //[94.5,86,44x5],
    [100,100.5,4411],
    [89,100.5,4382],
    [89,115,4563],
    [100,114.5,4567],
    [101,118,4104],
    [86,116.5,3877],
    [87,83.5,3756],
    [102,84.5,3876]];

Test_Set_Two = [

        // Start with the wall above the stairs
    [280,87,3774],
    [280,92,3735],
    [280,96,3714],

        //Base of the stairs
    [264,125,3095],
    [255,119,4011],
    [255,102,3944],
    [269.5,103,3808],
    [270,84,3912],
    [270,115,2758],
    [270,122,2884],
    [275,120,2706],
    [280,104.5,2690],
    [280,113,2748],
    [290,100,2800],
    [290,94,2817],
    [300.5,808.5,3075],
    [300,82.5,3131],
    [302,82,3209],
    [306,82,3349],
];

Test_Set_Three = [
    [314,87,5037],
    [54,87,5013],
    [211,91,8132],
    [156,90,8146],
    [0,150,1815],
    [0,0,0908],
    [0,83,3345],
    [0,85.5,3385],
    [355,85.5,3413],
    [14,85,3393],
    [180,73,2139],
    [180,90,1935],
    [251,73,2272]

];

module Workshop_Assembly(Cube_Size = 50, draw_beams = false)
{
    Rafters();
    PointSet(Origin_one, Test_Set_One, "red", Cube_Size, draw_beams);
    PointSet(Origin_one, Test_Set_Two, "yellow", Cube_Size, draw_beams);
    PointSet(Origin_one, Test_Set_Three, "blue", Cube_Size, draw_beams);
}
Workshop_Assembly(50, true);

color([.5,.5,.5,.1])
hull()
{
    Workshop_Assembly();
}