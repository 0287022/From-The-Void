class_name OneTime
extends Resource

enum UpgradeType { ADD, MULT, EXP }
enum CostingResource { SING } # To add more resources
enum AffectedResource { SING } # Ditto

# level is 1 for void upgrades, 2 for light/energy/mass, so on
@export var level: int
# layer describes where you are in the level. usually 0, but can be 1/2
@export var layer: int
# id increases per layer
@export var id: int
@export var title: String
@export_multiline var description: String
@export var upgrade_type: UpgradeType
@export var cost_resource: CostingResource
@export var affected_resource: AffectedResource
@export var cost: float
@export var purchased: bool
