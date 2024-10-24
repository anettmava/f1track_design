clc
clear all
close all

%Polinomio
n = 3;
s2x = [284.845 390.087 500.329 547.57];
s2y = [284.845 373.087 205.724 284.845];

p = polyfit(s2x, s2y, n);

xx=linspace(284.845,547.57,50);
yy= p(1)*xx.^3 + p(2)*xx.^2 + p(3)*xx + p(4);
hold on;
plot(xx,yy,'k-','LineWidth',40);
plot(xx,yy,'w-','LineWidth',40-2);
plot(xx,yy,'k-','LineWidth',40-4);
plot(xx,yy,'y--','LineWidth',40/10)

%Gradas

gradax1 = [325 375 375 325 325];
graday1 = [350 350 320 320 350];
plot(gradax1, graday1, 'g', 'LineWidth', 3);

gradax2 = [470 520 520 470 470];
graday2 = [275 275 305 305 275];
plot(gradax2, graday2, 'g', 'LineWidth', 3);

distancia=0;

for i = 1: length (xx)-1

   distancia = sqrt((xx(i+1) - xx(i))^2 + (yy(i+1) - yy(i))^2) + distancia;

end

derivada=0;

for i = 1: length (xx)-1
    
    
    derivada(i) = 3*p(1)*xx(i).^2 + 2*p(2)*xx(i) + p(3);
    derivada

end

tangente1x = [337.385 427.385];
tangente1y = [412.7808156 473.7081372];
plot(tangente1x, tangente1y, 'm', 'LineWidth', 3);

tangente2x = [342.639 432.639];
tangente2y = [414.664057 446.9236167];
plot(tangente2x, tangente2y, 'm', 'LineWidth', 3);

tangente3x = [347.893 437.893];
tangente3y = [414.9771175 420.3397832];
plot(tangente3x, tangente3y, 'm', 'LineWidth', 3);

tangente4x = [353.147 443.147];
tangente4y = [413.8233765 394.0600159];
plot(tangente4x, tangente4y, 'm', 'LineWidth', 3);

tangente5x = [495.005 585.005];
tangente5y = [205.9694318 177.1913902];
plot(tangente5x, tangente5y, 'm', 'LineWidth', 3);

tangente6x = [500.259 590.259];
tangente6y = [205.7172532 201.3974837];
plot(tangente6x, tangente6y, 'm', 'LineWidth', 3);

tangente7x = [505.513 595.513];
tangente7y = [206.9962736 228.905644];
plot(tangente7x, tangente7y, 'm', 'LineWidth', 3);

tangente8x = [510.767 600.767];
tangente8y = [209.9098722 259.8192502];
plot(tangente8x, tangente8y, 'm', 'LineWidth', 3);

derivada2=0

for i = 1: length (xx)-1
    
    derivada2(i) = 6*p(1)*xx(i) + 2*p(2);
    derivada2

end

radio=0

for i = 1: length (xx)-1

    radio(i)=abs(((1+derivada(i).^2).^(3/2))./derivada2(i))
    

end

miu=0;
velocidad=170;
gravedad=9.81;
masa=800;
cftipico=1.7;

for i = 1: length (xx)-1

    miu(i) = (velocidad^2)/(4*gravedad*radio(i))

end

trabajo=0.5*masa*velocidad^2

friccion=(cftipico*masa*gravedad)*(distancia)

for i = 1: length (xx)-1

    an = animatedline('linewidth', 3 ,'linestyle',':', 'color' ,'y');
    xo=(xx(i));
    yo=(yy(i));
    addpoints(an,xo,yo);
    head=scatter(xo,yo,100,'filled')
    drawnow

    if miu(i) < 1.7

        head = scatter(xo,yo,100,'filled','g')

    else

        head = scatter(xo,yo,100,'filled','r')
    
    drawnow

    end
end