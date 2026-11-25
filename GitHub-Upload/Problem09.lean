-- Bounds for a weighted sum

theorem problem09 (a b k w : Nat) (hab : a ≤ b) (hk : k ≤ w) :
    w * a ≤ k * a + (w - k) * b ∧ k * a + (w - k) * b ≤ w * b := by
  have h : k + (w - k) = w := by omega
  constructor
  · calc
      w * a = k * a + (w - k) * a := by rw [← Nat.add_mul, h]
      _ ≤ _ := Nat.add_le_add_left (Nat.mul_le_mul_left (w - k) hab) _
  · calc
      k * a + (w - k) * b ≤ k * b + (w - k) * b :=
        Nat.add_le_add_right (Nat.mul_le_mul_left k hab) _
      _ = w * b := by rw [← Nat.add_mul, h]
