  function Key_Down(src,event)
global vel_angular;
global vel_lineal;
global incAngular;
global incLineal;
global vel_angular_max;
global vel_lineal_max;
global stop

  if(strcmp(event.Key,'rightarrow'))
     vel_angular= max(vel_angular - incAngular, -vel_angular_max)
  end
  if(strcmp(event.Key,'leftarrow'))
     vel_angular= min(vel_angular + incAngular, vel_angular_max)
  end
    if(strcmp(event.Key,'downarrow'))
     vel_lineal= max(vel_lineal - incLineal, -vel_lineal_max)
  end
  if(strcmp(event.Key,'uparrow'))
     vel_lineal= min(vel_lineal + incLineal, vel_lineal_max)
  end
  if(strcmp(event.Key,'space'))
     stop = 1;
  end
  
  
  if (abs(vel_angular)<1e-12)
  vel_angular = 0.0
  end
    if (abs(vel_lineal)<1e-12)
  vel_lineal = 0.0
  end
  
  end