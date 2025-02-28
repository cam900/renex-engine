///list_instance_activation(gameplay)
//put here the objects that always need to be activated

//instances that should always be active
instance_activate_object(World)
instance_activate_object(global.screen_manager)
instance_activate_object(core)
instance_activate_object(Ortho)
instance_activate_object(Profiler)

if (argument0) {
    //instances that should only activate during gameplay
    instance_activate_object(Player)
    instance_activate_object(Bullet)
    instance_activate_object(SkyGradient2Colors)
    instance_activate_object(Teleporter)
    instance_activate_object(HPMode)
    instance_activate_object(HitCount)
}
