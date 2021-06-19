var l,f;

texture_reset_interpolation()

if (is_ingame()) {
    //update camera system
    if (instance_exists(camera_f)) {
        if (camera_f.object_index==Player) {
            newcamx=camera_f.drawx
            newcamy=camera_f.drawy
        } else {
            newcamx=camera_f.x
            newcamy=camera_f.y
        }
    }

    if (camera_s && (abs(vcx-newcamx)<global.width && abs(vcy-newcamy)<global.height)) {
        vcx=(vcx*4+newcamx)/5
        vcy=(vcy*4+newcamy)/5
    } else {
        vcx=newcamx
        vcy=newcamy
    }

    if (camera_s) {
        vcz=(vcz*4+camera_z)/5
    } else {
        vcz=camera_z
    }

    f=1/(global.scale*vcz)

    cam_l=floorto(vcx,camera_w)
    cam_t=floorto(vcy,camera_h)
    cam_r=cam_l+camera_w
    cam_b=cam_t+camera_h

    view_xview=median(0,floor(median(cam_l,vcx-global.width /2*f,cam_r-global.width *f)),room_width -global.width *f)
    view_yview=median(0,floor(median(cam_t,vcy-global.height/2*f,cam_b-global.height*f)),room_height-global.height*f)
    view_wview=global.width*f
    view_hview=global.height*f

    view_xcenter=view_xview+(global.width/2)/(global.scale*vcz)
    view_ycenter=view_yview+(global.height/2)/(global.scale*vcz)
}

if (!gameclosing) {
    //frame skip if game speed is much larger than screen refresh rate
    var t; t=hrt_time_now()
    if (t>oldtime) {
        oldtime=t+oneframe
        set_automatic_draw(1)
    } else set_automatic_draw(0)
}
