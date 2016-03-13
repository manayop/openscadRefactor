include <constants.scad>;
include <functions.scad>;

module front_connector() {

	ledge = 1.19;

	x_offset = -half(SLIM_BOARD_LENGTH)-ledge;
	y_offset = -half(FRONT_CONNECTOR_WIDTH);
	z_offset = half(SLIM_BOARD_HEIGHT);

    color(METALLIC)
		translate([x_offset,y_offset,z_offset])
			cube([FRONT_CONNECTOR_LENGTH,FRONT_CONNECTOR_WIDTH,FRONT_CONNECTOR_HEIGHT]);

}

