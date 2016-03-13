use <constants.scad>;



function half(x) = x / 2;

module slim_board() {

	center_translation = [-half(SLIM_BOARD_LENGTH),-half(WIDTH),-half(SLIM_BOARD_HEIGHT)];

    color("green")
		translate(center_translation)
			cube([SLIM_BOARD_LENGTH,WIDTH,SLIM_BOARD_HEIGHT]);

}

module fat_board() {

	front_offset = 1;

	x_offset = front_offset-half(FAT_BOARD_LENGTH);
	y_offset = -half(WIDTH);
	z_offset = -half(SLIM_BOARD_HEIGHT)-FAT_BOARD_HEIGHT;

    color("green")
		translate([x_offset,y_offset,z_offset])
			cube([FAT_BOARD_LENGTH,WIDTH,FAT_BOARD_HEIGHT]);

}

module board() {

	slim_board();
	fat_board();

}


module front_connector() {

	ledge = 1.19;

	x_offset = -half(SLIM_BOARD_LENGTH)-ledge;
	y_offset = -half(FRONT_CONNECTOR_WIDTH);
	z_offset = half(SLIM_BOARD_HEIGHT);

    color(METALLIC)
		translate([x_offset,y_offset,z_offset])
			cube([FRONT_CONNECTOR_LENGTH,FRONT_CONNECTOR_WIDTH,FRONT_CONNECTOR_HEIGHT]);

}


module rear_connectors() {
	

	connector_dimmensions = [REAR_CONNECTOR_LENGTH,REAR_CONNECTOR_WIDTH,REAR_CONNECTOR_HEIGHT];
	rear_separation = -3.45;
	lateral_separation = 2.5;

	x_offset = half(SLIM_BOARD_LENGTH)-REAR_CONNECTOR_LENGTH+rear_separation;
	y_offset = half(WIDTH)-REAR_CONNECTOR_WIDTH-lateral_separation;
	second_y_offset = -half(WIDTH)+lateral_separation;

	z_offset = half(SLIM_BOARD_HEIGHT);

    color("white")
		translate([x_offset,y_offset,z_offset])
			cube(connector_dimmensions);

    
	color("white")
		translate([x_offset,second_y_offset,z_offset])
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

	positioned_holder([offset_x, half(WIDTH)-lateral_ledge,0]);
	positioned_holder([offset_x,-half(WIDTH)+lateral_ledge,0]);

}


module positioned_holder(traslation) {
	
	dimensions = [HOLDER_LENGTH,HOLDER_WIDTH,HOLDER_HEIGHT];

	center_translation = [-half(HOLDER_LENGTH),-half(HOLDER_WIDTH),-half(HOLDER_HEIGHT)];
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