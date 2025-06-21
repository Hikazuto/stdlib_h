// #include <windows.h>
#include <conio.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "time_ex.h"
#include "lib/histogram.h" 

#define CLEAR system("cls");
#define HALT(msg) {printf("%s",msg);getch();}


int getline(char* buf, unsigned int n) {
    char c = 0;
    unsigned int i = 0;
    for (; i < n; i++) {
        c = getch();
        buf[i] = c;
        printf("[%3d] %d : %c\n", i, c, c);
        if(c == 13) break;
    }
    
    return i;
}



void init(void* _this){

}


typedef struct vec3 {
    float x, y, z;
} vec3;

typedef struct obj_stats {
    int STR;
    int DEX;
    int SPD;
    int INT;
    int VIT;
} obj_stats;

typedef struct obj obj;

double obj_attack(obj* this, int atk_type);
void obj_income(obj* this, double in);
void obj_idle(obj* this);
void obj_init(obj* this);
void obj_translate(obj* this, vec3 delta);
void obj_stat_update(obj* this, obj_stats delta);
int obj_print_stats(obj* this);

typedef struct _obj_vtable {
    void (*init)(obj* this);

    void (*translate)(obj* this, vec3 delta);
    void (*income)(obj* this, double in);
    double (*attack)(obj* this, int atk_type);
    void (*idle)(obj* this);
    void (*stat_update)(obj* this, obj_stats delta);

    int (*print_stats)(obj* this);
} _obj_vtable;

static const _obj_vtable obj_vtable = {obj_init, obj_translate, obj_income, obj_attack, obj_idle, obj_stat_update, obj_print_stats}; 

struct obj {

    _obj_vtable* vtable;
    vec3 coord;

    double HP;
    double MP;
    double stamina;

    double HP_max;
    double MP_max;
    double stamina_max;


    double gold;
    obj_stats stat;

};

void obj_translate(obj* this, vec3 delta) {
    this->coord.x += delta.x * (0.3 * this->stat.SPD);
    this->coord.y += delta.y * (0.3 * this->stat.SPD);
    this->coord.z += delta.z * (0.3 * this->stat.SPD);
}

#define obj_ATK_LIGHT 0x0
#define obj_ATK_HEAVY 0x1
#define obj_ATK_MAGIC 0x2

#define obj_ATK_ARROW 0x4

double obj_attack(obj* this, int atk_type){
    register double dmg = 0;
    switch (atk_type) {
    case obj_ATK_LIGHT:
        dmg = 2 * this->stat.STR;
        this->stamina -= 10/this->stat.DEX;
        break;
    
    case obj_ATK_HEAVY:
        dmg = 5 * this->stat.STR;
        this->stamina -= 20/this->stat.DEX;
        break;

    default:
        break;
    }

    return dmg;
}

void obj_income(obj* this, double in) {
    this->gold += in;
}

void obj_idle(obj* this) {
    if(this->stamina < this->stamina_max) this->stamina += 1.25 + (0.053 * this->stat.VIT);
    if(this->MP < this->MP_max) this->MP += (0.006 * this->stat.VIT) + (0.013 * this->stat.INT);
    if(this->HP < this->HP_max) this->HP += (0.0057 * this->stat.DEX) + (0.0021 * this->stat.VIT);
}

void obj_init(obj* this) {

    // this->vtable->init = obj_init;
    // this->vtable->translate = obj_translate;
    // this->vtable->income = obj_income;
    // this->vtable->attack = obj_attack;
    // this->vtable->idle = obj_idle;
    // this->vtable->stat_update = obj_stat_update;
    // this->vtable->print_stats = obj_print_stats;
    this->vtable = &obj_vtable;

    this->coord = (vec3) {0, 0, 0};
    this->stat = (obj_stats) {1, 1, 1, 1, 1};
    this->vtable->stat_update(this, (obj_stats){0});

    
    this->gold = 120;
    this->HP = this->HP_max;
    this->MP = this->MP_max;
    this->stamina = this->stamina_max;
    
}

void obj_stat_update(obj* this, obj_stats delta) {
    this->stat.STR += delta.STR;
    this->stat.DEX += delta.DEX;
    this->stat.SPD += delta.SPD;
    this->stat.INT += delta.INT;
    this->stat.VIT += delta.VIT;
    
    this->HP_max = 100 + (7.5 * this->stat.VIT) + (3 * this->stat.DEX);
    this->stamina_max = 250 + (15 * this->stat.VIT) + (20 * this->stat.DEX) + (5 * this->stat.STR);
    this->MP_max = 100 + (10 * this->stat.INT) + (2.5 * this->stat.VIT);
    
}

#define BAR_LEN 32
int obj_print_stats(obj* this) {
    char bars[3][BAR_LEN + 3] = { 0 };
    
    printf("HP: %3.2lf/%-3.2lf %s\tMP: %3.2lf/%-3.2lf %s\n", 
        this->HP, this->HP_max, _printBar(bars[0], this->HP, this->HP_max, BAR_LEN, NULL),
        this->MP, this->MP_max,  _printBar(bars[1], this->MP, this->MP_max, BAR_LEN, NULL));

    printf("stamina: %4lf/%-4lf\n%s\n\n", this->stamina, this->stamina_max, _printBar(bars[2], this->stamina, this->stamina_max, BAR_LEN, NULL));
    printf("x: %lf  y: %lf  z: %lf\n", this->coord.x, this->coord.y, this->coord.z);    
    
    printf("Gold: %4.2lf\n\n", this->gold);

    printf("STR: %3d\nDEX: %3d\nSPD: %3d\nINT: %3d\nVIT: %3d\n", this->stat.STR, this->stat.DEX, this->stat.SPD, this->stat.INT, this->stat.VIT);
}




// int misc((func*), int);
typedef int funcptr(char*, unsigned int);
#define CLOCK_UPS_SAMPLES 0X40

int main() {
    CLEAR;


    obj* player = malloc(sizeof(obj));  // memory allocation
    player->vtable = &obj_vtable;    // vtable function assignment
    player->vtable->init(player);       // initialization

    int i = 0;

    char action = 0;
    time_t clocks = 0;
    double UPS = 0;
    int clk_i = 0;

    while (1) {
        _sleep(0);
        if (clk_i++ < CLOCK_UPS_SAMPLES) {
            clocks += _clockElapsed();
        }
        else {
            UPS = (1000.0 * CLOCK_UPS_SAMPLES) / clocks; // update UPS
            clk_i = clocks = 0;
        }
        
        printf("\033[Hiteration: %6d  UPS: %lf\n\n", i++, UPS);
        player->vtable->print_stats(player);
        printf("\n\nKEY: %d", action);

        
        action = (_kbhit()) ? getch() : 0;
    

        switch (action) {
            case 'w': case 'W':
            player->vtable->translate(player, (vec3){0,1,0});
            break;

        case 'a': case 'A':
            player->vtable->translate(player, (vec3){-1,0,0});
            break;
            
            case 's': case 'S':
            player->vtable->translate(player, (vec3){0,-1,0});
            break;

            case 'd': case 'D':
            player->vtable->translate(player, (vec3){1,0,0});
            break;

            case 'j': case 'J':
            player->vtable->attack(player, obj_ATK_LIGHT);
            // _sleep(100);
            break;
            
            case 'k': case 'K':
            player->vtable->attack(player, obj_ATK_HEAVY);
            // _sleep(100);
            break;
            
            case '1':
            player->vtable->stat_update(player, (obj_stats){1,0,0,0,0});
            break;
            case '2':
            player->vtable->stat_update(player, (obj_stats){0,1,0,0,0});
            break;
            case '3':
            player->vtable->stat_update(player, (obj_stats){0,0,1,0,0});
            break;
            case '4':
            player->vtable->stat_update(player, (obj_stats){0,0,0,1,0});
            break;
            case '5':
            player->vtable->stat_update(player, (obj_stats){0,0,0,0,1});
            break;
            
            case ' ':
                return player->gold;
            break;

            default:
            if(!(i % 5))
                player->vtable->idle(player);
        }
        
    }
    

    

    return 0;

}