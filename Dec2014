#created and performed from scratch using SonicPi v2.2.0 20 Dec 2014

live_loop :tick do
  sleep 4
end

live_loop :cut do
  sync :tick
  use_synth :tri
  with_fx :level, amp: 1 do
    with_fx :slicer, mix: 0.1, phase: 0.125 do
      s = play 48, cutoff: 30, cutoff_slide: 16, release: 16, amp: 0.5, amp_slide: 16, pan: -1, pan_slide: 16
      control s, note: [36, 36].choose, cutoff: 110, amp: 2, pan: 1
    end
    sleep [16, 16, 16].choose
  end
end

live_loop :basslino do
  sync :tick
  use_synth :tri
  use_transpose 0
  play_pattern_timed (knit :c3, 7, :d3, 2), (knit 0.5, 7, 0.25, 2), release: 0.3, cutoff: 60, cutoff_slide: 4
end

live_loop :basslino2 do
  sync :tick
  use_synth :prophet
  use_transpose -12
  play_pattern_timed (knit :c3, 7, :g3, 2), (knit 2, 7, 1, 2), release: 3, cutoff: 110, cutoff_slide: 4
end

live_loop :drums do
  sync :tick
  #sleep 16
  4.times do
    sample :bd_haus
    sleep 0.25
    with_fx :echo, phase: 0.125, decay: 4 do
      sample :drum_snare_soft, amp: 0.25
    end
    sleep 0.25
    sample :bd_fat
    sleep 0.25
    with_fx :echo, phase: 0.125, decay: 4 do
      sample :drum_snare_soft, amp: 0.15, rate: 1.5
    end
    sleep 0.25
  end
end

live_loop :bass do
  sync :tick
  with_fx :ixi_techno, mix: 0.3, phase: 0.25 do
    with_fx :slicer, mix: 0.3, phase: 0.5, phase_offset: 0.25 do
      sample :bass_thick_c
      sleep 4
    end
  end
end

live_loop :bass2 do
  sync :tick
  with_fx :ixi_techno, mix: 0.0, phase: 0.25 do
    with_fx :slicer, mix: 0, phase: 0.5, phase_offset: 0.5 do
      4.times do
        sample :bass_trance_c, amp: 1, release: 0.5
        sleep 1
      end
    end
  end
end
