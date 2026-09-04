extends Node2D
# MultiplierTable
var multipliers = [
	[0, 1, 1], # Singularities
]
func _ready() -> void:
	print(GlobalGamestate.singularities)

func level2Reset(l) -> void:
	for upgrade_key in UpgradeLambdaEffects.upgrade_effects.keys():
		if upgrade_key.x < 2: UpgradeLambdaEffects.upgrade_effects[upgrade_key][3] = false
	match l:
		0:
			pass
		1:
			pass
		2: 
			pass
	GlobalGamestate.singularities = 0 

func updateMultiplierTable() -> Array:
	var base_table = [
		[0, 1, 1],
	]
	for upgrade in UpgradeLambdaEffects.upgrade_effects.values():
		# Lambda, Affected, Effect Type, Purchased
		var l = upgrade[0]
		var a = upgrade[1]
		var e = upgrade[2]
		var p = upgrade[3]
		# Type of resource
		var i1 = -1
		if not p: continue
		match a:
			UpgradeLambdaEffects.AffectedResource.SING: i1 = 0
		if i1 == -1: continue
		match e:
			UpgradeLambdaEffects.UpgradeType.ADD:
				base_table[i1][0] += l.call()
			UpgradeLambdaEffects.UpgradeType.MULT:
				base_table[i1][1] *= l.call()
			UpgradeLambdaEffects.UpgradeType.EXP:
				base_table[i1][2] *= l.call()
	return base_table 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var add
	var mult
	var exp
	# Actual gameloop
	multipliers = updateMultiplierTable()
	# Secondary effects
	
	# Resource generation
	# Singularities:
	add = multipliers[0][0]
	mult = multipliers[0][1]
	exp = multipliers[0][2]
	GlobalGamestate.singularities += ((add * mult) ** exp) * delta / 2
	# Pending prestige
	pass
