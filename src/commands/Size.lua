return {
	Name = "size";
	Aliases = {},
	Description = "Gets the size of a part using SizeService.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "string";
			Name = "part";
			Description = "The part to check the size of.";
		}
	};
}