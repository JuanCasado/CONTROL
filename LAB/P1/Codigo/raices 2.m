function [solucion, reales, complejas] = raices(poli_1, poli_2)
action = input('Indique sobre que polinomio aplicar la operacion [1 2 3]: ');
switch action
    case 1
        solucion = roots(poli_1);
    case 2
        solucion = roots(poli_2);
    case 3
        solucion = roots(conv(poli_1, poli_2));
    otherwise
        error('valor introducido erroneo')
end
reales = 0;
complejas = 0;
len = size(solucion);
for i=1:len(1)
    if isreal(solucion(i))
        reales = reales +1;
    else
        complejas = complejas +1;
    end
end
end