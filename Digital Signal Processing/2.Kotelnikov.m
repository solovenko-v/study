function Signal
    
    % частоты всходящих составляющих
    omega1 = 1;
    omega2 = 3;
    % амплитуды
    A1 = 3;
    A2 = 5;
    % фазы
    Phi1 = 0;
    Phi2 = pi / 2;
    % максимальная и минимальная из частот
    omegamin = min(omega1, omega2);
    omegamax = max(omega1, omega2);
    delta = 0.01; % точность построения графиков
    Nq = omegamax / 2; % частота Найквиста

    N = 3; % количество максимальных периодов для построения
    TM = fix(2 * pi * N / omegamin); % маскимальное время построения сигнала
   
    t = 0 : delta : TM; % временная шкала
    s = A1 * sin(omega1 * t + Phi1) + A2 * sin(omega2 * t + Phi2); % исходный сигнал

    for l = 1:20
        T = 10 * l * delta; % период с которым берутся отсчеты сигнала (в целых от дискретизации)
        % частота дискретизации
        Nt = pi / T;
        Tq = 1 / 4 * pi * Nq
        T
        Nn = fix(TM / T);
        sK = zeros(1, length(t)); 
        for k = 0:Nn
            ind = round(k * T / delta + 1);
            sK = sK + s(ind) * sinc(t / T - k);
        end    

    %     plot(t,s);
        plot(t,[s;sK]);
        title(['T/Tq = ' num2str(T /Tq)]);
        % pause(0.5);
        waitforbuttonpress;
    end
    
%     s = 
%     s = 5 * sin 
%     T = 5; % period
%     tau = 4; % impulse length (must be less then T)
%     n = 3; % number of impulse in the signal
%     c = 100;
%     t = -T*n:(1/c):T*n; % time vector
%     A = 3; % signal amplitude
%     N = 50; % number of adds
%     s  = zeros(1, 2*T*n*c+1); 
%     for k = -n:n
%         s = s + A * (heaviside(t-k*T)-heaviside(t-tau-k*T));
%     end 
%     
%     axes
%     q = T / tau;
%     sF = (A / q) * ones(1, 2*T*n*c+1);
%     for k = 1:N
%         omega = 2 *  k / T;
%         sF = sF + 2 * (A / q) * cos(pi * omega * (t - tau / 2)) *sinc(omega * tau / 2);
%     end
%     
%     sx = std(s-sF)
%     
%     plot(t,[s;sF]);
%     s = s + 0.01 * rand([length(s),1]);
   
%     S = fft(s);
%     s1 = ifft(S); 
%     plot(t,[s;s1]);
% %     f = Fs*(0:(L/2))/L; 
%     S = fft(s);
%     figure
%     subplot(2,1,1);
%     plot(t,s)
% 
%     subplot(2,1,2);
%     plot(f,S);
    
%     subplot
%     S = fft(s, 5);
%     s1 = ifft(S, 5);
%     plot(t,[s;s1]);