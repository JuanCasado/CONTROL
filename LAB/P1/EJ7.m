clear
[raices, reales, complejas] = raices([1 2 2], [1 3]);
display(raices)
display(reales)
display(complejas)

lenRaiz = size(raices);

vectorComplejo = [];
for i = 1:lenRaiz
    if(~isreal(raices(i)))
       vectorComplejo = [vectorComplejo raices(i)]; 
    end
end

hold on
figure('Name',"Representacion de numeros complejos")
plot(vectorComplejo,'or','LineWidth',3)
xlabel("Parte real")
ylabel("Parte compleja")
hold off