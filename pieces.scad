$fn=100;

//TODO 1 = 1mm
//need to multiply all numbers by 10 for cm

//UTILITY MODULES
module dome(d){
    difference(){
        sphere(d=d);
        translate([-d,-d,-d]){
            cube([d*2,d*2,d]);
        }
    }
}
//dome(10);
module half_cylinder(d,h){
    difference(){
        translate([-h/2,0,0])
        rotate([0,90,0])
            cylinder(d=d,h=h);
        translate([-d,-d,-d]){
            cube([d*2,d*2,d]);
        }
    }
}
//half_cylinder(10, 10);

//PIECE MODULES

module pawn(){
    cylinder(d1=20, d2=10, h=10);
    translate([0,0,10]){
        cylinder(d1=10, d2=15, h=10);
    }
    translate([0,0,20]){
        sphere(d=13.5);
    }
}
//pawn();

module alfil(){
    difference(){
        scale([10,10,20]){
            hull(){
                half_cylinder(3,1.5);
                translate([0,1,1]){
                    half_cylinder(1,0.75);
                }
                translate([0,-0.75,1]){
                    half_cylinder(1,1.5);
                }
            }
            hull(){
                translate([0,-0.5,1.5]){
                    half_cylinder(0.5,1);
                }
                translate([0,0.25,1.5]){
                    half_cylinder(0.5,1);
                }
            }
        }
        scale([10,5,10]){
            hull(){
                half_cylinder(3,1.5);
                translate([0,1,1]){
                    half_cylinder(1,0.75);
                }
                translate([0,-0.75,1]){
                    half_cylinder(1,1.5);
                }
            }
            
        }
    }
    
}
alfil();

module mann(){
    scale([10,10,10]){//mm => cm
        cylinder(d1=2, d2=1, h=2);
        translate([0,0,2]){
            cylinder(d1=1, d2=1.5, h=1);
        }
        difference(){
            translate([0,0,3]){
                cylinder(d=1, h=1);
            }
            union(){
                for(a=[0:45:360]){//make cutout cones every 45 deg around edge
                    //cutout from top down
                    translate([sin(a)/2,cos(a)/2,3.5]){
                        cylinder(d1=0,d2=0.25, h=0.5);
                    }
                    //offset by 45/2 cutout from base up
                    translate([sin(a+22.5)/2,cos(a+22.5)/2,3]){
                        cylinder(d1=0.25,d2=0, h=0.5);
                    }
                }
            }
        }
    }
}
//mann();

module wazir(){//jester look
    scale([10,10,10]){
        //TODO maybe parameterize it for 2,3,4 jester jangles
        cylinder(d1=2, d2=0.75, h=2);
        translate([0,0,2]){
            cylinder(d1=0.75, d2=1.5, h=1);
        }
        
        //jester floppy things
        translate([-0.9,0,0.5]){
            cylinder(d1=0.1,d2=0.75, h=2.5);
            sphere(d=0.5);
            translate([0,0,2.5]){
                dome(d=0.75);
            }
        }
        translate([0.9,0,0.5]){
            cylinder(d1=0.1,d2=0.75, h=2.5);
            sphere(d=0.5);
            translate([0,0,2.5]){
                dome(d=0.75);
            }
        }
        translate([0,-0.75,0.5]){
            cylinder(d1=0.1,d2=0.75, h=2.5);
            sphere(d=0.5);
            translate([0,0,2.5]){
                dome(d=0.75);
            }
        }
        
        //top of hat
        //hull(){
        //    translate([0,0,2]){
        //        cylinder(d1=0.75, d2=1.5, h=1);
        //    }
        //}
        hull(){
            translate([0,0,3.5]){
                scale([1,0.5,1])
                dome(1.5);
            }
            translate([0.9,0,3]){
                dome(0.75);
            }
            translate([-0.9,0,3]){
                dome(0.75);
            }
            
        }
        
        hull(){//rear jangley thing
            translate([0,0,3.5]){
                scale([1,0.5,1])
                dome(1.5);
            }
            translate([0,-0.75,3]){
                dome(0.75);
            }
        }
        
        hull(){
            translate([0,0,3.5]){
                scale([1,0.5,1])
                dome(1.5);
            }
            translate([0,0,2]){
                cylinder(d1=0.75, d2=1.5, h=1);
            }
        }
    }
}
//wazir();


module watchtower_rook(){
    scale([10,10,10]){
        $fn=6;
        cylinder(d1=2, d2=1.75, h=2);
        translate([0,0,2]){
            cylinder(d1=1.75, d2=2.5, h=0.5);
        }
        translate([0,0,2.5]){
            cylinder(d=2.5, h=0.5);
        }
        translate([0,0,3]){
            cylinder(d1=2.5, d2=0, h=1);
        }
    }
    
}
//watchtower_rook();