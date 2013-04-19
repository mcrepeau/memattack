function Ps=binary_attack_kV(k,N,n,M)

if nargin > 4
    error('Too many input arguments');
elseif nargin < 4
    error('Too few input arguments');
end

C = nchoosek(0:M-2,(k-1));
m = size(C,1);
B = zeros(m,M-1);
B(bsxfun(@plus,(1:m).',m*C)) = 1;

n_success=k;
n_failures=(M-k);

if M>=k %If the number of attempts is higher than the number of versions 
	for i=1:(M-1); %Summation loop, we have M-1 combinations
		p_fail=1; %We have to reset the probability of failure at the beginning of the summation
		p_success=0; %We have to reset the probability of success at the beginning of the summation
		for j=1:n_failures; %Product loop for failures
			p_fail=p_fail*(1-(n/(N-j*n+1))); %We multiply all the failed attempts depending on the number of attempts already made
		end;
		for j=1:n_success-1 %Product loop for successes
			p_success=p_success*(n/(N-j*n+1));
		end;
		p_success=p_success+(p_fail*p_success*(n/(N-i*n+1))); %Then we add all the previous probabilities to the current probability of success 
	end
else %Else, the probabilities of success are 0
	p_success=0;
end

Ps=p_success;