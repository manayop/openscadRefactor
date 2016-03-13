METALLIC = "silver";

BOARD_WIDTH = 19.8;
SLIM_BOARD_HEIGHT = 0.8;

function half(x) = x / 2;

module slim_board() {

	length = 33.8;

	center_translation = [-half(length),-half(BOARD_WIDTH),-half(SLIM_BOARD_HEIGHT)];

    color("green")
		translate(center_translation)
			cube([length,BOARD_WIDTH,SLIM_BOARD_HEIGHT]);

}

module fat_board() {

	length = 30.5;
	height = 2;
	front_ledge = 1;

	translate_x = front_ledge-half(length);
	translate_y = -half(BOARD_WIDTH);
	translate_z = -half(SLIM_BOARD_HEIGHT)-height;

    color("green")
		translate([translate_x,translate_y,translate_z])
			cube([length,BOARD_WIDTH,height]);

}

module board() {

	slim_board();
	fat_board();

}


module front_connector() {

    color(METALLIC) translate([-29.48/2,0,1.8]) cube([ 6.7, 7.9,2.8], center=true);

}


module scisky() {
	board();
	front_connector();
    color("white")  translate([  29.48/2-3-4.4,3,0.4]) cube([ 6.1, 4.4,4.1], center=false);
    color("white")  translate([  29.48/2-3-4.4,-7.4,0.4]) cube([ 6.1, 4.4,4.1], center=false);
    color("red")    translate([  0.5, 9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([  0.5,-9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([ -11,   9.5,0]) cube([ 3, 3, 2], center=true);
    color("red")    translate([ -11,  -9.5,0]) cube([ 3, 3, 2], center=true);
    }
    
scisky();