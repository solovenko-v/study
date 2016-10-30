function Signal
    T = 10; % period
    tau = 1; % impulse length (must be less then T)
    n = 1; % number of impulse in the signal
    c = 100;
    t = -T*(n+1/2):(1/c):T*(n+1/2); % time vector
    A = 3; % signal amplitude
    N = 3; % number of adds
%     k = 1:n; % vector of impulses numbers
    dim = 2*T*(n+1/2)*c+1;
    s  = zeros(1, dim);
    for k = -n:n
        s = s + A * (1 + 2 *(t - k *T) / T) .* (heaviside(t-(k-1/2)*T)-heaviside(t-k*T)) + A * (1 - 2 *(t - k *T) / T) .* (heaviside(t-k*T) - heaviside(t-(k+1/2)*T));
    end 
    
    sF = zeros(1, dim) + (A / 2);
    for k = 1:N
        omega = 2 * pi * (2 * k -1) / T;
        sF = sF + 4 * (A / (pi * (2 * k - 1))^2 ) * cos(omega * t);
    end
    
    sx = std(s-sF)
    
    plot(t,[s;sF]);