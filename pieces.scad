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
        //sphere(d=12.5);// => for a collar, also hides the bottom of sphere
        //corrected with dome()
        dome(15);
    }
}
//pawn();

module promo_crown(){
    scale([10,10,10]){
        hull(){
            translate([-0.5,-0.05,0])
            cube([0.1,0.1,0.1]);
            
            translate([0.4,-0.05,0])
            cube([0.1,0.1,0.1]);
            
            translate([-1,-0.05,0.5])
            cube([0.1,0.1,0.1]);
            
            translate([0.9,-0.05,0.5])
            cube([0.1,0.1,0.1]);
        }
        
        hull(){
            translate([-0.5,-0.05,0])
            cube([0.1,0.1,0.1]);
            
            translate([0.4,-0.05,0])
            cube([0.1,0.1,0.1]);
            
            translate([-0.005,-0.05,1])
            cube([0.01,0.1,0.1]);
        }
        
        hull(){
            translate([-0.05,-0.3,0.5])
            cube([0.1,0.1,0.01]);
            
            translate([-0.05,-0.05,0.4])
            cube([0.1,0.1,0.1]);
            
            translate([-0.05,-0.05,0])
            cube([0.1,0.1,0.1]);
        }
    }
}

//promo_crown();

//translate([0,0,23])
//promo_crown();

module crown_pawn(){
    difference(){
        
        pawn();
        
        translate([0,0,23])
        scale([1.5,1.5,1.5])
        promo_crown();
    }
}
crown_pawn();

module promo_disc_alt(){
    difference(){
        difference(){
            translate([0,0,20]){
                cylinder(d1=18, d2=22, h=5);
            }
            pawn();
        }
        union(){
            cylinder(d=13.5,h=100);
            translate([0,50,25]){
                rotate([90,0,0]){
                    cylinder(d=5,h=100);
                }
            }
            translate([-50,0,25]){
                rotate([0,90,0]){
                    cylinder(d=5,h=100);
                }
            }
        }
    }
}
//promo_disc_alt();

module promotion_disc(){
    difference(){
        difference(){
            cylinder(d1=18,d2=25,h=10);
            pawn();
        }
        union(){
            cylinder(d=18,h=40);
            translate([0,50,5]){
                rotate([90,0,0]){
                    cylinder(d=5,h=100);
                }
            }
            translate([-50,0,5]){
                rotate([0,90,0]){
                    cylinder(d=5,h=100);
                }
            }
        }
    }
}
//promotion_disc();

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
//alfil();

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
        $fn=6;//4 is cool to
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

module king(){
    scale([10,10,10]){
        cylinder(d1=2.5, d2=1, h=1.5);
        difference(){
            hull(){
                translate([0,0,1.5]){
                    cylinder(d1=1, d2=1.5, h=2.5);
                }
                translate([0,0,4]){
                    for(a=[0:45:360]){
                        translate([sin(a)/1.75,cos(a)/1.75,0]){
                            cylinder(d=0.3,h=0.75);
                        }
                    }
                }
            }
            hull(){
                translate([0,0,4]){
                    for(a=[0:45:360]){
                        translate([sin(a)/2.5,cos(a)/2.5,0]){
                            cylinder(d1=0.3, d2=0.4,h=0.75);
                        }
                    }
                }
            }
        }
        //maybe add half_cylinder cross on the top
    }
}
//king();

module courier(){//bishop
    scale([10,10,10]){//mm => cm
        cylinder(d1=2, d2=1, h=2);
        translate([0,0,2]){
            cylinder(d1=1, d2=1.5, h=1);
        }
        
        difference(){
            translate([0,0,3]){
                scale([1,1,2]){
                    dome(1.5);
                }
                
            }
            translate([0.5,0,4])
            rotate([0,-60,0])
            cylinder(d=2,h=0.3);
            
        }
    }
}
//courier();

module knight(){
    scale([10,10,10]){//mm => cm
        cylinder(d1=2, d2=1.5, h=1);
        
        //shoulder
        hull(){
            translate([0,0,1]){
                cylinder(d=1.5,h=0.001);
            }
            
            translate([0,0.75,2]){
                sphere(d=0.75);
            }
        }
        
        //neck
        hull(){
            translate([0,0.75,2]){
                sphere(d=0.75);
            }
            translate([0,0,2.5]){
                dome(d=0.75);
            }
        }
        
        //head/snout
        hull(){
            translate([0,0.75,2]){
                sphere(d=0.75);
            }
            translate([0,0,2.5]){
                dome(d=0.75);
            }
            translate([0,-0.8,1.25])
            rotate([-40,0,0])
            scale([1,1.3,1])
            cylinder(d1=0.3,d2=0.75,h=1);
        }
        //mane
        hull(){
            translate([-0.15,0,2.5]){
                cube([0.3,0.1,0.5]);
            }
            
            translate([-0.15,0.9,1.9]){
                cube([0.3,0.1,0.5]);
            }
        }
        
    }
}
//knight();

module bigger_knight(){
    scale([10,10,10]){//mm => cm
        cylinder(d1=2, d2=1.5, h=1);
        
        //shoulder
        hull(){
            translate([0,0,1]){
                cylinder(d=1.5,h=0.001);
            }
            
            translate([0,0.75,2]){
                sphere(d=1);
            }
        }
        
        //neck
        hull(){
            translate([0,0.75,2]){
                sphere(d=1);
            }
            translate([0,0,3]){
                dome(d=1);
            }
        }
        
        //head/snout
        hull(){
            translate([0,0.75,2]){
                sphere(d=1);
            }
            translate([0,0,3]){
                dome(d=1);
            }
            translate([0,-0.8,1.15])
            rotate([-30,0,0])
            scale([1,1.5,1])
            cylinder(d1=0.5,d2=0.7,h=1);
        }
        
        hull(){
            translate([-0.25,0,3.3]){
                cube([0.5,0.1,0.7]);
            }
            
            translate([-0.25,1.05,2.1]){
                cube([0.5,0.1,0.7]);
            }
        }
        
    }
}
//bigger_knight();

module ferz(){//queen
    scale([10,10,10]){//mm => cm
        
        cylinder(d1=2, d2=1, h=2);
        translate([0,0,2]){
            difference(){
                difference(){
                    cylinder(d1=1, d2=1.5, h=1);
                    cylinder(d1=0.5, d2=1, h=1);
                }
                union(){
                    for(a=[0:45:360]){//make cutout cones every 45 deg around edge
                        //cutout from top down
                        translate([1.5*sin(a)/2,1.5*cos(a)/2,0.5]){
                            cylinder(d1=0,d2=0.7, h=0.5);
                        }
                        //offset by 45/2 cutout from base up
                        translate([sin(a+22.5)/2,cos(a+22.5)/2,0]){
                            cylinder(d1=0.3,d2=0, h=0.5);
                        }
                    }
                }
            }
            cylinder(d1=1,d2=0.3,h=1.5);
        }
    }
}
//ferz();