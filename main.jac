node Station {
    has name: str;
    has level: float;
    has status: str;
}

walker:pub get_status {
    can get_status with `root entry {
        report {
            "app": "FloodWatch Level 2 LIVE",
            "stations": [
                {"name": "Garissa Town", "level": 7.0, "status": "SAFE"},
                {"name": "Bura", "level": 10.1, "status": "RED ALERT"},
                {"name": "Nakuru", "level": 5.0, "status": "SAFE"}
            ]
        };
    }
}

walker:pub health {
    obj __specs__ {
        static has methods: list = ["get"];
        static has auth: bool = False;
    }
    can health with `root entry {
        report {"status": "ok"};
    }
}

with entry {
    print("FloodWatch READY");
}
