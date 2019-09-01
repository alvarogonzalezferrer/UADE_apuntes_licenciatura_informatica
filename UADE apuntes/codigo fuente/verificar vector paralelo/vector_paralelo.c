/*
Verificacion de paralelismo de vectores
Por Kronoman - En memoria de mi querido padre
Para Math 2 

*/

#include <stdio.h>

/* cantidad de vectores a comprobar, dejar en 2 por favor! */
#define C_V 2
/* dimensiones de cada vector (ej: x,y,z = 3) */
#define C_D 3
/* nombre de las dimensiones del vector para pedirle al usuario */
char C_D_name[] = "xyz";

int main()
{
int x,y; /* para el for de ingreso */
float vect[C_V][C_D], res;

while(1)
{
printf("\n\nVerificacion de paralelismo de vectores\n");
printf("Por Kronoman - En memoria de mi querido padre\n\n");
printf("CTRL+C para salir\n\n");

 for (x = 0; x < C_V; x++)
 {
   printf("Vector #%d\n", x+1);
  for (y = 0; y < C_D; y++)
  {
   printf("Ingrese coordenada %c > ", C_D_name[y]);
   scanf("%f", &vect[x][y]);
   printf("\nConfirmacion: %c = %f\n\n", C_D_name[y], vect[x][y]);
  }
 }

/* calcular, si al final la relacion se mantiene son todos paralelos */
printf("Relaciones entre componentes homologas:\n");
 for (x = 0; x < C_V-1; x++) /* vectores */
  for (y = 0; y < C_D; y++) /* componentes */
      printf("%f / %f = %f \n",vect[x][y], vect[x+1][y], vect[x][y] / vect[x+1][y] );


printf("\nCTRL+C para finalizar\n");
}



return 0;
}