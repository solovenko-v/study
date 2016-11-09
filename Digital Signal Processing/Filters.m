CONSOLE:
ls -
cd <dirname>

git status

git add <filename>
git add . - add all untracked files
git commit -m <commit name>
git push

git pull

git checkout <name of branch>
git checkout -b <name of branch> - create new branch

VRKIooNEK

function Filters
    
    w1 = 1; %2 * pi * f1;
    w2 = 3; %* pi * f2;

    % FILTERS
    % parameters for lowpass and highpass filters
    Wn = 2; % cutoff frequency
    % parameters for bandpass and bandstop filters
    Wlo = 0.5; % lower band edge 
    Wup = 2; % upper band edge
    Wo = sqrt(Wlo * Wup) % center frequency
    Bw = abs(Wup - Wlo); % bandwidth
    
    % analog lowpass filter prototype
    n = 10; % Filter order, specified as an integer scalar.
    Rp = 5; % dB of ripple in the passband
    Rs = 10; % dB of ripple in the stopband
    [z,p,k] = cheb2ap(n,Rs); % returns the zeros, poles, and gain
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
    
    %    
    options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);
    [T,Ksi] = ode45(@ff,[0 12],zeros(n,1),[Alp Blp],options);
    
end

function dksi = ff(t,ksi,A,B)

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
    
    dksi = A * ksi + B * s;    % a column vector
   
end
