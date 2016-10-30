function Signal
    T = 5; % period
    tau = 3; % impulse length (must be less then T)
    n = 3; % number of impulse in the signal
    c = 100;
    t = -T*n:(1/c):T*n; % time vector
    A = 3; % signal amplitude
    N = 50; % number of adds
    s  = zeros(1, 2*T*n*c+1); 
    for k = -n:n
        s = s + A * (heaviside(t-k*T)-heaviside(t-tau-k*T));
    end 
    
    axes
    q = T / tau;
    sF = (A / q) * ones(1, 2*T*n*c+1);
    for k = 1:N
        omega = 2 *  k / T;
        sF = sF + 2 * (A / q) * cos(pi * omega * (t - tau / 2)) * sinc(omega * tau / 2);
    end
    
    sx = std(s-sF)
    
    plot(t,[s;sF]);
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