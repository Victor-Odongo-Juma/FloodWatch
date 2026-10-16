node RiverStation {
    has name: str;
    has level: float;
    has people_at_risk: int;
}

walker CheckFlood {
    can start with Root entry {
        visit [-->];
    }
    can check with RiverStation entry {
        if here.level > 8.5 {
            print(f"RED ALERT: {here.name} - {here.level}m - FLOODING! EVACUATE {here.people_at_risk}");
        } else {
            print(f"SAFE: {here.name} - {here.level}m");
        }
        visit [-->];
    }
}

with entry {
    print("=== FloodWatch Level 2 - New Jac Syntax ===");
    
    garissa = RiverStation(name="Garissa Town", level=7.0, people_at_risk=0);
    bura = RiverStation(name="Bura", level=10.1, people_at_risk=847);
    hola = RiverStation(name="Galole (Hola)", level=14.4, people_at_risk=1200);
    garsen = RiverStation(name="Garsen", level=9.0, people_at_risk=3200);
    
    root ++> garissa;
    garissa ++> bura;
    bura ++> hola;
    hola ++> garsen;
    
    print("Monitoring 4 stations...");
    print("");
    
    root spawn CheckFlood();
    
    print("");
    print("Level 2 Complete - 100% Jac!");
}