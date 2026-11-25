-- Problem 01: Divisibility is transitive
-- If a divides b and b divides c, then a divides c.

theorem problem01 (a b c : Nat)
    (hab : a ∣ b) (hbc : b ∣ c) : a ∣ c := by
  exact Nat.dvd_trans hab hbc
