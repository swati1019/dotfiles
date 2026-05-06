#include <stdio.h>
#include <string.h>
int main() {
long value , memTotal, memAvailable, memFree;
char label[50];
FILE *fp = fopen("/proc/meminfo", "r");
while(fscanf(fp , "%s %ld kB" , label , &value) == 2){
if(strcmp(label , "MemTotal:") == 0) memTotal = value;
if(strcmp(label , "MemAvailable:") == 0) memAvailable = value;
if(strcmp(label , "MemFree:") == 0) memFree = value;
}
fclose(fp);
long used = memTotal - memAvailable;

printf("MemTotal: %ld kB\n",  memTotal);
printf("MemAvailable: %ld kB\n", memAvailable);
printf("RAM Usage: %.1f%%\n", (float)used/memTotal*100);

return 0;

}

