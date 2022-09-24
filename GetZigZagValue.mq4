//+------------------------------------------------------------------+
//|                                               GetZigZagValue.mq4 |
//|                                    Copyright 2015,Rony Nofrianto |
//|                               https://www.mql5.com/en/users/RoNz |
//+------------------------------------------------------------------+
#property copyright "Copyright 2015,Rony Nofrianto"
#property link      "https://www.mql5.com/en/users/RoNz"
#property version   "1.00"
#property strict

#property script_show_inputs

double zz_values[];
int zz_barshift[];

input int inpZZDepth=12;
input int inpZZDeviation=5;
input int inpZZBackstep=3;
input int inpZZLimit=5;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void get_zz_values(int zz_depth,int zz_deviation,int zz_backstep,int zz_limit)
  {
   int j=0;

   ArrayResize(zz_values,zz_limit);
   ArrayResize(zz_barshift,zz_limit);

   for(int i=0;i<Bars;i++)
     {
      double zz=iCustom(NULL,0,"ZigZag",zz_depth,zz_deviation,zz_backstep,0,i);

      if(zz!=0)
        {
         zz_values[j]=zz;
         zz_barshift[j]=i;
         j++;
        }

      if(j==zz_limit) break;
     }

   for(int i=0;i<ArraySize(zz_values);i++)
      Print("zz_values[",i,"]=",zz_values[i]," zz_barshift[",i,"]=",zz_barshift[i]);

  }
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   get_zz_values(inpZZDepth,inpZZDeviation,inpZZBackstep,inpZZLimit);
  }
//+------------------------------------------------------------------+
