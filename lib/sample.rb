## Posted by snex (Guest) on 2009-02-23 17:03  (Received via mailing list)
## On Feb 20, 11:18 am, Daniel Moore <yahi...@gmail.com> wrote:
## >
## > This weeks quiz is to produce an implementation of [Conway's Game of
## > It is amazing to see the patterns that can emerge from seemingly
## >
## > --
## > -Danielhttp://rubyquiz.strd6.com
#
## here is my really hideous code (but it uses opengl so its pretty!):
#
#### gol.rb ###
#
#class Cell
#
#  attr_accessor :state, :next_state
#
#  def initialize( state )
#
#    @state = state
#
#  end
#
#  def alive?
#
#    @state == 1
#
#  end
#
#end
#
#class Game
#
#  attr_accessor :board
#
#  def initialize( board_size )
#
#    @board = Array.new
#
#    board_size.times do |i|
#
#      @board[i] = Array.new
#
#      board_size.times do |j|
#
#        @board[i][j] = Cell.new( rand(2) ) # 0 means start with no
#cell, 1 means start with a living cell
#
#      end
#
#    end
#
#  end
#
#  def update_board
#
#    @board.each_index do |i|
#
#      @board[i].each_index do |j|
#
#        if ( @board[i][j].alive? and ( ( count_living_neighbors( i,
#j ) < 2 ) or ( count_living_neighbors( i, j ) > 3 ) ) )
#
#          @board[i][j].next_state = 0
#
#        elsif ( @board[i][j].alive? and ( count_living_neighbors( i,
#j ) == 2 or ( count_living_neighbors( i, j ) == 3 ) ) )
#
#          @board[i][j].next_state = 1
#
#        elsif ( !@board[i][j].alive? and count_living_neighbors( i,
#j ) == 3 )
#
#          @board[i][j].next_state = 1
#
#        else
#
#          @board[i][j].next_state = @board[i][j].state
#
#        end
#
#      end
#
#    end
#
#    @board.each_index do |i|
#
#      @board[i].each_index do |j|
#
#        @board[i][j].state = @board[i][j].next_state
#
#      end
#
#    end
#
#  end
#
#  def count_living_neighbors( i, j )
#
#    sum = 0
#
#    sum += 1 if i - 1 >= 0 and j - 1 >= 0 and @board[i - 1][j -
#1].alive?
#    sum += 1 if i - 1 >= 0 and @board[i - 1][j].alive?
#    sum += 1 if i - 1 >= 0 and j + 1 < @board.size and @board[i - 1][j
#+ 1].alive?
#    sum += 1 if j - 1 >= 0 and @board[i][j - 1].alive?
#    sum += 1 if j + 1 < @board.size and @board[i][j + 1].alive?
#    sum += 1 if i + 1 < @board.size and j - 1 >= 0 and @board[i + 1][j
#- 1].alive?
#    sum += 1 if i + 1 < @board.size and @board[i + 1][j].alive?
#    sum += 1 if i + 1 < @board.size and j + 1 < @board.size and @board
#[i + 1][j + 1].alive?
#
#    return sum
#
#  end
#
#end
#
#### end gol.rb ###
#
#### display.rb ###
#
#require 'opengl'
#require 'glut'
#require 'gol'
#
#$dot_size = 5.0
#$board_size = 200
#$gol = Game.new( $board_size )
#
#display = Proc.new {
#
#  GL.Clear( GL::COLOR_BUFFER_BIT );
#  GL.PushMatrix();
#  GL.Begin( GL::POINTS );
#
#    $gol.board.each_index { |i|
#
#      $gol.board[i].each_index { |j|
#
#        GL.Vertex2f( i.to_f * $dot_size, j.to_f * $dot_size ) if
#$gol.board[i][j].alive?
#
#      }
#
#    }
#
#  GL.End();
#  GL.PopMatrix();
#  GLUT.SwapBuffers();
#
#}
#
#idle = Proc.new {
#
#  $gol.update_board
#  display.call
#
#}
#
#
#init = Proc.new {
#
#  GL.ClearColor( 0.0, 0.0, 0.0, 0.0 )
#  GL.MatrixMode( GL::PROJECTION )
#  GL.LoadIdentity()
#  GLU.Ortho2D( 0.0, $dot_size * $board_size.to_f, 0.0, $dot_size *
#$board_size.to_f )
#  GL.PointSize( $dot_size )
#  GL.Enable( GL::POINT_SMOOTH )
#  GL.Enable( GL::BLEND )
#  GL.BlendFunc( GL::SRC_ALPHA, GL::ONE_MINUS_SRC_ALPHA )
#
#}
#
#GLUT.Init()
#GLUT.InitDisplayMode( GLUT_DOUBLE | GLUT_RGB )
#GLUT.InitWindowSize( $dot_size.to_i * $board_size, $dot_size.to_i *
#$board_size )
#GLUT.InitWindowPosition( 0, 0 )
#GLUT.CreateWindow( "game of life" )
#init.call
#GLUT.DisplayFunc( display )
#GLUT.IdleFunc( idle )
#GLUT.MainLoop()
#
#### end display.rb ###