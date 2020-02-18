% Matrices données 
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

% Contraintes
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

% fonction de calcul du bénéfice
fbenef = -1*(M4 - M4p*M2 - (1/60)*M5*M1');

% fonction de calcul de la production 
fprod=[-1 -1 -1 -1 -1 -1];

% fonction de calcul du stock :
% Pour chaque produit, on somme les matières premières nécessaires à sa
% production, puis on ajoute la place que prendra le produit dans le stock
fstock = sum(M2)+ones(1,6);

% X maximisant les bénéfices
Xbenef = linprog(fbenef,c1,B,[],[],zeros(6,1),[])

% X maximisant la production
Xprod = linprog(fprod,c1,B,[],[],zeros(6,1),[])

% prod représente la production totale ( tout produit confondu )
prod = sum(Xprod);

graph=zeros(101,1);
for i=0:1:100
    % Recherche du X tel que fstock soit minimal
    % c1*X < B
    % sum(X) = (i/100)*ProdMaximale
    % X > 0 
    XN =linprog(fstock,c1,B,[1 1 1 1 1 1],(i/100)*prod,zeros(6,1),[]);
    % Calcul du Stock correspondant
    graph(i+1)= fstock*XN; 
end

plot(0:1:100,graph);

% Points particuliers pour ~48 et 94% d'activité

% Pour 45% d'activité
X45 =linprog(fstock,c1,B,[1 1 1 1 1 1],(45/100)*prod,zeros(6,1),[]);
% Calcul du Stock correspondant
stock45 = fstock * X45;

% Pour 93% d'activité
X93 =linprog(fstock,c1,B,[1 1 1 1 1 1],(93/100)*prod,zeros(6,1),[]);
% Calcul du Stock correspondant
stock93 = fstock * X93; 
