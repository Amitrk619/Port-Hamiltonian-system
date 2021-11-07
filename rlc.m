clear;
clc;



out = rlc_circuit(2,6,14,0.02,2);
disp(out.B)

A = out.J * out.Q;
C = (out.B)' * out.Q;
B = out.B;
D = out.D;
sys = ss(A,B,C,D);

step(sys)



function sys = rlc_circuit(R1,R2,R3,C,L1)
    syms x_1 x_2 x_3
    % rlc circuit written in port Hamiltonian framework
    % input -> voltage
    % output-> current
    % Xp = JQX + Bu
    % y = B'QX
    sys.J = [(-R2*R3)/(R2+R3),-R3/(R2+R3);R3/(R2+R3),-1/(R2+R3)];
    
   % f = (1/(2*L1))*x_1^2 +(1/(2*L2))*x_2^2 + ((x_3*b)/2);
   
    
    
    sys.Q = diag([1/L1,1/C]);
    sys.B = [1;0];
    sys.D = [1/R1];
end