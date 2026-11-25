-- Distance from a target

theorem problem08 (x y t e : Int) (hx₁ : t - e ≤ x) (hx₂ : x ≤ t + e)
    (hy₁ : t - e ≤ y) (hy₂ : y ≤ t + e) :
    -(2 * e) ≤ x - y ∧ x - y ≤ 2 * e := by
  constructor <;> omega
