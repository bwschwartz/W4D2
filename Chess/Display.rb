require "colorize"
require "colorized_string"

class Display

    def self.render_board(board)
        board.map do |row|
            row.map do |sq|
                if sq.nil? 
                    "   ".colorize(:color => :black, :background => :white)
                else
                    sq.symbol.colorize(:color => :black, :background => :white)
                end
            end
        end
    end 

    def self.print_board(board)
        Display.render_board(board).each do |row|
            puts row.join(" ") 
            puts
        end
    end
end