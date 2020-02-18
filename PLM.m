clear;
%X optimaux trouvés
Xben= [0 17.1174004192872 271.666666666667 0 0 71.7819706498952];
Xat= [0 1.753128103277063e+02 90.029791459781280 0 21.231380337636340 1.368818272095334e+02];
Xstock= [0  0  0  0  0 190.5551]; 
Xcom= [0  133.8481  74.7834  33.8920  34.9969  139.7426];
Xper= [0  0  0  0  304.8882  0];

%Fonction à minimiser 
Fben=[-39;-31.050000000000000;-45.433333333333330;-27.200000000000000;-18.150000000000000;-37.550000000000000];
Fat=[-1;-1;-1;-1;-1;-1];
Fstock=[5;5;6;6;6;4];
Fcom=[-1;-1;-1;1;1;1];
Fper=[32;24;27;33;17;19];
%Matrice des fonctions
F=[-Fben -Fat Fstock Fcom  Fper];
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
min(D)