//game closing animation
if (gameclosing) {
    closingvol=max(0,closingvol*0.9)
    sound_global_volume(closingvol*global.gain)
    if (closingvol<=0.025) game_end()

    closingk=!closingk
    if (closingk) {
        window_set_region_scale(1,1)
        window_set_region_size(global.width,ceil(global.height*sqr(closingvol)),1)
        window_center()
    }

    draw_clear(merge_color(0,$ffffff,1-closingvol))
    window_set_color(merge_color(0,$ffffff,1-closingvol))
    screen_refresh()

    exit
}

global.infocus=window_has_focus()

if (message) message-=1
if (message2) message2-=1

//music fade
if (fading) {
    fadefrom-=0.01
    sound_kind_volume(1,settings("musvol")*fadefrom)
    if (fadefrom<=0) {
        fading=0
        //pause when it's done fading if pause is on
        if (global.gameover_music_pause) {
            sound_kind_pause(1)
        }
    }
}

if (is_ingame() && room!=global.difficulty_room) {
    //advance game time
    if (instance_exists(Player) && !instance_exists(TimerFreeze)) {
        time=savedata("time")+50/room_speed
        savedata("time",time)
    }

    update_caption_deathtime()
}

system_hotkeys()

if (fps_real) cpu_usage=ceil(min(1,room_speed/fps_real)*100)

//debug keys
if (global.test_run) {
    debug_keys()
}
