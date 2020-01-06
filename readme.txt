V 1.0
known issues - sometimes trashing misses items, need to figure out if it's AHK or NGU

Welcome to the NGU Idle sorter by theradman
notes about how to use the sorter can be found in the .ahk file as well as controls, if you can't acces that then here they are just incase.
PLEASE NOTE YOU NEED AUTOHOTKEY OR AUTOHOTKEY PORTABLE TO USE THIS SCRIPT!
Controls:
f1 : reload script if it hangs or won't start
f2 : begin looping, run a sort and if enabled loop for configured amount of loops
f3 : perform single sort
f4 : Perform single deletion, the only other way to trigger this is during loops with configuration.
f12 : Exit the app

Also note that due to me not being that far yet it doesn't support more than 2 accessories,
or inventories bigger than page 1.
By default you can have the head, chest, leg, pants, weapon, accessories 1-2 and the first two
inventory slots (topleft going right) be set individually to on/off for combining and boosting.
There will be a guide to how to add your own custom boost/combine spaces, that will be in the readme.
There is also an auto trash feature that will delete all the inventory items, except any exempted ones,
again starting from topleft going right you can set how many slots to skip. This can be useful for if a
piece of armor reaches LVL 100 overnight to keep the system from stopping.
Settings as well as an explanation of what they do will be below
Also any feedback would be appreciated.

Now onto that part about adding customer merge/boost cells. It's simple really if you can get the coordinates just get this template:
; Template Coordinates and enable/disable
TemplateX = 0
TemplateY = 0
TemplateMerge = 0
TemplateBoost = 0
put your coordinates in X and Y and replace template with whatever you want that inventory slot called.
Then set merge and boost to 1 if you want to use it for that and paste your custom section into the appropriate settings or just in a heap at the top it doesn't really matter.
Next we're going to setup the actual action of merging/ boosting
you'll need this template:
; Template for actual combine and boost, needs enable/disable to work
; Attempt to combine template slot
if (templateMerge == 1) {
	MouseMove, templateX, templateY
	send {d down}
	MouseClick, Left, templateX, templateY
	send {d up}
}

; Attempt to boost template slot
if (templateBoost == 1) {
	MouseMove, templateX, templateY
	send {a down}
	MouseClick, Left, templateX, templateY
	send {a up}
}
sleep, MoveToNewItemDelay

now all you have to do is replace the template with your custom name from above and scroll down into the code section once there are no template placeholders left.


find the f4::
and look above it you'll see return and then the infinity cube and it's warning.
If you want your boost/merging to take place before the infinity cube then just paste it right below the sleep, moveToNewItemDelay and you're good to go.
or paste it below if you want boosting/merging to take place after the infinity cube.

Please let me know of any improvements or feedback! 
Either at https://github.com/theradman221/NGU-INV-Sort
or theradman221@gmail.com