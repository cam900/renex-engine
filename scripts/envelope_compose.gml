//during end step, compose the window and update the internal buffer.

if (((global.rw!=global.APPwidth || global.rh!=global.APPheight)) || global.use_application_surface) {
    dx8_make_opaque()
    d3d_set_depth(0)
    application_surface=dx8_surface_engage(application_surface,global.APPwidth,global.APPheight)

    /*
        this place is where you can add any post-processing effects using the application surface.
        remember to set the engine option to always use an application surface, when using this.
    */

    if ((global.rw!=global.APPwidth || global.rh!=global.APPheight) && settings("filter")==2) {
        //fullscreen area filter
        dequanto_surface=dx8_surface_engage(dequanto_surface,global.APPwidth*2,global.APPheight*2)
        texture_set_interpolation(global.APPfilter)
        draw_surface_stretched(application_surface,0,0,global.APPwidth*2,global.APPheight*2)
        texture_set_interpolation(0)
        event_draw_gui()
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        texture_set_interpolation(1)
        draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
        texture_set_interpolation(0)
    } else {
        //regular screen filtering
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        texture_set_interpolation(!!settings("filter") && global.APPfilter)
        draw_surface_stretched(application_surface,0,0,global.rw,global.rh)
        texture_set_interpolation(0)
        event_draw_gui()
    }
} else {
    event_draw_gui()
}

if (minalpha>0) {
    //minimize button
    texture_set_interpolation(1)
    d3d_set_projection_ortho(0,0,global.width,global.height,0)
    if (minclick=3) draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,pick(minhover=3,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,1,global.width-90,0,1,1,0,mincolor2,minalpha)
    if (minclick=2) draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,pick(minhover=2,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,3+settings("fullscreen"),global.width-45,0,1,1,0,mincolor2,minalpha)
    if (minclick=1) draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,merge_color(mincolor1,$2311e8,0.5),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,pick(minhover=1,mincolor1,$2311e8),minalpha)
    draw_sprite_ext(sprCapButtons,2,global.width,0,1,1,0,mincolor2,minalpha)
    texture_set_interpolation(0)
}
