function [ Tout,varargout ] = DH_Transform( DH_table )

for i = 1:1:size(DH_table)

    alpha = DH_table(i,1);
    a = DH_table(i,2);
    d = DH_table(i,3);
    theta = DH_table(i,4);

    varargout{i} = [cos(theta) -sin(theta) 0 a;
                    sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                    sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                    0 0 0 1];

end
Tout = varargout;

end
