include <board.scad>;
include <front_connector.scad>;
include <rear_connectors.scad>;
include <holders.scad>;


module scisky() {

	board();
	front_connector();
	rear_connectors();
	holders();

}
    
scisky();