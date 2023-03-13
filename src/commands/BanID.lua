return {
    Name = "banid";
    Aliases = {};
    Description = "Ban a player from the game.";
    Group = "DefaultAdmin";
    Args = {
        {
            Type = "number";
            Name = "player";
            Description = "The player to ban.";
        },
        {
            Type = "number";
            Name = "length";
            Description = "The length of the ban. !!!IN SECONDS!!!";
        },
        {
            Type = "string";
            Name = "reason";
            Description = "The reason of the ban.";
        }
    }
}