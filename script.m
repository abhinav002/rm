%clear;close all;clc;

page_output_immediately (1);
page_screen_output (0);

%fprintf('loading data\n');
%load('train-images.mat');  %train_images_data
%load('train-labels.mat');  %train_labels_data
%load('test-images.mat');   %test_images_data
%load('test-labels.mat');   %test_labels_data
%m=size(train_images_data,1);
%sel=randperm(size(train_images_data,1));
%sel=sel(1:100);

%fprintf('Displaying data:\n');
%fprintf('\n');
%var=sel;
%for i=1:10
%  for j=1:10
%    fprintf('%d  ', train_labels_data(var((i-1)*10+j)));
%  endfor
%  fprintf('\n');
%endfor

output_labels=10;
%displayData(train_images_data(sel,:));
y=trainLabels(train_labels_data,output_labels);

%pSize=20;
examples=size(train_images_data,1);input_layer_size=size(train_images_data,2);
%population=randomPopulation(pSize,examples,input_layer_size,output_labels);
%generations=5;
maxIter=50;

pc=0.5;pm=0.01;

%fprintf('Random population generated\n');
%fprintf('Program paused. Press enter to continue.\n');
%pause;
load('population.mat');load('generations.mat');
generations=generations+1;
nxtGenerations=generations+4;
pSize=size(population,1);
for i=generations:nxtGenerations
  fprintf('\nGeneration= %d',i);
  for j=1:pSize
    nn_params=cell2mat(population(j,1));
    cr=cell2mat(population(j,2));
    hidden_layer_size=getNumber(cr(1,60003:60010));
    options = optimset('MaxIter', maxIter);
    selected_inputs=cr(1,3:60002)';
    X=train_images_data(selected_inputs==1,:);
    yd=y(selected_inputs==1,:);

    lambda = 1;

    % Create "short hand" for the cost function to be minimized
    costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_labels, X, yd, lambda);
    [nn_params, cost] = fmincg(costFunction, nn_params, options);
    population(j,1)=nn_params;
  endfor
  population=fitness(population,test_images_data,test_labels_data,output_labels);
  if(i==nxtGenerations)
    solution=population;
  endif
  x=cell();
  count=0;
  while(count<pSize)
    v=cell(2,3);
    vari=rankSelection(population);
    vari=crossOver(vari,pc);
    vari=mutate(vari,pm);
    v(1,2)=vari(1,:);
    v(2,2)=vari(2,:);
    hidden_layer_size=getNumber(vari(1,60003:60010));
    epsilon=getEpsilon(vari(1,1:2));
    theta1=randInitializeWeights(input_layer_size,hidden_layer_size,epsilon);
    theta2=randInitializeWeights(hidden_layer_size,output_labels,epsilon);
    v(1,1)=[theta1(:);theta2(:)];
    
    hidden_layer_size=getNumber(vari(2,60003:60010));
    epsilon=getEpsilon(vari(2,1:2));
    theta1=randInitializeWeights(input_layer_size,hidden_layer_size,epsilon);
    theta2=randInitializeWeights(hidden_layer_size,output_labels,epsilon);
    v(2,1)=[theta1(:);theta2(:)];
    
    x=[x;v];
    count=count+2;
  endwhile
  population=x;
endfor
generations=nxtGenerations;
save('solution.mat','solution');
save('population.mat','population');
save('generations.mat','generations');
fprintf('\n');



