life_time--;
if (life_time <= 0) {
    part_emitter_destroy(ps, emitter);
    part_system_destroy(ps);
    instance_destroy();
}
