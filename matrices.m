M1 = [8 17 8 2 15 15 15;
      15 11 1 10 0 5 13;
      0 12 11 5 0 3 15;
      15 15 0 4 7 12 18;
      0 7 10 13 10 8 10;
      10 12 25 7 25 0 7
      ];
  
M2 = [1 2 1 1 1 2;
      2 2 1 2 2 1;
      1 0 3 2 2 0
      ];
  
M3 = [750 620 815];

M4a = [55 47 60 45 35 50];
M4b = [3 4 2];

M5 = [2 2 1 1 2 3 3];

%Maximisation de la fonction bénefices
A = [M1'; M2];
b = [80 * 60 * ones(7, 1); M3'];
f = M4a' - M2' * M4b' - (1/60) * M1 * M5';%fonction de bénefices
X0=linprog(-f, A, b, [], [],zeros(6,1) , []);%maximisation avec linprog
bTot=f'*X; %benefices totaux


