# eth-address-icon

Generates a cool unique ethereum account address icon.

## What it is

This is a little tool to create a really nice and cool icon for any ethereum account address.

It is very important to notice the icon art is very unique therefore each address will generate a completely different art.

Icons can be used to personalize the ethereum presence online and give the fun fact feeling.

## How it works

The icon is generated in a 16 by 16 image canvas, which are represented on the cartesian by points from 0 to f (hexadecimal).

The account address is normalized and the `x` in `0x` is converted to `0`, so all strings are going to start with `00`.

Now we have a 42 chars long string composed by numbers and letters from `a`  to `f` (hexa) and starting by `00`.

We fold the 42 chars string into 7 strings of 6 chars each, which are the hexadecimal representation of the colors used in the art.

To determine the drawing location of each color, all 6 chars long strings are fold into 3 string of 2 chars each representing the pair X and Y point in the canvas.

Finally we fold each of the 2 char long strings into 2 strings of a single char each where one represent the X and the other the Y in the canvas.

Using all those points, many straight lines are laid while the canvas rotates in 90 degres steps, creating a magnific pattern unique per address.

## How to use it

### Original Bash Script (with ImageMagick)

To call the original script written in bash you need to have `convert` tool from imagemagick installed, I used ImageMagick 6.9.7-4.

Call the string by passing the account address as first argument.

The final icon will be written inside the icons directory created in the same dir where the script is run.

```shell
./icon.sh 0xd1498f1c4aaafcd1eaa1b6e3594a37c7fd7d0909
```

### Online HTML5 Canvas

You can call the [live demo](http://highlinux.com/eth-address-icon/?address=0xd1498f1c4aaafcd1eaa1b6e3594a37c7fd7d0909) or use your own private version of the index.html.

Pass a get parameter named `address` to the index

```shell
index.html?address=0xd1498f1c4aaafcd1eaa1b6e3594a37c7fd7d0909
```
