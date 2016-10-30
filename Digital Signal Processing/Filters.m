function Filters
    
    % Signal generate
    % Frequences
    omega1 = 1;
    omega2 = 3;
    % Amplitude
    A1 = 3;
    A2 = 5;
    Anoise = 1;
    % Phases
    Phi1 = 0;
    Phi2 = pi / 2;
    
    delta = 0.01; % precision

    N = 5; % Number of long waves
    TM = fix(2 * pi * N / min(omega1, omega2)); % longest wave period
   
    t = 0 : delta : TM; % time-vector
    s = A1 * sin(omega1 * t + Phi1) + A2 * sin(omega2 * t + Phi2) + Anoise * rand(1,length(t)); % input signal

    % FILTERS
    % parameters for lowpass and highpass filters
    Wn = 0.5; % cutoff frequency
    % parameters for bandpass and bandstop filters
    W1 = 0.4; % lower band edge 
    W2 = 0.6; % upper band edge
    Wo = sqrt(W1 * W2); % center frequency
    Bw = abs(W2 - W1); % bandwidth
    
    % butter
    n = 5; % Filter order, specified as an integer scalar.
    [A,B,C,D] = butter(n,Wn) % lowpass filter with cutoff frequency Wn
    [Ahp,Bhp,Chp,Dhp] = lp2hp(A,B,C,D,Wn); % highpass filter with cutoff frequency Wn
    [Abp,Bbp,Cbp,Dbp] = lp2bp(A,B,C,D,Wo,Bw); % bandpass filter with central frequency Wo and bandwidth Bw
    [Abs,Bbs,Cbs,Dbs] = lp2bs(A,B,C,D,Wo,Bw); % bandstop filter with central frequency Wo and bandwidth Bw
    
    [b,a] = 
    h = freqs(b,a,w);
    mag = abs(h);
    phase = angle(h);
    phasedeg = phase*180/pi;

    subplot(2,1,1), loglog(w,mag), grid on
    xlabel 'Frequency (rad/s)', ylabel Magnitude
    subplot(2,1,2), semilogx(w,phasedeg), grid on
    xlabel 'Frequency (rad/s)', ylabel 'Phase (degrees)'
    
    
%     for l = 1:20
%         T = 10 * l * delta; % период с которым берутся отсчеты сигнала (в целых от дискретизации)
%         % частота дискретизации
%         Nt = pi / T;
%         Tq = 1 / 2 * pi * max(omega1, omega2);
%         Nn = fix(TM / T);
%         sK = zeros(1, length(t)); 
%         for k = 0:Nn
%             ind = round(k * T / delta + 1);
%             sK = sK + s(ind) * sinc(t / T - k);
%         end    
% 
%     %     plot(t,s);
%         plot(t,[s;sK]);
%         title(['T/Tq = ' num2str(T /Tq)]);
%         % pause(0.5);
%         waitforbuttonpress;
%     end
%   
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