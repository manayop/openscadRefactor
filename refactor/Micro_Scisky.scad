METALLIC = "silver";

BOARD_WIDTH = 19.8;
SLIM_BOARD_HEIGHT = 0.8;
SLIM_BOARD_LENGTH = 33.8;

function half(x) = x / 2;

module slim_board() {

	center_translation = [-half(SLIM_BOARD_LENGTH),-half(BOARD_WIDTH),-half(SLIM_BOARD_HEIGHT)];

    color("green")
		translate(center_translation)
			cube([SLIM_BOARD_LENGTH,BOARD_WIDTH,SLIM_BOARD_HEIGHT]);

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

	length = 6.7;
	width = 7.9;
	height = 2.8;

	ledge = 2.16;

	translate_x = -half(SLIM_BOARD_LENGTH)-ledge;
	translate_y = -half(width);
	translate_z = half(SLIM_BOARD_HEIGHT);

    color(METALLIC)
		translate([translate_x,translate_y,translate_z])
			cube([length,width,height]);

}


module rear_connectors() {
	
	length = 6.1;
	width = 4.4;
	height = 4.1;

	connector_dimmensions = [length,width,height];
	rear_separation = -3.45;
	center_separation = 3;

	translate_x = half(SLIM_BOARD_LENGTH)-length+rear_separation;
	translate_z = half(SLIM_BOARD_HEIGHT);

    color("white")
		translate([translate_x,center_separation,translate_z])
			cube(connector_dimmensions);
    
	color("white")
		translate([translate_x,-center_separation-width,translate_z])
			cube(connector_dimmensions);

}


module holders() {


	center_holders_pair();	
	front_holders_pair();

}


module center_holders_pair() {

	translation_x = 0.5;
	

	positioned_holder([translation_x, 9.5,0]);
	positioned_holder([translation_x,-9.5,0]);

}

module front_holders_pair() {

	positioned_holder([-11,9.5,0]);
	positioned_holder([-11,-9.5,0]);

}

module positioned_holder(traslation) {
	
	length = 3;
	width = 3;
	height = 2;

	dimensions = [length,width,height];

	center_translation = [-half(length),-half(width),-half(height)];
    color("red")
		translate(traslation)
			translate(center_translation)
				cube(dimensions);

}


module scisky() {

	board();
	front_connector();
	rear_connectors();
	holders();

}
    
scisky();