#created and performed from scratch for Yow! Australia 2014, Sydney 10 Dec 2014
#using SonicPi v2.1.1

use_bpm 70

live_loop :tick do
  sleep 4
end

live_loop :bass do
  sync :tick
  with_fx :level, amp: 1 do
    with_fx :slicer, mix: 0.2 do
      sample :bass_hard_c, rate: [0.5, 1, 2].choose
      sleep [1,2].choose
    end
  end
end

live_loop :heart_beat do
  sync :tick
  with_fx :level, amp: 1 do
    with_fx :reverb, mix: 0.3 do
      with_fx :echo, mix: 0.2, decay: 2 do
        sample :drum_bass_hard
        sleep 1.75
        sample :drum_bass_hard, rate: 0.9
        sleep 0.25
        sample :drum_bass_hard, rate: 0.9
        sleep 1.75
        sample :drum_bass_hard
        sleep 0.25
      end
    end
  end
end

live_loop :ocean do
  sync :tick
  with_fx :level, amp: 0.1 do
    with_fx :ixi_techno, mix: 0.02, phase: 1 do
      with_fx :slicer, mix: 0.2, phase: 0.5 do
        use_synth [:bnoise, :cnoise, :gnoise].choose
        play 48, attack: rrand(0,2), release: rrand(3,5)
        sleep [2, 4].choose
      end
    end
  end
end

live_loop :choir do
  sync :tick
  with_fx :level, amp: 1 do
    sd = sample_duration :ambi_choir
    4.times do
      r = [0.2, 0.5, 1, 2].choose
      sample :ambi_choir, rate: [r, -r].choose, pan: [-1, 1].choose
      sleep sd/r
    end
  end
end

live_loop :drums do
  sync :tick
  with_fx :level, amp: 0.2 do
    28.times do
      sample :drum_bass_hard, rate: rrand(1, 1.1)
      sleep 0.5
      sample :drum_snare_hard, rate: rrand(0.9, 1)
      sleep 0.25
      sample :drum_snare_hard, rate: rrand(0.9, 1)
      sleep 0.25
    end
    with_fx :level, amp: 0.4 do
      p = -1
      32.times do
        p = p + 1.0/16
        sample :drum_snare_hard, rate: rrand(0.5, 0.9), pan: p
        sleep 1.0/16
      end
    end
  end
end

live_loop :hook do
  sync :tick
  with_fx :level, amp: 0.5 do
    use_transpose 0
    use_synth :prophet
    with_fx :echo, mix: 0.4, decay: 2 do
      play_pattern_timed [:C3, :D3, :C3, :C3, :C2, :D2], [0.5, 0.5, 1, 1, 0.25], attack: 0, release: 1, cutoff: rrand(60, 110)
      sleep [4, 8].choose
      #play_pattern_timed [:F3, :D3, :D3, :F3, :C3, :D3], [1.5, 0.5, 0.5, 1, 0.5], attack: 0, release: 1, cutoff: rrand(60, 110) if rand<0.2
      #sleep 4
    end
  end
end

live_loop :beeps do
  sync :tick
  with_fx :level, amp: 1 do
    with_fx :echo, decay: 10 do
      sample :elec_beep if rand<0.1
      sleep 1
    end
  end
end

live_loop :bing do
  sync :tick
  with_fx :level, amp: 1 do
    sample :elec_chime, release: rrand(0, 2)
    sleep 12
  end
end
