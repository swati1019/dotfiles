#include <stdio.h>
#include <string.h>
#include <unistd.h> 
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

FILE *fp2 = fopen("/proc/stat", "r");
long user1, nice1, system1, idle1, iowait1, irq1, softirq1;
fscanf(fp2, "cpu %ld %ld %ld %ld %ld %ld %ld", 
       &user1, &nice1, &system1, &idle1, &iowait1, &irq1, &softirq1);
       fclose(fp2);

long total1 = user1 + nice1 + system1 + idle1 + iowait1 + irq1 + softirq1;

sleep(1);

fp2 = fopen("/proc/stat", "r");
long user2, nice2, system2, idle2, iowait2, irq2, softirq2;
fscanf(fp2, "cpu %ld %ld %ld %ld %ld %ld %ld", 
       &user2, &nice2, &system2, &idle2, &iowait2, &irq2, &softirq2);
       fclose(fp2);

long total2 = user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2;

long diff_total = total2 - total1;
long diff_idle = idle2 - idle1;
float cpu_usage = (float)(diff_total - diff_idle) / diff_total * 100;
printf("CPU Usage: %.1f%%\n", cpu_usage);

return 0;

}

