#include "colors.inc"
#include "textures.inc"     
      

camera { 
    location <-17,12,17>
    look_at <0,0,0>
}     
light_source { 
    <0,100,0>  
    color White    
}
background {
         color White
           }   
           


                                        // DECLARATION DE MACRO QUI SERONT UTILES POUR L'ANIMATION //           
#macro bezier_x(t_range)
    #local p0 = 0;
    #local p1 = 5.5;
    #local p2 = 8;
    #local p3 = 10;
    p0*(1-t_range)*(1 - t_range)*(1 - t_range) + 3*p1*t_range*(1-t_range)*(1-t_range) + 3*p2*t_range*t_range*(1 - t_range) +p3*t_range*t_range*t_range
#end

#macro bezier_y(t_range)
    #local p0 = 0;
    #local p1 = 5;
    #local p2 = 5;
    #local p3 = 0-0.1;
    p0*(1-t_range)*(1 - t_range)*(1 - t_range) + 3*p1*t_range*(1-t_range)*(1-t_range) + 3*p2*t_range*t_range*(1 - t_range) +p3*t_range*t_range*t_range
#end 

                                       
           
           
           
           
           
           
           
           
           
           


                                            // DECLARATION DE NOTRE DAMIER //                                                                                          
box {
    <-10.00,-0.1,-10.00>,<10.00,0.05,10.00>
    texture{         
        pigment{ checker        
                    rgb<1,1,1>
                    rgb<0,0,0>
                    scale 2.5
            }            
       finish { reflection 0.2
             specular 0.2  }
    }} 
                                            // FIN DECLARATION DE NOTRE DAMIER //
                                            
                                            
                                                                                      
                                            // DECLARATION DE LA TOUR// 
                                                                                        
#declare Tour =

    union{   

        cylinder{
            <0,0,0>,<0,0.5,0>,3       
        }
      
        ovus{2.8,1.5            
            translate <0,3,0>
            scale<0,0.4,0>
        }
     
        cylinder{
            <0,2.7,0>,<0,2.9,0>,1.8             
        } 
  
        cone{
            <0,2.8,0>,1.4,<0,8,0>,1.1            
        }       
        
        difference{          
            cylinder{
                <0,8,0>,<0,10,0>,1.7 
            }             
            cylinder{
                <0,9.6,0>,<0,11,0>,1.3 
            }    

            box{
                <5,9.3,0.2><-5,10,-0.2>  
            }
      
            box{
                <5,9.3,0.2><-5,10,-0.2> 
                 rotate <0,90,0> 
            }
        } // FIN DIFFERENCE     

}// FIN UNION 

                                            
                                            // APPEL DES TOURS //   
                     
object {Tour 
    scale<0.3,0.3,0.3>
    translate<-8.75,0,-8.75> 
    texture {White_Marble}
    finish{ambient 0.5}
        }
        
object {Tour 
    scale<0.3,0.3,0.3>
    translate<-8.75,0,8.75>
    texture {White_Marble}
    finish{ambient 0.5}
        } 
        
                                            //TOURS ADVERSE//
                                             
object {Tour 
    scale<0.3,0.3,0.3>
    translate<8.75,0,-8.75>
    texture {White_Marble}
    finish{ambient 0.0}
        }
        
object {Tour 
    scale<0.3,0.3,0.3>
    translate<8.75,0,8.75>
    texture {White_Marble}
    finish{ambient 0.0}
        }        
        
                                            
                                            //DECLARATION DU FOU//  
#declare Fou =
                                            
    union{                                                
        
            difference{
                blob  {
                    threshold 1.5 
                    sphere{
                        <0,-2,0>,3,-10
                    }  
                    sphere{
                        <0,0,0>,3,3 
                    }  
                    cylinder{
                        <0,2.5,0>,<0,5.5,0>,1.5,1.8 
                    }
                    sphere{
                        <0,7.2,0>,2.8,1.53 
                    }      
                }// FIN BLOB  
            
                    box{
                        <0.1,0,1.3><-0.1,2,-1.3>  
                        rotate <0,0,20>
                        translate <-0.2,5.5,0>
                    }
            }// FIN DIFF         
        
            ovus{
                1,1  
                scale <0,0.15,0>
                translate<0,1.2,0>  
            }              
                 
            ovus{
                0.7,0.7 
                scale <0,0.15,0>
                translate<0,4.7,0>    
            }           
         
            ovus{
                0.7,0.9 
                scale <0,0.15,0>
                translate<0,4.4,0>     
            }  
                                
}//FIN UNION  
    
                                                    // APPEL DES FOUS //  


object{Fou//troisième pièce qui fait un mouvement (vertical)
    scale<0.65,0.58,0.65>
    translate<-8.75,-0.1,-3.75>
    texture {White_Marble}
    finish{ambient 0.5}
    #if (clock>=0.70 & clock<0.90)//interval sur lequel se fait le mouvement  
        translate<bezier_x((clock-0.70)/0.20),bezier_y((clock-0.70)/0.20),10/0.20*(clock-0.70)>              
       // translate<2.5/0.20*(clock-0.09),0,0>//mouvement en fonction de la clock
    #end    
    #if (clock>=0.90)//moment où il faut fixer la pièce à sa nouvelle place 
        translate<10,-0.1,10>//translation de la pièce à sa place finale 
    #end          
}        

object{Fou
    scale<0.65,0.58,0.65>
    translate<-8.75,-0.1,3.75>
    texture {White_Marble}
    finish{ambient 0.5}        
} 

                                                        //FOUS ADVERSE//

object{Fou
    scale<0.65,0.58,0.65>
    translate<8.75,-0.1,-3.75> 
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Fou
    scale<0.65,0.58,0.65>
    translate<8.75,-0.1,3.75> 
    texture {White_Marble}
    finish{ambient 0.0}
}
           
                                                           
                                                // DECLARATION DE LA REINE // 
                                                
                                                
#declare Reine =

    union{ 
           
            cylinder {
                <0,0,0>,<0,0.5,0>,3                 
            }   
                           
            ovus{
                2.8,1                
                translate <0,3,0>
                scale<0,0.4,0>
            }        
                
            cylinder {
                <0,2.6,0>,<0,2.8,0>,1.7                 
            }
        
            cone {
                <0,2.8,0>,1.2,<0,10.5,0>,0.9                
            }
         
            cylinder {
                <0,9,0>,<0,9.3,0>,1.7                 
            }
        
            cylinder {
                <0,9.5,0>,<0,9.8,0>,1.5                 
            }
        
            cylinder {
                <0,10.2,0>,<0,10.5,0>,1.2                 
            }
        
            ovus{
                1.2,1               
                rotate<180,0,0>
                translate <0,17,0>
                scale<0,0.7,0>
            }
          
            sphere{
                <0,13,0> 0.6                
            }
        
        
        
            difference{
                cone {
                    <0,12,0>,1.7,<0,12.3,0>,1.5                    
                }  
                
                sphere{
                    <1.35,12.35,1.35> 0.5                     
                }
                
                sphere{
                    <-1.35,12.35,-1.35> 0.5                    
                } 
                
                sphere{
                    <-1.35,12.35,1.35> 0.5
                }
                
                sphere{
                    <1.35,12.35,-1.35> 0.5                    
                }
                
                sphere{
                    <1.92,12.35,0> 0.5                    
                }
                
                sphere{
                    <-1.92,12.35,0> 0.5                    
                }

                sphere{
                    <0,12.35,1.92> 0.5                    
                } 
                
                sphere{
                    <0,12.35,-1.92> 0.5                    
                }
            }// FIN DIFF

}// FIN UNION                                               
    
         
                                        // APPEL DE LA REINE //  
                                          
object{Reine
    scale<0.35,0.34,0.35>
    translate<-8.75,0,1.25>
    texture {White_Marble}
    finish{ambient 0.5}
}
                                                //REINE ADVERSE//

object{Reine
    scale<0.35,0.34,0.35>
    translate<8.75,0,1.25>
    texture {White_Marble}
    finish{ambient 0.0}
}


                                        // DECLARATION DU ROI//
                                
                                                                
#declare Roi =

    union{
    
            cylinder {
                <0,0,0>,<0,0.5,0>,3                 
            }
                
            ovus{
                2.8,1                
                translate <0,3,0>
                scale<0,0.4,0>
            }

            cylinder {
                <0,2.6,0>,<0,2.8,0>,1.7                 
            }

            cone {
                <0,2.8,0>,1.2,<0,10.5,0>,0.9            
            }
        
            cylinder {
                <0,9,0>,<0,9.3,0>,1.7                 
            }

            cylinder {
                <0,9.5,0>,<0,9.8,0>,1.5                 
            }
        
            cylinder {
                <0,10.2,0>,<0,10.5,0>,1.2                 
            }
        

            ovus{
                1.4,1                
                rotate<180,0,0>
                translate <0,13.5,0>
                scale<0,0.9,0>
            }
          
            ovus{
                0.01,0.5                
                rotate<180,0,0>
                scale<0,0.3,0>
                translate <0,13.4,0>
            }
         
            box {
                <-0.2,14,-0.7>,<0.3,14.3,0.7>                
            }
        
            box {
                <-0.2,-0.15,-0.7>,<0.3,0.15,0.7>                
                rotate<90,0,0>
                translate<0,14,0>
            }
            
}//FIN UNION
    
                                                
                                                
                                                // APPEL DU ROI //  
                                                
  
object{Roi
    scale<0.35,0.34,0.35>
    translate<-8.75,0,-1.25>
    texture {White_Marble}
    finish{ambient 0.5}
}  

                                            //ROI ADVERSE// 
                                                                                       
object{Roi
    scale<0.35,0.34,0.35>
    translate<8.75,0,-1.25>
    texture {White_Marble}
    finish{ambient 0.0}
}


                                        //DECLARATION D'UN PION// 
                                        
#declare Pion =


union{ 
     
        lathe{
            linear_spline
            4,
            <0,0><1.5,0>,<1.5,0.3>,<1,0.5>            
        } 
    
        lathe{
            bezier_spline
            4,
            <1,0.5,>,<2,1>,<0.6,0.9>,<0.5,3.5>             
        }          
    
        lathe{
            linear_spline
            5,
            <0.5,3.5>,<0.7,3.6,>,<1,3.8>,<0.7,4.1>,<0.4,4.2>             
        }
     
        lathe{
            bezier_spline
            4,
            <0.4,4.2>,<0.3,4.3>,<1.7,5>,<0,5.5>  
            } 

}//FIN UNION 

                                                                                        
                                            //APPEL D'UN PION// 
                                           

object{Pion//premiere pièce qui fait un mouvement (rectiligne)
    scale<0.5,0.5,0.5>
    translate<-6.25,0,-1.25>  
    texture {White_Marble}
    finish{ambient 0.5} 
    #if (clock>=0.10 & clock<0.30)//interval sur lequel se fait le mouvement 
        translate<2.5/0.20*(clock-0.10),0,0>
        //translate<2.5/0.20*(clock-0.09),0,0>//mouvement en fonction de la clock
    #end    
    #if (clock>=0.30)//moment où il faut fixer la pièce à sa nouvelle place 
        translate<2.5,0,0>//translation de la pièce à sa place finale 
    #end
}                      
  

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,1.25> 
    texture {White_Marble}
    finish{ambient 0.5} 
    
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,-3.75>
    texture {White_Marble}
    finish{ambient 0.5}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,3.75>
    texture {White_Marble}
    finish{ambient 0.5}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,-6.25> 
    texture {White_Marble}
    finish{ambient 0.5}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,6.25> 
    texture {White_Marble}
    finish{ambient 0.5}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,-8.75>
    texture {White_Marble}
    finish{ambient 0.5}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<-6.25,0,8.75>
    texture {White_Marble}
    finish{ambient 0.5}
}  


                        //PION ADVERSE// 
                        
object{Pion                      
    scale<0.5,0.5,0.5>
    translate<6.25,0,-1.25>
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Pion//deuxième pièce qui fait un mouvement (vertical)
    scale<0.5,0.5,0.5>
    translate<6.25,0,1.25>
    texture {White_Marble}
    finish{ambient 0.0}
    #if (clock>=0.40 & clock<0.45)//interval sur lequel se fait le mouvement (montée verticale)
        translate<0,2.5/0.05*(clock-0.40),0>//mouvement montée verticale
    #end
    #if (clock>=0.45 & clock<0.55)//interval sur lequel se fait le mouvement (horizontal)     
        translate<-5/0.10*(clock-0.45),2.5,0>//mouvement horizontale
    #end
    #if (clock>=0.55 & clock<0.60)//interval sur lequel se fait le mouvement (descente verticale)    
        translate<-5,2.5-(2.5/0.05*(clock-0.55)),0>//descente verticale
    #end
    #if (clock>=0.60)//moment où il faut fixer la pièce à sa nouvelle place 
        translate<-5,0,0>//translation de la pièce à sa place finale 
    #end    
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<6.25,0,-3.75>
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<6.25,0,3.75>
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<6.25,0,-6.25> 
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<6.25,0,6.25>
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<6.25,0,-8.75>
    texture {White_Marble}
    finish{ambient 0.0}
}

object{Pion
    scale<0.5,0.5,0.5>
    translate<6.25,0,8.75>
    texture {White_Marble}
    finish{ambient 0.0}
} 


                                        //DECLARATION D'UN CAVALIER//    

#declare Cavalier =  

union{ 
        //Base 
        cylinder{
            <0,0,0>,<0,0.2,0>,1
        }
                        
        ovus{
             0.8,0.5    
             scale <1,0.4,1> 
             translate <0,0.4,0> 
        }
          
        ovus{
             0.7,0.7
             scale <1,0.2,1>
             translate <0,0.8,0> 
        }
        

        //cou    
        difference{                   
              cone{
                    <0,0.9,0>,0.6,<0,2.5,0>,0.35                  
              }    
                                   
              plane{
                    <-1,0,0>,-0.34
              }
                 
              plane{
                    <1,0,0>,-0.34
              }   
        }//FIN DIFF        
 
                
        //tête avec yeux et bouche     
        difference{ //DIFF1
                         
               difference{//DIFF2                  
                    box{
                        <-0.35,0,1>,<0.35,0.8,-0.5>
                    }                     
                    plane{
                        <0,0,-1>,-0
                        rotate <-40,0,0>
                        translate<0,1,0.5>
                    }                    
                    plane{
                        <0,0,-1>,-0
                        rotate <40,0,0>
                        translate<0,1,1.7>
                    }                        
                    plane{
                        <0,0,-1>,-0
                        rotate <-110,0,0>
                        translate<0,0.7,0.2>   
                    }                              
                    sphere{
                        <-0.35,0.5,0.5>,0.1
                    }                    
                    sphere{
                        <0.35,0.5,0.5>,0.1
                    }
                                   
                    translate <0,2,0>                                    
                }//FIN DIFF2  
                
                box{
                    <-0.4,0,0>,<0.4,0.1,1>
                    rotate <5,0,0>
                    translate <0,2.2,0.9>    
                }                   
        }//FIN DIFF1  
        
        
        //crête     
        difference{//DIFF1
    
            difference{//DIFF2          
                box{
                    <-0.25,0,0>,<0.25,1,1.2>
                    rotate <5,0,0>
                    translate <0,2.1,-0.8>
                }                  
                plane{
                    <0,0,-1>,-0
                    rotate <-105,0,0>
                    translate<0,3.1,0.2>   
                }                         
            }//FIN DIFF2 
            
            box{ 
                <-0.3,0,0>,<0.3,1,0.2>
                rotate <90,0,0>
                translate <0,2.4,-1.7>
            }            
            box{ 
                <-0.3,0,0>,<0.3,1,0.2>
                rotate <90,0,0>
                translate <0,2.75,-1.65>
            }            
            box{ 
                <-0.3,0,-1>,<0.3,1,0.2>
                rotate <-15,0,0>
                translate <0,2.8,-0.5>
            }            
            box{ 
                <-0.3,0,0>,<0.3,1,0.2>
                rotate <-5,0,0>
                translate <0,2.9,-0.15>
            }            
            box{ 
                <-0.3,0,0>,<0.3,1,0.2>
                rotate <0,0,0>
                translate <0,2.9,0.2>
            }                         
        }//FIN DIFF1
           
}//FIN UNION 


  
                            //APPEL D'UN CAVALIER// 
                                                                                   
object{Cavalier
    rotate<0,90,0>
    scale<0,0,0>
    translate<-8.75,0,-6.25> 
    texture {White_Marble}
    finish{ambient 0.5}
}

object{Cavalier
    rotate<0,90,0>
    scale<0,0,0>
    translate<-8.75,0,6.25>
    texture {White_Marble}
    finish{ambient 0.5}
}


                                //CAVALIER ADVERSE//  
                                
object{Cavalier
    rotate<0,-90,0>
    scale<0,0,0>
    translate<8.75,0,6.25>
    pigment {color Green}
    texture {White_Marble}
    finish{ambient 0.0}
} 
                       
           
object{Cavalier
    rotate<0,-90,0>
    scale<0,0,0>
    translate<8.75,0,-6.25>
    texture {White_Marble}
    finish{ambient 0.0}
}                               