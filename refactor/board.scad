include <constants.scad>;
include <functions.scad>;

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