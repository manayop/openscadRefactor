include <constants.scad>;
include <functions.scad>;

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
