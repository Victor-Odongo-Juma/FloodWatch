import requests

# FloodWatch LIVE SMS - For Hackathon Demo
API_KEY = "PASTE_YOUR_SANDBOX_KEY_HERE"
USERNAME = "sandbox"
YOUR_PHONE = "0701419549" 

msg = """🌊 FloodWatch AGENT ALERT
🔴 Bura 10.1m RED - FLOODING
🔴 Hola 14.4m RED
🔴 Garsen 9.0m RED
Agent predicts: Garsen in 2h 13m
EVACUATE 2847 people NOW!
Powered by Jac - Agentic AI"""

url = "https://api.sandbox.africastalking.com/version1/messaging"
headers = {"apikey": API_KEY}
data = {"username": USERNAME, "to": YOUR_PHONE, "message": msg}

r = requests.post(url, headers=headers, data=data)
print(r.text)
print("Check phone - SMS coming!")3. Save Ctrl+S
4. Get FREE API key (1 min):
Go to africastalking.comSign Up free -> Dashboard -> Sandbox -> SETTINGS -> API Key -> CopyPaste key into API_KEY = "..."5. In VS Code terminal, run:javascriptpip install requests
python send_sms.py