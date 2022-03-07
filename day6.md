# Day 6: Editing with Vim

When I started learning Linux, I took a short course on Vim, from Linux Academy. Back when I was just starting, Vim looked exciting and daunting. I wanted to learn it!

Then I started using nano, and it was enough for the simple things I'd been doing. I gave up Vim. My thought was exactly what it says in the lesson: **isn't nano enough for our daily admin tasks?**

Let's dive into Vim!

## Basic commands

I took the **Vimtutor** tutorial that comes with Vim. It's very helpful and it teaches the necessary, the essential commands you'll need to move around and accomplish things in Vim.

I thought then to base the contents of this lesson on the Vimtutor exercises.

### Opening, quitting and saving

To open Vim, we simply type `vim` followed by a file name. If the file doesn't exist, Vim will create it. I created a file named *tutor*, following the Vimtutor instructions.

`vim tutor`

There are two working modes in Vim: **normal mode** and **insert mode**. To go to insert mode, press `i`. To go back to normal mode from insert mode, press the `esc` key. Insert mode allows you to enter text, while the normal mode is the one you use to navigate around, and to perform actions using Vim commands. We can't enter any text while in normal mode.

To exit Vim without saving any changes made, type this while in normal mode: `:q!`
To exit Vim and save the changes made, type this: `!wq`

### Navigation and some basic editing

| Key | Action |
| ------ | ------ |
| h | Move cursor left |
| j | Move cursor down |
| k | Move cursor up |
| l | Move cursor right |
| 0 | Move to the beginning of the current line |
| H | Jump to the top of the screen |
| M | Jump to the middle of the screen |
| L | Jump to the bottom of the screen |
| gg | Move to the first line of the file |
| G | Move to the last line of the file |
| x | Delete the character to the right of the cursor |
| i | Switch to Insert mode. Text will be inserted *before* the cursor |
| A | Append text. Text will be appended to the end of the line where the cursor is at. |
| dw | Delete the word after the cursor |
| d$ | Delete to the end of the line, from where the cursor is currently at. |
| dd | Delete the entire line |
| u | Undo the previous action |
| p | Paste a character or word previously deleted |
| r | Replace a character after the cursor with the one indicated (`rt` replaces the letter after the cursor with the letter `t`) |
| ce | Change until the end of a word |

There's much more to Vim. This is just the beginning. I finished the **Vimtutor** but not all the commands I learned are here in this lesson.

I'll keep updating this!