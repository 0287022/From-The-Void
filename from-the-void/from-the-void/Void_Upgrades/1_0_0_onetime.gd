extends Button
@export var upgrade: OneTime
var upgrade_key = Vector3i(-1,-1,-1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upgrade_key=Vector3i(upgrade.level, upgrade.layer, upgrade.id)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if UpgradeLambdaEffects.upgrade_effects[upgrade_key][3]:
		text = upgrade.title + " (Purchased) " + "\n" + upgrade.description
	else: text = upgrade.title + '\n' + upgrade.description

func buy_upgrade() -> void:
	match upgrade.cost_resource:
		OneTime.CostingResource.SING:
			if GlobalGamestate.singularities >= upgrade.cost and not UpgradeLambdaEffects.upgrade_effects[upgrade_key][3]:
				GlobalGamestate.singularities -= upgrade.cost
				UpgradeLambdaEffects.upgrade_effects[upgrade_key][3] = true
		_: pass

func _on_pressed() -> void:
	buy_upgrade()
	print("---------------")
	print(Gameloop.updateMultiplierTable())
