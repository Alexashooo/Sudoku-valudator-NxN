class Sudoku

  def initialize(solution=[])
    @sudoku_solution=solution
  end

  def is_valid
    n=Array(@sudoku_solution).count
    @one_row=[]
    @one_column=[]
    @one_square=[]
    @row_validator=0
    @column_validator=0
    @square_validator=0
    @value_validator=0

    i=0
    j=0


      for i in 0..(n-1)
        m=Array(@sudoku_solution[i]).count
        for j in 0..m
          if @sudoku_solution[i][j].is_a?(Integer) && @sudoku_solution[i][j].between?(1, n)
            @value_validator+=1
          end
        end
      end


  if @value_validator==n*n


      for i in 0..(n-1)
        for j in 0..(n-1)
          @one_row << @sudoku_solution[i][j]
          @one_column << @sudoku_solution[j][i]

        end

        if @one_row.uniq.count==n
          @row_validator+=1
        end

        if @one_column.uniq.count==n
          @column_validator+=1
        end

        @one_row.clear
        @one_column.clear

      end

      steps=Math.sqrt(n).to_i

      for i in (0..(n-1)).step(steps)
        for j in (0..(n-1)).step(steps)

          for k in i..(i+steps-1)
            for l in j..(j+steps-1)
              @one_square << @sudoku_solution[k][l]
            end
          end

          if @one_square.uniq.count==n
            @square_validator+=1
          end
          @one_square.clear
        end
      end

      if @column_validator==n && @row_validator== n && @square_validator==n
        return true
      else
        return false
      end
  else
    return false
  end

  end

end

goodSudoku1 = Sudoku.new([
                             [7,8,4, 1,5,9, 3,2,6],
                             [5,3,9, 6,7,2, 8,4,1],
                             [6,1,2, 4,3,8, 7,5,9],

                             [9,2,8, 7,1,5, 4,6,3],
                             [3,5,7, 8,4,6, 1,9,2],
                             [4,6,1, 9,2,3, 5,8,7],

                             [8,7,6, 3,9,4, 2,1,5],
                             [2,4,3, 5,6,1, 9,7,8],
                             [1,9,5, 2,8,7, 6,3,4]
                         ])

goodSudoku2 = Sudoku.new([[3]]
)

badSudoku1 = Sudoku.new([
                             [7,8,4, 1,5,9, 3,2],
                             [5,3,9, 6,7,2, 8,4],
                             [6,1,2, 4,3,8, 7,5],

                             [9,2,8, 7,1,5, 4,6],
                             [3,5,7, 8,4,6, 1,9],
                             [4,6,1, 9,2,3, 5,8],

                             [8,7,6, 3,9,4, 2,1],
                             [2,4,3, 5,6,1, 9,7],
                             [1,9,5, 2,8,7, 6,3]
                         ])

p goodSudoku1.is_valid

p goodSudoku2.is_valid

p badSudoku1.is_valid

