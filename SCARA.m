# constants in meters "from tha datasheet of the THP700 type"
L1=0.35;
L2=0.3; 
d1=0.16;
d4=0.16;
#constrains on the range, all are +ve or -ve, in degrees and meters
rangeAxis1=148;
rangeAxis2=150;
rangeAxis3=0.21;
rangeAxis4=720;
#the varibles entered by the user
z1=(input ("Please,enter the angle\"in degrees\" rotated by the first R-joint : "));  #short for theta1
#cheking for the range !
if z1<(-rangeAxis1)
  z1=(-rangeAxis1);
else if z1>rangeAxis1
  z1=rangeAxis1;
     end
end
z2=(input ("Please,enter the angle\"in degrees\" rotated by the second R-joint : ")); #short for theta2
#cheking for the range !
if z2<(-rangeAxis2)
  z2=(-rangeAxis2);
else if z2>rangeAxis2
  z2=rangeAxis2;
     end
end
d3=(input ("Please,enter the distance\"in meters\" traveled by the P-joint : "));
#cheking for the range !
if d3<(-rangeAxis3)
  d3=(-rangeAxis3);
else if d3>rangeAxis3
  d3=rangeAxis3;
     end
end
z4=(input ("Please,enter the angle\"in degrees\" rotated by the third R-joint : "));  #short for theta4
#cheking for the range !
if z4<(-rangeAxis4)
  z4=(-rangeAxis4);
else if z4>rangeAxis4
  z4=rangeAxis4;
     end
end
########################################################################################
A1=[( cos(z1* pi/180)),(-1* sin(z1* pi/180)),0,(L1* cos(z1* pi/180));
    ( sin(z1* pi/180)),( cos(z1* pi/180))   ,0,(L1* sin(z1* pi/180));
    0,0,1,d1;
    0,0,0,1 ];

A1
########################################################################################
A2= [( cos(z2* pi/180)),( sin(z2* pi/180))   ,0,(L2* cos(z2* pi/180)) ;
     ( sin(z2* pi/180)),(-1* cos(z2* pi/180)),0,(L2* sin(z2* pi/180)) ;
     0,0,-1,0;
     0,0,0,1 ];
              
A2
########################################################################################
A3= [1, 0, 0,0 ;
     0, 1, 0,0 ;
     0, 0, 1,d3;
     0, 0, 0,1 ];

A3
########################################################################################
A4= [( cos(z4* pi/180)),(-1* sin(z4* pi/180)),0,0 ;
     ( sin(z4* pi/180)),( cos(z4* pi/180))   ,0,0 ;
     0,0,1,d4;
     0,0,0,1 ];

A4
########################################################################################
T_byHand=[cos((z1+z2-z4)*pi/180),   sin((z1+z2-z4)*pi/180),0,L1*cos(z1*pi/180)+L2*cos((z1+z2)*pi/180);
          sin((z1+z2-z4)*pi/180),-1*cos((z1+z2-z4)*pi/180),0,L1*sin(z1*pi/180)+L2*sin((z1+z2)*pi/180);
          0,0,-1,d1-d3-d4;
          0,0,0,1]
T_byHand
#this matrix was calculated by hand !
########################################################################################
z1
z2
d3
z4
T= A1*A2*A3*A4;

n= [ T(1,1),T(1,2),T(1,3) ];
s= [ T(2,1),T(2,2),T(2,3) ];
a= [ T(3,1),T(3,2),T(3,3) ];
d= [ T(1,4),T(2,4),T(3,4) ];

disp("################################For the RRP SCARA robot#################################")
disp ("position of the end-effector : ")
disp(d')
disp ("Orientation of the end-effector : ")
disp ("1)direction of tha x-axis of the end-effector relative to the base : ")
disp(n')
disp ("2)direction of tha y-axis of the end-effector relative to the base : ")
disp(s')
disp ("3)direction of tha z-axis of the end-effector relative to the base : ")
disp(a')

