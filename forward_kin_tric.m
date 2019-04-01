%Given values
L0 = 0.3;
L1 = 0.2;
L2 = 0.1;
theta0 = 0.4;
theta1 = 0.6;
theta2 = 1.2;

%degree conversion and theta calculation
t0deg = rad2deg(theta0);
t1deg = rad2deg(theta1);
t2deg = rad2deg(theta2);
%output theta to screen
thetaZ = t0deg+t1deg+t2deg

X1 = [  cosd(t0deg)  -sind(t0deg)   0   0;
        sind(t0deg)   cosd(t0deg)   0   0;
        0          0          1   0;
        0          0          0   1];
    
X2 = [  cosd(t1deg)  -sind(t1deg)   0   0;
        sind(t1deg)   cosd(t1deg)   0   0;
        0          0          1   0;
        0          0          0   1];
X3 = [  cosd(t2deg)  -sind(t2deg)   0   0;
        sind(t2deg)   cosd(t2deg)   0   0;
        0          0          1   0;
        0          0          0   1];

%Creates identity matrices and attach last column defined to it
Y1 = [eye(4,3) [L0;0;0;1]];
Y2 = [eye(4,3) [L1;0;0;1]];
Y3 = [eye(4,3) [L2;0;0;1]];

%multiplication of joints, step to produce final fk matrix
t0degs = X1*Y1;
t1degs = X2*Y2;
t2degs = X3*Y3;

%output matrix with end effector location
T = t0degs*t1degs*t2degs

%xe = L0*cosd(t0degree)+L1*cosd(t0degree+t1degree)+L2*cosd(t0degree+t1degree+t2degree)
%ye = L0*sind(t0degree)+L1*sind(t0degree+t1degree)+L2*sind(t0degree+t1degree+t2degree)

%t = t0degree*t1degree*t2degree
