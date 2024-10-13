# greensheart_test

A Flutter application for GreenSHeart internship coding test

## Getting Started

The Flutter application was built and tested on a Windows machine, but the application should
be able to run smoothly on any platform that Flutter can build to.

## Design Choices
The application mainly revolves around a backend logic for managing the medications and user 
credentials, and a frontend interface for the users to interact with. Therefore the source 
code was split into two directory: `backend` and `ui` to categorize the respective tasks. 

For the UI, the login screen and home screen have their own directory just in case they have 
extra dependencies that only they themselves needed to make the UI directory less cluttered,
as the prime example in this case would be the medication UI as the medication related UI
has the editing dialog, addition dialog, medication grid list, search bar ui elements, which 
if were to be placed in the `ui` directory will cause cluttering. 

For the addition and editing dialog, there is a prefab named dialog for a general dialog to
show a given medication information for editing or an empty dialog for a new medication.
The search bar too has a prefab for it for the search to be modular and able to be used any 
where that needs it without having to write redundant code.

For the medication backend, there is the medication manager that manages a list of medications
from the base medication class, so it is responsible for adding, removing, and updating the
medication list. Given the responsibility, I made the manager class a singleton and static, so
there will only be one instance throughout the application lifetime and is accessible anywhere.
The same goes to the authentication manager and utility class which are singletons for the
same reason.

The observer pattern is used here for the medication grid UI to be able to update the shown
medications whenever the medication manager has changes applied to. The publisher in this case
is the medication manager singleton that uses the ChangeNotifier mixin provided by Flutter,
to notify the card grid ui that has a ListenableBuilder also provided by Flutter that will
subscribe itself to a given ChangeNotifier, which is our medication manager which will 
invoke the notifyListeners function to initiate the card grid rebuild. This can reduce
the rebuild of the ui to the medication card grid instead of the entire application. This can
also be used in the future to be able to listen for specific changes like on medication 
update to maybe update a timer for an alarm.