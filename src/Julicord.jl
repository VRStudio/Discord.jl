module Julicord

    include("./API/Request.jl")
    include("./Client.jl")
    # Events
    include("./Events/ready.jl")
    include("./Events/EventExporter.jl")
    # Structs
    include("./Structs/Emoji.jl")
    include("./Structs/User.jl")
    include("./Structs/Webhook.jl")
    # Utils
    include("./Utils/Snowflake.jl")
    include("./Utils/Constants.jl")
    # WebSocket
    include("./WebSocket/Manager.jl")
    include("./WebSocket/Handler.jl")
    include("./WebSocket/Logger.jl")

    export Client,
    Request,
    # Events
    EventExporter, ReadyEvent,
    # Structs
    Emoji, User, Webhook,
    # Utils
    Snowflake, Constants,
    Manager, Handler, Logger

end # module