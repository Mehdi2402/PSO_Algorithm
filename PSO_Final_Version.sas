proc iml;
/****************** Defining objective funtions ********************/

Start Ackley(x);
y=-20*exp((-0.2*sqrt(0.5*X*X`))) - exp(0.5*(cos(2*constant("pi")*X[,1]) + 
							cos(2*constant("pi")*X[,2])))+constant("e")+20 ;
return (y);
finish Ackley;

Start Sphere(x);
y=x*x`; 
return (y);
finish Sphere;

start Rosenbrock(X); 
y=(100*(X[,2]-(X[,1])**2)**2+(x[,1]-1)**2);
return y;
finish Rosenbrock;

start Rastrigin(X);
y=2*10 + (x[,1]**2-10*cos(2*constant("pi")*x[,1])) + 
			(x[,2]**2-10*cos(2*constant("pi")*x[,2])); 
return y;
finish Rastrigin;

Start Easom(x);
y=-cos(x[,1])*cos(x[,2])*exp(-((x[,1]-constant("pi"))**2 + 
								(x[,2]-constant("pi"))**2));
return (y);
finish Easom;

start Bukin(X);
y=100*abs(x[,2]-0.01*x[,1]**2)+0.01*abs(x[,1]+10);
return(y);
finish Bukin;



/************ Defining Algorithm's parameters **************/

dim = 2;
ub = j(1,dim,5);
lb = j(1,dim,-5);

Nbpcl = 100;   		
Maxiter=300;		
Maxiner= 0.9;		
Mininer=0.2;		
Vmax = j(1,dim,0.2*(ub[1]-lb[1]));					
a= 0.8;
b= 0.8;		

/************* Generating Particles (Position & Velocity) *************/
r = j(Nbpcl, dim, 0);       
call randgen(r, "UNIFORM");	
Xpcl= (ub-lb)#r+lb;

v = j(Nbpcl, dim, 0);       
call randgen(v, "UNIFORM");
Velpcl = (2*Vmax)#v-Vmax;


Pclbestx = J(Nbpcl,dim,0);			
GBestx = j(1,dim,0);
Pclbesty = j(Nbpcl,1,9**10);
Gbesty = 9**10;

/********************** Main loop *************************/

do t=1 to Maxiter;
	do i=1 to Nbpcl;
		currentX = Xpcl[i,];
		currentY = Ackley(currentX) ;
		if currentY < Pclbesty[i] then do;
		Pclbestx[i,] = currentX; Pclbesty[i] = currentY;
		end;
	
		if currentY < Gbesty then do;
		Gbestx = currentX; Gbesty = currentY;
		end;
	
		w = Maxiner - t*((Maxiner-Mininer)/Maxiter);
	
		Velpcl[i,]=w*Velpcl[i,] + a*v[i,]#(Pclbestx[i,]-Xpcl[i,]) + 
									b*v[i,]#(GBestx - Xpcl[i,]);

		do vv=1 to dim;
			if Velpcl[i,vv] > Vmax[,1] then do;
			Velpcl[i,vv]= Vmax[,1];
			end;
			if Velpcl[i,vv] < - Vmax[,1] then do;
			Velpcl[i,vv]= - Vmax[,1];
			end;
		end;

		Xpcl[i,] = Xpcl[i,] + Velpcl[i,];

		do bb=1 to dim;
			if Xpcl[i,bb] > ub[bb] then do;
			Xpcl[i,bb]= ub[,bb];
			end;
			if Xpcl[i,bb] < lb then do;
			Xpcl[i,bb]= lb[,bb];
			end;
		end;
	end;

call randgen(v, "UNIFORM");
Gbestys= Gbestys // Gbesty;

end;



/****** Showing results ******/

print "The Global Minimum is : ";
print Gbesty;


/****** Showing Group-Minimum evolution ******/

print "The Group Minimum per iteration is : ";
print Gbestys;

