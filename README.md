# foot_traffic

This is the implementation of the coding problem to analyse the number of visitors for each room in a museum and the average time spent in each room by all of the visitors. Ruby version 2.5.0 is being used to implement the solution.

### Instruction to run the code

```bash
> cd foot_traffic
> ./bin/foot_traffic
Provide the input:
4
0 0 I 540
1 0 I 540
0 0 O 560
1 0 O 560

Below is the analysis
---------------------
Room 0, 20 minute average visit, 2 visitors total
```

Note: The outputs are fine but the average minutes spent are off by 1 with the second test sample ground truth. I have manually chaked the calculation and did not find any issue in calculation. It is passing the first test sample but the issue is coming for only second test sample.
