-- A finite geometric sum

def powerSum : Nat → Nat
  | 0 => 0
  | n + 1 => powerSum n + 2 ^ n

theorem problem06 (n : Nat) : powerSum n + 1 = 2 ^ n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [powerSum, Nat.pow_succ]
    omega
