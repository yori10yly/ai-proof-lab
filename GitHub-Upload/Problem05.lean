-- The triangular sum

def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => sumTo n + (n + 1)

theorem problem05 (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [sumTo, Nat.mul_add, ih]
    simp [Nat.add_mul, Nat.mul_add]
    omega
