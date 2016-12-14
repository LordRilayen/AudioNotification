import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;

//SOUND VARIABLES
ControlP5 cp5;

TextToSpeechMaker ttsMaker;

SamplePlayer gymSound;
SamplePlayer walkingSound;
SamplePlayer coffeeSound;
SamplePlayer presentationSound;
SamplePlayer heartbeatStart;
SamplePlayer heartbeatLoop;
SamplePlayer priority1Intro;
SamplePlayer priority1Loop;
SamplePlayer priority2Intro;
SamplePlayer priority2Loop;
SamplePlayer priority3Loop; //has no intro
SamplePlayer priority4Intro;
SamplePlayer priority4Loop;
SamplePlayer twitterSound;
SamplePlayer emailSound;
SamplePlayer textSound;
SamplePlayer phoneSound;
SamplePlayer voiceSound;

boolean isGym;
boolean isWalking;
boolean isCoffee;
boolean isPresentation;
boolean isHeartbeatStart;
boolean isHeartbeatLoop;
boolean priority1;
boolean isPriority1Loop;
boolean priority2;
boolean isPriority2Loop;
boolean priority3;
boolean isPriority3Loop;
boolean priority4;
boolean isPriority4Loop;
boolean systemIsNotifying;
boolean notificationAdded;
boolean playTweet;
boolean playEmail;
boolean playText;
boolean playPhone;
boolean playVoice;

int notificationCounter;

float hbg;
float bg1;
float bg2;
float bg3;
float bg4;
float tg;
float eg;
float txtg;
float pg;
float vg;

Glide contextGlide;
Glide heartbeatGlide;
Glide backgroundGlide1;
Glide backgroundGlide1Loop;
Glide backgroundGlide2;
Glide backgroundGlide2Loop;
Glide backgroundGlide3Loop;
Glide backgroundGlide4;
Glide backgroundGlide4Loop;
Glide twitterGlide;
Glide emailGlide;
Glide textGlide;
Glide phoneGlide;
Glide voiceGlide;

Gain contextG;
Gain heartbeatG;
Gain backgroundG1;
Gain backgroundG1Loop;
Gain backgroundG2;
Gain backgroundG2Loop;
Gain backgroundG3Loop;
Gain backgroundG4;
Gain backgroundG4Loop;
Gain twitterG;
Gain emailG;
Gain textG;
Gain phoneG;
Gain voiceG;

//NOTIFICATION VARIABLES
NotificationServer server;

Example example;//might change the name of this variable later or maybe not

String eventDataJSON1 = "ExampleData_1.json";
String eventDataJSON2 = "ExampleData_2.json";
String eventDataJSON3 = "ExampleData_3.json";

boolean streamLoaded;

ArrayList<Notification> one;
ArrayList<Notification> two;
ArrayList<Notification> three;
ArrayList<Notification> four;
ArrayList<Notification> all;

void setup()
{
  size(800, 400);
  
  notificationCounter = 0;
  
  one = new ArrayList();
  two = new ArrayList();
  three = new ArrayList();
  four = new ArrayList();
  all = new ArrayList();
  
  isGym = false;
  isWalking = false;
  isCoffee = false;
  isPresentation = false;
  isHeartbeatStart = false;
  isHeartbeatLoop = false;
  priority1 = false;
  isPriority1Loop = false;
  priority2 = false;
  isPriority2Loop = false;
  priority3 = false;
  isPriority3Loop = false;
  priority4 = false;
  isPriority4Loop = false;
  streamLoaded = false;
  systemIsNotifying = false;
  notificationAdded = false;
  playTweet = false;
  playEmail = false;
  playText = false;
  playPhone = false;
  playVoice = false;
  
  server = new NotificationServer();
  ttsMaker = new TextToSpeechMaker();
  
  example = new Example();
  server.addListener(example);
  
  //server.loadEventStream(eventDataJSON1);
  
  cp5 = new ControlP5(this);
  ac = new AudioContext();
  
  //Context buttons
  cp5.addButton("Gym", 1, 50, 100, 60, 40);
  gymSound = getSamplePlayer("gym_loop.wav");
  gymSound.pause(true);
  cp5.addButton("Walking", 1, 120, 100, 60, 40);
  walkingSound = getSamplePlayer("walking_loop.wav");
  walkingSound.pause(true);
  cp5.addButton("Coffee Shop", 1, 190, 100, 60, 40);
  coffeeSound = getSamplePlayer("coffee_shop_loop.wav");
  coffeeSound.pause(true);
  cp5.addButton("Presentation", 1, 260, 100, 60, 40);
  presentationSound = getSamplePlayer("presentation.wav");
  presentationSound.pause(true);
  //Context buttons
  
  //Heartbeat
  cp5.addToggle("Heartbeat", false, 330, 100, 60, 40);
  heartbeatStart = getSamplePlayer("heartbeat_intro.wav");
  heartbeatLoop = getSamplePlayer("heartbeat_loop.wav");
  heartbeatStart.pause(true);
  heartbeatLoop.pause(true);
  //Heartbeat
  
  //Notification Type buttons
  cp5.addToggle("Twitter", false, 50, 160, 60, 40);
  cp5.addToggle("Email", false, 120, 160, 60, 40);
  cp5.addToggle("Missed Call", false, 190, 160, 60, 40);
  cp5.addToggle("Text Message", false, 260, 160, 60, 40);
  cp5.addToggle("Voice Mail", false, 330, 160, 60, 40);
  //Notification Type buttons
  
  //Choose Event Stream buttons
  cp5.addButton("Events 1", 1, 50, 220, 60, 40);
  cp5.addButton("Events 2", 1, 120, 220, 60, 40);
  cp5.addButton("Events 3", 1, 190, 220, 60, 40);
  //Choose Event Stream buttons
  
  //Acknowledge notification buttons
  cp5.addToggle("Clear 1", false, 50, 280, 60, 40);
  cp5.addToggle("Clear 2", false, 120, 280, 60, 40);
  cp5.addToggle("Clear 3", false, 190, 280, 60, 40);
  cp5.addToggle("Clear 4", false, 260, 280, 60, 40);
  //Acknowledge notification buttons
  
  //Add background sounds
  priority1Intro = getSamplePlayer("priority_1_intro.wav");
  priority1Intro.pause(true);
  priority1Loop = getSamplePlayer("priority_1_loop.wav");
  priority1Loop.pause(true);
  priority2Intro = getSamplePlayer("priority_2_intro.wav");
  priority2Intro.pause(true);
  priority2Loop = getSamplePlayer("priority_2_loop.wav");
  priority2Loop.pause(true);
  priority3Loop = getSamplePlayer("priority_3_loop.wav");
  priority3Loop.pause(true);
  priority4Intro = getSamplePlayer("priority_4_intro.wav");
  priority4Intro.pause(true);
  priority4Loop = getSamplePlayer("priority_4_loop.wav");
  priority4Loop.pause(true);
  //Add background sounds
  
  //Add notification sounds
  twitterSound = getSamplePlayer("twitter_sound.wav");
  twitterSound.pause(true);
  emailSound = getSamplePlayer("email_sound.wav");
  emailSound.pause(true);
  textSound = getSamplePlayer("text_message_sound.wav");
  textSound.pause(true);
  phoneSound = getSamplePlayer("phone_call_sound.wav");
  phoneSound.pause(true);
  voiceSound = getSamplePlayer("voice_mail_sound.wav");
  voiceSound.pause(true);
  //Add notification sounds
  
  //Setup Glides for each group or individual sound
  contextGlide = new Glide(ac, 1.0, 50);
  heartbeatGlide = new Glide(ac, .2, 50);
  backgroundGlide1 = new Glide(ac, 0.0, 50);
  backgroundGlide1Loop = new Glide(ac, 0.0, 50);
  backgroundGlide2 = new Glide(ac, 0.0, 50);
  backgroundGlide2Loop = new Glide(ac, 0.0, 50);
  backgroundGlide3Loop = new Glide(ac, 0.0, 50);
  backgroundGlide4 = new Glide(ac, 0.0, 50);
  backgroundGlide4Loop = new Glide(ac, 0.0, 50);
  twitterGlide = new Glide(ac, 1.0, 50);
  emailGlide = new Glide(ac, 1.0, 50);
  textGlide = new Glide(ac, 1.0, 50);
  phoneGlide = new Glide(ac, 1.0, 50);
  voiceGlide = new Glide(ac, 1.0, 50);
  //Setup Glides for each group or individual sound
  
  //Setup Gains for each group or individual sound
  contextG = new Gain(ac, 1, contextGlide);
  heartbeatG = new Gain(ac, 1, heartbeatGlide);
  backgroundG1 = new Gain(ac, 1, backgroundGlide1);
  backgroundG1Loop = new Gain(ac, 1, backgroundGlide1Loop);
  backgroundG2 = new Gain(ac, 1, backgroundGlide2);
  backgroundG2Loop = new Gain(ac, 1, backgroundGlide2Loop);
  backgroundG3Loop = new Gain(ac, 1, backgroundGlide3Loop);
  backgroundG4 = new Gain(ac, 1, backgroundGlide4);
  backgroundG4Loop = new Gain(ac, 1, backgroundGlide4Loop);
  twitterG = new Gain(ac, 1, twitterGlide);
  emailG = new Gain(ac, 1, emailGlide);
  textG = new Gain(ac, 1, textGlide);
  phoneG = new Gain(ac, 1, phoneGlide);
  voiceG = new Gain(ac, 1, voiceG);
  //Setup Gains for each group or individual sound
  
  //Add each sound to its gain
  contextG.addInput(gymSound);
  contextG.addInput(walkingSound);
  contextG.addInput(coffeeSound);
  contextG.addInput(presentationSound);
  heartbeatG.addInput(heartbeatStart);
  heartbeatG.addInput(heartbeatLoop);
  backgroundG1.addInput(priority1Intro);
  backgroundG1Loop.addInput(priority1Loop);
  backgroundG2.addInput(priority2Intro);
  backgroundG2Loop.addInput(priority2Loop);
  backgroundG3Loop.addInput(priority3Loop);
  backgroundG4.addInput(priority4Intro);
  backgroundG4Loop.addInput(priority4Loop);
  twitterG.addInput(twitterSound);
  emailG.addInput(emailSound);
  textG.addInput(textSound);
  phoneG.addInput(phoneSound);
  voiceG.addInput(voiceSound);
  //Add each sound to it's gain
  
  //Add each gain to the Audio Context
  ac.out.addInput(contextG);
  ac.out.addInput(heartbeatG);
  ac.out.addInput(backgroundG1);
  ac.out.addInput(backgroundG1Loop);
  ac.out.addInput(backgroundG2);
  ac.out.addInput(backgroundG2Loop);
  ac.out.addInput(backgroundG3Loop);
  ac.out.addInput(backgroundG4);
  ac.out.addInput(backgroundG4Loop);
  ac.out.addInput(twitterG);
  ac.out.addInput(emailG);
  ac.out.addInput(textG);
  ac.out.addInput(phoneG);
  ac.out.addInput(voiceG);
  //Add each gain to the Audio Context
  
  //Start the Audio Context
  ac.start();
}

void draw()
{
  //println(notificationAdded + "!!!!!!!!!!!!!!!");
  if(streamLoaded == true && notificationAdded == true)
  {
    //print(notificationCounter + "!!!!!!!!!!!!!!!!!!");
    if(all.get(notificationCounter).getType().toString() == "Tweet")
    {
      if(isGym == true) {twitterGlide.setValue(1.0);}
      if(isWalking == true) {twitterGlide.setValue(1.0);}
      if(isCoffee == true) {twitterGlide.setValue(.4);}
      if(isPresentation == true) {twitterGlide.setValue(.1);}
      if(playTweet == false) {twitterGlide.setValue(0.0);}
      twitterSound.setToLoopStart();
      twitterSound.start();
      notificationCounter++;
      notificationAdded = false;
      twitterSound.reset();
    }
    else if(all.get(notificationCounter).getType().toString() == "Email")
    {
      if(isGym == true) {emailGlide.setValue(1.0);}
      if(isWalking == true) {emailGlide.setValue(1.0);}
      if(isCoffee == true) {emailGlide.setValue(.4);}
      if(isPresentation == true) {emailGlide.setValue(.1);}
      if(playEmail == false) {emailGlide.setValue(0.0);}
      emailSound.setToLoopStart();
      emailSound.start();
      notificationCounter++;
      notificationAdded = false;
      emailSound.reset();
    }
    else if(all.get(notificationCounter).getType().toString() == "TextMessage")
    {
      if(isGym == true) {textGlide.setValue(1.0);}
      if(isWalking == true) {textGlide.setValue(1.0);}
      if(isCoffee == true) {textGlide.setValue(.4);}
      if(isPresentation == true) {textGlide.setValue(.1);}
      if(playText == false) {textGlide.setValue(0.0);}
      textSound.setToLoopStart();
      textSound.start();
      notificationCounter++;
      notificationAdded = false;
      textSound.reset();
    }
    else if(all.get(notificationCounter).getType().toString() == "MissedCall")
    {
      if(isGym == true) {phoneGlide.setValue(1.0);}
      if(isWalking == true) {phoneGlide.setValue(1.0);}
      if(isCoffee == true) {phoneGlide.setValue(.4);}
      if(isPresentation == true) {phoneGlide.setValue(.1);}
      if(playPhone == false) {phoneGlide.setValue(0.0);}
      phoneSound.setToLoopStart();
      phoneSound.start();
      notificationCounter++;
      notificationAdded = false;
      phoneSound.reset();
    }
    else if(all.get(notificationCounter).getType().toString() == "VoiceMail")
    {
      if(isGym == true) {voiceGlide.setValue(1.0);}
      if(isWalking == true) {voiceGlide.setValue(1.0);}
      if(isCoffee == true) {voiceGlide.setValue(.4);}
      if(isPresentation == true) {voiceGlide.setValue(.1);}
      if(playVoice == false) {voiceGlide.setValue(0.0);}
      voiceSound.setToLoopStart();
      voiceSound.start();
      notificationCounter++;
      notificationAdded = false;
      voiceSound.reset();
    }
    //notificationCounter++;
    //notificationAdded = false;
    //if(all.get(notificationCounter) != null)
    //{
    //  print("WE GOT NOTIFICATION NUMBER " + notificationCounter + "!!!!!!");
    //  notificationCounter++;
    //}
  }
  
  //priority4Loop.setToEnd();
  //print(priority4Loop.getPosition() + "!!!!!!!!!!");
  if(gymSound.getPosition() >= 172999.3125 && isGym == true)
  {
    gymSound.reset();
  }
  if(walkingSound.getPosition() >= 206025.234375 && isWalking == true)
  {
    walkingSound.reset();
  }
  if(coffeeSound.getPosition() >= 184990.296875 && isCoffee == true)
  {
    coffeeSound.reset();
  }
  if(presentationSound.getPosition() >= 442850.3125 && isPresentation == true)
  {
    presentationSound.reset();
  }
  if(heartbeatStart.getPosition() >= 29012.857421875 && isHeartbeatStart == true)
  {
    heartbeatLoop.start();
    isHeartbeatStart = false;
    heartbeatStart.setToEnd();
    
  }
  if(heartbeatLoop.getPosition() >= 119763.5078125 && isHeartbeatLoop == true)
  {
    heartbeatLoop.reset();
  }
  if(priority1 == true && priority2 == false && priority3 == false && priority4 == false && isPriority1Loop == false)
  {
    isPriority1Loop = true;
    if(isGym == true) {backgroundGlide1Loop.setValue(1.0);}
    else if(isWalking == true) {backgroundGlide1Loop.setValue(.3);}
    else if(isCoffee == true) {backgroundGlide1Loop.setValue(.1);}
    else if(isPresentation == true) {backgroundGlide1Loop.setValue(0.0);}
    else backgroundGlide1Loop.setValue(1.0);
    heartbeatGlide.setValue(0.0);
    priority1Loop.setToLoopStart();
    priority1Loop.start();
  }
  if(priority1Loop.getPosition() >= 58654.26171875 && isPriority1Loop == true)
  {
    priority1Loop.reset();
  }
  if(priority2 == true && priority3 == false && priority4 == false && isPriority2Loop == false)
  {
    isPriority2Loop = true;
    backgroundGlide1Loop.setValue(0.0);
    if(isGym == true) {backgroundGlide2Loop.setValue(1.0);}
    else if(isWalking == true) {backgroundGlide2Loop.setValue(.3);}
    else if(isCoffee == true) {backgroundGlide2Loop.setValue(.1);}
    else if(isPresentation == true) {backgroundGlide2Loop.setValue(0.0);}
    else backgroundGlide2Loop.setValue(1.0);
    heartbeatGlide.setValue(0.0);
    priority2Loop.setToLoopStart();
    priority2Loop.start();
  }
  if(priority2Loop.getPosition() >= 68653.3984375 && priority2 == true)
  {
    priority2Loop.reset();
  }
  if(priority3 == true && priority4 == false && isPriority3Loop == false)
  {
    isPriority3Loop = true;
    backgroundGlide1Loop.setValue(0.0);
    backgroundGlide2Loop.setValue(0.0);
    if(isGym == true) {backgroundGlide3Loop.setValue(1.5);}
    else if(isWalking == true) {backgroundGlide3Loop.setValue(.5);}
    else if(isCoffee == true) {backgroundGlide3Loop.setValue(.3);}
    else if(isPresentation == true) {backgroundGlide3Loop.setValue(0.0);}
    else backgroundGlide3Loop.setValue(1.0);
    heartbeatGlide.setValue(0.0);
    priority3Loop.setToLoopStart();
    priority3Loop.start();
  }
  if(priority3Loop.getPosition() >= 113001.859375 && priority3 == true)
  {
    priority3Loop.reset();
  }
  if(priority4 == true && isPriority4Loop == false)
  {
    isPriority4Loop = true;
    backgroundGlide1Loop.setValue(0.0);
    backgroundGlide2Loop.setValue(0.0);
    backgroundGlide3Loop.setValue(0.0);
    if(isGym == true) {backgroundGlide4Loop.setValue(2.0);}
    else if(isWalking == true) {backgroundGlide4Loop.setValue(1.0);}
    else if(isCoffee == true) {backgroundGlide4Loop.setValue(2.0);}
    else if(isPresentation == true) {backgroundGlide4Loop.setValue(0.3);}
    else backgroundGlide4Loop.setValue(1.0);
    heartbeatGlide.setValue(0.0);
    priority4Loop.setToLoopStart();
    priority4Loop.start();
  }
  if(priority4Loop.getPosition() >= 101117.640625 && priority4 == true)
  {
    priority4Loop.reset();
  }
}

void controlEvent(ControlEvent theEvent)
{
  if(theEvent.isController())
  {
    if(theEvent.controller().getName() == "Gym" ||
       theEvent.controller().getName() == "Walking" ||
       theEvent.controller().getName() == "Coffee Shop" ||
       theEvent.controller().getName() == "Presentation")
    {
       isGym = false;
       isWalking = false;
       isCoffee = false;
       isPresentation = false;
    }
    if(theEvent.controller().getName() == "Gym")
    {
      isGym = true;
      walkingSound.setToEnd();
      coffeeSound.setToEnd();
      presentationSound.setToEnd();
      gymSound.setToLoopStart();
      gymSound.start();      
    }
    if(theEvent.controller().getName() == "Walking")
    {
      isWalking = true;
      gymSound.setToEnd();
      coffeeSound.setToEnd();
      presentationSound.setToEnd();
      walkingSound.setToLoopStart();
      walkingSound.start();
    }
    if(theEvent.controller().getName() == "Coffee Shop")
    {
      isCoffee = true;
      gymSound.setToEnd();
      walkingSound.setToEnd();
      presentationSound.setToEnd();
      coffeeSound.setToLoopStart();
      coffeeSound.start();
    }
    if(theEvent.controller().getName() == "Presentation")
    {
      isPresentation = true;
      gymSound.setToEnd();
      walkingSound.setToEnd();
      coffeeSound.setToEnd();
      presentationSound.setToLoopStart();
      presentationSound.start();
    }
    if(theEvent.controller().getName() == "Heartbeat")
    {
      if(theEvent.controller().getValue() == 1)
      {
        isHeartbeatStart = true;
        heartbeatStart.setPosition(0);
        heartbeatLoop.setToLoopStart();
        heartbeatStart.start();
      }
      else if(theEvent.controller().getValue() == 0)
      {
        isHeartbeatStart = false;
        isHeartbeatLoop = false;
        heartbeatStart.setToEnd();
        heartbeatLoop.setToEnd();
      }
    }
    if(theEvent.controller().getName() == "Twitter")
    {
      if(theEvent.controller().getValue() == 1)
      {
        playTweet = true;
      }
      else if(theEvent.controller().getValue() == 0)
      {
        playTweet = false;
      }
    }
    if(theEvent.controller().getName() == "Email")
    {
      if(theEvent.controller().getValue() == 1)
      {
        playEmail = true;
      }
      else if(theEvent.controller().getValue() == 0)
      {
        playEmail = false;
      }
    }
    if(theEvent.controller().getName() == "Text Message")
    {
      if(theEvent.controller().getValue() == 1)
      {
        playText = true;
      }
      else if(theEvent.controller().getValue() == 0)
      {
        playText = false;
      }
    }
    if(theEvent.controller().getName() == "Missed Call")
    {
      if(theEvent.controller().getValue() == 1)
      {
        playPhone = true;
      }
      else if(theEvent.controller().getValue() == 0)
      {
        playPhone = false;
      }
    }
    if(theEvent.controller().getName() == "Voice Mail")
    {
      if(theEvent.controller().getValue() == 1)
      {
        playVoice = true;
      }
      else if(theEvent.controller().getValue() == 0)
      {
        playVoice = false;
      }
    }
    if(theEvent.controller().getName() == "Events 1")
    {
      server.stopEventStream();
      server.loadEventStream(eventDataJSON1);
    }
    if(theEvent.controller().getName() == "Events 2")
    {
      server.stopEventStream();
      server.loadEventStream(eventDataJSON2);
    }
    if(theEvent.controller().getName() == "Events 3")
    {
      server.stopEventStream();
      server.loadEventStream(eventDataJSON3);
    }
    if(theEvent.controller().getName() == "Clear 1" ||
       theEvent.controller().getName() == "Clear 2" ||
       theEvent.controller().getName() == "Clear 3" ||
       theEvent.controller().getName() == "Clear 4") 
    {      
      if(theEvent.controller().getName() == "Clear 1")
      {
        if(theEvent.controller().getValue() == 1)
        {
          hbg = heartbeatGlide.getValue();
          bg1 = backgroundGlide1Loop.getValue();
          bg2 = backgroundGlide2Loop.getValue();
          bg3 = backgroundGlide3Loop.getValue();
          bg4 = backgroundGlide4Loop.getValue();
          tg = twitterGlide.getValue();
          eg = emailGlide.getValue();
          txtg = textGlide.getValue();
          pg = phoneGlide.getValue();
          vg = voiceGlide.getValue();
      
          heartbeatGlide.setValue(0.0);
          backgroundGlide1Loop.setValue(0.0);
          backgroundGlide2Loop.setValue(0.0);
          backgroundGlide3Loop.setValue(0.0);
          backgroundGlide4Loop.setValue(0.0);
          twitterGlide.setValue(0.0);
          emailGlide.setValue(0.0);
          textGlide.setValue(0.0);
          phoneGlide.setValue(0.0);
          voiceGlide.setValue(0.0);          
           for(int i = 0; i < one.size(); i++)
           {
              ttsExamplePlayback(one.get(i).getType().toString() + "from " + one.get(i).getSender() + one.get(i).getMessage());
              delay(3500);
           }
           one.clear();
           priority1 = false;
        }
        else if(theEvent.controller().getValue() == 0)
        {
          heartbeatGlide.setValue(hbg);
          backgroundGlide1Loop.setValue(bg1);
          backgroundGlide2Loop.setValue(bg2);
          backgroundGlide3Loop.setValue(bg3);
          backgroundGlide4Loop.setValue(bg4);
          twitterGlide.setValue(tg);
          emailGlide.setValue(eg);
          textGlide.setValue(txtg);
          phoneGlide.setValue(pg);
          voiceGlide.setValue(vg);
        }
      }
      if(theEvent.controller().getName() == "Clear 2")
      {      
        if(theEvent.controller().getValue() == 1)
        {
          hbg = heartbeatGlide.getValue();
          bg1 = backgroundGlide1Loop.getValue();
          bg2 = backgroundGlide2Loop.getValue();
          bg3 = backgroundGlide3Loop.getValue();
          bg4 = backgroundGlide4Loop.getValue();
          tg = twitterGlide.getValue();
          eg = emailGlide.getValue();
          txtg = textGlide.getValue();
          pg = phoneGlide.getValue();
          vg = voiceGlide.getValue();
      
          heartbeatGlide.setValue(0.0);
          backgroundGlide1Loop.setValue(0.0);
          backgroundGlide2Loop.setValue(0.0);
          backgroundGlide3Loop.setValue(0.0);
          backgroundGlide4Loop.setValue(0.0);
          twitterGlide.setValue(0.0);
          emailGlide.setValue(0.0);
          textGlide.setValue(0.0);
          phoneGlide.setValue(0.0);
          voiceGlide.setValue(0.0);
           for(int i = 0; i < two.size(); i++)
           {
              ttsExamplePlayback(two.get(i).getType().toString() + "from " + two.get(i).getSender() + two.get(i).getMessage());
              delay(3500);
           }
           two.clear();
           priority2 = false;
        }
        else if(theEvent.controller().getValue() == 0)
        {
          heartbeatGlide.setValue(hbg);
          backgroundGlide1Loop.setValue(bg1);
          backgroundGlide2Loop.setValue(bg2);
          backgroundGlide3Loop.setValue(bg3);
          backgroundGlide4Loop.setValue(bg4);
          twitterGlide.setValue(tg);
          emailGlide.setValue(eg);
          textGlide.setValue(txtg);
          phoneGlide.setValue(pg);
          voiceGlide.setValue(vg);
        }
      }
      if(theEvent.controller().getName() == "Clear 3")
      {
        if(theEvent.controller().getValue() == 1)
        {
          hbg = heartbeatGlide.getValue();
          bg1 = backgroundGlide1Loop.getValue();
          bg2 = backgroundGlide2Loop.getValue();
          bg3 = backgroundGlide3Loop.getValue();
          bg4 = backgroundGlide4Loop.getValue();
          tg = twitterGlide.getValue();
          eg = emailGlide.getValue();
          txtg = textGlide.getValue();
          pg = phoneGlide.getValue();
          vg = voiceGlide.getValue();
      
          heartbeatGlide.setValue(0.0);
          backgroundGlide1Loop.setValue(0.0);
          backgroundGlide2Loop.setValue(0.0);
          backgroundGlide3Loop.setValue(0.0);
          backgroundGlide4Loop.setValue(0.0);
          twitterGlide.setValue(0.0);
          emailGlide.setValue(0.0);
          textGlide.setValue(0.0);
          phoneGlide.setValue(0.0);
          voiceGlide.setValue(0.0);          
           for(int i = 0; i < three.size(); i++)
           {
              ttsExamplePlayback(three.get(i).getType().toString() + "from " + three.get(i).getSender() + three.get(i).getMessage());
              delay(3500);
           }
           three.clear();
           priority3 = false;
        }
        else if(theEvent.controller().getValue() == 0)
        {
          heartbeatGlide.setValue(hbg);
          backgroundGlide1Loop.setValue(bg1);
          backgroundGlide2Loop.setValue(bg2);
          backgroundGlide3Loop.setValue(bg3);
          backgroundGlide4Loop.setValue(bg4);
          twitterGlide.setValue(tg);
          emailGlide.setValue(eg);
          textGlide.setValue(txtg);
          phoneGlide.setValue(pg);
          voiceGlide.setValue(vg);
        }
      }
      if(theEvent.controller().getName() == "Clear 4")
      {
        if(theEvent.controller().getValue() == 1)
        {
          hbg = heartbeatGlide.getValue();
          bg1 = backgroundGlide1Loop.getValue();
          bg2 = backgroundGlide2Loop.getValue();
          bg3 = backgroundGlide3Loop.getValue();
          bg4 = backgroundGlide4Loop.getValue();
          tg = twitterGlide.getValue();
          eg = emailGlide.getValue();
          txtg = textGlide.getValue();
          pg = phoneGlide.getValue();
          vg = voiceGlide.getValue();
      
          heartbeatGlide.setValue(0.0);
          backgroundGlide1Loop.setValue(0.0);
          backgroundGlide2Loop.setValue(0.0);
          backgroundGlide3Loop.setValue(0.0);
          backgroundGlide4Loop.setValue(0.0);
          twitterGlide.setValue(0.0);
          emailGlide.setValue(0.0);
          textGlide.setValue(0.0);
          phoneGlide.setValue(0.0);
          voiceGlide.setValue(0.0);
          for(int i = 0; i < four.size(); i++)
          {
            ttsExamplePlayback(four.get(i).getType().toString() + "from " + four.get(i).getSender() + four.get(i).getMessage());
            delay(3500);
          }
          four.clear();
          priority4 = false;
        }
        else if(theEvent.controller().getValue() == 0)
        {
          heartbeatGlide.setValue(hbg);
          backgroundGlide1Loop.setValue(bg1);
          backgroundGlide2Loop.setValue(bg2);
          backgroundGlide3Loop.setValue(bg3);
          backgroundGlide4Loop.setValue(bg4);
          twitterGlide.setValue(tg);
          emailGlide.setValue(eg);
          textGlide.setValue(txtg);
          phoneGlide.setValue(pg);
          voiceGlide.setValue(vg);
        }
      }
      
      /*heartbeatGlide.setValue(hbg);
      backgroundGlide1Loop.setValue(bg1);
      backgroundGlide2Loop.setValue(bg2);
      backgroundGlide3Loop.setValue(bg3);
      backgroundGlide4Loop.setValue(bg4);
      twitterGlide.setValue(tg);
      emailGlide.setValue(eg);
      textGlide.setValue(txtg);
      phoneGlide.setValue(pg);
      voiceGlide.setValue(vg);*/
      
    }
  }
}

void ttsExamplePlayback(String inputSpeech) {
  //create TTS file and play it back immediately
  //the SamplePlayer will remove itself when it is finished in this case
  
  String ttsFilePath = ttsMaker.createTTSWavFile(inputSpeech);
  println("File created at " + ttsFilePath);
  
  //createTTSWavFile makes a new WAV file of name ttsX.wav, where X is a unique integer
  //it returns the path relative to the sketch's data directory to the wav file
  
  //see helper_functions.pde for actual loading of the WAV file into a SamplePlayer
  
  SamplePlayer sp = getSamplePlayer(ttsFilePath, true); 
  //true means it will delete itself when it is finished playing
  //you may or may not want this behavior!
  
  ac.out.addInput(sp);
  sp.setToLoopStart();
  sp.start();
  println("TTS: " + inputSpeech);
}

class Example implements NotificationListener {
  
  public Example() {
    //setup here
  }
  
  //this method must be implemented to receive notifications
  public void notificationReceived(Notification notification) { 
    println("<Example> " + notification.getType().toString() + " notification received at " 
    + Integer.toString(notification.getTimestamp()) + "millis.");
    
    all.add(notification);//put the notification in the first array, with all notifications
    
    String debugOutput = "";
    switch (notification.getPriorityLevel())//(notification.getType()) {
    {
      case 1:
        one.add(notification); //put the notification in the second array, with same priority notifications
        priority1 = true;
        break;
      case 2:
        two.add(notification);
        priority2 = true;
        break;
      case 3:
        three.add(notification);
        priority3 = true;
        break;
      case 4:
        four.add(notification);
        priority4 = true;
        break;
        
      /*case Tweet:
        debugOutput += "New tweet from ";
        break;
      case Email:
        debugOutput += "New email from ";
        break;
      case VoiceMail:
        debugOutput += "New voicemail from ";
        break;
      case MissedCall:
        debugOutput += "Missed call from ";
        break;
      case TextMessage:
        debugOutput += "New message from ";
        break;*/
    
    }
    debugOutput += notification.getSender() + ", " + notification.getMessage();
    
    streamLoaded = true;
    notificationAdded = true;
    //debugging code
    //end debugging code
    
    println(debugOutput);
    
   //You can experiment with the timing by altering the timestamp values (in ms) in the exampleData.json file
    //(located in the data directory)
  }
}