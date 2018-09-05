/*
  SPDX-License-Identifier: GPL-2.0-only
*/

#include <ArduiPi_OLED_lib.h>
#include <ArduiPi_OLED.h>

// Instantiate the display
ArduiPi_OLED display;

int main(int argc, char **argv)
{
  // I2C change parameters to fit to your LCD
  if ( !display.init(OLED_I2C_RESET, OLED_ADAFRUIT_I2C_128x64) )
    exit(EXIT_FAILURE);

  display.begin();

  display.clearDisplay();
  display.display();

  display.setTextColor(WHITE);

  if (argc > 1)
  {
    display.setTextSize(2);
    display.setCursor(0,0);
    display.print(argv[1]);
  }

  if (argc > 2)
  {
    display.setTextSize(1);
    display.setCursor(0,16);
    display.print(argv[2]);
  }

  if (argc > 3)
  {
    display.setTextSize(1);
    display.setCursor(0,26);
    display.print(argv[3]);
  }

  if (argc > 4)
  {
    display.setTextSize(1);
    display.setCursor(0,36);
    display.print(argv[4]);
  }

  if (argc > 5)
  {
    display.setTextSize(1);
    display.setCursor(0,46);
    display.print(argv[5]);
  }

  display.display();
  display.close();
}
