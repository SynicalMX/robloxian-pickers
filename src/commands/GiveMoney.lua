return {
	Name = "giveMoney";
	Aliases = {"gm", "givemoney"},
	Description = "Gives money to a player.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "player";
			Name = "player";
			Description = "The player that is receiving the money.";
		},
        {
            Type = "number";
            Name = "amount";
            Description = "The amount of money being given."
        }
	};
}