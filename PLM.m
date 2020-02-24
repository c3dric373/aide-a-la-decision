
clear;

M1 = [ 8 17 8 2 15 15 15;
    15 11 1 10 0 5 13;
    0 12 11 5 0 3 15;
    15 15 0 4 7 12 18;
    0 7 10 13 10 8 10;
    10 12 25 7 25 0 7];

M2 = [ 1 2 1 1 1 2;
    2 2 1 2 2 1;
    1 0 3 2 2 0];

M4 = [ 55 47 60 45 35 50];

M4p = [3 4 2];

M5 = [ 2 2 1 1 2 3 3 ];

c1 = [1 2 1 1 1 2;
    2 2 1 2 2 1;
    1 0 3 2 2 0;
    8 15 0 15 0 10;
    17 11 12 15 7 12;
    8 1 11 0 10 25;
    2 10 5 4 13 7;
    15 0 0 7 10 25;
    15 5 3 12 8 0;
    15 13 15 18 10 7];

B = [ 750 620 815 4800 4800 4800 4800 4800 4800 4800];

Aeq= [1 1 1 1 1 1];

Beq=[0];

%X optimaux trouvés
Xben= [0 17.1174004192872 271.666666666667 0 0 71.7819706498952];
Xat= [0 1.753128103277063e+02 90.029791459781280 0 21.231380337636340 1.368818272095334e+02];
Xstock= [0  0  0  0  0 190.5551]; 
Xcom= [0  133.8481  74.7834  33.8920  34.9969  139.7426];
Xper= [0  0  0  0  304.8882  0];

X=[Xben' Xat' Xstock' Xcom' Xper'];
%Fonction à minimiser 
Fben=[-39;-31.050000000000000;-45.433333333333330;-27.200000000000000;-18.150000000000000;-37.550000000000000];
Fat=[-1;-1;-1;-1;-1;-1];
Fstock=[5;5;6;6;6;4];
Fcom=[-1;-1;-1;1;1;1];
Fper=[32;24;27;33;17;19];
%Matrice des fonctions
F=[-Fben -Fat Fstock Fcom Fper];
%Vecteurs de gains
Zben=Xben*F;
Zat=Xat*F;
Zstock=Xstock*F;
Zcom=Xcom*F;
Zper=Xper*F;
%Matrice de gains
Z=[Zben;Zat;Zstock;Zcom;Zper];
%Point de mire, Diagonale de la matrice.
M=diag(Z);

%Distances
Dben=norm(M-Zben,2);
Dat=norm(M-Zat,2);
Dstock=norm(M-Zstock,2);
Dcom=norm(M-Zcom,2);    
Dper=norm(M-Zper,2);

D=[Dben Dat Dstock Dcom Dper]
% res= linprog(-Fat,c1,B,[],[],zeros(6,1),[])

%normalisation
normalisation = [15569.6305031447 0;
    423.455809334657 0;
    423.455809334657+750+620+815 762.22;
    366.3253 2.13162820728030e-14;
    9600 5183.0944];


Znorm =zeros(5,5);
for i=1:5
    Znorm(:,i)=(Z(:,i)-normalisation(i,2))/(normalisation(i,1)-normalisation(i,2));
end
Znorm=max(Znorm,0);

Mnorm=zeros(5,1);
for i=1:5
    Mnorm(i)=(M(i)-normalisation(i,2))/(normalisation(i,1)-normalisation(i,2));
end

Dnorm = zeros(5,1);
for i=1:5
    Dnorm(i)=norm(Mnorm-Znorm(:,i));
end

res= linprog(Fper,c1,B,[],[],zeros(6,1),[])