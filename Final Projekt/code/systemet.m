% Funktionsfilen

function f = systemet(t,u,varden)

    % Bryter ner indata för att göra det lättare att förstå koden
    fyllnadsgrad = varden(1); 
    alpha = varden(2);
    N = varden(3);
    gamma = varden(4);
    pA = varden(5);
    g = varden(6);
    L = varden(7);
    L0 = varden(8);
    Cf = varden(9);
    CDR = varden(10);
    CD = varden(11);
    roh = varden(12);
    X0 = varden(13);
    systembyte = varden(14);
    
    % Bryter ned u för att göra det lättare att förstå ekvationerna
    X = u(1:2); % [X X']
    Z = u(3:end); % [Z Z']
    
    % ----- System 1 -----
    if X(1) > systembyte % När det finns vatten i flaskan
        dz = Z(2);
        ddz = ((alpha-1)*((X(2).^2))-g*(L0+X(1))-CDR*Z(2).*abs(Z(2))+...
            (pA/roh)*(N*(((L-X0)./(L-X(1))).^gamma)-1)+g*X(1)+...
            Cf*X(1).*X(2).*abs(X(2))-CD*(X(2).^2)*(alpha^2-1))/L0;
        
        dx = X(2);
        ddx = ((alpha-1)*((X(2).^2))-g*(L0+X(1))-CDR*Z(2)*abs(Z(2))-(X(1)+L0)*ddz)./(X(1));
    
    % ----- System 2 -----
    elseif Z(1) > 0 % När vattnet i flaskan är slut
        dz = Z(2);
        ddz = -g-CDR*Z(2).*abs(Z(2));
        
        dx = 0;
        ddx = 0;
    % ----- System 3 -----
    else % När pet-flaskan träffat marken igen
        dz = 0; ddz = 0; dx = 0; ddx = 0;
    end
    f = [dx ddx dz ddz]';
end