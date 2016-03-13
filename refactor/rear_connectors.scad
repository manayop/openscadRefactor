include <constants.scad>;
include <functions.scad>;

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
