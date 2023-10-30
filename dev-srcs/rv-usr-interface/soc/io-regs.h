#include "soc-configs.h"
#include <cstdint>

volatile uint8_t        *setx_reg     = CVIO_REG( 0 );
volatile uint8_t        *sety_reg     = CVIO_REG( 1 );
volatile settings_reg_t *settings_reg = (settings_reg_t *) CVIO_REG( 2 );
volatile conf_reg1_t    *configs_reg1 = CVIO_REG( 3 );
volatile uint8_t        *configs_reg2 = CVIO_REG( 4 );
volatile uint8_t        *wraddr_reg   = CVIO_REG( 5 );
volatile uint8_t        *wrdata_reg   = CVIO_REG( 6 );
