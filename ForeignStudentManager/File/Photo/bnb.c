#include <stdio.h>
struct student
{
  int no;
  char name[30];
  int age;
};

int main()
{

   /* struct student s={20101,"zhangsan",30};

    FILE *fp;
    fp=fopen("stu.dat","w");
    if(fp==NULL)
    {
        printf("file can not open.\n");
        exit(1);
    }
    fprintf(fp,"%d %30s %d\n",s.no,s.name,s.age);
    fclose(fp);*/

    struct student s;

    FILE *fp;
    fp=fopen("stu.dat","r");
    if(fp==NULL)
    {
        printf("file can not open.\n");
        exit(1);
    }
    fscanf(fp,"%d%s%d",&s.no,s.name,&s.age);
    if(ferror(fp)) printf("error");
    printf("%d %s %d\n",s.no,s.name,s.age);
    fclose(fp);



}
