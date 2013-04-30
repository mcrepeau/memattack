function success=uniform_attack_sim(M,memory)

if nargin > 2
    error('Too many input arguments');
elseif nargin < 2
    error('Too few input arguments');
end

[K,N] = size(memory); % We fetch the dimensions of the memory space
    
success=0;
variant_attacked=0;

for m = 1:M; %Maximum number of attempts   
    location = randi(N,1,1); %Generates a random integer in the boundaries of the array
    for j = 1:K; %For each variant
        if memory(j,location) == 1
            variant_attacked = variant_attacked + 1; % We increase the number of variant successfully attacked
            memory(j,1:N)=zeros(1); % We fill the successfully attacked variant with zero so we don't hit it again
            %fprintf('Memory successfully attacked on variant %d at location %d\n', j, location);
        end;
    end;
end;
if variant_attacked == K % If all the variants have been attacked within the given number of attempts
    success=1; % We increase the overall number of successful attacks
end;

