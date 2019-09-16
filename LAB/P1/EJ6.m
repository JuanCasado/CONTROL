A = [0  2 10  7 90;
     2  7  7  1 59;
     1  9  0  5 15;
     4  0  0  6 10;
     2  8  4  1 80;
     10 5  1  3 17;
     2  6  4  0 93;
     1  1  9  3 51;
     6  4  8  2 91;
     1  3  1  9 76];
B = [0.110 0 1 0 317;
     0 3.260 0 1 237;
     0.425 0 1 0 319;
     3.574 0 0 1 229;
     0.739 0 1 0 321;
     3.888 0 0 1 241;
     1.054 0 1 0 323;
     4.202 0 0 1 243;
     1.368 0 1 0 325;
     4.516 0 0 1 245];
 
 condicion = norm(pinv(A))*norm(A);
 display(condicion)
 
 sol = linsolve(A, B);
 display(X)
 
 len = size(B);
 noise = randn(len(1),1);
 B_noise = [B(:,1:len(2)-2) B(:,len(2))+noise];
 sol_noise = linsolve(A, B_noise);
 display(sol_noise)