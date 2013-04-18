function Ps=binary_attack_1V(N,n,M)

if nargin > 3
    error('Too many input arguments');
elseif nargin < 3
    error('Too few input arguments');
end

p_fail=1;
p_success=0;

if M<=((N-n+1)/n) %If the number of attempts is above the critical number (number of couples/size of the vulnerable memory) we are sure to success, the probability is automatically 1 
	for i=1:M; %Summation loop
		if i>1; %We only get into the product loop after the first attempt
			for j=1:i-1; %Product loop
				p_fail=p_fail*(1-(n/(N-j*n+1))); %We multiply all the failed attempts depending on the number of attempts already made
			end;
		end;
		p_success=p_success+(p_fail*(n/(N-i*n+1))); %Then we add all the previous failures to the current probability of success 
		p_fail=1; %We have to reset the probability of failure at the end of the summation
	end
else
	p_success=1;
end

Ps=p_success;
