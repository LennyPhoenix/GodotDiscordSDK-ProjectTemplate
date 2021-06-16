extends VBoxContainer


onready var status := $SDKCheck/Status

var discord: Discord.Core
var activities: Discord.ActivityManager


func _ready() -> void:
	discord = Discord.Core.new()

	var result: int = discord.create(
		807697044516372541,
		Discord.CreateFlags.NO_REQUIRE_DISCORD
	)

	if result != Discord.Result.OK:
		print("Failed to initialise SDK: ", result)
		discord = null
		status.text = "Failed to initialise: %d\nCheck that Discord is running?" % result
		return

	activities = discord.get_activity_manager()

	status.text = "Updating activity..."

	var activity := Discord.Activity.new()
	activity.state = "Hello world"
	activity.details = "from the GodotDiscordSDK!"
	activity.assets.large_image = "icon"
	activity.assets.large_text = "GodotDiscordSDK"
	activities.update_activity(activity, self, "_update_activity_callback")


func _update_activity_callback(result: int) -> void:
	if result != Discord.Result.OK:
		print("Failed to update activity: ", result)
		status.text = "Failed to update activity: %d" % result
		return

	print("Updated activity!")
	status.text = "Updated activity, SDK check passed!"


func _process(_delta: float) -> void:
	if discord:
		var result: int = discord.run_callbacks()
		if result != Discord.Result.OK:
			print("Failed to run callbacks: ", result)
			discord = null
			activities = null
			status.text = "Failed to run callbacks: %d" % result
