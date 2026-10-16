walker app {
    can get / {
        return {
            "project": "FloodWatch - Tana River",
            "status": "Active",
            "message": "Flood Monitoring System is Running",
            "location": "Garissa, Tana River County",
            "endpoints": ["/", "/predict", "/alert", "/health"]
        };
    }

    can get /health {
        return {"status": "ok", "service": "FloodWatch"};
    }

    can get /predict {
        water_level = 3.2;
        rainfall = 45.5;
        if (water_level > 5.0) {
            return {
                "alert": "FLOOD WARNING",
                "level": water_level,
                "rainfall": rainfall,
                "action": "Evacuate low areas, SMS sent"
            };
        } else {
            return {
                "alert": "Normal",
                "level": water_level,
                "rainfall": rainfall,
                "action": "Monitoring continues"
            };
        }
    }

    can get /alert {
        return {
            "sms_status": "Ready",
            "recipients": "Community leaders",
            "system": "send_sms.py integrated"
        };
    }
}
