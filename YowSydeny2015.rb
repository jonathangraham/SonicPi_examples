#live-coded from scratch during Yow! Sydney, December 11th, 2015
#example recording at https://soundcloud.com/jpgraham-1

root = :e1
c = :minor
per_amp = 0.5

live_loop :bd do
  with_fx :level, amp: per_amp*2 do
    with_fx :echo, phase: 0.5, decay: 0.5, mix: 0.7 do
      3.times do
        sample :bd_tek
        sleep 1
        sample :bd_tek, rate: 0.97
        sleep 1
      end
      sample :bd_tek
      sleep 2
    end
  end
end

live_loop :roll do
  sync :bd
  if per_amp == 0
    sleep 16
    a=1
    co=60
    with_fx :reverb do
      64.times do
        sample :drum_snare_hard, amp: a, cutoff: co
        sleep 0.125
        a = a+0.03
        co = co+1
      end
      per_amp=0.5
      root=:g1
    end
  end
end
live_loop :cymbal do
  sync :bd
  with_fx :level, amp: per_amp*2 do
    sleep 7.75
    with_fx :reverb do
      sample :drum_cymbal_open
    end
  end
end

live_loop :snare do
  sync :bd
  with_fx :level, amp: per_amp do
    with_fx :echo, phase: 0.5, decay: 0.5, mix: 0.7 do
      4.times do
        sleep 0.25
        sample :drum_snare_hard
        sleep 1
        sample :drum_snare_soft
        sleep 0.75
      end
    end
  end
end

live_loop :snare2 do
  sync :bd
  with_fx :level, amp: per_amp do
    with_fx :echo, phase: 0.5, decay: 0.5, mix: 0.7 do
      4.times do
        sleep 0.25
        sample :drum_snare_hard
        sleep 1
        sample :drum_snare_soft
      end
    end
  end
end

live_loop :tom do
  sync :bd
  with_fx :level, amp: per_amp*2 do
    with_fx :echo, mix: 1, phase: 0.5, decay: 2 do
      2.times do
        sample :drum_tom_hi_hard
        sleep 1.5
        sample :drum_tom_hi_hard
        sleep 1.5
        sample :drum_tom_hi_soft, rate: 0.9
        sleep 1.5
      end
    end
  end
end

live_loop :bass do
  sync :bd
  use_synth :tb303
  use_random_seed (ring 3000, 3003, 3006, 3009).tick
  n= (chord root+24, c).choose
  with_fx :slicer, mix: 0.7, phase: (1.0 /3) do
    with_fx :slicer, mix: 0.7, phase: (1.0 /2) do
      4.times do
        play (chord n, c), release: 2, cutoff: rrand(60, 120)
        play n+12, release: 4, cutoff: rrand(60, 120), amp: [0,0,0.25, 0.5].choose
        sleep 2
      end
    end
  end
end

live_loop :bass2 do
  sync :bd
  use_synth :mod_pulse
  use_random_seed (ring 300, 303, 306, 309).tick
  8.times do
    play root, mod_range: 12, cutoff: rrand(60, 120), amp: rrand(0.5, 1), mod_phase: (1.0/3)
    play root+12, mod_range: [12,24,36].choose, cutoff: rrand(60, 120), amp: rrand(0.25, 0.5), mod_phase: [0.25, 0.5, 0.75, 1].choose, mod_pulse_width: rand
    sleep 1
  end
end

live_loop :melody do
  sync :bd
  use_synth :piano
  use_random_seed (ring 300, 303, 306, 309).tick
  ns = (scale root+24, :minor_pentatonic).take(4)
  4.times do
    r = [2,4,8,8].choose
    (2*r).times do
      play ns.choose, amp: rrand(0,2)
      sleep (1.0/r)
    end
  end
end
