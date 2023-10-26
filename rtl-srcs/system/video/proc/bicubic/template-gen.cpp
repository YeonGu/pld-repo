#include <cstdio>
#include <stdio.h>

using namespace std;

int main(int argc, const char **argv) {
  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 4; j++) {
      printf("assign i_raw_pix%d%d = loaded_pixel[%d][calc_cnt+%d]\n",
             i + 1, j + 1, 3 - i, j);
    }
  }
  return 0;
}