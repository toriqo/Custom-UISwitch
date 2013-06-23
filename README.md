Custom UISwitch
===============


Allows you to add a custom skinned UISwitch for which you can use two images for each state:
One background image + one nob image for the "OFF" steate and one background image + one nob image for the "ON" state.

The class simply uses four views:

  - One view to contain them all (pun intended) :)
  - One view for the "ON" background
  - One view for the "OFF" background
  - One view for the nob

To use it, simply include FLACustomSwitch.h and FLACustomSwitch.m in your project and simply init the switch with:

    [[FLACustomSwitch alloc] initWithFrame:CGRect];

Also, the switch works being syncronized with NSUserDefaults and NSUbiquitousKeyValueStore. A settings bundle is included
to reflect that (once you launch this sample app, go to your device's Settings > UISwitch and change it - it'll reflect in
the custom switch as well).

Any feedback is welcome!
