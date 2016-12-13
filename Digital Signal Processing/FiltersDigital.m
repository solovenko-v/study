function FiltersDigital
   
    Np = 3; % number of periods
    % Frequences
    Om = [1 5 20];
    % Amplitudes
    Amp = [10 3 1];
    AmpN = 0; % noise amplitude    % Phases
    Phi = [0 pi/2 pi/3];
    fd = 8; % sampling frequency
    Omd = pi*fd;
    
    %
    h_min = -50;
    h_max = 10;
    H = [h_min h_max];
    Om1 = [Om(1)/Omd 1.01*Om(1)/Omd];
    Om2 = [Om(2)/Omd 1.01*Om(2)/Omd];
    Om3 = [Om(3)/Omd 1.01*Om(3)/Omd];
   
    % INPUT SIGNAL
    T = 1 / fd;
    t = 0:T:Np*max(2*pi./Om);   
    s = signal(t, Om, Amp, AmpN, Phi);
    
    % IIR FILTERS
    Wlp = 0.1;
    Whp = 0.3;
    Wbp = [0.1 0.3];
    Wbs = [0.1 0.9];
    n = 8; % filter order
    Rs = 40; % dB of attenuation
    
    % lowpass
    [b,a] = cheby2(n,Rs,Wlp);
    dataIn = s;
    dataOut = filter(b,a,dataIn);
    subplot(2,4,1);
    [h,w] = freqz(b,a);
    plot(w/pi,20*log10(abs(h)), Om1, H, Om2, H, Om3, H);
    ax = gca;
    ax.YLim = [h_min h_max];
    ax.XTick = 0:.5:2;
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude (dB)')
    title('lowpass');
    subplot(2,4,5);
    plot(t, dataIn, t, dataOut);
    
    % highpass
    [b,a] = cheby2(n,Rs,Whp,'high');
    dataIn = s;
    dataOut = filter(b,a,dataIn);
    subplot(2,4,2);
    [h,w] = freqz(b,a);
    plot(w/pi,20*log10(abs(h)), Om1, H, Om2, H, Om3, H);
    ax = gca;
    ax.YLim = [h_min h_max];
    ax.XTick = 0:.5:2;
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude (dB)')
    title('highpass');
    subplot(2,4,6);
    plot(t, dataIn, t, dataOut); 
    
     % bandpass
    [b,a] = cheby2(n,Rs,Wbp,'bandpass');
    dataIn = s;
    dataOut = filter(b,a,dataIn);
    subplot(2,4,3);
    [h,w] = freqz(b,a);
    plot(w/pi,20*log10(abs(h)), Om1, H, Om2, H, Om3, H);
    ax = gca;
    ax.YLim = [h_min h_max];
    ax.XTick = 0:.5:2;
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude (dB)')
    title('bandpass');
    subplot(2,4,7);
    plot(t, dataIn, t, dataOut);
    
     % bandstop
    [b,a] = cheby2(n,Rs,Wbs,'stop');
    dataIn = s;
    dataOut = filter(b,a,dataIn);
    subplot(2,4,4);
    [h,w] = freqz(b,a);
    plot(w/pi,20*log10(abs(h)), Om1, H, Om2, H, Om3, H);
    ax = gca;
    ax.YLim = [h_min h_max];
    ax.XTick = 0:.5:2;
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude (dB)')
    title('bandstop');
    subplot(2,4,8);
    plot(t, dataIn, t, dataOut);
    
    figure
    
    % FIR FILTERS
    
    ord = 44;
    low = 0.1;
    bnd = [0.5 0.9];
    
    % fir1
    b = fir1(ord,[low bnd],'DC-1',tukeywin(ord+1));
    a = 1;
    dataIn = s;
    dataOut = filter(b,a,dataIn);
    subplot(2,2,1);
    [h,w] = freqz(b,a);
    plot(w/pi,20*log10(abs(h)), Om1, H, Om2, H, Om3, H);
    ax = gca;
    ax.YLim = [h_min h_max];
    ax.XTick = 0:.5:2;
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude (dB)')
    title('fir1');
    subplot(2,2,3);
    plot(t, dataIn, t, dataOut);
    
    f = [0 0.05 0.4 0.6 0.95 1];
    c = [0 0.0 1.0 1.0 0.0 0];
    b = firpm(17,f,c);
    a = 1;
    dataIn = s;
    dataOut = filter(b,a,dataIn);
    subplot(2,2,2);
    [h,w] = freqz(b,a);
    plot(w/pi,20*log10(abs(h)), Om1, H, Om2, H, Om3, H);
    ax = gca;
    ax.YLim = [h_min h_max];
    ax.XTick = 0:.5:2;
    xlabel('Normalized Frequency (\times\pi rad/sample)')
    ylabel('Magnitude (dB)')
    title('firpm');
    subplot(2,2,4);
    plot(t, dataIn, t, dataOut);    
    
    % IIR zeros and poles
    figure
    
    [b,a] = cheby2(n,Rs,Wlp);
    subplot(2,2,1);
    zplane(b,a);
    title('lowpass');
    
    [b,a] = cheby2(n,Rs,Whp,'high');;
    subplot(2,2,2);
    zplane(b,a);
    title('highpass');
    
    [b,a] = cheby2(n,Rs,Wbp,'bandpass');
    subplot(2,2,3);
    zplane(b,a);
    title('bandpass');
    
    [b,a] = cheby2(n,Rs,Wbs,'stop');
    subplot(2,2,4);
    zplane(b,a);
    title('bandstop');

end
      

function s = signal(t, Omega, Amp, AmpN, Phi)

    s = 0;
    for i = 1:length(Omega)
        s = s + Amp(i) * sin(Omega(i) * t + Phi(i));
    end
    s = s + AmpN * rand(1);
    
end