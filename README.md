# ChatExample

ChatExample is iOS project adaptation for [figma design](https://www.figma.com/community/file/837004516127885517/) .

## Prerequisites

Before you begin, ensure you have met the following requirements:
* macOS
* Xcode

## Run OpenVPN Client - iOS

Open "ChatExample.xcodeproj".

### Run application in simulator
Select simulator from the top of the list and run the application(⌘R). You’ll see Xcode install the app and then attach the debugger in simulator. The application should pop up on simulator..

### Run application in iPhone
Plug your iPhone into your computer. You can select your device from the top of the list.


Unlock your device and run the application(⌘R). You’ll see Xcode install the app and then attach the debugger. The application should pop up on your phone.

### Troubleshooting Common Errors

##### 1. “Signing Requires a Development Team”

Xcode requires that you’ve connected a Team to your project in order to run the simulator on a device. You can do this from the “General” tab of your Project Settings. As of Xcode 7 this can be any Apple ID.

Open the Team menu that currently says “None” and select your team. If you don’t have a team, select “Add an Account…” and create one with your Apple ID.

##### 2. Xcode claims your device is locked when it isn’t

Try following steps:

* Unplug your iPhone
* Reset Location & Privacy on your iPhone. Found under Settings >> General >> Reset
* Plug in your iPhone
* Hit Trust when prompted to Trust This Computer

##### 3. “iPhone is Busy”

Try following steps:

* Unplug your device
* Restart both Xcode and your iPhone
* Plug in your device

## Contact

If you want to [contact us](https://piri.ai/contact-us/) you can reach us at info@piri.ai.


