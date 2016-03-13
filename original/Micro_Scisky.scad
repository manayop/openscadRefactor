module scisky() {
    color("green")  translate([     0,0,  0])   cube([33.8,19.8,0.8], center=true);
    color("silver") translate([-29.48/2,0,1.8]) cube([ 6.7, 7.9,2.8], center=true);
    color("green")  translate([    1,0,-1.4])    cube([30.5,19.8,2], center=true);
    color("white")  translate([  29.48/2-3-4.4,3,0.4]) cube([ 6.1, 4.4,4.1], center=false);
    color("white")  translate([  29.48/2-3-4.4,-7.4,0.4]) cube([ 6.1, 4.4,4.1], center=false);
    color("red")    translate([  0.5, 9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([  0.5,-9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([ -11,   9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([ -11,  -9.5,0]) cube([ 3, 3, 2], center=true);
    }
    
scisky();