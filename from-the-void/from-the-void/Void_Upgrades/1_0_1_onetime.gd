extends Button
@export var upgrade: OneTime
var upgrade_key = Vector3i(-1,-1,-1)
var upgrade_lambda_data
var effect
var purchased

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upgrade_key=Vector3i(upgrade.level, upgrade.layer, upgrade.id)
	upgrade_lambda_data = UpgradeLambdaEffects.upgrade_effects[upgrade_key]
	effect = upgrade_lambda_data[0]
	purchased = upgrade_lambda_data[3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	upgrade_lambda_data = UpgradeLambdaEffects.upgrade_effects[upgrade_key]
	purchased = upgrade_lambda_data[3]
	if purchased:
		text = upgrade.title + " (Purchased) " + "\n" + upgrade.description + Format.f(effect.call())
	else: text = upgrade.title + '\n' + upgrade.description + Format.f(effect.call())

func buy_upgrade() -> void:
	match upgrade.cost_resource:
		OneTime.CostingResource.SING:
			if GlobalGamestate.singularities >= upgrade.cost and not purchased:
				GlobalGamestate.singularities -= upgrade.cost
				UpgradeLambdaEffects.upgrade_effects[upgrade_key][3] = true # this one needs to specifically set, not get.
		_: pass

func _on_pressed() -> void:
	buy_upgrade()
	print(purchased)
