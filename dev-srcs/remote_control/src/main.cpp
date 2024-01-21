
#define BLINKER_WIFI 
#include <Blinker.h>

char auth[] = "0dc88854d85d";
char ssid[] = "KasakiMz";
char pswd[] = "20040421";

// Button Define
#define BUTTON_ENA "btn-qk1"
#define BUTTON_CHMT "btn-qgl"
#define BUTTON_CHDS "btn-lu8"
#define BUTTON_LAST "btn-a1"
#define BUTTON_NEXT "btn-3si"
#define BUTTON_UP "btn-123"
#define BUTTON_DOWN "btn-3yq"
#define BUTTON_LEFT "btn-2qn"
#define BUTTON_RIGHT "btn-pj1"
// Text
#define TXT_MUL "tex-skt"
#define TXT_DISP "tex-l7v"
#define TXT_ENH "tex-ssj"
#define LED_BUILTIN  2

#define GPIO_ENA 23
#define GPIO_MUL 22
#define GPIO_DISP 32
#define GPIO_CV_L 33
#define GPIO_CV_H 25
#define GPIO_UP 26
#define GPIO_DOWN 27
#define GPIO_LEFT 14
#define GPIO_RIGHT 12


BlinkerButton Button_ena(BUTTON_ENA);
BlinkerButton Button_mul(BUTTON_CHMT);
BlinkerButton Button_disp(BUTTON_CHDS);
BlinkerButton Button_last_enh(BUTTON_LAST);
BlinkerButton Button_next_enh(BUTTON_NEXT);
BlinkerButton Button_up(BUTTON_UP);
BlinkerButton Button_down(BUTTON_DOWN);
BlinkerButton Button_left(BUTTON_LEFT);
BlinkerButton Button_right(BUTTON_RIGHT);
BlinkerText Text_mul(TXT_MUL);
BlinkerText Text_disp(TXT_DISP);
BlinkerText Text_cv(TXT_ENH);

#define ARRLEN(x) sizeof(x) / sizeof(x[0])
char* mul_lut[] = {"2x", "4x"};
char* disp_lut[] = {"256*256", "128*128"};
char* cv_lut[] = {"None", "Sharpen", "Defog", "Hist"};

bool en;
bool mul_sel;
bool disp_sel;
uint8_t cv_sel;

// void button1_callback(const String & state)
// {
//     digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
//     BLINKER_LOG("get button state: ", state);
	
//     if (state == BLINKER_CMD_BUTTON_TAP) {
//         BLINKER_LOG("Button tap!");

//         Button1.icon("fas fa-air-freshener");
//         Button1.color("#FFFFFF");
//         Button1.text("第一点灯程序");
//         Button1.print();
//     }
// }

#define BUTTAP state == BLINKER_CMD_BUTTON_TAP
#define BUTPRES state == BLINKER_CMD_BUTTON_PRESS
#define BUTPRESUP state == BLINKER_CMD_BUTTON_PRESSUP

#define RED "#FF6969"
#define GREY "#A8A196"
#define BLUE "#8BE8E5"
#define dw digitalWrite

void ena_callback(const String & state){
	// BLINKER_LOG("ENA EVENT: ", state);
	// if (BUTPRES)
	// {
	// 	digitalWrite(2,1);
	// }else if (BUTPRESUP)
	// {
	// 	digitalWrite(2,0);
	// }
	if(BUTTAP){
		en = !en;
		if(en) Button_ena.color(RED);
		else Button_ena.color(GREY);
		Button_ena.print();
		dw(GPIO_ENA, en);
	}
}
void mul_callback(const String & state){
	if (BUTTAP)
	{
		mul_sel = !mul_sel;
		Text_mul.print(mul_lut[mul_sel], "超分倍数选择");
		dw(GPIO_MUL, mul_sel==true);
	}
}
void disp_callback(const String & state){
	if (BUTTAP)
	{
		disp_sel = !disp_sel;
		Text_disp.print(disp_lut[disp_sel], "超分窗口大小");
		dw(GPIO_DISP, disp_sel);
	}
}

#define WRENHAC dw(GPIO_CV_L, cv_sel & 0x1); \
				dw(GPIO_CV_H, (cv_sel >> 1) & 0x1);
void last_enh_callback(const String & state){
	if (BUTTAP)
	{
		cv_sel = cv_sel==0? ARRLEN(cv_lut)-1: cv_sel-1;
		Text_cv.print(cv_lut[cv_sel], "增强算法选择");
		WRENHAC;
	}
}
void next_enh_callback(const String & state){
	if (BUTTAP)
	{
		cv_sel = cv_sel==(ARRLEN(cv_lut)-1)? 0: cv_sel+1;
		Text_cv.print(cv_lut[cv_sel], "增强算法选择");
		WRENHAC;
	}
}
void up_callback(const String & state){
	if (BUTPRES)
	{
		Button_up.color(BLUE);
		Button_up.print();
		dw(GPIO_UP, 1);
	}else if (BUTPRESUP)
	{
		Button_up.color(GREY);
		Button_up.print();
		dw(GPIO_UP, 0);
	}
}
void down_callback(const String & state){
	if (BUTPRES)
	{
		Button_down.color(BLUE);
		Button_down.print();
		dw(GPIO_DOWN, 1);
	}else if (BUTPRESUP)
	{
		Button_down.color(GREY);
		Button_down.print();
		dw(GPIO_DOWN, 0);
	}
}
void left_callback(const String & state){
	if (BUTPRES)
	{
		Button_left.color(BLUE);
		Button_left.print();
		dw(GPIO_LEFT, 1);
	}else if (BUTPRESUP)
	{
		Button_left.color(GREY);
		Button_left.print();
		dw(GPIO_LEFT, 0);
	}
}
void right_callback(const String & state){
	if (BUTPRES)
	{
		Button_right.color(BLUE);
		Button_right.print();
		dw(GPIO_RIGHT, 1);
	}else if (BUTPRESUP)
	{
		Button_right.color(GREY);
		Button_right.print();
		dw(GPIO_RIGHT, 0);
	}
}

void dataRead(const String & data)
{
    BLINKER_LOG("Blinker readString: ", data);

    Blinker.vibrate();
    
    uint32_t BlinkerTime = millis();
    
    Blinker.print("millis", BlinkerTime);
}

void setup()
{
    Serial.begin(115200);
    BLINKER_DEBUG.stream(Serial);

#define PO(x) pinMode(x, OUTPUT);
    pinMode(LED_BUILTIN, OUTPUT);
    digitalWrite(LED_BUILTIN, LOW);
	PO(GPIO_ENA);
	PO(GPIO_MUL);
	PO(GPIO_DISP);
	PO(GPIO_CV_L);
	PO(GPIO_CV_H);
	PO(GPIO_UP);
	PO(GPIO_DOWN);
	PO(GPIO_LEFT);
	PO(GPIO_RIGHT);


    Blinker.begin(auth, ssid, pswd);
    Blinker.attachData(dataRead);
    // Button1.attach(button1_callback);

	Button_ena.attach(ena_callback);
	Button_mul.attach(mul_callback);
	Button_disp.attach(disp_callback);
	Button_last_enh.attach(last_enh_callback);
	Button_next_enh.attach(next_enh_callback);
	Button_up.attach(up_callback);
	Button_down.attach(down_callback);
	Button_left.attach(left_callback);
	Button_right.attach(right_callback);

	Text_mul.print(mul_lut[mul_sel], "超分倍数选择");
	Text_disp.print(disp_lut[disp_sel], "超分窗口大小");
	Text_cv.print(cv_lut[cv_sel], "增强算法选择");

   	digitalWrite(LED_BUILTIN, 1);
   	// digitalWrite(GPIO_ENA, 1);
   	// digitalWrite(GPIO_MUL, 1);
   	// digitalWrite(GPIO_DISP, 1);
   	// digitalWrite(GPIO_CV_L, 1);
   	// digitalWrite(GPIO_CV_H, 1);
   	// digitalWrite(GPIO_UP, 1);
   	// digitalWrite(GPIO_DOWN, 1);
   	// digitalWrite(GPIO_LEFT, 1);
   	// digitalWrite(GPIO_RIGHT, 1);

}

void loop()
{
    Blinker.run();
}
