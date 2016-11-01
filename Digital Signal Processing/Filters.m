function Filters
    
    % Signal generate
    % Frequences
%     f1 = 1; % HZ
%     f2 = 3; % HZ
    w1 = 1; %2 * pi * f1;
    w2 = 3; %* pi * f2;
    % Amplitude
    A1 = 3;
    A2 = 5;
    Anoise = 1;
    % Phases
    Phi1 = 0;
    Phi2 = pi / 2;
    
    delta = 0.01; % precision

    N = 5; % Number of long waves
    TM = fix(2 * pi * N / min(w1, w2)); % longest wave period
   
    t = 0 : delta : TM; % time-vector
    s = A1 * sin(w1 * t + Phi1) + A2 * sin(w2 * t + Phi2) + Anoise * rand(1,length(t)); % input signal

    % FILTERS
    % parameters for lowpass and highpass filters
    Wn = 2; % cutoff frequency
    % parameters for bandpass and bandstop filters
    Wlo = 0.5; % lower band edge 
    Wup = 2; % upper band edge
    Wo = sqrt(Wlo * Wup) % center frequency
    Bw = abs(Wup - Wlo); % bandwidth
    
    % butter
    n = 10; % Filter order, specified as an integer scalar.
    [A,B,C,D] = ellip(n,3,30,Wn,'s'); % butter(n,Wn) % lowpass filter with cutoff frequency Wn
    % cheby1(n,3,Wn,'s'); cheby2(n,30,Wn,'s'); butter(n,Wn,'s'); ellip(n,3,30,Wn,'s');
    [Ahp,Bhp,Chp,Dhp] = lp2hp(A,B,C,D,3); % highpass filter with cutoff frequency Wn
    [Abp,Bbp,Cbp,Dbp] = lp2bp(A,B,C,D,Wo,Bw); % bandpass filter with central frequency Wo and bandwidth Bw
    [Abs,Bbs,Cbs,Dbs] = lp2bs(A,B,C,D,Wo,Bw); % bandstop filter with central frequency Wo and bandwidth Bw
    
    % LOWPASS FILTER (frequency response)
    [b,a] = ss2tf(A,B,C,D);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * max(w1,w2)
            w = w(1:i);
            h = h(1:i);
            break
        end
    end
    subplot(2,4,1);
    plot(w, h, [Wn-0.01 Wn+0.01], [max(mag2db(abs(h))) min(mag2db(abs(h)))]);
    title(['Lowpass']);
    xlabel('Frequency')
    ylabel('Attenuation (dB)')
    set(gca, 'Xlim', [0 1.2 * max(w1,w2)]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
    
    % HIGHPASS FILTER (frequency response)
    [b,a] = ss2tf(Ahp,Bhp,Chp,Dhp);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * max(w1,w2)
            w = w(1:i);
            h = h(1:i);
            break
        end
    end
    subplot(2,4,2);
    plot(w, h, [Wn-0.01 Wn+0.01], [max(mag2db(abs(h))) min(mag2db(abs(h)))]);
    title(['Highpass']);
    xlabel('Frequency')
    ylabel('Attenuation (dB)')
    set(gca, 'Xlim', [0 1.2 * max(w1,w2)]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
     
    % BANDPASS FILTER (frequency response)
    [b,a] = ss2tf(Abp,Bbp,Cbp,Dbp);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * max(w1,w2)
            w = w(1:i);
            h = h(1:i);
            break
        end
    end
    subplot(2,4,3);
    plot(w, h, [Wlo-0.01 Wlo+0.01], [max(mag2db(abs(h))) min(mag2db(abs(h)))], [Wup-0.01 Wup+0.01], [max(mag2db(abs(h))) min(mag2db(abs(h)))]);
    title(['Bandpass']);
    xlabel('Frequency')
    ylabel('Attenuation (dB)')
    set(gca, 'Xlim', [0 1.2 * max(w1,w2)]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
    
    % BANDSTOP FILTER (frequency response)
    [b,a] = ss2tf(Abs,Bbs,Cbs,Dbs);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * max(w1,w2)
            w = w(1:i);
            h = h(1:i);
            break
        end
    end
    subplot(2,4,4);
    plot(w, h, [Wlo-0.01 Wlo+0.01], [max(mag2db(abs(h))) -10 * max(mag2db(abs(h)))], [Wup-0.01 Wup+0.01], [max(mag2db(abs(h))) -10 * max(mag2db(abs(h)))]);
    title(['Bandstop']);
    xlabel('Frequency')
    ylabel('Attenuation (dB)')
    set(gca, 'Xlim', [0 1.2 * max(w1,w2)]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
    
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