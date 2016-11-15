function Filters
   
    % Frequences
    Omega = [1 3 8];
    % Amplitudes
    Amp = [20 5 2];
    AmpN = 0; % noise amplitude
    % Phases
    Phi = [0 pi/2 pi/3];

    % FILTERS
    % parameters for lowpass and highpass filters
    Wn = 15; % cutoff frequency
    % parameters for bandpass and bandstop filters
    Wlo = 2; % lower band edge 
    Wup = 4; % upper band edge
    Wo = sqrt(Wlo * Wup) % center frequency
    Bw = abs(Wup - Wlo); % bandwidth
    
    OmegaMax = max(max(Omega, Wn));
    
    % analog lowpass filter prototype
    n = 10; % Filter order, specified as an integer scalar.
    Rp = 5; % dB of ripple in the passband
    Rs = 50; % dB of ripple in the stopband
    [z,p,k] = buttap(n); % returns the zeros, poles, and gain
    % besselap(n) buttap(n) cheb1ap(n,Rp) cheb2ap(n,Rs) ellipap(n,Rp,Rs)
    [A,B,C,D] = zp2ss(z,p,k);
    
    % transforms analog lowpass filter prototypes
    [Alp,Blp,Clp,Dlp] = lp2lp(A,B,C,D,Wn); % lowpass filter with cutoff frequency Wn
    [Ahp,Bhp,Chp,Dhp] = lp2hp(A,B,C,D,Wn); % highpass filter with cutoff frequency Wn
    [Abp,Bbp,Cbp,Dbp] = lp2bp(A,B,C,D,Wo,Bw); % bandpass filter with central frequency Wo and bandwidth Bw
    [Abs,Bbs,Cbs,Dbs] = lp2bs(A,B,C,D,Wo,Bw); % bandstop filter with central frequency Wo and bandwidth Bw
    
    % LOWPASS FILTER (frequency response)
    [b,a] = ss2tf(Alp,Blp,Clp,Dlp);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * OmegaMax
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
    set(gca, 'Xlim', [0 1.2 * OmegaMax]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
    
    % HIGHPASS FILTER (frequency response)
    [b,a] = ss2tf(Ahp,Bhp,Chp,Dhp);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * OmegaMax
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
    set(gca, 'Xlim', [0 1.2 * OmegaMax]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
     
    % BANDPASS FILTER (frequency response)
    [b,a] = ss2tf(Abp,Bbp,Cbp,Dbp);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * OmegaMax
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
    set(gca, 'Xlim', [0 1.2 * OmegaMax]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
    
    % BANDSTOP FILTER (frequency response)
    [b,a] = ss2tf(Abs,Bbs,Cbs,Dbs);
    [h,w] = freqs(b,a,4096);
    h = mag2db(abs(h));
    for i = 1:length(w)
        if w(i) > 1.2 * OmegaMax
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
    set(gca, 'Xlim', [0 1.2 * OmegaMax]);
    set(gca, 'Ylim', [1 + min(h) 1 + max(h)]);
    
    % FILTRATION
    
    % LP
    opt = odeset('RelTol',1e-4);
    x0 = zeros(1, n);
    tspan = [0 20];
    [t,x] = ode45(@(t,x) odefcn(t,x,Alp,Blp,Omega, Amp, AmpN, Phi), tspan, x0, opt);
    u = signal(t, Omega, Amp, AmpN, Phi);
    y = Clp * x' + Dlp * u';    
    subplot(2,4,5);
    plot(t,u,t,y); 
    xlabel('time')
    ylabel('Amplitude')
    
    % HP
    opt = odeset('RelTol',1e-4);
    x0 = zeros(1, n);
    tspan = [0 20];
    [t,x] = ode45(@(t,x) odefcn(t,x,Ahp,Bhp,Omega, Amp, AmpN, Phi), tspan, x0, opt);
    u = signal(t, Omega, Amp, AmpN, Phi);
    y = Chp * x' + Dhp * u';    
    subplot(2,4,6);
    plot(t,u,t,y); 
    xlabel('time')
    ylabel('Amplitude')

    % BP
    opt = odeset('RelTol',1e-4);
    x0 = zeros(1, 2*n);
    tspan = [0 20];
    [t,x] = ode45(@(t,x) odefcn(t,x,Abp,Bbp,Omega, Amp, AmpN, Phi), tspan, x0, opt);
    u = signal(t, Omega, Amp, AmpN, Phi);
    y = Cbp * x' + Dbp * u';    
    subplot(2,4,7);
    plot(t,u,t,y); 
    xlabel('time')
    ylabel('Amplitude')
     
    % BS
    opt = odeset('RelTol',1e-4);
    x0 = zeros(1, 2*n);
    tspan = [0 20];
    [t,x] = ode45(@(t,x) odefcn(t,x,Abs,Bbs,Omega, Amp, AmpN, Phi), tspan, x0, opt);
    u = signal(t, Omega, Amp, AmpN, Phi);
    y = Cbs * x' + Dbs * u';    
    subplot(2,4,8);
    plot(t,u,t,y);
    xlabel('time')
    ylabel('Amplitude')  
     
end
    
function dydt = odefcn(t,y,A,B,Omega, Amp, AmpN, Phi)
    dydt = A * y + B * signal(t, Omega, Amp, AmpN, Phi);
end   
 
function s = signal(t, Omega, Amp, AmpN, Phi)

    s = 0;
    for i = 1:length(Omega)
        s = s + Amp(i) * sin(Omega(i) * t + Phi(i));
    end
    s = s + AmpN * rand(1);
    
end