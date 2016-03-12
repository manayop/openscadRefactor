METALLIC = "silver";

BOARD_WIDTH = 19.8;
SLIM_BOARD_HEIGHT = 0.8;

function half(x) = x / 2;

module slim_board() {

	length = 33.8;

    color("green")
		translate([-half(length),-half(BOARD_WIDTH),-half(SLIM_BOARD_HEIGHT)])
			cube([length,BOARD_WIDTH,SLIM_BOARD_HEIGHT]);

}

module fat_board() {

	x_size = 30.5;
	z_size = 2;
	front_ledge = 1;

	translate_x = front_ledge-half(x_size);
	translate_y = -half(BOARD_WIDTH);
	translate_z = -half(SLIM_BOARD_HEIGHT)-z_size;

    color("green")
		translate([translate_x,translate_y,translate_z])
			cube([x_size,BOARD_WIDTH,z_size]);

}

module board() {

	slim_board();
	fat_board();

}


module scisky() {
	board();
    color(METALLIC) translate([-29.48/2,0,1.8]) cube([ 6.7, 7.9,2.8], center=true);
    color("white")  translate([  29.48/2-3-4.4,3,0.4]) cube([ 6.1, 4.4,4.1], center=false);
    color("white")  translate([  29.48/2-3-4.4,-7.4,0.4]) cube([ 6.1, 4.4,4.1], center=false);
    color("red")    translate([  0.5, 9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([  0.5,-9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([ -11,   9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([ -11,  -9.5,0]) cube([ 3, 3, 2], center=true);
    }
    
scisky();