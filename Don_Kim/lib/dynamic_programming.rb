class DynamicProgramming

  def initialize
    @cache = { 1 => 1, 2 => 2}
    @odds = {}
  end

  def odd_num(n)
    return (n * 2) - 1
  end

  def blair_nums(n)
    return @cache[n] if @cache[n]
    ans = blair_nums(n - 1) + blair_nums(n - 2) + odd_num(n - 1)
    @cache[n] = ans
    return ans
  end

  def frog_hops_bottom_up(n)
    
  end

  def frog_cache_builder(n)

  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
