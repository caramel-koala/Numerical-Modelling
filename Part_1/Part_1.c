/////////////////////////////////////////////////////////////
//INCLUDES
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
/////////////////////////////////////////////////////////////
//LINSPACE
double* linspace(double xmin, double xmax, int n)
{
	double *res = (double* )malloc(sizeof(double)*(n+1));

	double diff = xmax - xmin;

	double h = diff/(n);

	int i;
	for(i = 0; i <= n; i++)
	{
		res[i] = xmin + h*i;
	}

	return res;

}
////////////////////////////////////////////////////////////
//GET_H
double get_h(double *grid)
{
	return grid[1] - grid[0];
}
///////////////////////////////////////////////////////////
//GRID_SIN
double* grid_sin(double *grid, int N)
{
	double *res = (double* )malloc(sizeof(double)*(N+1));

	int i;
	for(i = 0; i <= N; i++)
	{
		res[i] = sin(grid[i]);
	}

	return res;
}
///////////////////////////////////////////////////////////
//GET_MAX
double get_max(double *grid, int N)
{
	double max = -999999;
	int i;
	for (i = 0; i <= N; ++i)
	{
		if (grid[i] > max) max = grid[i];
	}

	return max;
}
///////////////////////////////////////////////////////////
//GET_MIN
double get_min(double *grid, int N)
{
	double min = 999999;
	int i;
	for (i = 0; i <= N; ++i)
	{
		if (grid[i] < min) min = grid[i];
	}

	return min;
}
///////////////////////////////////////////////////////////
//GET_LINF
double get_linf(double *grid, int N)
{
	double max = get_max(grid, N);

	return fabs(max);
}
///////////////////////////////////////////////////////////
//GET_L1
double get_l1(double *grid, int N)
{
	double l1 = 0;
	int i;
	for (i = 0; i <= N; ++i)
	{
		l1 += fabs(grid[i]);
	}

	return l1;
}
///////////////////////////////////////////////////////////
//GET_L2
double get_l2(double *grid, int N)
{
	double l2 = 0;
	int i;
	for (i = 0; i <= N; ++i)
	{
		l2 += grid[i]*grid[i];
	}

	return l2;
}
///////////////////////////////////////////////////////////
//MAIN
int main(int argc, char*argv[])
{

	//get params
	int xmin = -1;
    int xmax = 1;
    int N = 40;

    if(argc > 3)
    {
        xmin 	= atoi(argv[1]);
        xmax 	= atoi(argv[2]);
        N 		= atoi(argv[3]);
    }

    double *grid = linspace((double) xmin, (double) xmax, N);

    double h = get_h(grid);

    double *v = grid_sin(grid, N);

    double max = get_max(v, N);
    double min = get_min(v, N);
    double Linf = get_linf(v, N);
    double L1 = get_l1(v,N);
    double L2 = get_l2(v,N);

    FILE *fp;

    fp = fopen( "v.dat", "w+" );
    int i;
    for (i = 0; i <= N; ++i)
    {
    	fprintf(fp, "%f \t %f\n", grid[i], v[i]);
    }
    fclose(fp);

}
//////////////////////////////////////////////////////////
	