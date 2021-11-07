clear;
clc;



k = 24;
m = 25;

C = [1 0];
% Xp = JQX + Bu
    % y = B'QX

out = massspring(m,k);
J = out.J;
Q = out.Q;
A = J*Q;
C = C*Q;
B = out.B;
D = out.D;

disp(J);
disp(Q);
disp(J*Q)
disp(B')
disp(D);
disp(C);


sys = ss(A,B,C,D);
step(sys);



function sys = massspring(mass,K)
    % mass spring written in port Hamiltonian framework
    % input -> force(moment)
    % output-> speed(angle rate)
    % Xp = JQX + Bu
    % y = B'QX
    sys.J = [0,1;-1,0];
    sys.Q = diag([1/mass,K]);
    sys.B = [1;0];
    sys.D = 0;
end