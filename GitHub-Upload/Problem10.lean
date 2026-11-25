-- A quadratic inequality

theorem problem10 (a b : Int) : 4 * a * b ≤ (a + b) * (a + b) := by
  by_cases h : a ≤ b
  · have hn : 0 ≤ b - a := by omega
    have hs := Int.mul_nonneg hn hn
    simp only [Int.sub_mul, Int.mul_sub] at hs
    simp only [Int.add_mul, Int.mul_add, Int.mul_assoc]
    rw [Int.mul_comm b a] at *
    omega
  · have hn : 0 ≤ a - b := by omega
    have hs := Int.mul_nonneg hn hn
    simp only [Int.sub_mul, Int.mul_sub] at hs
    simp only [Int.add_mul, Int.mul_add, Int.mul_assoc]
    rw [Int.mul_comm b a] at *
    omega
