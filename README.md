# Biomechanical Gait Analysis in MATLAB

This repository hosts scripts related to human biomechanical gait analysis during level walking (treadmill or overground).

---

## Joint-level Kinetics

### Hip Joint
`hip_moment_vars.mat`: This function calculates support phase hip joint extensor and flexor peak moments and angular impulses. 

`hip_power_vars.mat`: This function calculates support phase hip jont extensor peak positive power and positive work (early support phase), hip flexor peak negative power and negative work (mid-support phase), hip flexor peak positive power and positive work (late support phase), and total joint positive and negative work. 

### Knee Joint
`knee_moment_vars.mat`: This function calculates support phase knee joint extensor and flexor peak moments and angular impulses.

`knee_power_vars.mat`: This function calculates support phase knee joint extensor peak positive power and positive work, and total joint positive and negative work. 

### Ankle Joint
`ankle_moment_vars.mat`: This function calculates support phase ankle joint extensor (plantarflexor) and flexor (dorsiflexor) peak moments and angular impulses.

`ankle_power_vars.mat`: This function calculates support phase ankle joint peak positive power and positive and negative work.

---

## Ground Reaction Forces
`grf_vars`: This function returns the first and second peaks and the total impulse of the vertical ground reaction force of a single step. It also returns posterior and anterior peaks and impulses of the anteroposterior ground reaction force of a single step.
