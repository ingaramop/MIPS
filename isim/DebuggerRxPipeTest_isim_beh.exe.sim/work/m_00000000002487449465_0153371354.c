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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/MIPS/DebuggerRx.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {49U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {50U, 0U};
static unsigned int ng8[] = {4U, 0U};
static unsigned int ng9[] = {51U, 0U};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {6U, 0U};
static unsigned int ng12[] = {2U, 0U};



static void Cont_47_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;

LAB0:    t1 = (t0 + 5328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2408U);
    t3 = *((char **)t2);
    t2 = (t0 + 4408);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t5);
    t9 = (t7 & t8);
    *((unsigned int *)t6) = t9;
    t10 = (t3 + 4);
    t11 = (t5 + 4);
    t12 = (t6 + 4);
    t13 = *((unsigned int *)t10);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    t38 = (t0 + 5992);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    memset(t42, 0, 8);
    t43 = 1U;
    t44 = t43;
    t45 = (t6 + 4);
    t46 = *((unsigned int *)t6);
    t43 = (t43 & t46);
    t47 = *((unsigned int *)t45);
    t44 = (t44 & t47);
    t48 = (t42 + 4);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t49 | t43);
    t50 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t50 | t44);
    xsi_driver_vfirst_trans(t38, 0, 0);
    t51 = (t0 + 5896);
    *((int *)t51) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t6);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t6) = (t18 | t19);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t36 & t32);
    t37 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t37 & t33);
    goto LAB6;

}

static void Always_49_1(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 5576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 5912);
    *((int *)t2) = 1;
    t3 = (t0 + 5608);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(49, ng0);

LAB5:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 4088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t5, 3);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t13 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng12)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t13 == 1)
        goto LAB23;

LAB24:
LAB25:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(50, ng0);

LAB9:    xsi_set_current_line(51, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 3, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(56, ng0);

LAB26:    xsi_set_current_line(57, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB25;

LAB13:    xsi_set_current_line(63, ng0);

LAB27:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB28;

LAB29:
LAB30:    goto LAB25;

LAB15:    xsi_set_current_line(90, ng0);

LAB64:    xsi_set_current_line(93, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB25;

LAB17:    xsi_set_current_line(97, ng0);

LAB65:    xsi_set_current_line(100, ng0);
    t3 = ((char*)((ng3)));
    t5 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3208U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB66;

LAB67:
LAB68:    goto LAB25;

LAB19:    xsi_set_current_line(106, ng0);

LAB70:    xsi_set_current_line(109, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB25;

LAB21:    xsi_set_current_line(114, ng0);

LAB71:    xsi_set_current_line(117, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB25;

LAB23:    xsi_set_current_line(120, ng0);

LAB72:    xsi_set_current_line(121, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 3928);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 3048U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB73;

LAB74:
LAB75:    goto LAB25;

LAB28:    xsi_set_current_line(68, ng0);

LAB31:    xsi_set_current_line(70, ng0);
    t5 = (t0 + 2728U);
    t11 = *((char **)t5);

LAB32:    t5 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 8, t5, 8);
    if (t13 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 8, t2, 8);
    if (t13 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 8, t2, 8);
    if (t13 == 1)
        goto LAB37;

LAB38:
LAB40:
LAB39:    xsi_set_current_line(84, ng0);

LAB63:    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB41:    goto LAB30;

LAB33:    xsi_set_current_line(71, ng0);

LAB42:    xsi_set_current_line(72, ng0);
    t12 = ((char*)((ng6)));
    t14 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, 0, 3, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3208U);
    t3 = *((char **)t2);
    memset(t15, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB46;

LAB44:    if (*((unsigned int *)t2) == 0)
        goto LAB43;

LAB45:    t5 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t5) = 1;

LAB46:    t12 = (t15 + 4);
    t14 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (~(t16));
    *((unsigned int *)t15) = t17;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB48;

LAB47:    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 & 1U);
    t23 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t23 & 1U);
    t24 = (t15 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t15);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB49;

LAB50:
LAB51:    goto LAB41;

LAB35:    xsi_set_current_line(75, ng0);

LAB52:    xsi_set_current_line(76, ng0);
    t3 = ((char*)((ng8)));
    t5 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3208U);
    t3 = *((char **)t2);
    memset(t15, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB56;

LAB54:    if (*((unsigned int *)t2) == 0)
        goto LAB53;

LAB55:    t5 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t5) = 1;

LAB56:    t12 = (t15 + 4);
    t14 = (t3 + 4);
    t16 = *((unsigned int *)t3);
    t17 = (~(t16));
    *((unsigned int *)t15) = t17;
    *((unsigned int *)t12) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB58;

LAB57:    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 & 1U);
    t23 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t23 & 1U);
    t24 = (t15 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t15);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB59;

LAB60:
LAB61:    goto LAB41;

LAB37:    xsi_set_current_line(79, ng0);

LAB62:    xsi_set_current_line(80, ng0);
    t3 = ((char*)((ng10)));
    t5 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB41;

LAB43:    *((unsigned int *)t15) = 1;
    goto LAB46;

LAB48:    t18 = *((unsigned int *)t15);
    t19 = *((unsigned int *)t14);
    *((unsigned int *)t15) = (t18 | t19);
    t20 = *((unsigned int *)t12);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t12) = (t20 | t21);
    goto LAB47;

LAB49:    xsi_set_current_line(73, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 1, 0LL);
    goto LAB51;

LAB53:    *((unsigned int *)t15) = 1;
    goto LAB56;

LAB58:    t18 = *((unsigned int *)t15);
    t19 = *((unsigned int *)t14);
    *((unsigned int *)t15) = (t18 | t19);
    t20 = *((unsigned int *)t12);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t12) = (t20 | t21);
    goto LAB57;

LAB59:    xsi_set_current_line(77, ng0);
    t30 = ((char*)((ng3)));
    t31 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 1, 0LL);
    goto LAB61;

LAB66:    xsi_set_current_line(101, ng0);

LAB69:    xsi_set_current_line(102, ng0);
    t5 = ((char*)((ng2)));
    t12 = (t0 + 4408);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB68;

LAB73:    xsi_set_current_line(123, ng0);
    t5 = ((char*)((ng4)));
    t12 = (t0 + 4088);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 3, 0LL);
    goto LAB75;

}


extern void work_m_00000000002487449465_0153371354_init()
{
	static char *pe[] = {(void *)Cont_47_0,(void *)Always_49_1};
	xsi_register_didat("work_m_00000000002487449465_0153371354", "isim/DebuggerRxPipeTest_isim_beh.exe.sim/work/m_00000000002487449465_0153371354.didat");
	xsi_register_executes(pe);
}
