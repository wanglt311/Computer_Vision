inputImageForestTest1 = imread('forest_test1.jpg');
inputImageForestTest2 = imread('forest_test2.jpg');
inputImageForestTest3 = imread('forest_test3.jpg');
inputImageForestTest4 = imread('forest_test4.jpg');


figure(1)
classifier1 = printResultForest(inputImageForestTest1, 1);
figure(2)
classifier2 = printResultForest(inputImageForestTest2, 2);
figure(3)
classifier3 = printResultForest(inputImageForestTest3, 3);
figure(4)
classifier4 = printResultForest(inputImageForestTest4, 4);

inputImageCoastTest1 = imread('coast_test1.jpg');
inputImageCoastTest2 = imread('coast_test2.jpg');
inputImageCoastTest3 = imread('coast_test3.jpg');
inputImageCoastTest4 = imread('coast_test4.jpg');

figure(5)
classifier5 = printResultCoast(inputImageCoastTest1, 1);
figure(6)
classifier6 = printResultCoast(inputImageCoastTest2, 2);
figure(7)
classifier7 = printResultCoast(inputImageCoastTest3, 3);
figure(8)
classifier8 = printResultCoast(inputImageCoastTest4, 4);

inputImageInsidecityTest1 = imread('insidecity_test1.jpg');
inputImageInsidecityTest2 = imread('insidecity_test2.jpg');
inputImageInsidecityTest3 = imread('insidecity_test3.jpg');
inputImageInsidecityTest4 = imread('insidecity_test4.jpg');

figure(9)
classifier9 = printResultInsidecity(inputImageInsidecityTest1, 1);
figure(10)
classifier10 = printResultInsidecity(inputImageInsidecityTest2, 2);
figure(11)
classifier11 = printResultInsidecity(inputImageInsidecityTest3, 3);
figure(12)
classifier12 = printResultInsidecity(inputImageInsidecityTest4, 4);




