function Signal
    T = 5; % period
    tau = 1; % impulse length (must be less then T)
    n = 3; % number of impulse in the signal
    c = 100;
    t = -T*n:(1/c):T*n; % time vector
    A = 7; % signal amplitude
    N = 100; % number of adds
%     k = 1:n; % vector of impulses numbers
    s  = A + zeros(1, 2*T*n*c+1); 
    for k = -n:n
        s = s + A * ((-t) / T - (k + 1)) .* (heaviside((-t) - k * T) - heaviside((-t) - (k + 1) * T));
    end 
  
    sF = A / 2 + zeros(1, 2*T*n*c+1); % start value
    for k = 1:N
        sF = sF + (A / (pi * k)) * cos(2 * pi * k * ((-t) / T) + pi / 2);
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