function Pss = simulation(N,n,K,M,iterations)
    
success = 0;

for i = 1:iterations    
    memory = init_memoryspace(N,n,K);
    success = success + binary_attack_sim(M,memory);
end; 
             
 Pss=success/iterations;