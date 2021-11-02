#include <platform.h>
#include "stdio.h"


void tx(chanend chan_in) {
    int recv;
    while (1) {
      chan_in :> recv;
    }
}


void rx(chanend chan_out) {
    int i = 0;
    while(1) {
    chan_out <: i;
    i++;
    }
}

int main(void) {
  chan c;
  par {
    on tile[0] :   tx(c);
    on tile[2] :   tx(c);
  }
  return 0;
}
