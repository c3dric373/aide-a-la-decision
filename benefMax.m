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

f = -1*(M4 - M4p*M2 - (1/60)*M5*M1');
fprod=[-1 -1 -1 -1 -1 -1];
X= linprog(f,c1,B,[],[],zeros(6,1),[])
Xprod= linprog(fprod,c1,B,[],[],zeros(6,1),[])

stock = sum(M2*X)+sum(X)
%stockOpti =linprog(fstrock,c1,B,[],[], 0.5*Xprod,[]);
prod=sum(Xprod);
graph=zeros(101,1);
for i=0:1:100
    XN=linprog(sum(M2)+ones(1,6),c1,B,[],[],i/100*Xprod,[]);
    graph(i+1)=sum(M2*XN)+sum(XN);
end

plot(0:1:100,graph);

