function tM = ICV_translationMatrix(Tx,Ty)
%% Function to generate a Translation Matrix for a certain Tx and Ty

% Use the Translation Matrix formula including Tx and Ty 
% Generate the 3D space via Homogenous Co-ordinates
tM = [ 1 , 0 , Tx  ;
       0 , 1 , Ty  ;
       0 , 0 , 1  ];

%% Return the Transformation Matrix, tM

end
