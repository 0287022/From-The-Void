extends Node
# Key Format: Vector3i(level, layer, id)
# Value Format: effect, affect_res, type, purchased
enum UpgradeType { ADD, MULT, EXP }
enum AffectedResource { SING }

var upgrade_effects =  {
	# Void Upgrades
	Vector3i(1, 0, 0): [func(): return 1, AffectedResource.SING, UpgradeType.ADD, false],
	Vector3i(1, 0, 1): [func(): return (1 + log(GlobalGamestate.singularities + 1) / log(10)), AffectedResource.SING, UpgradeType.MULT, false],
}
