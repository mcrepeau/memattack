function [Pss, Psf] = simulation_batch(K,attack,iterations,overlapping)

M = [0:5:500];
n = [10 25 50 75 100];
N = 1000;

Pss = zeros(length(n),length(M));
Psf = zeros(length(n),length(M));

for i = 1:length(M)
    
    for j = 1:length(n)
        
        success = 0;
        
        for k = 1:iterations
            if (overlapping == 1)
                memory = init_memoryspace(N,n(j),K);
            elseif (overlapping == 0)
                memory = init_memoryspace_nonoverlapping(N,n(j),K);
            end
            switch attack
                case 1
                    success = success + binary_attack_sim(M(i),memory);
                case 2
                    success = success + delta_attack_sim2(M(i),memory);
                case 3
                    success = success + uniform_attack_sim(M(i),memory);
                otherwise
            end
        end;
        
        Pss(j,i)=1-(success/iterations);
        fprintf('Test with n = %d and M = %d\n', n(j), M(i));
    end;
    
    if K == 1 % The formula below only works for K=1
        %Psf(i) = binary_attack_form_1V(N,n,M(i));
    end;
end;

