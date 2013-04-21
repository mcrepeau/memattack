function [Pss, Psf] = simulation_batch(K,iterations)

M = [0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 105 110 115 120 125 130 135];
n = [10 25 50 75 100];
N = 1000;

Pss = zeros(length(n),length(M));
Psf = zeros(length(n),length(M));

for i = 1:length(M)
    
    for j = 1:length(n)
        
        success = 0;
        
        for k = 1:iterations
            memory = init_memoryspace(N,n(j),K);
            %success = success + binary_attack_sim(M(i),memory);
            %success = success + delta_attack_sim(M(i), memory, s);
            success = success + delta_attack_sim2(M(i), memory);
        end;
        
        Pss(j,i)=success/iterations;
        fprintf('Test with n = %d and M = %d\n', n(j), M(i));
    end;
    
    if K == 1 % The formula below only works for K=1
        %Psf(i) = binary_attack_form_1V(N,n,M(i));
    end;
end;

