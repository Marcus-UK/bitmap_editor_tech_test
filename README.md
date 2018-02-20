# Bitmap Editor tech test

This is an attempt at the Bitmap Editor tech test. In order to complete the
challenge, I have utilised a BDD pattern. As such, I have broken the challenge
down in to a number of user stories that can be seen below.

#User stories

```

As a user,
So that I can pass instructions to the editor,
I want to be able to read a text file of instructions.

As a user,
So that the editor can understand the instructions,
I want to be able to convert text instructions into arrays.

As a user,
So that I can create a bitmap image,
I want to be able to specify a grid size with length and width.

As a user,
So that I can undo any changes to the bitmap,
I want to be able to clear the image and return it to it's original state.

As a user,
So that I can change the colour of individual pixels,
I want to be able to specify a colour and the location that I want to update.

As a user,
So that I can draw vertical lines on the bitmap,
I want to be able to choose a vertical range of of pixels to update.

As a user,
So that I can draw horizontal lines on the bitmap,
I want to be able to choose a horizontal range of pixels to update.

As a user,
So that I can assess the current state of the bitmap,
I want to be able to print the image to my screen.

```

# How to use

To run this application, follow these commands:

```
$ Clone this repo into a local directory.
$ Navigate to the project and run 'bundle' to install dependencies.
$ in the root directory of the application, rub 'bin/bitmap_editor examples/show.txt'.
```

To run the tests:

```
$ in the root directory of the application, run 'rspec'.
```

# Supported commands

The following commands are currently supported in this application:

- I N M - Create a new M x N image with all pixels coloured white (O).
- C - Clears the table, setting all pixels to white (O).
- L X Y C - Colours the pixel (X,Y) with colour C.
- V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- S - Show the contents of the current image


# Technologies used

- Ruby
- Rspec

# My approach

In order to complete this tech test, I've followed a BDD pattern. As
such, I began by outlining the requirements of the software with a series of
user stories. Each of these relate to a particular feature within the program.
Once I had defined the requirements, each feature was built using a strict TDD
process. The result is that the software meets the requirements of the test.

Throughout the program, I have tried to include clear and explicit error
reporting. As such, invalid commands should raise helpful error messages.
