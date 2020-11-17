#include <ros.h>
#include <std_msgs/String.h>
#include <std_msgs/UInt16.h>

//#define BUTTON 7
//#define LED 13

int i = 0;


ros::NodeHandle node_handle;

std_msgs::String Button_msg;
std_msgs::UInt16 Led_msg;

void SubscriberCallback(const std_msgs::UInt16& Led_msg)
{
  if (Led_msg.data == 1)
  {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(1000);                       // wait for a second


  }
  else {
    digitalWrite(LED_BUILTIN, LOW);
    delay(1000);                       // wait for a second

  }
}

ros::Publisher button_publisher("button_press", &Button_msg);
ros::Subscriber<std_msgs::UInt16> led_subscriber("toggle_led", &SubscriberCallback);


void setup() {
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);
  //pinMode(BUTTON, INPUT);


  node_handle.initNode();
  node_handle.advertise(button_publisher);
  node_handle.subscribe(led_subscriber);
}

void loop() {
  // put your main code here, to run repeatedly:

  i = i + 1;


  // if (digitalRead(BUTTON) == HIGH)
  if (i % 5 == 0)

  {
    Button_msg.data = "Button is Pressed";
  }
  else
  {
    Button_msg.data = "Button is not Pressed";

  }

  button_publisher.publish(&Button_msg);
  node_handle.spinOnce();

  delay(500);

}
