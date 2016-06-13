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
static const char *ng0 = "C:/Users/Tincho/Xilinx/UART/Rx.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {1U, 0U};
static int ng4[] = {7, 0};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {15, 0};
static unsigned int ng7[] = {3U, 0U};



static void Always_43_0(char *t0)
{
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

LAB0:    t1 = (t0 + 4832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5648);
    *((int *)t2) = 1;
    t3 = (t0 + 4864);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1912U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(52, ng0);

LAB9:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2952);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2792);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3112);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3592);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 3, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3912);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3752);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(45, ng0);

LAB8:    xsi_set_current_line(46, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2792);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3112);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3752);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    goto LAB7;

}

static void Always_60_1(char *t0)
{
    char t9[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 5080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 5664);
    *((int *)t2) = 1;
    t3 = (t0 + 5112);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(61, ng0);

LAB5:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 2792);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 2952);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 2);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2632);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3272);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3592);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 3);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 3752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3912);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2792);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(69, ng0);
    t6 = (t0 + 1592U);
    t7 = *((char **)t6);
    memset(t9, 0, 8);
    t6 = (t7 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (~(t10));
    t12 = *((unsigned int *)t7);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB19;

LAB17:    if (*((unsigned int *)t6) == 0)
        goto LAB16;

LAB18:    t15 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t15) = 1;

LAB19:    t16 = (t9 + 4);
    t17 = (t7 + 4);
    t18 = *((unsigned int *)t7);
    t19 = (~(t18));
    *((unsigned int *)t9) = t19;
    *((unsigned int *)t16) = 0;
    if (*((unsigned int *)t17) != 0)
        goto LAB21;

LAB20:    t24 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t24 & 1U);
    t25 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t25 & 1U);
    t26 = (t9 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t9);
    t30 = (t29 & t28);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB22;

LAB23:
LAB24:    goto LAB15;

LAB9:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 2072U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB26;

LAB27:
LAB28:    goto LAB15;

LAB11:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 2072U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB37;

LAB38:
LAB39:    goto LAB15;

LAB13:    xsi_set_current_line(98, ng0);
    t3 = (t0 + 2072U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t5);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB55;

LAB56:
LAB57:    goto LAB15;

LAB16:    *((unsigned int *)t9) = 1;
    goto LAB19;

LAB21:    t20 = *((unsigned int *)t9);
    t21 = *((unsigned int *)t17);
    *((unsigned int *)t9) = (t20 | t21);
    t22 = *((unsigned int *)t16);
    t23 = *((unsigned int *)t17);
    *((unsigned int *)t16) = (t22 | t23);
    goto LAB20;

LAB22:    xsi_set_current_line(70, ng0);

LAB25:    xsi_set_current_line(71, ng0);
    t32 = ((char*)((ng3)));
    t33 = (t0 + 2952);
    xsi_vlogvar_assign_value(t33, t32, 0, 0, 2);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    goto LAB24;

LAB26:    xsi_set_current_line(76, ng0);
    t6 = (t0 + 3112);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    t16 = ((char*)((ng4)));
    memset(t9, 0, 8);
    t17 = (t15 + 4);
    t26 = (t16 + 4);
    t18 = *((unsigned int *)t15);
    t19 = *((unsigned int *)t16);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t26);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t17);
    t27 = *((unsigned int *)t26);
    t28 = (t25 | t27);
    t29 = (~(t28));
    t30 = (t24 & t29);
    if (t30 != 0)
        goto LAB32;

LAB29:    if (t28 != 0)
        goto LAB31;

LAB30:    *((unsigned int *)t9) = 1;

LAB32:    t33 = (t9 + 4);
    t31 = *((unsigned int *)t33);
    t34 = (~(t31));
    t35 = *((unsigned int *)t9);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 4, t5, 4, t6, 4);
    t7 = (t0 + 3272);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 4);

LAB35:    goto LAB28;

LAB31:    t32 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB32;

LAB33:    xsi_set_current_line(77, ng0);

LAB36:    xsi_set_current_line(78, ng0);
    t38 = ((char*)((ng5)));
    t39 = (t0 + 2952);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 2);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3272);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3592);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);
    goto LAB35;

LAB37:    xsi_set_current_line(86, ng0);
    t6 = (t0 + 3112);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    t16 = ((char*)((ng6)));
    memset(t9, 0, 8);
    t17 = (t15 + 4);
    t26 = (t16 + 4);
    t18 = *((unsigned int *)t15);
    t19 = *((unsigned int *)t16);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t26);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t17);
    t27 = *((unsigned int *)t26);
    t28 = (t25 | t27);
    t29 = (~(t28));
    t30 = (t24 & t29);
    if (t30 != 0)
        goto LAB43;

LAB40:    if (t28 != 0)
        goto LAB42;

LAB41:    *((unsigned int *)t9) = 1;

LAB43:    t33 = (t9 + 4);
    t31 = *((unsigned int *)t33);
    t34 = (~(t31));
    t35 = *((unsigned int *)t9);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB44;

LAB45:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 4, t5, 4, t6, 4);
    t7 = (t0 + 3272);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 4);

LAB46:    goto LAB39;

LAB42:    t32 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB43;

LAB44:    xsi_set_current_line(87, ng0);

LAB47:    xsi_set_current_line(88, ng0);
    t38 = ((char*)((ng2)));
    t39 = (t0 + 3272);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 4);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 3752);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t40, 0, 8);
    t6 = (t40 + 4);
    t7 = (t5 + 4);
    t10 = *((unsigned int *)t5);
    t11 = (t10 >> 1);
    *((unsigned int *)t40) = t11;
    t12 = *((unsigned int *)t7);
    t13 = (t12 >> 1);
    *((unsigned int *)t6) = t13;
    t14 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t14 & 127U);
    t18 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t18 & 127U);
    t15 = (t0 + 1592U);
    t16 = *((char **)t15);
    xsi_vlogtype_concat(t9, 8, 8, 2U, t16, 1, t40, 7);
    t15 = (t0 + 3912);
    xsi_vlogvar_assign_value(t15, t9, 0, 0, 8);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3432);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t9, 0, 8);
    t7 = (t5 + 4);
    t15 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t15);
    t18 = (t13 ^ t14);
    t19 = (t12 | t18);
    t20 = *((unsigned int *)t7);
    t21 = *((unsigned int *)t15);
    t22 = (t20 | t21);
    t23 = (~(t22));
    t24 = (t19 & t23);
    if (t24 != 0)
        goto LAB51;

LAB48:    if (t22 != 0)
        goto LAB50;

LAB49:    *((unsigned int *)t9) = 1;

LAB51:    t17 = (t9 + 4);
    t25 = *((unsigned int *)t17);
    t27 = (~(t25));
    t28 = *((unsigned int *)t9);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB52;

LAB53:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 3432);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 3, t5, 3, t6, 3);
    t7 = (t0 + 3592);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 3);

LAB54:    goto LAB46;

LAB50:    t16 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB51;

LAB52:    xsi_set_current_line(91, ng0);
    t26 = ((char*)((ng7)));
    t32 = (t0 + 2952);
    xsi_vlogvar_assign_value(t32, t26, 0, 0, 2);
    goto LAB54;

LAB55:    xsi_set_current_line(99, ng0);
    t6 = (t0 + 3112);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    t16 = ((char*)((ng6)));
    memset(t9, 0, 8);
    t17 = (t15 + 4);
    t26 = (t16 + 4);
    t18 = *((unsigned int *)t15);
    t19 = *((unsigned int *)t16);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t26);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t17);
    t27 = *((unsigned int *)t26);
    t28 = (t25 | t27);
    t29 = (~(t28));
    t30 = (t24 & t29);
    if (t30 != 0)
        goto LAB61;

LAB58:    if (t28 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t9) = 1;

LAB61:    t33 = (t9 + 4);
    t31 = *((unsigned int *)t33);
    t34 = (~(t31));
    t35 = *((unsigned int *)t9);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 4, t5, 4, t6, 4);
    t7 = (t0 + 3272);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 4);

LAB64:    goto LAB57;

LAB60:    t32 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(100, ng0);

LAB65:    xsi_set_current_line(101, ng0);
    t38 = ((char*)((ng1)));
    t39 = (t0 + 2952);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 2);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2632);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB64;

}

static void Cont_109_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 5328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5760);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 255U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 7);
    t18 = (t0 + 5680);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000004137689832_3831866458_init()
{
	static char *pe[] = {(void *)Always_43_0,(void *)Always_60_1,(void *)Cont_109_2};
	xsi_register_didat("work_m_00000000004137689832_3831866458", "isim/Testbench_1_isim_beh.exe.sim/work/m_00000000004137689832_3831866458.didat");
	xsi_register_executes(pe);
}
