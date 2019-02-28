%% Provision of all Kernels used in filtering

%% Average Kernel (Part A)

averageKernel = [1,1,1;
                1,1,1;
                1,1,1];
            
%% 3x3 Kernels (Part B)

a3Kernel =   [1  2	1;
              2	 4	2;
              1	 2	1];
                
                
b3Kernel = [0  1  0;
            1 -4  1;
            0  1  0];

       
%% 5x5 Kernels (Part D)

a5Kernel = [1	3	4	3	1;
            3	8	11	8	3;
            4	11	16	11	4;
            3	8	11	8	3;
            1	3	4	3	1];
        
b5Kernel = [0	0	1	0	0;
            0	0	1	0	0;
            1	1	-8	1	1;
            0	0	1	0	0;
            0	0	1	0	0];

%% 7x7 Kernels (Part D)
        
a7Kernel = [1	3	6	7	6	3	1;
            3	9	18	22	18	9	3;
            6	18	35	44	35	18	6;
            7	22	44	55	44	22	7;
            6	18	35	44	35	18	6;
            3	9	18	22	18	9	3;
            1	3	6	7	6	3	1];
        
        
b7Kernel = [0	0	0	1	0	0	0;
            0	0	0	1	0	0	0;
            0	0	0	1	0	0	0;
            1	1	1	-12	1	1	1;
            0	0	0	1	0	0	0;
            0	0	0	1	0	0	0;
            0	0	0	1	0	0	0];


        
