function T = ej1(h,Tl,Tr)
  delta=h.^2;
  x=0:h:1;
  n=length(x)-2;
  fila=[-1 (2+delta) -1];
  //inicializo la matriz y el vector
  A=zeros(n,3);
  b=(ones(n,1)*delta);
  //primer fila de la matriz
  A(1,1:2)=fila(2:3);
  //condicion de borde izquierdo
  b(1)=b(1)+Tl;
  //armo las filas intermedias de la matriz
  for i=2:n-1
    A(i,i-1:i+1)=fila;
  end
  //ultima fila de la matriz
  A(n,n-1:n)=fila(1:2);
  //condicion de borde derecho
  b(n)=b(n)+Tr;
  //resuelvo el sistema
  T=A\b;
  T=[Tl;T;Tr];
  plot(x,T);
  //solucion analitica
  CA=exp(-1)/(exp(1)-exp(-1));
  CB=exp(1)/(exp(-1)-exp(1));
  Ta=CA*exp(x)+CB*exp(-x)+1;
  plot(x,Ta,'r');
endfunction