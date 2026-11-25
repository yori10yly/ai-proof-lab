-- Divisibility of a sum

theorem problem02 (d a b : Nat) (ha : d ∣ a) (hb : d ∣ b) : d ∣ a + b := by
  exact Nat.dvd_add ha hb
