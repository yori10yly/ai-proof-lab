-- Constructing a divisibility witness

theorem problem03 (d a b r s : Nat) (ha : d ∣ a) (hb : d ∣ b) :
    d ∣ r * a + s * b := by
  obtain ⟨x, rfl⟩ := ha
  obtain ⟨y, rfl⟩ := hb
  refine ⟨r * x + s * y, ?_⟩
  simp [Nat.mul_add, Nat.mul_left_comm]
