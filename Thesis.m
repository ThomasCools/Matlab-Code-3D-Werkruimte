%% Thesis Workspace Robot 80kg
close all
clear
%HOEKEN VAN GRADEN OMZETTEN NAAR RADIALEN!!!

%% Workspace
% Berekenen workspace
%OPGELET: Bij een ander link diagram krijgen we een ander resultaat!
%Kies dus een logische neutrale positie voor het link diagram!

l1 = 0.48;
l2 = 0.32;
l3 = 0.87;
l4 = 0.2;
l5 = 1.03;
l6 = 0.185;
p3_e = [0 0 l6 1]';

figure
grid on
axis('equal')
for th1 = -180*pi/180:0.1:180*pi/180
%    -180*pi/180:3:180*pi/180
    for th2 = 90*pi/180:-1:-155*pi/180
        % 90*pi/180:-0.1:-155*pi/180
        for th3 = -180*pi/180:0.5:230*pi/180
            % -180*pi/180:0.5:230*pi/180
            for th4 = 0*pi/180:3:360*pi/180
                for th5 = -125*pi/180:3:125*pi/180
                    % -125*pi/180:0.5:125*pi/180
                    %for th6 = 0*pi/180:1:360*pi/180
            
DHtable = [0 0 l1 th1; (90*pi)/180 l2 0 th2+((90*pi)/180); 0 l3 0 th3; (90*pi)/180 l4 l5 th4; (-90*pi)/180 0 0 th5];
        %(90*pi)/180 0 l6 th6
X = DH_Transform(DHtable);
T01 = X{1};
T12 = X{2};
T23 = X{3};
T34 = X{4};
T45 = X{5};
%T56 = X{6};

T05 = T01*T12*T23*T34*T45;
%*T56
p0e = T05*p3_e;
hold on
  
plot3(p0e(1),p0e(2),p0e(3),'b.')
                end
            end
        end
    end
end
%end

ylabel('y')
xlabel('x')
zlabel('z')
title('Workspace')
axis('equal')
