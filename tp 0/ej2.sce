function T = ej2(h,Tl)
  delta=h.^2;
  x=0:h:1;
  x_int=x(2:length(x)-1);
  n=length(x_int);
  fila=[-1 (2+delta) -1];
  //inicializo la matriz y el vector
  A=zeros(n+1);
  b=(ones(n+1,1)*delta);
  //primer fila de la matriz
  A(1,1:2)=fila(2:3);
  //condicion de borde izquierdo
  b(1)=b(1)+Tl;
  //armo las filas intermedias de la matriz
  for i=2:n
    A(i,i-1:i+1)=fila;
  end
  //ultima fila de la matriz
  A(n+1,n:n+1)=[-2 fila(2)];
  //condicion de borde derecho
  b(n+1)=b(n+1)-2*h;
  //resuelvo el sistema
  T=A\b;
  T=[Tl;T];
  plot(x,T);
  //solucion analitica
  den=exp(1)+exp(-1);
  CA=(-1-exp(-1))/den;
  CB=(1-exp(1))/den;
  Ta=CA*exp(x)+CB*exp(-x)+1;
  plot(x,Ta,'r');
endfunction