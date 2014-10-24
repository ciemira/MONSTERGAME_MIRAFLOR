/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity : SEEntity
{
    SESprite monster;
    SESprite text;
    int w;
    int h;
    int mx;
    int my;
    int plx;
    int ply;
    String display;
    
    public void initialize (SEResourceCache rsc) {
        base.initialize(rsc);
        w = get_scene_width();
        h = get_scene_height();
        plx = MainScene.x;
        ply = MainScene.y;
        
        rsc.prepare_image("mymonster", "monster", 0.05*w);
        monster = add_sprite_for_image(SEImage.for_resource("mymonster"));
        rsc.prepare_font("acfont","courier new bold color=white",50);
        text = add_sprite_for_text(display, "acfont");
        text.move(0,0);
        mx = monster.get_x();
        my = monster.get_y();
        monster.move(Math.random(0,w),Math.random(0,h));
    }

    public void cleanup() {
        base.cleanup();
    }

    
    public void tick(TimeVal now, double delta) {
        base.tick(now,delta);
        plx = MainScene.x;
        ply = MainScene.y;
        mx = monster.get_x();
        my = monster.get_y();
        base.tick(now, delta);
        monster.move(mx+(plx-mx)/50,my+(ply-my)/50);

           if((mx/plx)==1 && (my/ply)==1) {
            text.set_text("GAME OVER!");
            text.move(0.35*w, 0.45*h);
        }
    }
}