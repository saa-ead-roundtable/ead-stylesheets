Handling for Linking Elements
=============================

* Author: Michele Combs, mrrothen@syr.edu
* Release date: March 25, 2011

This chunk of XSL provides basic handling of linking elements `ref`, `extref`, `archref`, `dao` and `ptr` by converting them into HTML links. Links are output in the usual HTML format using `<a href=" ">`. `extref` and `archref` check for `@show='new'` to see if they should open in a new window (`target="_blank"`). `extptr` checks for `@show='embed'` to see if the referenced image should be linked to (`<a href=" ">`) or displayed within the document (`<img src=" ">`). `dao` checks for whether there are multiple DAOs and if so places a line break between them. The default for DAO is the words "Digital object" which can of course be changed to other text or to an icon as desired.

Note: `This basic code does not handle href strings that contain an ampersand.