% use RANSAC to determine the inliers in the points by fitting a line model
function [success, inliers, model] = lineFittingRansac(points, sigma)

%% control parameters
datum_num = size(points, 1);
fun_compute = @(sampled) lineFittingSolver(points(sampled,:));
fun_evaluate = lineFittingEvaluator(points, sigma);
fun_candidates = -1;
fun_sample = -1;
fun_termination = -1;
fun_draw = -1;
min_sample_num = 2;
max_rounds = 1000;
confidence = 0.95;
gui = false; 
verbose = false;

%% call ransac function
[~, success, inliers, model, ~] = ...
    ransac(datum_num, fun_compute, fun_evaluate, fun_candidates, fun_sample, fun_termination, fun_draw, ...
        min_sample_num, max_rounds, confidence, gui, verbose);

end