/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000590250206_2305464382_init();
    work_m_00000000004137689832_3831866458_init();
    work_m_00000000003401975391_3273414670_init();
    work_m_00000000002482269063_3597375865_init();
    work_m_00000000001195609469_1602151772_init();
    work_m_00000000003251966651_2990474204_init();
    work_m_00000000000922953146_3683860065_init();
    work_m_00000000003059815130_1543769969_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003059815130_1543769969");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
