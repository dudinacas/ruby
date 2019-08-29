class Scene
  def enter()
    exit(1)
  end
end

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)

      # be sure to print out the last scene
      current_scene.enter()
    end
  end

  def test()
    puts "Engine is functional!"
    puts "\n"
    puts "--~--"
    puts "\n"
  end
end

# Death is-a Scene
class Death < Scene

  @@quips = [
  "Bruce has died of dysentry.",
  "Rest in peace, Bruce."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    puts "GAME OVER"
    exit(1)
  end
end

class Finished < Scene
  def enter()
    puts "You won! Congratulations."
  end
end

class QuartzHallway < Scene

  def enter()
    puts 'You wake up in an empty hallway, with no recollection of anything'
    puts 'except your name - Bruce. The hallway is a dazzling white, with a'
    puts 'bright light seemingly coming from nowhere.'
    puts "\n"
    puts 'You get up, seeing nothing around you, and start walking towards'
    puts 'the light. Suddenly, a man drops down from the ceiling, seemingly'
    puts 'phasing through the wall.'
    puts "\n"
    puts '"Halt!", the man says.'
    puts '"What are you doing here?"'
    puts "\n"
    print '>'
    return 'death'
  end
end

class Map
  @@scenes = {
    'quartz_hallway' => QuartzHallway.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

# Start of game loop

a_map = Map.new('quartz_hallway')
a_game = Engine.new(a_map)
a_game.test()
a_game.play()
