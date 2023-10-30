#include <cstdint>
#ifdef _SOC_CONFIGS_

#define CVIO_BASE 0x10042000
#define CVIO_REG( x ) (uint8_t *) ( CVIO_BASE + x )

struct settings_reg_t
{
    uint8_t enable_disp : 1;
    uint8_t unused : 2;
    uint8_t disp_size : 1; // 0: 256
    uint8_t cv_select : 4;
};
struct conf_reg1_t
{
    uint8_t bcb_mul : 1;
    uint8_t bcb_disp_size : 1;
    uint8_t shp_disp_size : 1;
    uint8_t dfog_disp_size : 1;
    uint8_t imadj_disp_size : 1;
    uint8_t unused : 3;
};

#endif // _SOC_CONFIGS_