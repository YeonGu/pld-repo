# GPIO

# 定时器中断

## 初始化

```C
void mtimer_irq_handler(void)
{
    int0_cnt++;
    wait_seconds(1);
    printf("MTimer IRQ handler %d\n\r", int0_cnt);
    uint64_t now = SysTimer_GetLoadValue();
    SysTimer_SetCompareValue(now + 0.5 * SOC_TIMER_FREQ);
}

void setup_timer()
{
    printf("init timer and start\n\r");
    uint64_t now = SysTimer_GetLoadValue();
    uint64_t then = now + 0.5 * SOC_TIMER_FREQ;
    SysTimer_SetCompareValue(then);
}

int main(){
    Core_Register_IRQ(SysTimer_IRQn, mtimer_irq_handler); /* register system timer interrupt */
    __enable_irq(); /* enable global interrupt */
    setup_timer();
}
```
