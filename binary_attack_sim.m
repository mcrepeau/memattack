function success=binary_attack_sim(M,memory)

if nargin > 2
    error('Too many input arguments');
elseif nargin < 2
    error('Too few input arguments');
end

[K,N] = size(memory); % We fetch the dimensions of the memory space
    
success=0;
granularity_level=2;
p=1;
variant_attacked=0;

for m = 1:M; %Maximum number of attempts 
    location = ceil((p/granularity_level)*N); % The location we attack is determined by the dichotomy of the memory space (N)
    for j = 1:K; %For each variant
        if memory(j,location) == 1
            variant_attacked = variant_attacked + 1; % We increase the number of variant successfully attacked
            memory(j,1:N)=zeros(1); % We fill the successfully attacked variant with zero so we don't hit it again
            %fprintf('Memory successfully attacked on variant %d at location %d\n', j, location);
        end;
    end;
    if p < granularity_level - 2
        p=p+2; % For odd numbers in the fraction of the memory space
    else
        granularity_level = granularity_level*2; % Once we have reached the end of the granularity level, we increase it
        p=1; % We reset the fraction
    end;
end;
if variant_attacked == K % If all the variants have been attacked within the given number of attempts
    success=1; % We increase the overall number of successful attacks
end;

