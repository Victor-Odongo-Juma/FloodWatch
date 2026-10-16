
walker:pub get_status {
    can get_status with `root entry {
        report {
            "app": "FloodWatch Level 2",
            "status": "SAFE",
            "stations": [
                {"name": "Garissa Town", "level": "7.0m", "status": "SAFE"},
                {"name": "Tana River", "level": "6.5m", "status": "SAFE"},
                {"name": "Nakuru", "level": "5.0m", "status": "SAFE"},
                {"name": "Kano", "level": "4.0m", "status": "SAFE"}
            ],
            "message": "Monitoring 4 stations - 100% Jac!"
        };
    }
}

walker:pub health {
    obj __specs__ {
        static has methods: list = ["get"], auth: bool = False;
    }
    can health with `root entry {
        report {"status": "ok", "app": "FloodWatch"};
    }
}

with entry {
    print("=== FloodWatch Level 2 - New Jac Syntax ===");
    print("Web server ready - API at /walker/get_status");
}
