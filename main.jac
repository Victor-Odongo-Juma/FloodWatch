# FloodWatch - Agentic AI - Level 2

node Station {
    has name: str, level: float, status: str, evac: int;
}

walker:pub get_status {
    can get_status with `root entry {
        visit [-->] else {
            # Create stations if not exist
            station1 = here ++> Station(name="Garissa Town", level=7.0, status="SAFE", evac=0);
            station2 = here ++> Station(name="Bura", level=10.1, status="RED ALERT", evac=847);
            station3 = here ++> Station(name="Nakuru", level=5.0, status="SAFE", evac=0);
            station4 = here ++> Station(name="Kano", level=4.0, status="SAFE", evac=0);
        }
        report {
            "app": "FloodWatch Agentic AI",
            "level": "Level 2 - 100% Jac",
            "stations": [ {"name": n.name, "level": n.level, "status": n.status, "evac": n.evac} for n in [-->] ],
            "alerts": [ {"name": n.name, "message": n.status + ": " + n.name + " - EVACUATE " + str(n.evac)} for n in [-->] if n.status == "RED ALERT"]
        };
    }
}

walker:pub health {
    obj __specs__ { static has methods: list = ["get"], auth: bool = False; }
    can health with `root entry { report {"status": "ok", "app": "FloodWatch"}; }
}

with entry {
    print("=== FloodWatch Agentic - Web Ready ===");
}
