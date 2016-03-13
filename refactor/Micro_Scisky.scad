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
	front_offset = 1;

	x_offset = front_offset-half(length);
	y_offset = -half(BOARD_WIDTH);
	z_offset = -half(SLIM_BOARD_HEIGHT)-height;

    color("green")
		translate([x_offset,y_offset,z_offset])
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

	ledge = 1.19;

	x_offset = -half(SLIM_BOARD_LENGTH)-ledge;
	y_offset = -half(width);
	z_offset = half(SLIM_BOARD_HEIGHT);

    color(METALLIC)
		translate([x_offset,y_offset,z_offset])
			cube([length,width,height]);

}


module rear_connectors() {
	
	length = 6.1;
	width = 4.4;
	height = 4.1;

	connector_dimmensions = [length,width,height];
	rear_separation = -3.45;
	center_separation = 3;

	x_offset = half(SLIM_BOARD_LENGTH)-length+rear_separation;
	z_offset = half(SLIM_BOARD_HEIGHT);

    color("white")
		translate([x_offset,center_separation,z_offset])
			cube(connector_dimmensions);
    
	color("white")
		translate([x_offset,-center_separation-width,z_offset])
			cube(connector_dimmensions);

}


module holders() {

	lateral_ledge = 0.4;
	offset_x_front_holders_pair = -11;
	offset_x_center_holders_pair = 0.5;

	holders_pair(offset_x_front_holders_pair,lateral_ledge);	
	holders_pair(offset_x_center_holders_pair,lateral_ledge);

}

module holders_pair(offset_x,lateral_ledge) {

	positioned_holder([offset_x, half(BOARD_WIDTH)-lateral_ledge,0]);
	positioned_holder([offset_x,-half(BOARD_WIDTH)+lateral_ledge,0]);

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