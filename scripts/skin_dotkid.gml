if (argument0=="step") {}

if (argument0=="draw") {
    draw_sprite_ext(sprDotKid,0,floor(drawx),floor(drawy),1,vflip,0,image_blend,image_alpha)
    draw_circle_color(floor(x),floor(y),48,0,$ff,1)

    if (bow) {
        draw_sprite_ext(sprBow,0,floor(bowx),floor(bowy+abs(lengthdir_y(2,sprite_angle))*vflip+(vflip==-1)),facing,vflip,drawangle,image_blend,image_alpha)
    }
}
