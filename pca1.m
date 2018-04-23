function [signals,PC,V, data] = pca1(data)
    [M,N] = size(data);

    mn = mean(data,2);
    %  od kazdej wczytanej twarzy odejmowanie twarzy usrednionej
    data = data - repmat(mn,1,N);

    % Wyznaczenie kowariancji gdzie rozmiary nie s� wi�ksze ni� liczba
    % obrazk�w (np. 25)
    covariance = 1/M * data' * data ;

     % znalezienie wektorow wlasnych(PC) i wartosci wlasnych(V)
    [PC, V] = eig(covariance);
    
    % diagonala z wartosci w�asnych zamieniana jest na wektor
    V = diag(V);

    % sortowanie od najwi�kszego do najmniejszego
    [~,rindices ] = sort(-1*V);
    V = V(rindices);
    %Eliminacja wartosci w�asnych z danych wejsciowych
    PC = PC(:,rindices);
    PC = data*PC;
    
    % W trakcie dzia�a� cz�� warto�ci by�a liczbami urojonymi - przyczyny
    % nie by�em w stanie sprawdzi�
    PC = real(PC);
    
    % project the original data set
    signals = PC' * data;