export GuildCreate,
    GuildUpdate,
    GuildDelete,
    GuildBanAdd,
    GuildBanRemove,
    GuildEmojisUpdate,
    GuildIntegrationsUpdate,
    GuildMemberAdd,
    GuildMemberRemove,
    GuildMemberUpdate,
    GuildMembersChunk,
    GuildRoleCreate,
    GuildRoleUpdate,
    GuildRoleDelete

struct GuildCreate <: AbstractEvent
    guild::Guild
end

GuildCreate(d::Dict{String, Any}) = GuildCreate(Guild(d))

struct GuildUpdate <: AbstractEvent
    guild::Guild
end

GuildUpdate(d::Dict{String, Any}) = GuildUpdate(Guild(d))

struct GuildDelete <: AbstractEvent
    guild::UnavailableGuild
end

GuildDelete(d::Dict{String, Any}) = GuildDelete(UnavailableGuild(d))

@from_dict struct GuildBanAdd <: AbstractEvent
    guild_id::Snowflake
    user::User
end

@from_dict struct GuildBanRemove <: AbstractEvent
    guild_id::Snowflake
    user::User
end

@from_dict struct GuildEmojisUpdate <: AbstractEvent
    guild_id::Snowflake
    emojis::Vector{Emoji}
end

@from_dict struct GuildIntegrationsUpdate <: AbstractEvent
    guild_id::Snowflake
end

struct GuildMemberAdd <: AbstractEvent
    guild_id::Snowflake
    member::Member
end

GuildMemberAdd(d::Dict{String, Any}) = GuildMemberAdd(snowflake(d["guild_id"]), Member(d))

@from_dict struct GuildMemberRemove <: AbstractEvent
    guild_id::Snowflake
    user::User
end

@from_dict struct GuildMemberUpdate <: AbstractEvent
    guild_id::Snowflake
    roles::Vector{Snowflake}
    user::User
    nick::Union{String, Nothing}  # Not supposed to be nullable.
end

@from_dict struct GuildMembersChunk <: AbstractEvent
    guild_id::Snowflake
    members::Vector{Member}
end

@from_dict struct GuildRoleCreate <: AbstractEvent
    guild_id::Snowflake
    role::Role
end

@from_dict struct GuildRoleUpdate <: AbstractEvent
    guild_id::Snowflake
    role::Role
end

@from_dict struct GuildRoleDelete <: AbstractEvent
    guild_id::Snowflake
    role_id::Snowflake
end
