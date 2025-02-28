#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
push_speed=1
fall_speed=4

grav=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Player) other.grav=vflip

if (place_free(x,y+grav)) {
    vspeed=fall_speed*grav
    hspeed=0
    check_crush()
}

if (vspeed!=0) {
    move_outside_solid(direction+180,speed)
    move_contact_solid(direction,speed)
}
vspeed=0

with (ConveyorLeft)
    if (place_meeting(x,y-other.grav*2,other.id))
        with (other)
            if (place_free(x+other.spd,y))
                hspeed=min(hspeed,other.spd)
            else
                move_contact_solid(90-90*sign(other.spd),other.spd)

with (ConveyorRight)
    if (place_meeting(x,y-other.grav*2,other.id))
        with (other)
            if (place_free(x+other.spd,y))
                hspeed=max(hspeed,other.spd)
            else
                move_contact_solid(90-90*sign(other.spd),other.spd)

if (hspeed!=0) {
    if (instance_exists(Player)) {
        //pushed
        if (place_meeting(x+hspeed,y,Player)) {
            move_player(Player.x+hspeed,Player.y,0)
            check_crush()
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=0
