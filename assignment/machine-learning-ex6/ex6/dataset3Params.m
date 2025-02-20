function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%bestPrediction = 1000;
%for C_i = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
%  for sigma_i = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
%    model= svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_i));
%    predictions = svmPredict(model, Xval);
%    prediction = mean(double(predictions ~= yval));
%    if prediction < bestPrediction;
%      bestPrediction = prediction;
%      C = C_i;
%      sigma = sigma_i;
%    end
 % end
%end

%C
%sigma

matrix_all = [];
for temp_c = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
    for temp_sim = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
        model = svmTrain(X,y,temp_c, @(x1,x2) gaussianKernel(x1,x2,temp_sim));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        matrix_all = [matrix_all; [temp_sim, temp_c, err]];
    end
end

vector_err = matrix_all(:,3);
[minval,rowindex] = min(vector_err);
rowindex
re = matrix_all(rowindex,:);
C = re(2)
sigma = re(1)


% =========================================================================

end
