/*
Welcome to an NGU Idle item sorter by theradman. V 1.0
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
*/

; SETTINGS - REPETITION

; set repeat to 0 to never loop, 1 to loop
Repeat = 1

; Determines the amount of to run the loops
RepeatAmount = 10

; delay between runs of the loop, measured in 1 second = 100 default is 5 minutes
RepeatDelay = 300000

; Sorting Delay
; delay of movement between combining and boosting each item, recommended at least 10 or game freaks out.
MoveToNewItemDelay = 100



; SETTINGS - DELETEING ITEMS

; Set to 0 to never delete items, 1 to delete items every deleteInterval runs
deleteOverflow = 1

; Determine how many runs between deletion occurring. - Do not set to 0
deleteInterval = 5

; number of total inventory slots - do not set to more than 1 page for this version
invsize = 38

; coordinates for the trash can - only change if it's missing the can
trashX = 630
trashY = 242

; how many slots, starting top left working right to not trash
exempt = 2

; top left coordinates, used to base all other coordinates on
InvX = 353
InvY = 354



; SETTINGS - MERGING
; All of these are formatted so that 1 = perform Merging and 0 = skip merging

; Head Merging
headMerge = 1

; Chest Merging
chestMerge = 1

; Legs Merging
LegsMerge = 1

; Boots Merging
BootsMerge = 1

; Weapon Merging
WeaponMerge = 1

; Top Accessory Slot Merging
AccessorySlot1Merge = 1

; Next Down Accessory Slot Merging
AccessorySlot2Merge = 1

; Top Left Inventory Merging (#1)
Inventory1Merge = 1

; Next Right Inventory Merging (#2)
Inventory2Merge = 1

; Infinity Cube Merging (At this point for me it doesn't so no setting)



; SETTINGS - BOOSTING
; All of these are formatted so that 1 = perform Boosting and 0 = skip Boosting

; Head Boosting
headBoost = 1

; Chest Boosting
chestBoost = 1

; Legs Boosting
LegsBoost = 1

; Boots Boosting
BootsBoost = 1

; Weapon Boosting
WeaponBoost = 1

; Top Accessory Slot Boosting
AccessorySlot1Boost = 1

; Next Down Accessory Slot Boosting
AccessorySlot2Boost = 1

; Top Left Inventory Boosting (#1)
Inventory1Boost = 1

; Next Right Inventory Boosting (#2)
Inventory2Boost = 1

; Infinity Cube Boosting (last priority)
InfinityCubeBoost = 1



; SETTINGS - COORDINANTS
; For merging/boosting all item boxes are hard coded, for now
; Only mess with these if adding a new one or adjusting positions,
; hopefully next release I'll figure out how to do it without hard coding the coordinates.

; Head Coordinates
headX = 529
headY = 90

; Chest Coordinates
chestX = 527
chestY = 141

; Legs Coordinates
LegsX = 528
LegsY = 192

; Boots Coordinates
BootsX = 523
BootsY = 239

; Weapon Coordinates
WeaponX = 580
WeaponY = 135

; AccessorySlot1 Coordinates
AccessorySlot1X = 482
AccessorySlot1Y = 84

; AccessorySlot2 Coordinates
AccessorySlot2X = 474
AccessorySlot2Y = 135

; Inventory1 Coordinates
Inventory1X = 353
Inventory1Y = 355

; Inventory2 Coordinates
Inventory2X = 400
Inventory2Y = 353

; InfinityCube Coordinates
InfinityCubeX = 635
InfinityCubeY = 142



; Settings Random - You shouldn't need to mess with these
; used in the deletion process don't touch
trashed = 0

; tells the deletion how many slots across the inventory is - only change if your is
; actually different than 12
slotsAcross = 12

; Tells the deletion how much to shift in the X and Y every time it shifts from cell to cell.
RightChange = 50
DownChange = 50



; Code - Do not pass unless you know what you're doing at least a little.

f12::
; exit the app upon receiving this hotkey
ExitApp
return

f1::
; reload the app upon receiving this hotkey
Reload
return

f2::
sorts = 0
; check if we are looping, if we are loop however many times is specified in loopAmount, if not run once and stop
if (Repeat == 1)
{
while (RepeatAmount != 0)
{
sorts += 1
send {f3}
if (Mod(sorts, deleteInterval) == 0)
{
if (deleteOverflow == 1)
{
send {f4}
}
}
sleep, RepeatDelay
RepeatAmount -= 1
}
}
else
{
send {f3}
}
return

f3::
; Try to combine everything in the enabled slots
; Then try to boost it

; Attempt to combine head slot
if (headMerge == 1) {
	MouseMove, headX, headY
	send {d down}
	MouseClick, Left, headX, headY
	send {d up}
}

; Attempt to boost head slot
if (headBoost == 1) {
	MouseMove, headX, headY
	send {a down}
	MouseClick, Left, headX, headY
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine chest slot
if (chestMerge == 1) {
	MouseMove, chestX, chestY
	send {d down}
	MouseClick, Left, chestX, chestY
	send {d up}
}

; Attempt to boost chest slot
if (chestBoost == 1) {
	MouseMove, chestX, chestY
	send {a down}
	MouseClick, Left, chestX, chestY
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine Legs slot
if (LegsMerge == 1) {
	MouseMove, LegsX, LegsY
	send {d down}
	MouseClick, Left, LegsX, LegsY
	send {d up}
}

; Attempt to boost Legs slot
if (LegsBoost == 1) {
	MouseMove, LegsX, LegsY
	send {a down}
	MouseClick, Left, LegsX, LegsY
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine Boots slot
if (BootsMerge == 1) {
	MouseMove, BootsX, BootsY
	send {d down}
	MouseClick, Left, BootsX, BootsY
	send {d up}
}

; Attempt to boost Boots slot
if (BootsBoost == 1) {
	MouseMove, BootsX, BootsY
	send {a down}
	MouseClick, Left, BootsX, BootsY
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine Weapon slot
if (WeaponMerge == 1) {
	MouseMove, WeaponX, WeaponY
	send {d down}
	MouseClick, Left, WeaponX, WeaponY
	send {d up}
}

; Attempt to boost Weapon slot
if (WeaponBoost == 1) {
	MouseMove, WeaponX, WeaponY
	send {a down}
	MouseClick, Left, WeaponX, WeaponY
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine AccessorySlot1 slot
if (AccessorySlot1Merge == 1) {
	MouseMove, AccessorySlot1X, AccessorySlot1Y
	send {d down}
	MouseClick, Left, AccessorySlot1X, AccessorySlot1Y
	send {d up}
}

; Attempt to boost AccessorySlot1 slot
if (AccessorySlot1Boost == 1) {
	MouseMove, AccessorySlot1X, AccessorySlot1Y
	send {a down}
	MouseClick, Left, AccessorySlot1X, AccessorySlot1Y
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine AccessorySlot2 slot
if (AccessorySlot2Merge == 1) {
	MouseMove, AccessorySlot2X, AccessorySlot2Y
	send {d down}
	MouseClick, Left, AccessorySlot2X, AccessorySlot2Y
	send {d up}
}

; Attempt to boost AccessorySlot2 slot
if (AccessorySlot2Boost == 1) {
	MouseMove, AccessorySlot2X, AccessorySlot2Y
	send {a down}
	MouseClick, Left, AccessorySlot2X, AccessorySlot2Y
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine Inventory1 slot
if (Inventory1Merge == 1) {
	MouseMove, Inventory1X, Inventory1Y
	send {d down}
	MouseClick, Left, Inventory1X, Inventory1Y
	send {d up}
}

; Attempt to boost Inventory1 slot
if (Inventory1Boost == 1) {
	MouseMove, Inventory1X, Inventory1Y
	send {a down}
	MouseClick, Left, Inventory1X, Inventory1Y
	send {a up}
}

sleep, MoveToNewItemDelay

; Attempt to combine Inventory2 slot
if (Inventory2Merge == 1) {
	MouseMove, Inventory2X, Inventory2Y
	send {d down}
	MouseClick, Left, Inventory2X, Inventory2Y
	send {d up}
}

; Attempt to boost Inventory2 slot
if (Inventory2Boost == 1) {
	MouseMove, Inventory2X, Inventory2Y
	send {a down}
	MouseClick, Left, Inventory2X, Inventory2Y
	send {a up}
}

sleep, MoveToNewItemDelay

; INFINITY CUBE SHOULD BE LAST UNLESS YOU WANT IT TO STEAL BOOSTS!
; Attempt to boost InfinityCube slot
if (InfinityCubeBoost == 1) {
	MouseMove, InfinityCubeX, InfinityCubeY
	send {a down}
	MouseClick, Left, InfinityCubeX, InfinityCubeY
	sleep, 15
	; make sure any split boosts are used up
	MouseClick, Left, InfinityCubeX, InfinityCubeY
	send {a up}
}

return


f4::
; discard anything left after doing a powerup/ combine
rightCount = 0
downCount = 0
while (trashed != invsize)
{
; skip the slot if it's exempt
if (trashed < exempt)
{
trashed += 1
rightCount += 1
}

else
{
temp := Mod(trashed, slotsAcross)
; if we are 12 slots across then go down 1 and start going across again
if (temp == 0)
{
rightCount = 0
downCount += 1
}
invmoveX := (invX + (rightCount * RightChange))
invmoveY := (invY + (downCount * DownChange))

; figure out which box we are dealing with
MouseMove, invmoveX, invmoveY
trashed += 1
;SendInput {LButton Down}
; Take that crap to the trash can!
sleep, 10
MouseClickDrag, L, invmoveX, invmoveY, trashX, trashY
;SendInput {LButton up}


; shift right after we are done with everything else
rightCount += 1
}
}
trashed = 0
return

/*
; Templates

; Template Coordinates and enable/disable
TemplateX = 0
TemplateY = 0
TemplateMerge = 0
TemplateBoost = 0



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


*/
