use <utilities/write.scad>
// include a ruler

module ruler(length = 150, t=[0,0,0], r=[0,0,0], line_color="white", ruler_color="black")
{
    mark_width = 0.125;
    mark_depth = 0.05;

    rotate(r) translate(t) union()
        {
            color(ruler_color) cube( [mark_depth-0.01, length, 8] );
            for ( i = [1:length-1] )
            {
                if (i % 10 == 0)	// tall one every 10
                {
                    translate( [0, i, 0] ) color(line_color) cube( [mark_depth, mark_width, 7 ] );
                    translate( [0, i+(2*mark_width), 6.5] ) rotate([90,0,90]) color("white") text(str(i), size=1,font = "Liberation Sans");
                }
                else if (i % 5 == 0)	// med. tall one every 5
                    translate( [0, i, 0] ) color(line_color) cube( [mark_depth, mark_width, 5 ] );
                else	// otherwise a short one
                    translate( [0, i, 0] ) color(line_color) cube( [mark_depth, mark_width, 3 ] );
            }
        }
}

module yruler(length = 150, line_color="white", ruler_color="black")
{
    ruler(length, line_color="white", ruler_color="black");
}

module xruler(length = 150, line_color="white", ruler_color="black")
{
    ruler(length, r=[0,0,-90], line_color="white", ruler_color="black");
}

module zruler(length = 150, line_color="white", ruler_color="black")
{
    ruler(length, r=[90,0,-45], line_color="white", ruler_color="black");
}

module xyzruler(length = 150, line_color="white", ruler_color="black")
{
    xruler(length, line_color="white", ruler_color="black");
    yruler(length, line_color="white", ruler_color="black");
    zruler(length, line_color="white", ruler_color="black");
}

// =======================================================================

// Test
// ====

module RulerTesting() {
	cube(30); 
	% xyzruler(32);
	}

RulerDebug=true;							// change to true for testing in this file

if (RulerDebug==true) 
	RulerTesting();

// =======================================================================

