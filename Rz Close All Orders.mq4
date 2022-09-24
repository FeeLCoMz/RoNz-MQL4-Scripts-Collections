//+------------------------------------------------------------------+
//|                                         RoNz Close All Orders.mq4|
//|                                   Copyright 2016, Rony Nofrianto |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, Rony Nofrianto"
#property link      ""
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CalculateCurrentOrders()
  {
   int buys=0,sells=0;

   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;
      if(OrderType()==OP_BUY)
        {
         buys++;
        }
      if(OrderType()==OP_SELL)
        {
         sells++;
        }
     }

   if(buys>0) return(buys);
   else       return(-sells);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CloseAllOrders()
  {
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false) break;

      bool bClosed;

      if(OrderType()==OP_BUY)
         bClosed=OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),3,clrBlue);
      if(OrderType()==OP_SELL)
         bClosed=OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),3,clrRed);
     }
   return false;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart()
  {
   while(CalculateCurrentOrders()!=0)
      CloseAllOrders();
  }
//+------------------------------------------------------------------+
