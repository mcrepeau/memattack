function [Pss, Psf] = simulation_batch(N,n,K,iterations,s)

M = [0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 150];
Pss = zeros(1,length(M));
Psf = zeros(1,length(M));

for i = 1:length(M)
    
    success = 0;

    for j = 1:iterations    
        memory = init_memoryspace(N,n,K);
        %success = success + binary_attack_sim(M(i),memory);
        success = success + delta_attack_sim(M(i), memory, s);
    end;
    
    Pss(i)=success/iterations;
    
    if K == 1 % The formula below only works for K=1
        %Psf(i) = binary_attack_form_1V(N,n,M(i));
    end;
    fprintf('Test %d/%d\n', i, length(M));
end;

% plot(M,Pss_1,M,Pss_2,M,Pss_3,M,Pss_4,M,Pss_5);
% title('Probability of success of the binary attack with N=1000 and n=10')
% ylabel('Ps')
% xlabel('M')
% legend('K=1','K=2','K=3','K=4','K=5')

