# nodot-portals

![](screenshot.png)

This is a simple portal demo for Godot 4.1.1. It simply follows [this youtube tutorial](https://www.youtube.com/watch?v=oqDdIg3BRlg) by [Nobody](https://www.youtube.com/@whosnobody) which is a compounded version of [this tutorial](https://www.youtube.com/watch?v=R1e9sJo7-x0).

It uses the [Nodot](https://github.com/NodotProject/nodot) first person character controller.

## How to use

- Clone this repo
- Open the project in Godot 4.1.1
- Press F5 to run the project
- Walk through the portal!


## Gotchas

- Looks good walking forwards, not so much walking backwards. This is because while inside the portal, it shows the outside of the portal. Not sure how to fix this.
- The portal will show up in front of any mesh that doesn't show on layer 5. Not sure how to work around this either.