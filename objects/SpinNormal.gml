#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
f=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    f=min(1,f+0.02*dt)
    view_angle=cosine(180,360,f)
    if (view_angle>270) PushBlock.grav=1

    if (f==1) {
        go=0
        f=0
        frozen=false
        view_angle=0
    }
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    if (vflip==-1 || view_angle==180) {
        speed=0
        djump=1
        sound_play_slomo("sndBlockChange")
        if (view_angle!=0) {
            frozen=true
            other.go=1
        } else PushBlock.grav=1
    }
    vflip=1
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
